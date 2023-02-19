import 'package:connectivity_plus/connectivity_plus.dart';

class CheckNet
{
  static Future<bool> isConnectedNet()
  async{
    var conResult = await (Connectivity().checkConnectivity());
    if(conResult == ConnectivityResult.mobile)
      {
        return true;
      }
    else if(conResult == ConnectivityResult.wifi)
      {
        return true;
      }
    else
      {
        return false;
      }
  }
}