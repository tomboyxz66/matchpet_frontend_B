class PetModel {
  bool? status;
  List<Data>? data;

  PetModel({this.status, this.data});

  PetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
  String? petImage;

  Data(
      {this.petId,
      this.name,
      this.species,
      this.breed,
      this.gender,
      this.age,
      this.ownerId,
      this.petImage});

  Data.fromJson(Map<String, dynamic> json) {
    petId = json['pet_id'];
    name = json['name'];
    species = json['species'];
    breed = json['breed'];
    gender = json['gender'];
    age = json['age'];
    ownerId = json['owner_id'];
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
    data['pet_image'] = this.petImage;
    return data;
  }
}
