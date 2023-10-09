import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:vote_app/models/all_voter.dart';

Future<void> createExel(List<Data> data , String box) async{
  final Workbook workbook = Workbook();
  final Worksheet sheet = workbook.worksheets[0];
  Style globalStyleRed = workbook.styles.add('style1');
  Style globalStyleGreen = workbook.styles.add('style2');
  globalStyleRed.fontColor = '#FF0000' ;
  globalStyleGreen.fontColor = '#00FF00';
  List <Data> hiall = [
    Data(id: 2 ,fName: "المنذر" , sName: "محمد" , tName: "احمد"  , lName: "الصرايرة" , state: 0),
    Data(id: 3 ,fName: "w" , sName: "v" , tName: "d"  , lName: "j" , state: 0),
    Data(id: 4 ,fName: "x" , sName: "s" , tName: "s"  , lName: "x" , state: 0),
    Data(id: 5 ,fName: "b" , sName: "x" , tName: "c"  , lName: "d" , state: 0),
    Data(id: 6 ,fName: "e" , sName: "g" , tName: "j"  , lName: "e" , state: 0),
    Data(id: 7 ,fName: "t" , sName: "y" , tName: "p"  , lName: "b" , state: 0),
  ];
  sheet.getRangeByName("C1").setText("رقم المواطن");
  sheet.getRangeByName("B1").setText("اسم المواطن");
  sheet.getRangeByName("A1").setText("حالة التصوييت");
  for(int i = 0  ; i<= data.length-1 ; i++ ){
    sheet.getRangeByName("C${i+2}").setText("${data[i].id}");
    sheet.getRangeByName("B${i+2}").setText("${data[i].fName} ${data[i].sName} ${data[i].tName} ${data[i].lName}");
    sheet.getRangeByName("A${i+2}").cellStyle = data[i].state==0? globalStyleRed : globalStyleGreen;
    sheet.getRangeByName("A${i+2}").setText("${data[i].state == 1 ? 'تم التصويت' : 'لم يتم التصويت بعد'}");
  }
  final List<int> bytes = workbook.saveAsStream();
  workbook.dispose();
  final String path  = (await getApplicationSupportDirectory()).path;
  final String fileName = '$path/Output$box.xlsx';
  final File file = File(fileName);
  await file.writeAsBytes(bytes , flush: true);
  OpenFile.open(fileName);
}