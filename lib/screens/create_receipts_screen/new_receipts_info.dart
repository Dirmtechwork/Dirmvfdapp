import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../controllers/customer_controller.dart';
import '../../env/dimensions.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_input_eng.dart';
import '../../widgets/dummy_business_controller.dart';

class NewReceiptInfo extends StatefulWidget {
  @override
  State<NewReceiptInfo> createState() => _NewReceiptInfoState();
}

class _NewReceiptInfoState extends State<NewReceiptInfo> {
  final ownBusinessController = Get.put(OwnBusinessController());

  final List<String> IdTypes = <String>['ph', 'kado', 'kido'];

  String dropdownValue = 'ph';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
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
                                decorationStyle: TextDecorationStyle
                                    .double, //double underline
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
                                decorationStyle: TextDecorationStyle
                                    .double, //double underline
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
                      child: GetBuilder<CustomerController>(
                          init: CustomerController(),
                          builder: (controller) {
                            var height;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('RECEIPT INFORMATION'),
                                Form(
                                  child: Column(
                                    children: [
                                      CustomInput_eng(
                                        controller: controller
                                            .customerNameInputController,
                                        label: AppStrings.ADD_PAYER_NAME,
                                        isRequired: true,
                                      ),
                                      CustomInput_eng(
                                        controller: controller
                                            .customerVrnInputController,
                                        label: 'Enter Customer VRN',
                                        isRequired: true,
                                        type: TextInputType.emailAddress,
                                      ),
                                      CustomInput_eng(
                                        controller: controller
                                            .customerPhoneInputController,
                                        label: AppStrings.ADD_PAYER_PHONE,
                                        isRequired: true,
                                        type: TextInputType.phone,
                                      ),
                                      CustomInput_eng(
                                        controller: controller
                                            .customerTinInputController,
                                        label: 'Enter customer Tin',
                                        isRequired: true,
                                      ),
                                      Container(
                                        color: AppColors.kSecondaryColor,
                                        height: height,
                                        margin: EdgeInsets.only(
                                          right: Dimensions.calcW(50),
                                        ),
                                        child: DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                filled: true,
                                                fillColor:
                                                    AppColors.kSecondaryColor,
                                                hintText: 'phhh'),
                                            items: IdTypes.map((element) =>
                                                    DropdownMenuItem(
                                                        value: element,
                                                        child: Text(element)))
                                                .toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                dropdownValue = newValue!;
                                              });
                                            }),
                                      ),
                                      CustomInput_eng(
                                        controller:
                                            controller.customerIdController,
                                        label: 'Enter customer Id',
                                        isRequired: true,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.calcH(50),
                                ),
                                CustomBtn(
                                  label: AppStrings.SAVE_BTN,
                                  action: () {
                                    bool isValid = controller.validate();
                                    if (isValid) {
                                      Get.back();
                                    }
                                  },
                                  color: AppColors.kPrimaryColor,
                                  textColor: Colors.white,
                                  width: Dimensions.calcW(150),
                                )
                              ],
                            );
                          }),
                    ))
              ],
            ),
          ),
        ));
  }
}
