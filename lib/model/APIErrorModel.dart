class APIErrorModel {
  var statusCode;
  String name;
  String message;
  int status;
  String stack;

  APIErrorModel(
      {this.statusCode, this.name, this.message, this.status, this.stack});

  factory APIErrorModel.fromJson(Map<String, dynamic> json) {
    return APIErrorModel(
        statusCode: json['statusCode'],
        name: json['name'],
        message: json['message'],
        status: json['status'],
        stack: json['stack']);
  }
}
