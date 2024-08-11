class subd {
  String? sellerId;
  String? subscriptionId;
  String? startDate;
  String? expiryDate;
  String? planName;
  String? subsValue;

  subd(
      {this.sellerId,
      this.subscriptionId,
      this.startDate,
      this.expiryDate,
      this.planName,
      this.subsValue});

  subd.fromJson(Map<String, dynamic> json) {
    sellerId = json['Seller_id'];
    subscriptionId = json['Subscription_id'];
    startDate = json['Start_date'];
    expiryDate = json['Expiry_date'];
    planName = json['Plan_name'];
    subsValue = json['subs_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Seller_id'] = this.sellerId;
    data['Subscription_id'] = this.subscriptionId;
    data['Start_date'] = this.startDate;
    data['Expiry_date'] = this.expiryDate;
    data['Plan_name'] = this.planName;
    data['subs_value'] = this.subsValue;
    return data;
  }
}