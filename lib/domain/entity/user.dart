class User {
  int? id;
  String? name;
  int? status;
  String? image;
  String? email;
  String? token;

  User({this.id, this.name, this.status, this.image, this.email, this.token});

  // function to convert json data to user model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['user']['id'],
        name: json['user']['name'],
        status: json['user']['status_id'],
        image: json['user']['image'],
        email: json['user']['email'],
        token: json['token']);
  }
}
