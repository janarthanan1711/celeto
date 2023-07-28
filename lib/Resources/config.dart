import 'package:celeto/Resources/commonDatas.dart';
import 'package:celeto/Resources/mytheme.dart';
import 'package:hive/hive.dart';

Mytheme currentTheme = Mytheme();
CommonUtils commonUtils = CommonUtils([]);
Box box = Hive.openBox('easyTheme') as Box;

