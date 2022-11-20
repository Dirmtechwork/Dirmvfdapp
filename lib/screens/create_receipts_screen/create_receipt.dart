import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controllers/new_receipt_controller.dart';
import '../../env/dimensions.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/dummy_business_controller.dart';
import 'secondPage.dart';

class CreateReceipt extends StatefulWidget {
  CreateReceipt({Key? key}) : super(key: key);

  @override
  State<CreateReceipt> createState() => _CreateReceiptState();
}

class _CreateReceiptState extends State<CreateReceipt> {
  final ownBusinessController = Get.put(OwnBusinessController());
  //var newReceiptController = Get.put(NewReceiptController());
  final newReceiptController = Get.lazyPut(() => NewReceiptController());
  final formKey = GlobalKey<FormState>();
  //final _priceFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var height;
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
                        SizedBox(
                          height: Dimensions.calcH(8),
                        ),
                        Form(
                            //  key: formKey,
                            child: Column(
                          children: [
                            Container(
                              color: AppColors.kSecondaryColor,
                              height: 50,
                              margin: EdgeInsets.only(
                                right: Dimensions.calcW(50),
                              ),
                              child: TextFormField(
                                // controller:  controller.,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: AppColors.kSecondaryColor,
                                    filled: true,
                                    labelText: 'Enter customer name'),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.calcH(8),
                            ),
                            Container(
                              color: AppColors.kSecondaryColor,
                              height: 55,
                              margin: EdgeInsets.only(
                                right: Dimensions.calcW(50),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: AppColors.kSecondaryColor,
                                    filled: true,
                                    labelText: 'Enter customer vrn'),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.calcH(8),
                            ),
                            Container(
                              color: AppColors.kSecondaryColor,
                              height: 55,
                              margin: EdgeInsets.only(
                                right: Dimensions.calcW(50),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: AppColors.kSecondaryColor,
                                    filled: true,
                                    labelText: 'Enter customer mobile'),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.calcH(8),
                            ),
                            Container(
                              color: AppColors.kSecondaryColor,
                              height: 55,
                              margin: EdgeInsets.only(
                                right: Dimensions.calcW(50),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: AppColors.kSecondaryColor,
                                    filled: true,
                                    labelText: 'Enter customer TIN'),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.calcH(8),
                            ),
                            Container(
                              color: AppColors.kSecondaryColor,
                              height: 55,
                              margin: EdgeInsets.only(
                                right: Dimensions.calcW(50),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: AppColors.kSecondaryColor,
                                    filled: true,
                                    labelText: 'Enter payment type'),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.calcH(8),
                            ),
                            Container(
                              color: AppColors.kSecondaryColor,
                              height: 55,
                              margin: EdgeInsets.only(
                                right: Dimensions.calcW(50),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: AppColors.kSecondaryColor,
                                    filled: true,
                                    labelText: 'Choose customer ID type'),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.calcH(8),
                            ),
                            Container(
                              color: AppColors.kSecondaryColor,
                              height: 55,
                              margin: EdgeInsets.only(
                                right: Dimensions.calcW(50),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: AppColors.kSecondaryColor,
                                    filled: true,
                                    labelText: 'Enter customer ID'),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.calcH(10),
                            ),
                            CustomBtn(
                              label: AppStrings.SAVE_BTN,
                              action: () {
                                Get.to(() => SecondPage());
                              },
                              color: AppColors.kPrimaryColor,
                              textColor: Colors.white,
                              width: Dimensions.calcW(0),
                            )
                          ],
                        )),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
