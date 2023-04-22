class PanierInfo {
  PanierInfo({this.id, this.userId, this.price, this.createAt, this.isPaid});

  String? id;
  String? userId;
  String? price;
  DateTime? createAt;
  bool? isPaid;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['price'] = price;
    data['isPaid'] = isPaid;
    data['createAt'] = createAt?.millisecondsSinceEpoch;
    return data;
  }

  static PanierInfo fromJson(Map<String, dynamic> json) {
    return PanierInfo(
      id: json['id'],
      userId: json['userId'],
      price: json['price'],
      isPaid: json['isPaid'],
      createAt: json['createAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['createAt'])
          : null,
    );
  }
}
