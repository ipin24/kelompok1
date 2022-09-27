class Users {
  final int? Nis;
  final String Nama;
  final String Password;

  const Users({
    required this.Nis,
    required this.Nama,
    required this.Password,
  });

  factory Users.fromJson(Map<String, dynamic> json) =>
      Users(Nis: json['Nis'], Nama: json['Nama'], Password: json['Password']);

  Map<String, dynamic> toJson() =>
      {'Nis': Nis, 'Nama': Nama, 'Password': Password};
}
