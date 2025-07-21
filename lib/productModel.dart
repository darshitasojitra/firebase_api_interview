class productModel {
  String? message;
  bool? status;
  List<Data>? data;

  productModel({this.message, this.status, this.data});

  productModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic? id;
  dynamic? catid;
  dynamic? subcatid;
  dynamic? productname;
  dynamic? productdescription;
  dynamic? originalprice;
  dynamic? sellingprice;
  dynamic? option;
  dynamic? image;

  Data(
      {this.id,
        this.catid,
        this.subcatid,
        this.productname,
        this.productdescription,
        this.originalprice,
        this.sellingprice,
        this.option,
        this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catid = json['catid'];
    subcatid = json['subcatid'];
    productname = json['productname'];
    productdescription = json['productdescription'];
    originalprice = json['originalprice'];
    sellingprice = json['sellingprice'];
    option = json['option'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catid'] = this.catid;
    data['subcatid'] = this.subcatid;
    data['productname'] = this.productname;
    data['productdescription'] = this.productdescription;
    data['originalprice'] = this.originalprice;
    data['sellingprice'] = this.sellingprice;
    data['option'] = this.option;
    data['image'] = this.image;
    return data;
  }
}
