class UserModel {
  String? message;
  Data? data;

  UserModel({this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Users? users;
  List<Pet>? pet;

  Data({this.users, this.pet});

  Data.fromJson(Map<String, dynamic> json) {
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
    if (json['pet'] != null) {
      pet = <Pet>[];
      json['pet'].forEach((v) {
        pet!.add(new Pet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    if (this.pet != null) {
      data['pet'] = this.pet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? userId;
  String? username;
  String? email;
  String? firstName;
  String? lastName;

  Users(
      {this.userId, this.username, this.email, this.firstName, this.lastName});

  Users.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}

class Pet {
  int? petId;
  String? name;
  String? species;
  String? gender;
  int? age;
  int? ownerId;

  Pet(
      {this.petId,
      this.name,
      this.species,
      this.gender,
      this.age,
      this.ownerId});

  Pet.fromJson(Map<String, dynamic> json) {
    petId = json['pet_id'];
    name = json['name'];
    species = json['species'];
    gender = json['gender'];
    age = json['age'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pet_id'] = this.petId;
    data['name'] = this.name;
    data['species'] = this.species;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['owner_id'] = this.ownerId;
    return data;
  }
}
