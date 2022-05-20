import 'dart:developer';


const String BASE_URL = 'https://mental-health-minder.azurewebsites.net/';
const String IMAGES_BASE_URL = 'http://mutawfin-api.linkicar.org/';

const String GET_COMPANIES = BASE_URL+'api/companies';
const String GET_COUNTRIES = BASE_URL+'api/countries';
const String GET_GATES = BASE_URL+'api/gates';
const String GET_PROFILE = BASE_URL+'api/office/auth/profile';
const String EDIT_PROFILE = BASE_URL+'api/office/auth/profile';
const String USER_LOGIN = BASE_URL+'api/user/login';
const String USER_LOGOUT = BASE_URL+'api/office/auth/logout';
const String USER_REGISTER = BASE_URL+'api/office/auth/signup';
const String OFFICE_CREATE_REQUEST = BASE_URL+'api/office/requests';
const String OFFICE_GET_REQUEST = BASE_URL+'api/office/requests';
const String OFFICE_CANCEL_REQUEST = BASE_URL+'api/office/requests';
const String OFFICE_CHANGE_PASSWORD = BASE_URL+'api/office/auth/profile/change_password';
const String SEND_VERIFICATION_CODE = BASE_URL+'api/office/auth/forget_password/code';
const String RESET_PASSWORD = BASE_URL+'api/office/auth/forget_password/reset_password';
const String PRIVACY_POLICY = BASE_URL+'api/settings/privacy-policy';
const String ABOUT_THE_APP = BASE_URL+'api/settings/about';

// observer end points
const String OBSERVER_LOGIN = BASE_URL+'api/observer/auth/login';
const String OBSERVER_LOGOUT = BASE_URL+'api/observer/auth/logout';
const String OBSERVER_GET_ORDERS = BASE_URL+'api/observer/requests';
const String OBSERVER_CREATE_ORDERS = BASE_URL+'api/observer/requests';
const String OBSERVER_CANCEL_REQUEST = BASE_URL+'api/observer/requests';
const String OBSERVER_ACCEPT_REQUEST = BASE_URL+'api/observer/requests';

//Static Headers
const Map<String, String> apiHeaders = {
  "Content-Type":"application/json",
  "Accept": "application/json, text/plain, */*",
};


void debugApi({
  required String methodName,
  required int statusCode,
  required response,
  required data,
  required String endPoint,
  headers,
}) {
  log(
    "methode: $methodName\n"
        "URL: $endPoint\n "
        "statusCode: $statusCode\n"
        "${response != null ? 'Response: $response\n' : ''}"
        "${data != null ? 'data: $data\n' : ''}"
        "${headers != null ? 'headers: $headers\n' : ''}"
        "--------------------",
  );
}

// void handleUnAuthorized(BuildContext context, {int statusCode}) {
//   if (statusCode >= 400 && statusCode <= 401) {
//     //showAlertMessage(context, message: "Please_login_again".tr() , backgroundColor: Colors.red);
//     // NavigateTo(context, SplashScreen());
//   }
// }

Uri getUri(String endpoint, {Map<String, String>? params}) {
  Uri uri = Uri.parse(endpoint);
  if (params != null) uri = uri.replace(queryParameters: params);
  return uri;
}