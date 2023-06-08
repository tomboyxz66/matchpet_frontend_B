class GetMessengsModel {
  int? id;
  int? senderId;
  int? receiverId;
  String? message;
  String? timestamp;

  GetMessengsModel(
      {this.id, this.senderId, this.receiverId, this.message, this.timestamp});

  GetMessengsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    message = json['message'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['message'] = this.message;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
