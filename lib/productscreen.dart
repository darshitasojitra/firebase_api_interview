import 'dart:convert';

import 'package:firebase_api_interview/productModel.dart';
import 'package:firebase_api_interview/subcategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Productscreen extends StatefulWidget {
  final subcategories subCategories;
  const Productscreen({super.key, required this.subCategories});

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
List<Data>productlist=[];
bool isLoading=true;

Future<void>productApi()async{
  try{
    final response=await http.post(Uri.parse("https://physiotherapycenter.mdidminfoway.com/darsita/bagsellingApi/selectBagProducts.php"),
    body: {'id':widget.subCategories.id});
    if(response.statusCode==200){
      productModel productmodel=productModel.fromJson(jsonDecode(response.body));
      if(productmodel.data!=null){
       setState(() {
         productlist=productmodel.data!;
         isLoading=false;
       });
      }
    }else{
      throw Exception('failed load product');
    }
  }catch(e){
    print('error $e');
    setState(() {
      isLoading=false;
    });
  }
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    productApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: productlist.length,
          itemBuilder: (BuildContext context,int index){
            final item=productlist[index];
            return Column(
              children: [
                Text('${item.id ?? ''}'),
                Text('${item.catid?? ''}'),
                Text('${item.productname ?? ''}'),
                Text('${item.productdescription ?? ''}'),
                Image.network('${item.image??''}'),
              ],
            );
      }),
    );
  }
}
