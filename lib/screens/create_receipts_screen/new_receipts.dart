import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/dummy_business_controller.dart';
import '../../widgets/input_field.dart';

class NewReceipt extends StatelessWidget {
  final ownBusinessController = Get.put(OwnBusinessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Image.network(
                              'https://toppng.com/uploads/preview/batman-png-11553978541s9xp0sddf1.png'),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                            height: 46,
                            width: 46,
                            child: FlatButton(
                               shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(50),
                               ),
                               color: Colors.white,
                              onPressed: () {},
                              child:
                                  SvgPicture.asset("assets/icons/pencil.svg"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'DIRM GROUP',
                          style: TextStyle(
                              fontSize: 15,
                              height:
                                  2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                              color: Colors.black, //font color
                              // backgroundColor: Colors.black12, //background color
                              letterSpacing: 5, //letter spacing
                              decoration:
                                  TextDecoration.underline, //make underline
                              decorationStyle:
                                  TextDecorationStyle.double, //double underline
                              decorationColor: Colors
                                  .brown, //text decoration 'underline' color
                              decorationThickness:
                                  1.5, //decoration 'underline' thickness
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'TEVI COMMERCIAL PARK-MBEZI BEACH,',
                          style: TextStyle(
                              fontSize: 10,
                              height:
                                  2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                              color: Colors.black, //font color
                              //backgroundColor: Colors.black12, //background color
                              letterSpacing: 5, //letter spacing
                              // decoration:
                              //    TextDecoration.underline, //make underline
                              decorationStyle:
                                  TextDecorationStyle.double, //double underline
                              decorationColor: Colors
                                  .brown, //text decoration 'underline' color
                              decorationThickness:
                                  1.5, //decoration 'underline' thickness
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'P.O.BOX 35880,',
                          style: TextStyle(
                              fontSize: 12,
                              height:
                                  2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                              color: Colors.black, //font color
                              // backgroundColor: Colors.black12, //background color
                              letterSpacing: 5, //letter spacing
                              // decoration:
                              //   TextDecoration.underline, //make underline
                              // decorationStyle:
                              //  TextDecorationStyle.double, //double underline
                              decorationColor: Colors
                                  .brown, //text decoration 'underline' color
                              decorationThickness:
                                  1.5, //decoration 'underline' thickness
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          'DAR ES SALAAM,',
                          style: TextStyle(
                              fontSize: 11,
                              height:
                                  2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                              color: Colors.black, //font color
                              // backgroundColor: Colors.black12, //background color
                              letterSpacing: 5, //letter spacing
                              // decoration:
                              //   TextDecoration.underline, //make underline
                              // decorationStyle:
                              //  TextDecorationStyle.double, //double underline
                              decorationColor: Colors
                                  .brown, //text decoration 'underline' color
                              decorationThickness:
                                  1.5, //decoration 'underline' thickness
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          '0788809966',
                          style: TextStyle(
                              fontSize: 11,
                              height:
                                  2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                              color: Colors.black, //font color
                              // backgroundColor: Colors.black12, //background color
                              letterSpacing: 5, //letter spacing
                              // decoration:
                              //   TextDecoration.underline, //make underline
                              // decorationStyle:
                              //  TextDecorationStyle.double, //double underline
                              decorationColor: Colors
                                  .brown, //text decoration 'underline' color
                              decorationThickness:
                                  1.5, //decoration 'underline' thickness
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                height: 4,
                thickness: 2,
                indent: 10,
                // color: Colors.white,
                endIndent: 10,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('RECEIPT INFORMATION'),
                        InputWidget(
                          title: 'CUSTOMER NAME',
                          hint: 'Enter customer name',
                        ),
                        InputWidget(
                          title: 'CUSTOMER VRN',
                          hint: 'Enter customer vrn',
                        ),
                        InputWidget(
                          title: 'CUSTOMER MOBILE',
                          hint: 'Enter customer mobile',
                        ),
                        InputWidget(
                          title: 'CUSTOMER TIN',
                          hint: 'Enter customer TIN',
                        ),
                        InputWidget(
                          title: 'PAYMENT TYPE',
                          hint: 'Enter payment type',
                        ),
                        InputWidget(
                          title: 'CUSTOMER ID TYPE',
                          hint: 'Choose customer ID type',
                        ),
                        InputWidget(
                          title: 'CUSTOMER ID',
                          hint: 'Enter customer ID',
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
