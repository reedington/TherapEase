class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String accountNumber;
  final String accountBalance;
  final String token;
  final int agentId;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.accountNumber,
    required this.accountBalance,
    required this.token,
    required this.agentId,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      firstName: data['first_name'],
      agentId: data['agent_id'],
      lastName: data['last_name'],
      email: data['email'],
      phoneNumber: data['phone_number'],
      accountNumber: data['account_number'],
      accountBalance: data['account_balance'],
      token: data['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'account_number': accountNumber,
      'account_balance': accountBalance,
      'token': token,
    };
  }
}
