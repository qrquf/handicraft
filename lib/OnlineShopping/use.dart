class User{
  String? user_name;
  String? user_email;
  String? pass;
  String? phone;
  User(this.user_name,this.user_email,this.pass,this.phone)
  {

  }
  Map<String,dynamic> toJson() =>
  {
    'name':user_name.toString(),
    'number':phone.toString(),
    'email':user_email.toString(),
    'password':pass.toString(),
      
  };
  Map<String,dynamic> fromJson(item) =>
  {
    user_name.toString():'name',
    phone.toString():'number',
    user_email.toString():'email',
    pass.toString():'password',
      
  };
}