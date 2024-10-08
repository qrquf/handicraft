import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce/Api/Api_connection.dart';
import 'package:ecommerce/Modal%20class/productmodal1.dart';
import 'package:ecommerce/Api/producthttp.dart';
import 'package:ecommerce/Modal%20class/productmodal.dart';
import 'package:ecommerce/Api/sellerhttp.dart';
import 'package:ecommerce/OnlineShopping/reusableWidget/reusableWidget.dart';
import 'package:ecommerce/Seller/AddProduct.dart';
import 'package:ecommerce/Seller/Product_images.dart';
import 'package:ecommerce/Seller/prodDetails.dart';
import './DashComponent.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddProduct1 extends StatefulWidget {
  final String? id;
  final String? name;
  final String? product1;
  final String? product2;
  final String? product3;
  final String? discount;
  final String? price;
  final String? category;
  final String? sale;

  const AddProduct1({
    Key? key,
    this.id,
    this.name,
    this.product1,
    this.product2,
    this.product3,
    this.discount,
    this.price,
    this.category,
    this.sale
  }) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct1> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();

  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  
  String? selectedCategory;
  File? image1, image2, image3;

  final List<String> listItems = [
    "choose category",
    "Wall Painting",
    "Sculpture",
    "Drawing",
    "Pottery",
    "Cubism",
    "Photography",
    "Digital Art"
  ];

  @override
  void initState() {
    super.initState();
    controller.text = widget.name ?? '';
    controller1.text = widget.price ?? '';
    controller2.text = widget.discount ?? '';
    controller3.text = widget.category ?? '';
    selectedCategory = widget.category;
  }

  Future<void> pickImage(ImageSource source, Function(File?) onImagePicked) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        final imageTemp = File(image.path);
        setState(() {
          onImagePicked(imageTemp);
        });
      }
    } on PlatformException catch (e) {
      _showErrorDialog("Failed to pick image: $e");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text("Error"), content: Text(message));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text("Add Product", style: TextStyle(fontSize: 20)),
        actions: [
          TextButton(
            onPressed: () {
              // Save product logic here
            },
            child: Text("Save", style: TextStyle(color: Colors.purple)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Product Name", Icons.card_travel, controller),
              SizedBox(height: 12),
              _buildTextField("Price", Icons.attach_money, controller1),
              SizedBox(height: 12),
              _buildTextField("Discount Price", Icons.discount, controller2),
              SizedBox(height: 12),
              _buildTextField("Quantity", Icons.shopping_cart, controller3),
              SizedBox(height: 20),
              _buildImagePickerRow(),
              SizedBox(height: 20),
              Divider(color: Colors.white),
              _buildCategorySelection(),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // Submit logic here
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor  : Colors.green,
                  ),
                  child: Text("Submit", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData icon, TextEditingController controller) {
    return Card(
      elevation: 5,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildImagePickerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildImagePicker(image1, (image) => image1 = image),
        _buildImagePicker(image2, (image) => image2 = image),
        _buildImagePicker(image3, (image) => image3 = image),
      ],
    );
  }

  Widget _buildImagePicker(File? image, Function(File?) onImagePicked) {
    return InkWell(
      onTap: () => pickImage(ImageSource.gallery, onImagePicked),
      child: Card(
        child: image != null
            ? Image.file(image, width: 100, height: 100, fit: BoxFit.cover)
            : Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text("Upload Image", textAlign: TextAlign.center)),
              ),
      ),
    );
  }

  Widget _buildCategorySelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Choose Category", style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: listItems.map((category) {
            return ChoiceChip(
              label: Text(category),
              selected: selectedCategory == category,
              onSelected: (isSelected) {
                setState(() {
                  selectedCategory = isSelected ? category : null;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
