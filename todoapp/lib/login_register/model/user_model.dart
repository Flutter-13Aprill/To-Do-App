class UserModel {
final String password;
  final String name;

  UserModel({required this.password, required this.name});
  
  Map<String,dynamic>toMap(){
    return{

'name':name,
    };
  }
  factory UserModel.fromMap(Map<String,dynamic>map){
return UserModel(password: map['password'], name: map['name']);
  }


}
