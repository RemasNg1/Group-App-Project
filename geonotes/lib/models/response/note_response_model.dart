class NoteResponse {
  String? id;
  String? authid;
  String? title;
  String? content;
  double? latitude;
  double? longitude;
  String? createdAt;
  bool? isDeleted;

  NoteResponse({
    this.id,
    this.authid,
    this.title,
    this.content,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.isDeleted,
  });

  NoteResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authid = json['authid'];
    title = json['title'];
    content = json['content'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['authid'] = this.authid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['is_deleted'] = this.isDeleted;
    return data;
  }
}
