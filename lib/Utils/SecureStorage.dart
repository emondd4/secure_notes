import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:secure_notes/Models/NoteListBaseResponse.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String> readSecureData(String key) async {
    return await storage.read(key: key) ?? 'No data found!';
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }

  saveNoteList(NoteListBaseResponse? value) async {
    if (value != null) {
      await storage.write(key: "NoteList", value:jsonEncode(value));
    }
  }

   getNoteList() async {
    String? data = await storage.read(key: "NoteList");
    if (data == null || data.isEmpty) return null;
    return NoteListBaseResponse.fromJson(jsonDecode(data));
  }

}