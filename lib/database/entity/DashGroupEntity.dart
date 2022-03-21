import 'package:floor/floor.dart';

@entity
class DashGroup {
  @primaryKey
  final int id;



  //
 final int slno;

  //
final  int order_no;

  //
 final String style;

  //
 final String display_name;

  //
  //
final  int download_st;
 final int disp_st;

  //
  //
 final String type;
final  String count;

  DashGroup(this.id, this.slno, this.order_no, this.style, this.display_name,
      this.download_st, this.disp_st, this.type, this.count);



}
