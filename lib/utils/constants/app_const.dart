//======= FLUTTER IMPORTS =======//
import 'package:flutter/material.dart';

//======= PACKAGE IMPORTS =======//
import 'package:get/get.dart';

bool isConnected = false;
RxBool isLoggedIn = false.obs;
const defaultPrimaryColor = Color(0xFF2ca601);

class DatabaseConst {
  static const userDatabase = "users.db";
}

class TablesConst {
  static const user = "Users";
}

class UsersConst {
  static const id = "id";
  static const name = "name";
  static const emailAddress = "emailAddress";
  static const phoneNo = "phoneNo";
  static const profileImage = "profileImage";
}