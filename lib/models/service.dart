class Service {
  final int id;
  final String name;
  final String resume;
  final String description;
  final String photo;
  final num price;
  final String time;
  final bool isActive;

  Service(this.id, this.name, this.resume, this.description, this.photo,
      this.price, this.time, this.isActive);

  factory Service.fromJson(Map<String, dynamic> json) {
    var service = Service(
      json['id'],
      json['name'],
      json['resume'],
      json['description'],
      json['photo'],
      num.parse(json['price']),
      json['time'],
      json['isActive'],
    );
    return service;
  }
}
