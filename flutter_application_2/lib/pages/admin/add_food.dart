import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/pages/services/database.dart';
import 'package:flutter_application_2/widget/Widget_suppot.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
class add_food extends StatefulWidget {
  const add_food({super.key});

  @override
  State<add_food> createState() => _add_foodState();
}

class _add_foodState extends State<add_food> {
  TextEditingController namecontroller =new TextEditingController();
  TextEditingController priceconroller = new TextEditingController();
  TextEditingController detailconroller = new TextEditingController();
final List<String>items = ['Burger','Ice-Cream','Pizza','Salad'];
String? value;
final ImagePicker _picker = ImagePicker();
File? Selectedimage;
Future getimage()async{
var image = await _picker.pickImage(source: ImageSource.gallery);
Selectedimage = File(image!.path);
setState(() {
  
});
}
uploaditem() async{
  if(Selectedimage != null && namecontroller.text != " " &&  priceconroller.text!= '' && detailconroller != ""){
    String addId = randomAlphaNumeric(10);
    Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogimages").child(addId);
    final UploadTask task = firebaseStorageRef.putFile(Selectedimage!);
    var downloadurl = await(await task).ref.getDownloadURL();

    Map<String,dynamic> additem = {
"Image" : downloadurl,
'name' : namecontroller.text,
'price' : priceconroller.text,
'detail' : detailconroller.text,
    };
    await Databasemethod().Addfooditem(additem, value!).then((value) {
      ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(' Added Successfully',style: TextStyle(fontSize: 18),))));
    });
  }
} 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_outlined,color: Color(0xFF373866),)),
          centerTitle: true,
          title: Text('Add Food Items',style: Appwidget.Headlinetextstyle(),),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Upload the Item Picture',style: Appwidget.semiboldtextstyle(),),
              SizedBox(height: 20,),
         Selectedimage == null?  GestureDetector(
          onTap: (){
            getimage();
          },
           child: Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 1.5,),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(Icons.camera_alt_outlined,color: Colors.black,),
                    ),
                  ),
                ),
         ):  Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 1.5,),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        Selectedimage!,fit: BoxFit.cover,
                      ),
                    )
                  ),
                ),),
              SizedBox(height:40),
              Text('Item Name ',style: Appwidget.semiboldtextstyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your Item',
                    hintStyle: Appwidget.lightlinetextstyle(),
                  ),
                ),
              ),
               SizedBox(height:40),
              Text('Item Price ',style: Appwidget.semiboldtextstyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: priceconroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your Price',
                    hintStyle: Appwidget.lightlinetextstyle(),
                  ),
                ),
              ),
               SizedBox(height:40),
              Text('Item Desciption ',style: Appwidget.semiboldtextstyle(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  maxLines: 6,
                  controller: detailconroller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your Detail.....',
                    hintStyle: Appwidget.lightlinetextstyle(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text('Select the Category',style: Appwidget.semiboldtextstyle(),),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFFececf8),borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: 
                      items.map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,style: TextStyle(color: Colors.black,fontSize: 18),))).toList(),
                    
                   onChanged:((value){
                    setState(() {
                      this.value = value;
                    });
                   }),
                    dropdownColor: Colors.white,
                    hint: Text('Select Category'),
                    iconSize: 36,
                    icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                    value: value,
                    ),),
              ),
              SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  uploaditem();
                },
                child: Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('Add',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}