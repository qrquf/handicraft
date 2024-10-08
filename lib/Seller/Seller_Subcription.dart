import 'package:ecommerce/Api/subghttp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce/Modal%20class/subgmodal.dart';

import 'package:ecommerce/payment.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
var sid;
var sr=0;
var ids;
  var name;
  var planname;
var price;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp({idd})
  {
    ids=idd;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handy Subscriptions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HandySubscription('66'),
    );
  }
}
var ig;
httpServices21 htp=httpServices21();
class HandySubscription extends StatefulWidget {
  HandySubscription(var dd)
  {
    ig=dd;
    if(ig==null)
    {
      ig='66';
    }
  }
  @override
  _HandySubscriptionState createState() => _HandySubscriptionState();
}

class _HandySubscriptionState extends State<HandySubscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: false,
        leading: IconButton(icon:Icon(
         Icons.arrow_back,color: Colors.black,),onPressed: () {Navigator.pop(context);},
        ),
        title: Text(
          'Subscriptions',
          style: TextStyle(color: Colors.black,fontSize: 14),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:FutureBuilder<List<subg>>
      (
      
        future: htp.getAllPost(ig) ,
        builder: ((context, snapshot) {
          //if(snapshot.hasData)
          //{
          if(snapshot.hasData)
          {
            List<subg>? picture = snapshot.data!;
            return xyz(context,picture);
          }
          //}
        
        //else{
          return CircularProgressIndicator();
        //}
        }),

      )
    );
  }

xyz(BuildContext context,List<subg> posts)
{if(posts[0].planName!=null)
{
  name=posts[0].planName.toString();
  price=posts[0].price.toString();
}
else
{
  name="Basic";
  price="free";
}
  if(posts[0].subsValue.toString()==2.toString())
  {
    sr=1;
  }
  else if(posts[0].subsValue.toString()==3.toString())
  {
    sr=2;
  }

  return SingleChildScrollView(child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child:SingleChildScrollView(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [ 
          
            _handylogo(),
            _handy(),
 //         _currentPlan(),
        //    _infoBox(),
           // _cancelSubscription(),
          _otherPlanLayout(),
          
          ],
        ),
      ),
      
    )
    );
}
  ///other plan layouts
  Widget _otherPlanLayout() {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * 0.1,
          left: MediaQuery.of(context).size.width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _otherPlansLabel(),
          _planRow(),
        ],
      ),
    );
  }

  Widget _planRow() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _standardPlanBox(),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          _premiumPlanBox()
        ],
      ),
    );
  }

  ///Standard plan box
  Widget _standardPlanBox() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.redAccent[100],
          highlightColor: Colors.white,
          onTap: () => {print('Tapped')},
          child: Container(
            height: MediaQuery.of(context).size.width * 0.4,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildPlanLabel('Standard'),
                _buildPlanPrice('\$12.99/mo'),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildFeatureLabel('-Upload upto 5 paid adds'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: _buildFeatureLabel(
                      '-offer valid for 2 month'),

                ),
                SizedBox(height:10),
                Align(alignment:Alignment.bottomRight,child:ElevatedButton(child:Text("buy now"),onPressed: () async{
                  if(sr!=2 && sr!=3)
                  {
                  httpServices21 hts=httpServices21();
              //  await  hts.insert((12122).toString(), (5).toString(), '2023-03-05', '2023-09-05', "Premium", (3).toString());
                  Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>  MyApp15(ig.toString(),600,2),
                             ),
                           );
                }
                else
                {
                  Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("you already have that plan you can only upgrade to other"),))));
                }
                },))
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///Premium plan box
  Widget _premiumPlanBox() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.redAccent[100],
          highlightColor: Colors.white,
          onTap: () => {print('Tapped')},
          child: Container(
            height: MediaQuery.of(context).size.width * 0.4,
            width: MediaQuery.of(context).size.width * 0.35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildPlanLabel('Premium'),
                _buildPlanPrice('\$18.99/mo'),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: _buildFeatureLabel('-add upto 10 paid adds'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: _buildFeatureLabel(
                      'get 6month access'),
                ),
                
                SizedBox(height:10),
                Align(alignment:Alignment.bottomRight,child:ElevatedButton(child:Text("buy now"),onPressed: () {
                  if(sr!=3)
                  {
                   Navigator.pushReplacement(
                           context,
                            MaterialPageRoute(
                               builder: (context) =>  MyApp15(ig.toString(),1000,3),
                             ),
                           );
                }
                else{
                  Future.delayed(Duration.zero,()=>showDialog(context: context, builder: ((context) => AlertDialog(
                  title:Text("you have the highest version of the plan")))));
                }},))
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///build price
  Widget _buildPlanPrice(String price) {
    return Text(
      price,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w900, fontSize: 14),
      textAlign: TextAlign.center,
    );
  }

  ///build feature row label
  Widget _buildFeatureLabel(String label) {
    return Text(
      label,
      style: TextStyle(
          letterSpacing: 0.2,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 10),
      textAlign: TextAlign.start,
    );
  }

  Widget _buildPlanLabel(String label) {
    return Text(
      label,
      style: TextStyle(
          letterSpacing: 0.1,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 12),
      textAlign: TextAlign.center,
    );
  }

  ///other plan label at bottom
  Widget _otherPlansLabel() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.06),
      child: Text(
        'Other Plans',
        style: TextStyle(
            letterSpacing: 0.5,
            color: Colors.grey,
            fontWeight: FontWeight.w800,
            fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }

  ///Cancel subscription option
  Widget _cancelSubscription() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'CANCEL SUBSCRIPTION',
            style: TextStyle(
                letterSpacing: 0.5,
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Icon(
            CupertinoIcons.forward,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  ///Subscription info box
  Widget _infoBox() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08),
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            'Your current subscription will end today.\nAnd will be renewed automatically.',
            style: TextStyle(
                letterSpacing: 1,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  ///Netflix text
  Widget _handy() {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Text('handy',
            style: TextStyle(
                fontSize: 34,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _currentPlan() {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(price.toString(),
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            Text(planname.toString(),
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _handylogo() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black54.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 1))
          ]),
      child: Center(
        child: Text(
          'H',
          style: TextStyle(
              fontSize: 34, color: Colors.pink, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}