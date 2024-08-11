
import 'dart:io';
	import 'dart:typed_data';
	
	import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerce/Modal%20class/subg.dart';
import 'package:ecommerce/Modal%20class/subghttp.dart';
	//import 'package:open_document/open_document.dart';
  //import 'package:open_document/open_document.dart';
	import 'package:path_provider/path_provider.dart';
	import 'package:pdf/pdf.dart';
  import 'package:permission_handler/permission_handler.dart';
	import 'package:pdf/widgets.dart' as pw;
  import '';
	//import 'package:pdf_invoice_generator_flutter/model/product.dart';
var idf;
	class CustomRow {
	  final String itemName;
	  final String itemPrice;
	  final String amount;
	  final String total;
	  final String vat;
	
	  CustomRow(this.itemName, this.itemPrice, this.amount, this.total, this.vat);
	}
	class Pdfin extends StatefulWidget
  {
    Pdfin({
      var id
    })
    {
idf=id;
    }
    @override
    PdfInvoiceService createState()
    {
      return PdfInvoiceService();
    }
  }
	class PdfInvoiceService extends State<Pdfin> {
    void initState()
    {
      super.initState();
    }
	  Future<Uint8List> createHelloWorld() {
	    final pdf = pw.Document();
	    pdf.addPage(
	      pw.Page(
	        pageFormat: PdfPageFormat.a4,
	        build: (pw.Context context) {
	          return pw.Center(
	            child: pw.Text("Hello World"),
	          );
	        },
	      ),
	    );
	
	    return pdf.save();
	  }
	
	  Future<Uint8List> createInvoice(BuildContext context,List<subg> soldProducts) async {
	    final pdf = pw.Document();
	
	    final List<CustomRow> elements = [
	      CustomRow("Item Name", "Item Price", "Amount", "Total", "Vat"),
	      //for (var product in soldProducts)
	        CustomRow(
	          soldProducts[0].planName.toString(),
	          soldProducts[0].price.toString(),
	          soldProducts[0].price.toString(),
	          
	          (int.parse(soldProducts[0].price.toString())).toStringAsFixed(2),
	          (int.parse(soldProducts[0].price.toString())).toStringAsFixed(2),
	        ),
	      CustomRow(
	        "Sub Total",
	        "",
	        "",
	        "",
	        "1000 INR",
	      ),
	      CustomRow(
	        "Vat Total",
	        "",
	        "",
	        "",
	        "1000 INR",
	      ),
	      CustomRow(
	        "Vat Total",
	        "",
	        "",
	        "",
	        "${(soldProducts[0].price).toString()} INR",
	      )
	    ];
	    //final image = (await rootBundle.load("assets/flutter_explained_logo.jpg"))
	      //  .buffer
	       // .asUint8List();
	    pdf.addPage(
	      pw.Page(
	        pageFormat: PdfPageFormat.a4,
	        build: (pw.Context context) {
	          return 
               
            pw.Column(
	            children: [
	             // pw.Image(pw.MemoryImage(image),
	              //    width: 150, height: 150, fit: pw.BoxFit.cover),
	              pw.Row(
	                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
	                children: [
	                  pw.Column(
	                    children: [
	                      pw.Text(soldProducts[0].name.toString()),
	                      pw.Text("Customer Addres"),
	                      pw.Text("Seller id"+soldProducts[0].sellerId.toString()),
	                    ],
	                  ),
	                  pw.Column(
	                    children: [
	                      pw.Text("Siddharth Srivastava"),
	                      pw.Text("3/629 vikas nagar"),
	                      pw.Text("226022"),
	                      pw.Text("Vat-id: 123456"),
	                      pw.Text("Invoice-Nr: 00001")
	                    ],
	                  )
	                ],
	              ),
	              pw.SizedBox(height: 50),
	              pw.Text(
	                  "Dear Customer, thanks for buying at Handy."),
	              pw.SizedBox(height: 25),
                itemColumn(elements),
	              pw.SizedBox(height: 25),
	              pw.Text("Thanks for your trust, and till the next time."),
	              pw.SizedBox(height: 25),
	              pw.Text("Kind regards,"),
	              pw.SizedBox(height: 25),
	              pw.Text("Siddharth Srivastava")
	            ],
	          );
	        },
	      ),
	    );
    
	    return pdf.save();
	  }
	
	  pw.Expanded itemColumn(List<CustomRow> elements) {
	    return pw.Expanded(
	      child: pw.Column(
	        children: [
	          for (var element in elements)
	            pw.Row(
	              children: [
	                pw.Expanded(
	                    child: pw.Text(element.itemName,
	                        textAlign: pw.TextAlign.left)),
	                pw.Expanded(
	                    child: pw.Text(element.itemPrice,
	                        textAlign: pw.TextAlign.right)),
	                pw.Expanded(
	                    child:
	                        pw.Text(element.amount, textAlign: pw.TextAlign.right)),
	                pw.Expanded(
	                    child:
	                        pw.Text(element.total, textAlign: pw.TextAlign.right)),
	                pw.Expanded(
	                    child: pw.Text(element.vat, textAlign: pw.TextAlign.right)),
	              ],
	            )
	        ],
	      ),
	    );
	  }
	
	  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
	    if(Platform.isAndroid)
      {
       var status=await Permission.storage.request();

      if(status.isGranted)
      {//final output = await getApplicationSupportDirectory();
      var dir='/storage/emulated/0/Download/';
     Directory dir1=Directory(dir+"$fileName.pdf");
     print(dir1.path);
	   // var filePath = "${output.path}/$fileName.pdf";
      //print(filePath.toString());
	   
	   
         final file = File(dir1.path);
       await file.writeAsBytes(byteList);
	  //  await OpenDocument.openDocument(filePath:dir1.path );
      }
      else
      {
        print("wrong input");
      }}}
	
	  String getSubTotal(List<subg> products) {
	    return products
	        .fold(0.0,
	            (double prev, element) => prev + (int.parse(element.price.toString()) *int.parse( element.price.toString())))
	        .toStringAsFixed(2);
	  }
	
	  String getVatTotal(List<subg> products) {
	    return products
	        .fold(
	          0.0,
	          (double prev, next) =>
	              prev + ((int.parse(next.price.toString()) / 100 *int.parse( next.price.toString())) * int.parse(next.price.toString())),
	        )
	        .toStringAsFixed(2);
	  }
    httpServices21 htp=httpServices21();
    
      @override
      Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: 500,
        width:500,
        child:
      FutureBuilder<List<subg>>
      (
      
        future: htp.getAllPost(idf) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          if(snapshot.hasData)
          {
            List<subg>? picture = snapshot.data!;
            return createInvoice1(context,picture);
          }
          //}
        
        //else{
          return CircularProgressIndicator();
        //}
        }),

      )
    ));

      }
      List<subg>? post;
      createInvoice1(BuildContext context,List<subg> posts)
      {post=posts;
        PdfInvoiceService service=PdfInvoiceService();
        return Container(
          height:600,
          width:600,
          child: 
        Column(
          
          children:[
         ListView.builder(
          shrinkWrap: true,
          addRepaintBoundaries: true,
          scrollDirection: Axis.vertical,
      itemCount: 1,
      itemBuilder: (context, index) {
        
return Row(
	                    children: [
	                      Expanded(child: Text(posts[0].planName.toString())),
	                      Expanded(
	                        child: Column(
	                          children: [
	                            Text("Price: ${posts[0].price.toString()} €"),
	                            Text("VAT ${posts[0].price.toString()} %")
	                          ],
	                          crossAxisAlignment: CrossAxisAlignment.center,
	                        ),
	                      ),
	                      Expanded(
	                        child: Row(
	                          children: [
	                            Expanded(
	                              child: IconButton(
	                                onPressed: () {
	                                  //setState(() => currentProduct.amount++);
	                                },
	                                icon: const Icon(Icons.add),
	                              ),
	                            ),
	                            Expanded(
	                              child: Text(
	                              posts[0].price.toString(),
	                                textAlign: TextAlign.center,
	                              ),
	                            ),
	                            Expanded(
	                              child: IconButton(
	                                onPressed: () {
	                                  //setState(() => currentProduct.amount--);
	                                },
	                                icon: const Icon(Icons.remove),
	                              ),
	                            )
	                          ],
	                        ),
	                      )
	                    ],
	                  );
      }),
      //Row(
	      //        mainAxisAlignment: MainAxisAlignment.spaceBetween,
	        //      children: [// Text("VAT"), Text("${getVat()} €")
            //    ],
	            //),
	            //Row(
	              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
	              //children: [// Text("Total"), Text("${getTotal()} €")
                //],
	            //),
	            ElevatedButton(
	              onPressed: () async {
              //final data1 = await createInvoice(context,posts);

                 // final data=await File('invoice.pdf').create();
                  //await data.writeAsBytes(await data1.save());
	               final data = await createInvoice(context,posts);
	              await savePdfFile("invoice_${posts[0].price.toString()}", data);
	                //number++;
	              },
	              child: const Text("Create Invoice"),
	            ),
	          ],
	        ));

        
      }
      getTotal(){
       print( post![0].price.toString()); 
        post!
	      .fold(0.0, (double prev, element) => prev + (double.parse(element.price.toString()) * double.parse(element.toString())))
	      .toStringAsFixed(2);
      }
	  getVat() {
      print(post![0].price);
      post!
	      .fold(
	          0.0,
	          (double prev, element) =>
	              prev + (double.parse(element.price.toString()) / 100 * double.parse(element.price.toString() )* int.parse(element.price.toString())))
	      .toStringAsFixed(2);
	}}