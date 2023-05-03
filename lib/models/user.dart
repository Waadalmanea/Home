class MyUser {
  final String firstName;
  final String lastName;
  final String email;
  final String id;
  const MyUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toFirebase() {
    return {
      'id':id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory MyUser.fromFirebase({required Map<String, dynamic> firebaseObj}) {
    final email = firebaseObj['email'];
    final firstName = firebaseObj['firstName'];
    final lastName = firebaseObj['lastName'];
    final id = firebaseObj['id'];
    return MyUser(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
    );
  }
}
