import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as Box;

class InputWidget extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const InputWidget(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              height:
                  2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
              color: Colors.black, //font color
              // backgroundColor: Colors.black12, //background color
              //letterSpacing: 5, //letter spacing
              // decoration:
              //   TextDecoration.underline, //make underline
              // decorationStyle:
              //  TextDecorationStyle.double, //double underline
              decorationColor: Colors.brown, //text decoration 'underline' color
              decorationThickness: 1.5, //decoration 'underline' thickness
              // fontStyle: FontStyle.italic
            ),
          ),
          Container(
            height: 42,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Expanded(
                child: TextFormField(
              autofocus: true,
              cursorColor: Color.fromARGB(1, 2, 3, 4),
              controller: controller,
              style: TextStyle(
                fontSize: 11,
                height:
                    2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                color: Colors.black, //font color
                // backgroundColor: Colors.black12, //background color
                //letterSpacing: 5, //letter spacing
                // decoration:
                //   TextDecoration.underline, //make underline
                // decorationStyle:
                //  TextDecorationStyle.double, //double underline
                decorationColor:
                    Colors.brown, //text decoration 'underline' color
                decorationThickness: 1.5, //decoration 'underline' thickness
                // fontStyle: FontStyle.italic
              ),
              decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: 11,
                    height:
                        2, //line height 200%, 1= 100%, were 0.9 = 90% of actual line height
                    // color: Colors.black, //font color
                    // backgroundColor: Colors.black12, //background color
                    //letterSpacing: 5, //letter spacing
                    // decoration:
                    //   TextDecoration.underline, //make underline
                    // decorationStyle:
                    //  TextDecorationStyle.double, //double underline
                    decorationColor:
                        Colors.brown, //text decoration 'underline' color
                    decorationThickness: 1.5, //decoration 'underline' thickness
                    // fontStyle: FontStyle.italic
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color.fromRGBO(255, 254, 229, 1),
                    width: 0,
                  ))),
            )),
          )
        ],
      ),
    );
  }
}
