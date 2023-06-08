class FriendsAcceptedModel {
  String? status;
  String? message;
  List<Data>? data;

  FriendsAcceptedModel({this.status, this.message, this.data});

  FriendsAcceptedModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? username;
  String? email;
  Null? firstName;
  Null? lastName;
  Null? location;
  int? petId;
  String? petName;
  String? species;
  String? gender;
  int? age;

  Data(
      {this.userId,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.location,
      this.petId,
      this.petName,
      this.species,
      this.gender,
      this.age});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    location = json['location'];
    petId = json['pet_id'];
    petName = json['pet_name'];
    species = json['species'];
    gender = json['gender'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['location'] = this.location;
    data['pet_id'] = this.petId;
    data['pet_name'] = this.petName;
    data['species'] = this.species;
    data['gender'] = this.gender;
    data['age'] = this.age;
    return data;
  }
}
