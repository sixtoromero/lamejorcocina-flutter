import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
    ResponseModel({
        this.data,
        this.isSuccess,
        this.message,
    });

    dynamic data;
    bool isSuccess;
    String message;

    factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        data: json["Data"],
        isSuccess: json["IsSuccess"],
        message: json["Message"],
    );

    Map<String, dynamic> toJson() => {
        "Data": data,
        "IsSuccess": isSuccess,
        "Message": message,
    };
}