class UserInfo {
  bool? status;
  AllInfo? allInfo;

  UserInfo({this.status, this.allInfo});

  UserInfo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    allInfo =
        json['data'] != null ? AllInfo.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (allInfo != null) {
      data['data'] = allInfo!.toJson();
    }
    return data;
  }
}

class AllInfo {
  List<Portfolio>? portfolio;

  AllInfo({
    this.portfolio,
  });

  AllInfo.fromJson(Map<String, dynamic> json) {
    if (json['portfolio'] != null) {
      portfolio = <Portfolio>[];
      json['portfolio'].forEach((v) {
        portfolio!.add(Portfolio.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (portfolio != null) {
      data['portfolio'] = portfolio!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Portfolio {
  int? id;
  String? cvFile;
  String? name;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Portfolio(
      {this.id,
      this.cvFile,
      this.name,
      this.image,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Portfolio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cvFile = json['cv_file'];
    name = json['name'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  Portfolio.fromJsonInAdd(Map<String, dynamic> json) {
    id = json['data']['id'];
    cvFile = json['data']['cv_file'];
    name = json['data']['name'];
    image = json['data']['image'];
    userId = json['data']['user_id'];
    createdAt = json['data']['created_at'];
    updatedAt = json['data']['updated_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cv_file'] = cvFile;
    data['name'] = name;
    data['image'] = image;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
