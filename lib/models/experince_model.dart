class ExperinceModel {
  String? userId;
  String? postion;
  String? typeWork;
  String? compName;
  String? location;
  String? start;
  String? end;
  ExperinceModel({
    this.userId,
    this.postion,
    this.typeWork,
    this.compName,
    this.location,
    this.start,
    this.end,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (userId != null) {
      result.addAll({'user_id': userId});
    }
    if (postion != null) {
      result.addAll({'postion': postion});
    }
    if (typeWork != null) {
      result.addAll({'type_work': typeWork});
    }
    if (compName != null) {
      result.addAll({'comp_name': compName});
    }
    if (location != null) {
      result.addAll({'location': location});
    }
    if (start != null) {
      result.addAll({'start': start});
    }
    if (end != null) {
      result.addAll({'end': end});
    }

    return result;
  }

  factory ExperinceModel.fromMap(Map<String, dynamic> map) {
    return ExperinceModel(
      userId: map['user_id'],
      postion: map['postion'],
      typeWork: map['type_work'],
      compName: map['comp_name'],
      location: map['location'],
      start: map['start'],
      end: map['end'],
    );
  }
}
