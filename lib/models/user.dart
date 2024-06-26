import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String? name;

  @HiveField(1, defaultValue: 0.0)
  double? gpa;

  @HiveField(2)
  String? admno;

  @HiveField(3)
  String? password;

  @HiveField(4)
  String? idno;

  @HiveField(5)
  String? gender;

  @HiveField(6)
  String? address;

  @HiveField(7)
  String? email;

  @HiveField(8)
  String? dateOfBirth;

  @HiveField(9)
  String? campus;

  @HiveField(10)
  String? programme;

  @HiveField(11)
  String? completedUnits;

  @HiveField(12)
  String? status;

  @HiveField(13)
  String? amountBilled;

  @HiveField(14)
  String? amountPaid;

  @HiveField(15)
  String? balance;

  @HiveField(16)
  String? cookie;

  @HiveField(17)
  String? profile;

  // from json
  User.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        gpa = double.parse(json["gpa"] ?? "0"),
        password = json['password'],
        admno = json['regno'],
        gender = json['gender'],
        address = json['address'],
        email = json['email'],
        dateOfBirth = json["dateofbirth"],
        campus = json["campus"],
        programme = json["currentprogramme"],
        completedUnits = json["completedunits"],
        status = json["academicstatus"],
        amountBilled = json["totalbilled"],
        amountPaid = json["totalpaid"],
        balance = json["feebalance"],
        profile = json["profile"] {
    json["profile"] = "a";
  }

  Map<String, dynamic> toModel() {
    return {
      'username': admno,
      'password': password,
    };
  }

  User(); // Explicitly does nothing to silence warnings
}
