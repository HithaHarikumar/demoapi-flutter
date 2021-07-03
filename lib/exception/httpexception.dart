import 'package:flutter/material.dart';

class httpexception implements Exception {
  final int statusCode;
  final String? msg;
  String err = "";

  httpexception(this.statusCode, {this.msg});

  String toString() {
    if (msg != null) {
      return msg!;
    }
    errorHandler();

    return err;
  }

  void errorHandler() {
    switch (statusCode) {
      case 400:
        this.err = "Bad request";
        break;
      case 401:
        this.err = "UnAuthorized Access";
        break;
      case 403:
        this.err = "Resource access forbidden";
        break;
      case 404:
        this.err = "Resource not found";
        break;
      case 500:
        this.err = "Internal Server error";
        break;
      case 503:
        this.err = "Service unavailable";
        break;
    }
  }
}
  //   if (statusCode >= 400 && statusCode <= 451) {
  //     err = 'Client Error';
  //   }
  //   if (statusCode >= 500 && statusCode <= 511) {
  //     err = 'Server  Error';
  //   }
  // }

