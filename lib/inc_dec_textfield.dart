import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IncDecTextField extends StatefulWidget {

  final TextEditingController controller;
  final bool isNegativeRequired;
  final Color borderColor;
  final TextStyle? textStyle;
  final bool isCurrency;
  final bool isShowPrefixIcon;
  final String currency;
  final Icon? prefixIcon;
  final Icon? incIcon;
  final Icon? decIcon;
  const IncDecTextField({Key? key,
    required this.controller,
    this.isNegativeRequired=true,
    this.borderColor=Colors.black,
    this.textStyle,
    this.isCurrency=false,
    this.isShowPrefixIcon=false,
    this.currency='USD',
    this.incIcon,
    this.prefixIcon,
    this.decIcon
  }) : super(key: key) ;

  @override
  IncDecTextFieldState createState() => IncDecTextFieldState();
}

class IncDecTextFieldState extends State<IncDecTextField> {

  bool isSmallDevice=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.controller.text == null || widget.controller.text==''){
      setState(() {
        widget.controller.text='0';
      });
    }

    if(widget.borderColor==null){
      setState(() {
        widget.borderColor;
      });
    }
  }

  String price='';

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;
    var height= MediaQuery.of(context).size.height;

    if( MediaQuery.of(context).size.width < 350){
      isSmallDevice=true;
    }else{
      isSmallDevice=false;
    }

    return Container(
      width: width,
      height:isSmallDevice?height*0.1: height*0.07,
      decoration: BoxDecoration(
          border: Border.all(
              color: widget.borderColor
          ),
          color: Colors.white
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(width*0.01),
              child: TextFormField(
                controller: widget.controller,
                style: widget.textStyle,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    prefixIcon: widget.isShowPrefixIcon?widget.prefixIcon:null,
                    prefix:widget.isCurrency? Container(
                      margin: EdgeInsets.symmetric(horizontal:width*0.02),
                      child: Text(
                        widget.currency,
                        style: widget.textStyle,
                      ),
                    ):null
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  widget.isCurrency?FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')):FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
          ),
          Container(
            width: width*0.1,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                    color: widget.borderColor
                ),
              ),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex:1,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        widget.controller.text=(double.parse(widget.controller.text)+1).toString();
                        if(!widget.isCurrency){
                          widget.controller.text=double.parse(widget.controller.text).toInt().toString();
                        }
                      });
                    },
                    child: Container(
                        width: width*0.1,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: widget.borderColor
                                )
                            )
                        ),
                        child:  widget.incIcon
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        if(widget.isNegativeRequired){
                          widget.controller.text=(double.parse(widget.controller.text)-1).toString();
                        }else{
                          if(double.parse(widget.controller.text)>0){
                            widget.controller.text=(double.parse(widget.controller.text)-1).toString();
                          }
                        }
                        if(!widget.isCurrency){
                          widget.controller.text=double.parse(widget.controller.text).toInt().toString();
                        }

                      });
                    },
                    child: Container(
                        width: width*0.1,
                        alignment: Alignment.center,
                        child:  widget.decIcon
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
