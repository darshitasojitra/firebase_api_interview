import 'dart:convert';

import 'package:firebase_api_interview/subcategoryrscreen.dart';
import 'package:flutter/material.dart';
import 'categoryModel.dart';
import 'package:http/http.dart' as http;

class Productdetailscreen extends StatefulWidget {
  const Productdetailscreen({super.key});

  @override
  State<Productdetailscreen> createState() => _ProductdetailscreenState();
}

class _ProductdetailscreenState extends State<Productdetailscreen> {
  List<categoris> categorylist = [];
  bool isLoading = true;

  Future<void> categoriApi() async {
    try {
      final response = await http.post(Uri.parse(
          "https://physiotherapycenter.mdidminfoway.com/darsita/bagsellingApi/selectBagCategory.php"),
      // body: {"id":id},
      );
      if (response.statusCode == 200) {
        Categorymodel categorymodel =
        Categorymodel.fromJson(jsonDecode(response.body));
        if (categorymodel.categorys != null) {
          setState(() {
            categorylist = categorymodel.categorys!;
            isLoading = false;
          });
        }
      } else {
        throw Exception('failed load product');
      }
    } catch (e) {
      print('error $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    categoriApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? CircularProgressIndicator()
          : categorylist.isEmpty
              ? Center(child: Text('no product found'))
              : ListView.builder(
                  itemCount: categorylist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Subcategoryrscreen(Categoris: categorylist[index],)));
                    },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 3)),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(categorylist[index].idss.toString()),
                            Text(categorylist[index].catname.toString()),
                            Text(categorylist[index].catdescription.toString()),
                            Image.network(categorylist[index].image.toString())
                          ],
                        ),
                      ),
                    );
                  }),
    );
  }
}
