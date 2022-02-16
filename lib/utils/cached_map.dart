
import 'dart:core';

class CachedMap<K, V> {
  CachedMap({this.expirationInMillis = 1000 * 60 * 5, this.maxSize = 1000});

  final int expirationInMillis;
  final int maxSize;

  Map<K, CachedElement<V>> cachedElements = {};

  V? getIfPresent(K key) {
    final element = cachedElements[key];
    if (element == null || DateTime.now().compareTo(element.creationDateTime.add(Duration(milliseconds: expirationInMillis))) > 0) {
      return null;
    } else {
      cachedElements.remove(key);
      return element.value;
    }
  }

  Map<K, V> getAllPresent(List<K> keys) {
    final Map<K, V> cachedValues = {};

    keys.forEach((keyToFind) {
      final value = getIfPresent(keyToFind);
      if (value != null) {
        cachedValues[keyToFind] = value;
      }
    });

    return cachedValues;
  }

  invalidate(K key) {
    cachedElements.remove(key);
  }

  invalidateAll(List<K> keys) {
    cachedElements.removeWhere((key, element) => keys.contains(key));
  }

  put(K key, V value) {
    if (cachedElements.length == maxSize) {
      _invalidateOldestValue();
    }

    cachedElements.update(key, (v) => CachedElement(value, DateTime.now()), ifAbsent: () => CachedElement(value, DateTime.now()));
  }

  _invalidateOldestValue() {
    MapEntry<K, CachedElement<V>> oldestEntry = cachedElements.entries.first;
    for (MapEntry<K, CachedElement<V>> entry in cachedElements.entries) {
      if (oldestEntry.value.creationDateTime.compareTo(entry.value.creationDateTime) > 0) {
        oldestEntry = entry;
      }
    }

    cachedElements.remove(oldestEntry.key);
  }
}

class CachedElement<V> {
  CachedElement(this.value, this.creationDateTime);

  final V value;
  final DateTime creationDateTime;
}