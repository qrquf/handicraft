class product{
  String? name;
  String? price;
  String? discount;
  String? sale;
  product(name,price,discount,sale)
  {
this.name=name;
this.price=price;
this.discount=discount;
this.sale=sale;
  }
  Map<String,dynamic> toJson() =>
  {
    'name':name.toString(),
    'price':price.toString(),
    'discount':discount.toString(),
    'sale':sale.toString(),
      
  };
  Map<String,dynamic> fromJson() =>
  {
    name.toString():'name',
    price.toString():'price',
    discount.toString():'discount',
    sale.toString():'sale',
      
  };
}
