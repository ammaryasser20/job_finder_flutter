class User {
  bool? status;
  String? name;
  String? email;
  int? otp;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? profileId;
  String? token;
  clear() {
    status = false;
    name = '11';
    email = '11';
    otp = 0;
    updatedAt = '11';
    createdAt = '11';
    id = 0;
    profileId = 0;
    token = '11';
  }

  User.register(Map<String, dynamic> json) {
    status = json['status'];
    name = json['data']['name'];
    email = json['data']['email'];
    otp = json['data']['otp'];
    updatedAt = json['data']['updated_at'];
    createdAt = json['data']['created_at'];
    id = json['data']['id'];
    profileId = json['profile']['profile_id'];
    token = json['token'];
  }
  User.login(Map<String, dynamic> json) {
    id = json['user']['id'];
    name = json['user']['name'];
    email = json['user']['email'];
    createdAt = json['user']['created_at'];
    updatedAt = json['user']['updated_at'];
    token = json['token'];
    status = json['status'];
  }
  User.profile(Map<String, dynamic> json, String theToken) {
    id = json['data']['id'];
    name = json['data']['name'];
    email = json['data']['email'];
    createdAt = json['data']['created_at'];
    updatedAt = json['data']['updated_at'];
    token = theToken;
    status = json['status'];
  }
}
