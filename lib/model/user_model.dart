class UserModel {
  String? UserId, Name, Email, Pic;
  UserModel({this.Name, this.Email, this.Pic, this.UserId});
  UserModel.fromJson(Map<dynamic, dynamic> Map) {
    if (Map == null) {
      return;
    }
    UserId = Map['userId'];
    Name = Map['name'];
    Email = Map['email'];
    Pic = Map['pic'];
  }
  toJson() {
    return {
      'userId': UserId,
      'name': Name,
      'email':Email,
      'pic':Pic


    };
  }
}
