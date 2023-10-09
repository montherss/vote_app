class Respons {
  String? status;
  String? message;

  Respons({this.status, this.message});

  Respons.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
