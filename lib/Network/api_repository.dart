import 'package:flutter/cupertino.dart';
import 'package:secure_notes/Models/CreateNoteBaseModel.dart';
import 'package:secure_notes/Models/NoteDeleteBaseResponse.dart';
import 'package:secure_notes/Models/NoteListBaseResponse.dart';
import 'package:secure_notes/Models/UpdateNoteBaseResponse.dart';
import 'api_client.dart';

class ApiRepository {

  /// Get Note List
  void getNoteList(BuildContext context,String url, Map<String, dynamic>? params, {void Function(NoteListBaseResponse)? onSuccess,
    void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.get(url, params,false, false);
      var callResponse = NoteListBaseResponse.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Save Note
  void saveNote(BuildContext context,String url, Map<String, dynamic>? params,Map<String,dynamic>? body, {void Function(CreateNoteBaseModel)? onSuccess,
    void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.post(url, params,body,false, false);
      var callResponse = CreateNoteBaseModel.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Update Note
  void updateNote(BuildContext context,String url, Map<String, dynamic>? params,Map<String,dynamic>? body, {void Function(UpdateNoteBaseResponse)? onSuccess,
    void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.patch(url, params,body,false, false);
      var callResponse = UpdateNoteBaseResponse.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Delete Note
  void deleteNote(BuildContext context,String url, Map<String, dynamic>? params,Map<String,dynamic>? body, {void Function(NoteDeleteBaseResponse)? onSuccess,
    void Function(String)? onFailure}) async {
    try {
      final response = await ApiClient.delete(url, params,body,false, false);
      var callResponse = NoteDeleteBaseResponse.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
