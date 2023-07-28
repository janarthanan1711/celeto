import 'package:celeto/Resources/mytheme.dart';
import 'package:hive/hive.dart';

Mytheme currentTheme = Mytheme();
Box box = Hive.openBox('easyTheme') as Box;
