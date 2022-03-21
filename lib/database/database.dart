import 'dart:async';
import 'package:fliutter_init_zero/database/dao/DashGroupDao.dart';
import 'package:fliutter_init_zero/database/entity/DashGroupEntity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;



part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [DashGroup])
abstract class AppDatabase extends FloorDatabase {
  DashGroupDao get dashGroupDao;
}