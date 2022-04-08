//
// @dart=2.12

part of icure_medical_device_dart_sdk.api;

extension PatientExtended on Patient {

  Future<Patient> patientGiveAccessToItself(Crypto crypto) async {
    return await delegateGiveAccessTo(this.id!, this.id!, crypto);
  }

  Future<Patient> delegateGiveAccessTo(String delegatedBy, String delegatedTo, Crypto crypto) async {
    final uuid = Uuid();
    final sfk = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
    final ek = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});

    // Check if delegatedBy has access

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
}