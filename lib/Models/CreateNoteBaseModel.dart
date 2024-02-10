class CreateNoteBaseModel {
  CreateNoteBaseModel({
      this.status, 
      this.message, 
      this.note,});

  CreateNoteBaseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    note = json['note'] != null ? Note.fromJson(json['note']) : null;
  }
  bool? status;
  String? message;
  Note? note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (note != null) {
      map['note'] = note?.toJson();
    }
    return map;
  }

}

class Note {
  Note({
      this.title, 
      this.description, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  Note.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? title;
  String? description;
  String? updatedAt;
  String? createdAt;
  num? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}