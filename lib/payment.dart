//import 'dart:js';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ecommerce/Modal%20class/subghttp.dart';
import 'package:ecommerce/Modal%20class/transhttp.dart';
import 'package:ecommerce/invoice.dart';
	import 'package:razorpay_flutter/razorpay_flutter.dart';
	DateTime date=DateTime.now();
  String format=DateFormat('yyyy-MM-dd').format(date);
  DateTime ss=DateTime(date.year,date.month+2,date.day);
  String format1=DateFormat('yyyy-MM-dd').format(ss);
  DateTime ss1=DateTime(date.year,date.month+6,date.day);
  String format2=DateFormat('yyyy-MM-dd').format(ss1);
  String g="";
String h="";
httpServices21 hts=httpServices21();
//  String newDate=DateFormat('yyyy-MM-dd').format();
	var sellid;
  var pr;
	var i=0;
  var order_id;
  var trans_id;
  var se;
  var sds;
  httpServices20 htp=httpServices20();
	class MyApp15 extends StatelessWidget {
	   MyApp15(var dd,int j,int k)
     {print(format);
     print(format1);
     sds=dd;
      sellid='68';
      pr=j;
      se=k;
      print(sellid);
      print(pr);
      if(k==1)
      {
g=g+format;
h=h+format1;

      }
      else
      {
        g=g+format;
        h=h+format2;
      }
     }
	
	  // This widget is the root of your application.
	  @override
	  Widget build(BuildContext context) {
	    return MaterialApp(
	      title: 'Flutter Demo',
	      theme: ThemeData(
	        // This is the theme of your application.
	        //
	        // Try running your application with "flutter run". You'll see the
	        // application has a blue toolbar. Then, without quitting the app, try
	        // changing the primarySwatch below to Colors.green and then invoke
	        // "hot reload" (press "r" in the console where you ran "flutter run",
	        // or simply save your changes to "hot reload" in a Flutter IDE).
	        // Notice that the counter didn't reset back to zero; the application
	        // is not restarted.
	        primarySwatch: Colors.blue,
	      ),
	      home: const MyHomePage(title: 'Flutter Demo Home Page'),
	    );
	  }
	}
	
	class MyHomePage extends StatefulWidget {
	  const MyHomePage({super.key, required this.title});
	
	  // This widget is the home page of your application. It is stateful, meaning
	  // that it has a State object (defined below) that contains fields that affect
	  // how it looks.
	
	  // This class is the configuration for the state. It holds the values (in this
	  // case the title) provided by the parent (in this case the App widget) and
	  // used by the build method of the State. Fields in a Widget subclass are
	  // always marked "final".
	
	  final String title;
	
	  @override
	  State<MyHomePage> createState() => _MyHomePageState();
	}
	
	class _MyHomePageState extends State<MyHomePage> {
	  int _counter = 0;
	
	  void _incrementCounter() {
	    setState(() {
	      // This call to setState tells the Flutter framework that something has
	      // changed in this State, which causes it to rerun the build method below
	      // so that the display can reflect the updated values. If we changed
	      // _counter without calling setState(), then the build method would not be
	      // called again, and so nothing would appear to happen.
	      _counter++;
	    });
	  }
	
	  @override
	  Widget build(BuildContext context) {
	    // This method is rerun every time setState is called, for instance as done
	    // by the _incrementCounter method above.
	    //
	    // The Flutter framework has been optimized to make rerunning build methods
	    // fast, so that you can just rebuild anything that needs updating rather
	    // than having to individually change instances of widgets.
	    return Scaffold(
	      appBar: AppBar(
          
	        // Here we take the value from the MyHomePage object that was created by
	        // the App.build method, and use it to set our appbar title.
	        title: Text(widget.title),
	      ),
	      body: Center(
	        // Center is a layout widget. It takes a single child and positions it
	        // in the middle of the parent.
	        child: Column(
	          // Column is also a layout widget. It takes a list of children and
	          // arranges them vertically. By default, it sizes itself to fit its
	          // children horizontally, and tries to be as tall as its parent.
	          //
	          // Invoke "debug painting" (press "p" in the console, choose the
	          // "Toggle Debug Paint" action from the Flutter Inspector in Android
	          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
	          // to see the wireframe for each widget.
	          //
	          // Column has various properties to control how it sizes itself and
	          // how it positions its children. Here we use mainAxisAlignment to
	          // center the children vertically; the main axis here is the vertical
	          // axis because Columns are vertical (the cross axis would be
	          // horizontal).
	          mainAxisAlignment: MainAxisAlignment.center,
	          children: <Widget>[
	            const Text(
	              'Pay with Razorpay',
	            ),
	            ElevatedButton(onPressed: (){
	                  Razorpay razorpay = Razorpay();
	                  var options = {
	                    'key': 'rzp_test_HNgCYoQZ9HmHb2',
	                    'amount': 100*pr,
	                    'name': 'Acme Corp.',
	                    'description': 'Fine T-Shirt',
	                    'retry': {'enabled': true, 'max_count': 1},
                      'send_sms_hash': true,
	                    'prefill': {'contact': '9140967607', 'email': 'test@razorpay.com'},
	                    'external': {
	                      'wallets': ['paytm']
	                    }
	                  };
	                  razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
	               razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
                
                  
	                  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
	                  razorpay.open(options);
                  
                    
                    
	                },
	                child: const Text("Pay with Razorpay")),
	          ],
	        ),
	      ),
	      floatingActionButton: FloatingActionButton(
	        onPressed: _incrementCounter,
	        tooltip: 'Increment',
	        child: const Icon(Icons.add),
	      ), // This trailing comma makes auto-formatting nicer for build methods.
	    );
	  }
	
	  void  handlePaymentErrorResponse(PaymentFailureResponse response){
	    /*
	    * PaymentFailureResponse contains three values:
	    * 1. Error Code
	    * 2. Error Description
	    * 3. Metadata
	    * */i=0;
	    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");

    }
	
	 void  handlePaymentSuccessResponse(PaymentSuccessResponse response) async{
	    /*
	    * Payment Success Response contains three values:
	    * 1. Order ID
	    * 2. Payment ID
	    * 3. Signature
	    * */
      i=1;
      var pl="Standard";
      if(se==2)
      {pl="Standard";
i=2;
      }
      else
      {
        pl="Premium";
        i=3;
        format1=format2;
      }
    Random random=Random();
    int r=random.nextInt(100);
    int q=random.nextInt(1000);
      trans_id=response.paymentId;
      
      print(r);
      print(sds.toString());
      print(se.toString());
      print(pl.toString());
      print(i);
     await hts.insert(r.toString(),sds.toString(), format.toString(),format1.toString() , pl.toString(), (i).toString()); 

  await  htp.Savereceipt(r.toString(),response.paymentId.toString(),format.toString(),pr.toString());
 Future.delayed(Duration.zero,()=>
	showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}",
  
    ));
	  }
	
	  void handleExternalWalletSelected(ExternalWalletResponse response){
	    showAlertDialog(context, "External Wallet Selected","${response.walletName}");
	  }
	
	  void showAlertDialog(BuildContext context, String title, String message){
	    // set up the buttons
	    Widget continueButton = ElevatedButton(
	      child: const Text("Continue"),
	      onPressed:  () {
           Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>Pdfin(id:sds.toString())
                             ),
                           );
        },
	    );
	    // set up the AlertDialog
	    AlertDialog alert = AlertDialog(
	      title: Text(title),
	      content: Text(message),
	      actions: [
	        continueButton,
	      ],
	    );
	    // show the dialog
	    showDialog(
	      context: context,
	      builder: (BuildContext context) {
	        return alert;
	      },
	    );
	  }
	}
   void open(Map<String, dynamic> options) async {}