class PetListModel {
  String? status;
  String? message;
  List<Data>? data;

  PetListModel({this.status, this.message, this.data});

  PetListModel.fromJson(Map<String, dynamic> json) {
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
  int? petId;
  String? name;
  String? species;
  String? breed;
  String? gender;
  int? age;
  int? ownerId;
  bool? isMatched;
  String? petImage;

  Data(
      {this.petId,
      this.name,
      this.species,
      this.breed,
      this.gender,
      this.age,
      this.ownerId,
      this.isMatched,
      this.petImage});

  Data.fromJson(Map<String, dynamic> json) {
    petId = json['pet_id'];
    name = json['name'];
    species = json['species'];
    breed = json['breed'];
    gender = json['gender'];
    age = json['age'];
    ownerId = json['owner_id'];
    isMatched = json['is_matched'];
    petImage = json['pet_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pet_id'] = this.petId;
    data['name'] = this.name;
    data['species'] = this.species;
    data['breed'] = this.breed;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['owner_id'] = this.ownerId;
    data['is_matched'] = this.isMatched;
    data['pet_image'] = this.petImage;
    return data;
  }
}
