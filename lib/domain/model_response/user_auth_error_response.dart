class UserAuthErrorResponse {
  UserAuthErrorResponse({
      this.message, 
      this.errors,});

  UserAuthErrorResponse.fromJson(dynamic json) {
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  String? message;
  Errors? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }

}

class Errors {
  Errors({
      this.userName = const [],
      this.office = const [],
      this.password= const [],
    this.error= const [],});

  Errors.fromJson(dynamic json) {
    userName = json['username'] != null ? json['username'].cast<String>() : [];
    office = json['office'] != null ? json['office'].cast<String>() : [];
    password = json['password'] != null ? json['password'].cast<String>() : [];
    managerName = json['manager_name'] != null ? json['manager_name'].cast<String>() : [];
    number = json['number'] != null ? json['number'].cast<String>() : [];
    country = json['country'] != null ? json['country'].cast<String>() : [];
    error = json['error'] != null ? json['error'].cast<String>() : [];
    phone = json['phone'] != null ? json['phone'].cast<String>() : [];
    passwordConfirmation = json['password_confirmation'] != null ? json['password_confirmation'].cast<String>() : [];
    code = json['code'] != null ? json['code'].cast<String>() : [];
  }
  List<String> userName = [];
  List<String> office = [];
  List<String> password = [];
  List<String> passwordConfirmation = [];
  List<String>  error = [];
  List<String>  number = [];
  List<String>  country = [];
  List<String>  phone = [];
  List<String>  managerName = [];
  List<String>  code = [];
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company'] = userName;
    map['office'] = office;
    map['password'] = password;
    return map;
  }

}