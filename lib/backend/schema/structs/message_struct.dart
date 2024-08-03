// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MessageStruct extends FFFirebaseStruct {
  MessageStruct({
    String? text,
    bool? userSent,
    DateTime? timeCreated,
    String? type,
    String? description,
    String? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _text = text,
        _userSent = userSent,
        _timeCreated = timeCreated,
        _type = type,
        _description = description,
        _status = status,
        super(firestoreUtilData);

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "userSent" field.
  bool? _userSent;
  bool get userSent => _userSent ?? false;
  set userSent(bool? val) => _userSent = val;

  bool hasUserSent() => _userSent != null;

  // "timeCreated" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  set timeCreated(DateTime? val) => _timeCreated = val;

  bool hasTimeCreated() => _timeCreated != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static MessageStruct fromMap(Map<String, dynamic> data) => MessageStruct(
        text: data['text'] as String?,
        userSent: data['userSent'] as bool?,
        timeCreated: data['timeCreated'] as DateTime?,
        type: data['type'] as String?,
        description: data['description'] as String?,
        status: data['status'] as String?,
      );

  static MessageStruct? maybeFromMap(dynamic data) =>
      data is Map ? MessageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'userSent': _userSent,
        'timeCreated': _timeCreated,
        'type': _type,
        'description': _description,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'userSent': serializeParam(
          _userSent,
          ParamType.bool,
        ),
        'timeCreated': serializeParam(
          _timeCreated,
          ParamType.DateTime,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static MessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessageStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        userSent: deserializeParam(
          data['userSent'],
          ParamType.bool,
          false,
        ),
        timeCreated: deserializeParam(
          data['timeCreated'],
          ParamType.DateTime,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MessageStruct &&
        text == other.text &&
        userSent == other.userSent &&
        timeCreated == other.timeCreated &&
        type == other.type &&
        description == other.description &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([text, userSent, timeCreated, type, description, status]);
}

MessageStruct createMessageStruct({
  String? text,
  bool? userSent,
  DateTime? timeCreated,
  String? type,
  String? description,
  String? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessageStruct(
      text: text,
      userSent: userSent,
      timeCreated: timeCreated,
      type: type,
      description: description,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessageStruct? updateMessageStruct(
  MessageStruct? message, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    message
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessageStructData(
  Map<String, dynamic> firestoreData,
  MessageStruct? message,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (message == null) {
    return;
  }
  if (message.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && message.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messageData = getMessageFirestoreData(message, forFieldValue);
  final nestedData = messageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = message.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessageFirestoreData(
  MessageStruct? message, [
  bool forFieldValue = false,
]) {
  if (message == null) {
    return {};
  }
  final firestoreData = mapToFirestore(message.toMap());

  // Add any Firestore field values
  message.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessageListFirestoreData(
  List<MessageStruct>? messages,
) =>
    messages?.map((e) => getMessageFirestoreData(e, true)).toList() ?? [];
