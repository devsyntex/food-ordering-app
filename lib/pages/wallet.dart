import 'package:flutter/material.dart';
import 'package:fooddelivery/widget/app_widgets.dart';
class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Center(child: Text(
                  "Wallet",style: AppWidget.headlineTextFieldStyle()))),
            ),
            SizedBox(height: 35.0,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
            ),
            child: Row(
              children: [
                Icon(Icons.wallet_outlined,size: 60,),
                SizedBox(width: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Wallet",style: AppWidget.semiboldTextFieldStyle(),),
                    SizedBox(height: 5.0,),
                    Text("\$+100",style: AppWidget.boldTextFieldStyle(),),

                  ],
                )
              ],
            ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Add Money",style: AppWidget.semiboldTextFieldStyle(),),
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               pricebox(text: "\$500"),
               pricebox(text: "\$1000"),
               pricebox(text: "\$2000"),
               pricebox(text: "\$5000"),
              ],
            ),
            SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("Add Money",style: AppWidget.boldTextFieldStyle(),),
            )
            

          ],
        ),
      ),
    );
  }
}
class pricebox extends StatelessWidget {
  final String text;
  const pricebox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Material(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(5)
        ),
        child: Text(text,style: AppWidget.lightTextFieldStyle(),),
      ),
    );
  }
}

