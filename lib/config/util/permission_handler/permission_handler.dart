import 'package:permission_handler/permission_handler.dart';

class PermissionHandler{
  static Future<void> getMapsPermission() async {
    final status = await Permission.location.request();
    if(status.isDenied){
      print("you denied the permission");


    }
    else if( await Permission.location.isRestricted){

    }
    else if( status.isPermanentlyDenied){
      openAppSettings(); // open app setting to allow the user to enable the permission
    }
  }
}