class Massage {
  bool? status;
  String? massage;
  void clear() {
    status = false;
    massage = '';
  }

  Massage.register(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['massege']['email'][0];
  }
  Massage.login(Map<String, dynamic> json) {
    status = json['status'];
    massage =
        json['massage'] ?? "The email field must be a valid email address";
  }
}
