class cartmodal {
  String? u_id;
  String? p_id;

  cartmodal({this.u_id, this.p_id});

  cartmodal.fromJson(Map<String, dynamic> json) {
    u_id=json['u_id'];
    p_id = json['p_id'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   //data['id']=this.id;
    data['u_id'] = this.u_id;
    data['p_id'] = this.p_id;
    
    return data;
  }
}
