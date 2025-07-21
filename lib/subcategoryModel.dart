class subcategoryModel {
  String? message;
  bool? status;
  List<subcategories>? data;

  subcategoryModel({this.message, this.status, this.data});

  subcategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <subcategories>[];
      json['data'].forEach((v) {
        data!.add(new subcategories.fromJson(v));
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

class subcategories {
  String? id;
  String? catid;
  String? subcatname;
  String? subcatdescription;
  String? image;

  subcategories(
      {this.id,
        this.catid,
        this.subcatname,
        this.subcatdescription,
        this.image});

  subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catid = json['catid'];
    subcatname = json['subcatname'];
    subcatdescription = json['subcatdescription'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catid'] = this.catid;
    data['subcatname'] = this.subcatname;
    data['subcatdescription'] = this.subcatdescription;
    data['image'] = this.image;
    return data;
  }
}
