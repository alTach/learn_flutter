class Student {
  int id = 0;
  String name = '';

  Student(this.name, this.id);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  Student.fromMap(Map<String, dynamic> map) {
    name = map['name'] ?? '';
    id = map['id'] ?? '';
  }
}