

class User {
  //final int? id;
  final String name;
  final double balance;
  final String? email;

  User(
      { //this.id,
        required this.name,
        required this.balance,
        this.email});



  User.fromMap(Map<String, dynamic> res)
      :// id = res["id"],
        name = res["name"],
        balance = res["balance"],
        email = res["email"];

  Map<String, Object?> toMap() {
    return {//'id':id,
      'name': name, 'balance': balance, 'email': email};
  }

}
