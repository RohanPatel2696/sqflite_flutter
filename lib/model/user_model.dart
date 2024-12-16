class UserResponse {
  int? id;
  String? name;
  String? emailAddress;
  String? phoneNo;
  String? profileImage;

  UserResponse(
      {this.id, this.name, this.emailAddress, this.phoneNo, this.profileImage});

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    emailAddress = json['emailAddress'];
    phoneNo = json['phoneNo'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['emailAddress'] = this.emailAddress;
    data['phoneNo'] = this.phoneNo;
    data['profileImage'] = this.profileImage;
    return data;
  }
}
