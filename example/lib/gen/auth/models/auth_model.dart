class AuthModel {
  AuthModel(
    this.name,
    this.phoneNo,
  );

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(json["name"], json["phoneNo"]);
  }

  String name;

  String phoneNo;

  Map<String, dynamic> toJson() {
    return {"name": name, "phoneNo": phoneNo};
  }
}
