import 'dart:convert';
import 'package:http/http.dart' as http;

void fetchCustomerData() async {
  final response =
      await http.get(Uri.parse('http://192.168.56.1:8000/viewTables/customer'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    print(jsonData);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future<int> checkLogin(String email, String password) async {
  // Define the url of the api
  var url = Uri.parse(
      'http://192.168.56.1:8000/viewTables/login?email=use@example.com&password=password1');
  // Define the query parameters
  var params = {
    'email': email,
    'password': password,
  };
  var query = Uri(queryParameters: params).query;
  // Append the query to the url
  var fullUrl = url.replace(query: query);
  // Make a get request to the api
  var response = await http.get(fullUrl);
  // Decode the response body as json
  var data = jsonDecode(response.body);
  int ans = data[0]
      ["check_login(\'${params['email']}\', \'${params['password']}\')"];
      return ans;

}

Future<int> signup(
    String firstName,
    String middleName,
    String lastName,
    String street,
    String city,
    String stateProvince,
    String country,
    String postalCode,
    String drivingLicenseId,
    String email,
    String password) async {
  // Define the url of the api
  var url = Uri.parse('http://192.168.56.1:8000/viewTables/signup');
  // Define the query parameters
  var params = {
    'firstName': firstName,
    'middleName': middleName,
    'lastName': lastName,
    'street': street,
    'city': city,
    'stateProvince': stateProvince,
    'country': country,
    'postalCode': postalCode,
    'drivingLicenseId': drivingLicenseId,
    'email': email,
    'password': password,
  };
  // Encode the query parameters
  var query = Uri(queryParameters: params).query;
  // Append the query to the url
  var fullUrl = url.replace(query: query);
  // Make a get request to the api
  var response = await http.get(fullUrl);
  // Decode the response body as json
  var data = jsonDecode(response.body);
  // Return the result as an integer
  return data;
}
