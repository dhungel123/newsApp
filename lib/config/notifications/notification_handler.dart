import 'package:permission_handler/permission_handler.dart';

class PermissionsHandler{
  static Future<void> getNotificationPermission() async {
    final status = await Permission.notification.request();
    if(status.isDenied){
      print("you denied the permission");


    }
    else if( await Permission.notification.isRestricted){

    }
    else if( status.isPermanentlyDenied){
      openAppSettings(); // open app setting to allow the user to enable the permission
    }
  }
}