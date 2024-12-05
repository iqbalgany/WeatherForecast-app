import 'dart:io';

String readJson(String fileName) {
  var path = '${Directory.current.path}/test/helpers/dummy_data/$fileName';
  return File(path).readAsStringSync();
}
