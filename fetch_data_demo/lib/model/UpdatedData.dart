class UpdatedData {
  final String name;
  final String salary;
  final String age;

  UpdatedData({this.name, this.salary, this.age});

  factory UpdatedData.fromJson(Map<String, dynamic> json) {
    return UpdatedData(
      name: json['name'],
      salary: json['salary'],
      age: json['age'],
    );
  }
}
