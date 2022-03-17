//
// @dart=2.12

part of icure_medical_device_dart_sdk.api;

extension UserExtended on User {
  String? dataOwnerId() {
    return this.healthcarePartyId ?? this.patientId ?? this.deviceId;
  }
}

extension PatientExtended on Patient {

  Future<Patient> initDelegations(User user, Crypto crypto) async {
    final Uuid uuid = Uuid();

    Set<String> delegationKeys = Set.from(user.autoDelegations["all"] ?? <String>{})
      ..addAll(user.autoDelegations["medicalInformation"] ?? <String>{});

    final ek = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
    final sfk = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});

    responsible = this.responsible ?? user.dataOwnerId()!;
    author = user.id;

    this.systemMetaData!.delegations = await (delegationKeys..add(user.dataOwnerId()!)).fold(
        Future.value({...this.systemMetaData!.delegations}),
            (m, d) async {

          final keyAndOwner = await crypto.encryptAESKeyForHcp(user.dataOwnerId()!, d, this.id!, sfk);

          if (keyAndOwner.item2 != null && keyAndOwner.item2!.dataOwnerId == this.id
              && keyAndOwner.item2!.rev!.compareTo((this.rev ?? "0")) == 1) {
            this.rev = keyAndOwner.item2!.rev;
            this.systemMetaData!.hcPartyKeys = keyAndOwner.item2!.hcPartyKeys;
          }

          return (await m)..addEntries([
            MapEntry(d, [
              Delegation(
                  owner: user.dataOwnerId(),
                  delegatedTo: d,
                  key: keyAndOwner.item1
              )
            ])
          ]);
        });

    this.systemMetaData!.encryptionKeys = await (delegationKeys..add(user.dataOwnerId()!)).fold(
        Future.value({...this.systemMetaData!.encryptionKeys}),
            (m, d) async {
          final keyAndOwner = await crypto.encryptAESKeyForHcp(user.dataOwnerId()!, d, this.id!, ek);

          return (await m)..addEntries([
            MapEntry(d, [
              Delegation(
                  owner: user.dataOwnerId(),
                  delegatedTo: d,
                  key: keyAndOwner.item1
              )
            ])
          ]);
        });


    return this;
  }

  Future<Patient> giveAccessToItself(Crypto crypto) async {
    return await giveAccessTo(this.id!, this.id!, crypto);
  }

  Future<Patient> giveAccessTo(String delegatedBy, String delegatedTo, Crypto crypto) async {
    final sfk = Uuid().v4(options: {'rng': UuidUtil.cryptoRNG});

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

    final dataOwner = keyAndOwner.item2;
    if (dataOwner != null && dataOwner.dataOwnerId == this.id) {
      this.rev = dataOwner.rev;
      this.systemMetaData!.hcPartyKeys = dataOwner.hcPartyKeys;
    }

    return this;
  }

  Future<Patient> lostRSAKeyAndReplacedItBy(Tuple2<String, String> newKeyPair) async {
    this.systemMetaData!.aesExchangeKeys = {...this.systemMetaData!.aesExchangeKeys}..addEntries([
      MapEntry(this.publicKey!, this.systemMetaData!.hcPartyKeys)
    ]);

    final encryptedNewKey = await encryptRSAKeyUsing(this.publicKey!, newKeyPair.item1);
    this.systemMetaData!.transferKeys = {...this.systemMetaData!.transferKeys}..addEntries([
      MapEntry(this.publicKey!, { newKeyPair.item2 : encryptedNewKey })
    ]);

    this.systemMetaData!.lostHcPartyKeys = [...this.systemMetaData!.lostHcPartyKeys]..addAll(
      this.systemMetaData!.hcPartyKeys.values.map((hcPartyKeys) => hcPartyKeys[0])
    );

    this.publicKey = newKeyPair.item2;
    //new hcpKeys

    return this;
  }
}