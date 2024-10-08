class subg {
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
  String? sellerId;
  String? subscriptionId;
  String? startDate;
  String? expiryDate;
  String? planName;
  String? subsValue;

  subg(
      {this.id,
      this.name,
      this.product1,
      this.product2,
      this.product3,
      this.product4,
      this.discount,
      this.price,
      this.sale,
      this.category,
      this.sId,
      this.sellerId,
      this.subscriptionId,
      this.startDate,
      this.expiryDate,
      this.planName,
      this.subsValue});

  subg.fromJson(Map<String, dynamic> json) {
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
    sellerId = json['Seller_id'];
    subscriptionId = json['Subscription_id'];
    startDate = json['Start_date'];
    expiryDate = json['Expiry_date'];
    planName = json['Plan_name'];
    subsValue = json['subs_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['Seller_id'] = this.sellerId;
    data['Subscription_id'] = this.subscriptionId;
    data['Start_date'] = this.startDate;
    data['Expiry_date'] = this.expiryDate;
    data['Plan_name'] = this.planName;
    data['subs_value'] = this.subsValue;
    return data;
  }
}