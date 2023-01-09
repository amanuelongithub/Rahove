class User {
  final String postdate;
  final String profile;
  final String username;
  final String phonenumber;
  final String cost;
  final String plus;

  const User({
    required this.postdate,
    required this.profile,
    required this.username,
    required this.phonenumber,
    required this.cost,
    required this.plus,
  });

  static User fromJson(json) => User(
    postdate: json['postdate'],
    profile: json['profile'],
    username: json['username'],
    phonenumber: json['phonenumber'],
    cost: json['cost'],
    plus: json['plus'],

     
     );
}
