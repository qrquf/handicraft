import 'package:ecommerce/Api/subghttp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce/Api/Api_connection.dart';
import 'package:ecommerce/Modal%20class/productmodal1.dart';
import 'package:ecommerce/Api/producthttp.dart';
import 'package:ecommerce/Modal%20class/sellerModal.dart';
import 'package:ecommerce/Modal%20class/subgmodal.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

httpServices21 htt = httpServices21();
TextEditingController controller = TextEditingController();
TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();
TextEditingController controller3 = TextEditingController();
TextEditingController controller4 = TextEditingController();
var sid;
String s = "";

class AddProduct12 extends StatefulWidget {
  AddProduct12(var v1) {
    sid = v1;
  }

  @override
  AddProductState createState() {
    return AddProductState();
  }
}

class AddProductState extends State<AddProduct12> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  File? image1, image2, image3;

  Future pickImage(ImageSource source, BuildContext context, Function(File?) onImagePicked) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagetemp = File(image.path);
      setState(() {
        onImagePicked(imagetemp);
      });
    } on PlatformException catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(title: Text("Failed to pick image:"), content: Text(message));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Add Product", style: TextStyle(fontSize: 18)),
        actions: [
          TextButton(
            onPressed: () {
              saveProduct(context);
            },
            child: Text("Save", style: TextStyle(color: Colors.purple)),
          ),
        ],
      ),
      body: FutureBuilder<List<subg>>(
        future: htt.getAllPost(sid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<subg>? data = snapshot.data;
            return buildProductForm(context, data!);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildProductForm(BuildContext context, List<subg> posts) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField("Product Name", controller),
            SizedBox(height: 12),
            buildTextField("Actual Price", controller1),
            SizedBox(height: 12),
            buildTextField("Discount Price", controller2),
            SizedBox(height: 12),
            buildTextField("Quantity", controller3),
            SizedBox(height: 20),
            buildCategorySelection(),
            SizedBox(height: 20),
            buildImagePickerRow(context),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  saveProduct(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text("Submit", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget buildCategorySelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Choose Category", style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: [
            buildChoiceChip("Sculpture", value1, (selected) {
              setState(() {
                s = "Sculpture";
                resetCategorySelection();
                value1 = selected;
              });
            }),
            buildChoiceChip("Wall Painting", value2, (selected) {
              setState(() {
                s = "Wall Painting";
                resetCategorySelection();
                value2 = selected;
              });
            }),
            buildChoiceChip("Cubism", value3, (selected) {
              setState(() {
                s = "Cubism";
                resetCategorySelection();
                value3 = selected;
              });
            }),
            buildChoiceChip("Digital Art", value4, (selected) {
              setState(() {
                s = "Digital Art";
                resetCategorySelection();
                value4 = selected;
              });
            }),
            buildChoiceChip("Photography", value5, (selected) {
              setState(() {
                s = "Photography";
                resetCategorySelection();
                value5 = selected;
              });
            }),
          ],
        ),
      ],
    );
  }

  Widget buildChoiceChip(String label, bool selected, ValueChanged<bool> onSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
    );
  }

  void resetCategorySelection() {
    value1 = false;
    value2 = false;
    value3 = false;
    value4 = false;
    value5 = false;
  }

  Widget buildImagePickerRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildImagePicker(image1, () {
          pickImage(ImageSource.gallery, context, (image) => image1 = image);
        }),
        buildImagePicker(image2, () {
          pickImage(ImageSource.gallery, context, (image) => image2 = image);
        }),
        buildImagePicker(image3, () {
          pickImage(ImageSource.gallery, context, (image) => image3 = image);
        }),
      ],
    );
  }

  Widget buildImagePicker(File? image, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          width: 100,
          height: 100,
          child: image != null
              ? Image.file(image, fit: BoxFit.cover)
              : Center(child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey)),
        ),
      ),
    );
  }

  void saveProduct(BuildContext context) {
    // Implement save product logic
  }
}
