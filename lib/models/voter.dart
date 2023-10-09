class Voter {
  String? status;
  String? message;
  List<Data>? data;

  Voter({this.status, this.data});

  Voter.fromJson(Map<dynamic, dynamic> json) {
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? fName;
  String? sName;
  String? tName;
  String? lName;
  int? state;

  Data({this.id, this.fName, this.sName, this.tName, this.lName, this.state});

  Data.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    sName = json['s_name'];
    tName = json['t_name'];
    lName = json['l_name'];
    state = json['state'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['s_name'] = this.sName;
    data['t_name'] = this.tName;
    data['l_name'] = this.lName;
    data['state'] = this.state;
    return data;
  }
}
