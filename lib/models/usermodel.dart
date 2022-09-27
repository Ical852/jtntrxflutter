//@dart=2.9

class UserModel {
  String user_id;
  String language;
  String full_name;
  String phone;
  String email_address;
  String role;
  String designation;
  String outlet_id;

  UserModel.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    language = json['language'];
    full_name = json['full_name'];
    phone = json['phone'];
    email_address = json['email_address'];
    role = json['role'];
    designation = json['designation'];
    outlet_id = json['outlet_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": user_id,
      "language": language,
      "full_name": full_name,
      "phone": phone,
      "email_address": email_address,
      "role": role,
      "designation": designation,
      "outlet_id": outlet_id,
    };
  }
}
