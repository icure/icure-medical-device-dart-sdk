import 'dart:io';

Future<E> retry<E>(Future<E> Function () action, {int trials = 5, int delay = 100}) async {
  try {
    return await action();
  } catch(e) {
    if (trials>0) {
      sleep(Duration(milliseconds: delay));
      return await retry(action, trials: trials - 1, delay: delay);
    } else {
      throw e;
    }
  }
}
