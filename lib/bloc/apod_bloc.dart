import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:nasa_demo/model/apod.dart';

class APODBloc {
  final StreamController _stream = StreamController.broadcast();

  Sink get input => _stream.sink;
  Stream<APOD> get output =>
      _stream.stream.asyncMap((dateSearch) => getAPOD(dateSearch));

  String url(DateTime dateSearch) =>
      "https://apodapi.herokuapp.com/api/?date=$dateSearch&html_tags=false&absolute_thumbnail_url=false&thumbs=true";

  Future<APOD> getAPOD(DateTime date) async {
    var response = await Dio().get(url(date));
    return APOD.fromJson(response.data);
  }

  Future<APOD> getLatestAPOD() async {
    var response = await Dio().get("https://apodapi.herokuapp.com/api/");
    return APOD.fromJson(response.data);
  }

  closeStream() {
    _stream.close();
    print("Stream closed");
  }
}
