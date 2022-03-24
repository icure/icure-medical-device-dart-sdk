//
// @dart=2.12

part of icure_medical_device_dart_sdk.api;

extension UserExtended on User {
  String? dataOwnerId() {
    return this.healthcarePartyId ?? this.patientId ?? this.deviceId;
  }
}

//TODO Move into dart-sdk
extension PatientExtended on Patient {

  Future<Patient> giveAccessToItself(Crypto crypto) async {
    return await giveAccessTo(this.id!, this.id!, crypto);
  }

  Future<Patient> giveAccessTo(String delegatedBy, String delegatedTo, Crypto crypto) async {
    final uuid = Uuid();
    final sfk = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
    final ek = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});

    final keyAndOwner = await crypto.encryptAESKeyForHcp(delegatedBy, delegatedTo, this.id!, sfk);
    final delegation = Delegation(
        owner: delegatedBy,
        delegatedTo: delegatedTo,
        key: keyAndOwner.item1
    );

    if (this.systemMetaData == null) {
      this.systemMetaData = SystemMetaDataOwnerEncrypted(delegations: {delegatedTo: [delegation]});
    } else {
      this.systemMetaData!.delegations = {...this.systemMetaData!.delegations}..addEntries([
        MapEntry(delegatedTo, [delegation])
      ]);
    }

    this.systemMetaData!.encryptionKeys = {...this.systemMetaData!.encryptionKeys}..addEntries([
        MapEntry(delegatedTo, [Delegation(
            owner: delegatedBy,
            delegatedTo: delegatedTo,
            key: (await crypto.encryptAESKeyForHcp(delegatedBy, delegatedTo, this.id!, ek)).item1
        )])
      ]);

    final dataOwner = keyAndOwner.item2;
    if (dataOwner != null && dataOwner.dataOwnerId == this.id) {
      this.rev = dataOwner.rev;
      this.systemMetaData!.hcPartyKeys = dataOwner.hcPartyKeys;
    }

    return this;
  }

  Future<Patient> lostRSAKeyAndReplacedItBy(Tuple2<String, String> newKeyPair, Crypto crypto) async {
    this.systemMetaData!.aesExchangeKeys = {...this.systemMetaData!.aesExchangeKeys}..addEntries([
      MapEntry(this.publicKey!, this.systemMetaData!.hcPartyKeys)
    ]);

    final encryptedNewKey = await crypto.encryptRSAKeyUsing(this.publicKey!, newKeyPair.item1);
    this.systemMetaData!.transferKeys = {...this.systemMetaData!.transferKeys}..addEntries([
      MapEntry(this.publicKey!, { newKeyPair.item2 : encryptedNewKey })
    ]);

    this.systemMetaData!.lostHcPartyKeys = [...this.systemMetaData!.lostHcPartyKeys]..addAll(
      this.systemMetaData!.hcPartyKeys.values.map((hcPartyKeys) => hcPartyKeys[0])
    );

    this.publicKey = newKeyPair.item2;
    this.systemMetaData!.hcPartyKeys = {};
    //new hcpKeys
    // new delegation (new key)
    // when decrypting information, try to decrypt all the delegations keys

    // Modify patient : Immutable while patient still has lostHcPartyKeys
    // Get patient

    return this;
  }
}