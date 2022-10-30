class UserModel {
  late String id;
  late String fullName;
  late String email;

  UserModel({required this.id, required this.fullName, required this.email});

  // Map to Object
  UserModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    fullName = map["fullName"];
    email = map["email"];
  }

  // Object to Map
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
    };
  }
}
