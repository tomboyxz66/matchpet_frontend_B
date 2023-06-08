class GetAddPetListModel {
  String? status;
  String? message;
  List<Data>? data;

  GetAddPetListModel({this.status, this.message, this.data});

  GetAddPetListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? matchId;
  int? user1Id;
  int? user2Id;
  int? pet1Id;
  int? pet2Id;
  String? matchDate;
  int? isChecked;
  String? matchStatus;
  String? user1Username;
  String? user1FirstName;
  String? user2Username;
  String? user2FirstName;
  String? pet1Name;
  String? pet2Name;

  Data(
      {this.matchId,
      this.user1Id,
      this.user2Id,
      this.pet1Id,
      this.pet2Id,
      this.matchDate,
      this.isChecked,
      this.matchStatus,
      this.user1Username,
      this.user1FirstName,
      this.user2Username,
      this.user2FirstName,
      this.pet1Name,
      this.pet2Name});

  Data.fromJson(Map<String, dynamic> json) {
    matchId = json['match_id'];
    user1Id = json['user1_id'];
    user2Id = json['user2_id'];
    pet1Id = json['pet1_id'];
    pet2Id = json['pet2_id'];
    matchDate = json['match_date'];
    isChecked = json['is_checked'];
    matchStatus = json['match_status'];
    user1Username = json['user1_username'];
    user1FirstName = json['user1_first_name'];
    user2Username = json['user2_username'];
    user2FirstName = json['user2_first_name'];
    pet1Name = json['pet1_name'];
    pet2Name = json['pet2_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['match_id'] = this.matchId;
    data['user1_id'] = this.user1Id;
    data['user2_id'] = this.user2Id;
    data['pet1_id'] = this.pet1Id;
    data['pet2_id'] = this.pet2Id;
    data['match_date'] = this.matchDate;
    data['is_checked'] = this.isChecked;
    data['match_status'] = this.matchStatus;
    data['user1_username'] = this.user1Username;
    data['user1_first_name'] = this.user1FirstName;
    data['user2_username'] = this.user2Username;
    data['user2_first_name'] = this.user2FirstName;
    data['pet1_name'] = this.pet1Name;
    data['pet2_name'] = this.pet2Name;
    return data;
  }
}
