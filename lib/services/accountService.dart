

import 'package:jaki_kapten/services/Models/userModel.dart';
import 'package:jaki_kapten/services/sharedService.dart';

import 'Models/ResponseModel.dart';

/// **********************************patient Register*************************************************/
 Future<ResponseModel> doctorRegister(UserModel model,context){
     return postData('/do_sign_up',model.toMap(),context);
}