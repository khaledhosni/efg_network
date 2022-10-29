import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:efg_network/model/Product.dart';
import 'package:efg_network/network/BaseAPI.dart';
import 'package:efg_network/network/ProductService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      builder: EasyLoading.init(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(onPressed: () async{

                  EasyLoading.show(status: "Getting Data");
                try {

                  var ps=ProductService();

                  Product p=await ps.getProductByID(91);

                  print(p.name);
                  EasyLoading.dismiss();

                } on Exception catch(e){

                  EasyLoading.showToast(e.toString());
                }



                    }, child: Text("Get Product By ID")),
                ElevatedButton(onPressed: () async{

                  EasyLoading.show(status: 'Getting Products');

                  try {
                    List<Product> l = await ProductService().getAllProducts();

                    l.forEach((element) {
                      print(element.name);
                    });
                  } catch(e){
                    print(e);
                      }

                  EasyLoading.dismiss();

                }, child: Text("Get All Products")),
                ElevatedButton(onPressed: (){}, child: Text("Add New Product")),
                ElevatedButton(onPressed: (){}, child: Text("Update Product")),

                Expanded(child:ImagePickerWidget())

              ],

            ),
          ),
        ),
      ),
    );
  }
}


class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  
  bool imageThumb=true;
  XFile? f;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
            child: Container(
              margin: EdgeInsets.all(62),
              child: imageThumb?Image.asset("image/upload.png"):
              Image.file(File(f!.path))


              ,
            ),

            onTap: ()async{



             XFile? file =await ImagePicker().pickImage(source: ImageSource.camera);

             if(file!=null){

               setState(() {
                 imageThumb=false;
                 f=file;
               });
             }

            },

          ),
       flex: 11,
        ),

        Expanded(child:
        ElevatedButton(onPressed: ()async{

          var imageBytes=await f?.readAsBytes();

          var imageString=base64Encode(imageBytes!);



              }, child: Text("Upload Image")),
        flex: 1,
        )

      ],
    );
  }
}
