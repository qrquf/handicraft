class updatemodal {
  String? pId;
  String? operation;
  String? date;
  String? id;
  String? name;
  String? product1;
  String? product2;
  String? product3;
  String? product4;
  String? discount;
  String? price;
  String? sale;
  String? category;
  String? sId;

  updatemodal(
      {this.pId,
      this.operation,
      this.date,
      this.id,
      this.name,
      this.product1,
      this.product2,
      this.product3,
      this.product4,
      this.discount,
      this.price,
      this.sale,
      this.category,
      this.sId});

  updatemodal.fromJson(Map<String, dynamic> json) {
    pId = json['p_id'];
    operation = json['operation'];
    date = json['Date'];
    id = json['id'];
    name = json['name'];
    product1 = json['product1'];
    product2 = json['product2'];
    product3 = json['product3'];
    product4 = json['product4'];
    discount = json['discount'];
    price = json['price'];
    sale = json['sale'];
    category = json['category'];
    sId = json['s_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['p_id'] = this.pId;
    data['operation'] = this.operation;
    data['Date'] = this.date;
    data['id'] = this.id;
    data['name'] = this.name;
    data['product1'] = this.product1;
    data['product2'] = this.product2;
    data['product3'] = this.product3;
    data['product4'] = this.product4;
    data['discount'] = this.discount;
    data['price'] = this.price;
    data['sale'] = this.sale;
    data['category'] = this.category;
    data['s_id'] = this.sId;
    return data;
  }
}