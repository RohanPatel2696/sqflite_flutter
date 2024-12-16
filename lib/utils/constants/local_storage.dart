//======= PACKAGE IMPORTS =======//
import 'package:get_storage/get_storage.dart';

//======= PROJECT IMPORTS =======//
import '../../utils/export_utils.dart';

GetStorage localStorage = GetStorage();

setValueToLocal(String key, dynamic value) {
  "setValueToLocal: ${value.runtimeType} - $key - $value".printLog();

  localStorage.write(key, value);
}

T getValueToLocal<T>(String key) {
  "getValueToLocal: ${localStorage.read(key).runtimeType} - $key - ${localStorage.read(key)}".printLog();

  return localStorage.read(key);
}

removeValueToLocal(String key) {
  "removeValueToLocal: $key";

  localStorage.remove(key);
}
