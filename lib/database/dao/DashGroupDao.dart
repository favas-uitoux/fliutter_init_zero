
import 'dart:ffi';

import 'package:fliutter_init_zero/database/entity/DashGroupEntity.dart';
import 'package:floor/floor.dart';

@dao
abstract class DashGroupDao {


   // @Query('SELECT COUNT(*)  FROM DashGroup')
   // Stream<int> getSize();

  @Query('SELECT * FROM Dashgroup WHERE id = :id')
  Stream<DashGroup?> findItemById(int id);

  @Query('SELECT * FROM Dashgroup ')
  Stream<List<DashGroup>?> getAll();


  @Query('SELECT COUNT (*) FROM DashGroup ')
  Future<int?> getCNT();


  @insert
  Future<void> saveDashGroup(DashGroup dashGroup);

}