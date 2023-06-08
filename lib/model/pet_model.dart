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
  String? gender;
  int? age;
  int? ownerId;

  Data(
      {this.petId,
      this.name,
      this.species,
      this.gender,
      this.age,
      this.ownerId});

  Data.fromJson(Map<String, dynamic> json) {
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
