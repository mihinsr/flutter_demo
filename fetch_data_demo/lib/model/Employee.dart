class Employee {
  final String name;
  final String salary;
  final String age;
  final String id;

  Employee({this.name, this.salary, this.age, this.id});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      salary: json['salary'],
      age: json['age'],
      id: json['id'],
    );
  }
}
