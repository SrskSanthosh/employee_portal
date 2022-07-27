class EmployeeModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? profileImage;
  String? address;
  String? phone;
  String? website;
  String? company;

  EmployeeModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.profileImage,
      this.address,
      this.phone,
      this.website,
      this.company});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    profileImage = json['profile_image'];
    address = json['address'].toString();
    phone = json['phone'];
    website = json['website'];
    company = json['company'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['profile_image'] = profileImage;
    data['address'] = address.toString();
    data['phone'] = phone;
    data['website'] = website;
    data['company'] = company!.toString();
    return data;
  }
}
