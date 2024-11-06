import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fooddelivery/widget/app_widgets.dart';
import 'package:image_picker/image_picker.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final List<String> items = ['Burger', 'Ice-Cream', 'Salad', 'Pizza'];
  String? value;
  TextEditingController itemnamecontroller = new TextEditingController();
  TextEditingController itempriceController = new TextEditingController();
  TextEditingController itemdetailcontroller = new TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedimage;

  Future pickimage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectedimage = File(image!.path);
    setState(() {});
  }

  @override  // This should be inside the _AddFoodState class
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {},
            child: Icon(Icons.navigate_before_outlined, color: Colors.white,)),
        title: Text("Add Items", style: AppWidget.headlineTextFieldStyle(),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(margin: EdgeInsets.only(left: 20, right: 20.0, bottom: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Upload the Item Picture", style: AppWidget.semiboldTextFieldStyle(),),
            SizedBox(height: 10,),
            if (selectedimage == null) GestureDetector(
              onTap: (){
                pickimage();
              },
              child: Center(
                child: Material(elevation: 10.0,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(child: Icon(Icons.camera_alt_outlined, color: Colors.black,)),
                  ),),),
            ) else Center(
              child: Material(elevation: 10.0,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: ClipRRect(
                      borderRadius:  BorderRadius.circular(20.0),
                    child: Image.file(selectedimage!,fit: BoxFit.cover,
                    ),
                  ),
                ),),),
            SizedBox(height: 20.0,),
            Text("Item Name", style: AppWidget.semiboldTextFieldStyle(),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffececf8), borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: itemnamecontroller,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Enter Item Name",
                    hintStyle: AppWidget.lightTextFieldStyle()),
              ),
            ),
            SizedBox(height: 20.0,),
            Text("Item Price", style: AppWidget.semiboldTextFieldStyle(),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffececf8), borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: itempriceController,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Enter Item Price",
                    hintStyle: AppWidget.lightTextFieldStyle()),
              ),
            ),
            SizedBox(height: 20.0,),
            Text("Item Detail", style: AppWidget.semiboldTextFieldStyle(),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffececf8), borderRadius: BorderRadius.circular(10)),
              child: TextField(maxLines: 6,
                controller: itemdetailcontroller,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Enter Item Detail",
                    hintStyle: AppWidget.lightTextFieldStyle()),
              ),
            ),
            SizedBox(height: 20,),
            Text("Select Category", style: AppWidget.semiboldTextFieldStyle(),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffececf8), borderRadius: BorderRadius.circular(10)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value,  // The selected value
                  items: items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,  // Set the value for each item
                      child: Text(item, style: TextStyle(fontSize: 18.0, color: Colors.black)),
                    );
                  }).toList(),
                  dropdownColor: Colors.white,
                  hint: Text("Select Category"),
                  iconSize: 36,
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (newValue) {
                    setState(() {
                      value = newValue;  // Update the selected value
                    });
                  },
                ),
              ),
            )
          ],),
        ),
      ),
    );
  }
}
