import 'dart:developer';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'future_model.dart';

// service for calling the APi and requesting a location then converting that to a object from a json response
class FutureApiService {
  Future<futureModel?> getForecast(String userSearch) async {
    // code to generate the url from the api base url and the query
    var url = Uri.parse(
        ApiConstants.futureBaseUrl + ApiConstants.usersEndpointFuture);

    // code to ensure no empty requests
    if (userSearch != "") {
      url = Uri.parse(ApiConstants.futureBaseUrl + userSearch);
    }

    print(url);
    //sending the http request and taking the response
    var response = await http.get(url);
    try{
    if (response.statusCode == 200) {
      // the model is generated and returned if the response code is all good
      futureModel _model = futureModelFromJson(response.body);
      print("working");
      return _model;
    }}
    catch(e){
      print("issue");
        log(e.toString());
        print(e);
    }

    //otherwise null is returned
    return null;
  }
}
