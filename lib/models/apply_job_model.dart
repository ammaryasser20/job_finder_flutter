class ApplyJobModel {
  int? jobId;
  String? fullName;
  String? email;
  String? handphone;
  String? typeOfWork;
  String? userCV;
  String? otherFile;
  int? step;
  ApplyJobModel({
    this.jobId,
    this.step,
    this.fullName,
    this.email,
    this.handphone,
    this.typeOfWork,
    this.userCV,
    this.otherFile,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (jobId != null) {
      result.addAll({'jobId': jobId});
    }
    if (step != null) {
      result.addAll({'step': step});
    }
    if (fullName != null) {
      result.addAll({'fullName': fullName});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (handphone != null) {
      result.addAll({'handphone': handphone});
    }
    if (typeOfWork != null) {
      result.addAll({'typeOfWork': typeOfWork});
    }
    if (userCV != null) {
      result.addAll({'userCV': userCV});
    }
    if (otherFile != null) {
      result.addAll({'otherFile': otherFile});
    }

    return result;
  }

  factory ApplyJobModel.fromDB(Map<String, dynamic> map) {
    return ApplyJobModel(
      jobId: map['jobId']?.toInt(),
      step: map['step'],
      fullName: map['fullName'],
      email: map['email'],
      handphone: map['handphone'],
      typeOfWork: map['typeOfWork'],
      userCV: map['userCV'],
      otherFile: map['otherFile'],
    );
  }
  factory ApplyJobModel.fromAPI(Map<String, dynamic> map) {
    return ApplyJobModel(
      step: 3,
      jobId: map['jobs_id']?.toInt(),
      fullName: map['name'],
      email: map['email'],
      handphone: map['mobile'],
      typeOfWork: map['work_type'],
      userCV: map['cv_file'],
      otherFile: map['other_file'],
    );
  }
}
