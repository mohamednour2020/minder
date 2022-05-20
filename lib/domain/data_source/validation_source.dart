bool isValidResponse(int statusCode) {
  return statusCode >= 200 && statusCode <= 302;
}