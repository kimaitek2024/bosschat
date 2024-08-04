import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonalityRecord extends FirestoreRecord {
  PersonalityRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "system_prompt" field.
  String? _systemPrompt;
  String get systemPrompt => _systemPrompt ?? '';
  bool hasSystemPrompt() => _systemPrompt != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _photo = snapshotData['photo'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _audio = snapshotData['audio'] as String?;
    _category = snapshotData['category'] as String?;
    _systemPrompt = snapshotData['system_prompt'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('personality');

  static Stream<PersonalityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PersonalityRecord.fromSnapshot(s));

  static Future<PersonalityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PersonalityRecord.fromSnapshot(s));

  static PersonalityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PersonalityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PersonalityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PersonalityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PersonalityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PersonalityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPersonalityRecordData({
  String? name,
  String? email,
  String? photo,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  String? audio,
  String? category,
  String? systemPrompt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'email': email,
      'photo': photo,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'audio': audio,
      'category': category,
      'system_prompt': systemPrompt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PersonalityRecordDocumentEquality implements Equality<PersonalityRecord> {
  const PersonalityRecordDocumentEquality();

  @override
  bool equals(PersonalityRecord? e1, PersonalityRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.photo == e2?.photo &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.audio == e2?.audio &&
        e1?.category == e2?.category &&
        e1?.systemPrompt == e2?.systemPrompt;
  }

  @override
  int hash(PersonalityRecord? e) => const ListEquality().hash([
        e?.name,
        e?.email,
        e?.photo,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.audio,
        e?.category,
        e?.systemPrompt
      ]);

  @override
  bool isValidKey(Object? o) => o is PersonalityRecord;
}
