import 'dart:convert';
import 'package:firebase_api_interview/productscreen.dart';
import 'package:firebase_api_interview/subcategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'categoryModel.dart';


class Subcategoryrscreen extends StatefulWidget {

  final categoris Categoris;
  const Subcategoryrscreen({super.key, required this.Categoris});

  @override
  State<Subcategoryrscreen> createState() => _SubcategoryrscreenState();
}

class _SubcategoryrscreenState extends State<Subcategoryrscreen> {
  List<subcategories>subcategorilist=[];
  bool isLoading=true;

  Future<void>subcategoryApi()async{
    try{
     final response=await http.post(Uri.parse("https://physiotherapycenter.mdidminfoway.com/darsita/bagsellingApi/selectBagsubcategories.php",),
         body: {'id':widget.Categoris.idss ?? ''}
     );
     if(response.statusCode==200){
       subcategoryModel subcategormodel=subcategoryModel.fromJson(jsonDecode(response.body));
       if(subcategormodel.data!=null){
        setState(() {
          subcategorilist=subcategormodel.data!;
          isLoading=false;
        });
       }
     }else{
       throw Exception('falid load subcategory');
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
    super.initState();
    subcategoryApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Categoryscreen'),
      ),
      body: ListView.builder(
          itemCount: subcategorilist.length,
          itemBuilder: (BuildContext context,int index){
            final item=subcategorilist[index];
            return InkWell(onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Productscreen(subCategories: item)));
            },
              child: Column(
                children: [
                  Text("id: ${item.id ?? ''}"),
                  Text("${item.subcatname ?? ''}"),
                  Image.network("${item.image ?? ''}")
                ],
              ),
            );
      }),
    );
  }
}
