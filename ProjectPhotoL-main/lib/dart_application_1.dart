import 'dart:io';

main(List<String> arguments) async {
  print("GGGG");
  var file = File('E:/new/new/New folder/dart_application_1/bin/data.json');
  print(file);

  var contents;
  var line = await file.readAsLines();
  //print(line[1]);
  Map BOM = {};
  for (var i = 0; i < line.length; ++i) {
    var c = line[i].split("=");
    BOM[c[0]] = c[1];
  }
  print(BOM);
  if (await file.exists()) {
    contents = await file.readAsString();

    //print(contents);
    var fileCopy =
        await File('E:/new/new/New folder/dart_application_1/bin/data.json')
            .writeAsString(contents);
    print(await fileCopy.exists());
    print(await fileCopy.length());
  }
}
