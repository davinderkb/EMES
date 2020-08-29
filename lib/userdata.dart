
import 'package:emes/util/utility.dart';

class UserData{
  String _id,
      _companyId,
      _name,
      _firstName,
      _lastName,
      _email,
      _profileImage;

  get companyId => _companyId;
  bool isManager;

  get firstName => _firstName;

  get profileImage => _profileImage;

  String get id => _id;

  String get name => _name;


  UserData(this._id, this._companyId,this._name, this._firstName, this._lastName,this._email, this._profileImage, this.isManager){

  }




  factory UserData.fromJson(dynamic json) {
    return UserData(json['id'] as String,
        json['company_id'] as String,
        json['name'] as String,
        json['first_name'] as String,
        json['last_name'] as String,
        json['email'],
        json["image"] as String,
        json["is_manager"] == "0" ? false : true);
  }

  get email => _email;

  get lastName => _lastName;




}