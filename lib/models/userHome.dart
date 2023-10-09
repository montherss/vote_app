class RepresentativeHome {
  String? status;
  String? message;
  List<Data>? data;

  RepresentativeHome({this.status, this.message, this.data});

  RepresentativeHome.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? representativeId;
  String? representativeFName;
  String? representativeSName;
  String? representativeTName;
  String? representativeGender;
  String? representativePhoneNumber;
  String? representativePassword;
  String? representativeBox;
  int? representativeCandidate;
  int? representativeVoted;
  String? representativeLocation;
  String? representativeGovernorate;
  List<Candidate>? candidate;

  Data(
      {this.representativeId,
        this.representativeFName,
        this.representativeSName,
        this.representativeTName,
        this.representativeGender,
        this.representativePhoneNumber,
        this.representativePassword,
        this.representativeBox,
        this.representativeCandidate,
        this.representativeVoted,
        this.representativeLocation,
        this.representativeGovernorate,
        this.candidate});

  Data.fromJson(Map<dynamic, dynamic> json) {
    representativeId = json['representative_id'];
    representativeFName = json['representative_f_name'];
    representativeSName = json['representative_s_name'];
    representativeTName = json['representative_t_name'];
    representativeGender = json['representative_gender'];
    representativePhoneNumber = json['representative_phone_number'];
    representativePassword = json['representative_password'];
    representativeBox = json['representative_box'];
    representativeCandidate = json['representative_candidate'];
    representativeVoted = json['representative_voted'];
    representativeLocation = json['representative_location'];
    representativeGovernorate = json['representative_governorate'];
    if (json['candidate'] != null) {
      candidate = <Candidate>[];
      json['candidate'].forEach((v) {
        candidate!.add(new Candidate.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['representative_id'] = this.representativeId;
    data['representative_f_name'] = this.representativeFName;
    data['representative_s_name'] = this.representativeSName;
    data['representative_t_name'] = this.representativeTName;
    data['representative_gender'] = this.representativeGender;
    data['representative_phone_number'] = this.representativePhoneNumber;
    data['representative_password'] = this.representativePassword;
    data['representative_box'] = this.representativeBox;
    data['representative_candidate'] = this.representativeCandidate;
    data['representative_voted'] = this.representativeVoted;
    data['representative_location'] = this.representativeLocation;
    data['representative_governorate'] = this.representativeGovernorate;
    if (this.candidate != null) {
      data['candidate'] = this.candidate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Candidate {
  String? candidateFName;
  String? candidateSName;
  String? candidateTName;
  String? candidateLName;

  Candidate(
      {this.candidateFName,
        this.candidateSName,
        this.candidateTName,
        this.candidateLName});

  Candidate.fromJson(Map<dynamic, dynamic> json) {
    candidateFName = json['candidate_f_name'];
    candidateSName = json['candidate_s_name'];
    candidateTName = json['candidate_t_name'];
    candidateLName = json['candidate_l_name'];
  }

  Map toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['candidate_f_name'] = this.candidateFName;
    data['candidate_s_name'] = this.candidateSName;
    data['candidate_t_name'] = this.candidateTName;
    data['candidate_l_name'] = this.candidateLName;
    return data;
  }
}
