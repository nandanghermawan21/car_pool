import 'dart:async';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;

class NetworkUtil {
  String Url;

  NetworkUtil({this.Url = "https://api.inovatrack.com/v1/api/Mobile"});

  factory NetworkUtil.BaseUrl() {
    return NetworkUtil();
  }

  String LoginUrl(String MemberCode, String Ussername, String Password) {
    NetworkUtil a = NetworkUtil.BaseUrl();
    String Token = generateMd5("$Ussername|$Password");
    return this.Url +
        "/Login?MemberCode=$MemberCode&UserName=$Ussername&Token=$Token";
  }

  String GetFleetUrl() {
    this.Url + "/GetFleets";
  }

  String GetVehiclesUrl() {
    this.Url + "/GetVehicles";
  }

  String VehicleHistoryUrl() {
    this.Url + "/GetHistory";
  }

  String DashboardUrl() {
    this.Url + "/FleetGeneralInformation";
  }

  String DashboardBarChartUrl() {
    this.Url + "/TopVehiclesByDistanceDriven";
  }

  String DashboardLineChartUrl() {
    this.Url + "/VehicleUtilisationSummaryByDistance";
  }

  Future<dynamic> get(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return response.body;
    });
  }

  Future<dynamic> post(String url, {Map headers, body, encoding}) {
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return response.body;
    });
  }

  ///Generate MD5 hash
  generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

}
