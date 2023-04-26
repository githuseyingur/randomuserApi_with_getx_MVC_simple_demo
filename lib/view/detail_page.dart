import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/model/user_model.dart';

class DetailPage extends GetView {

  DetailPage({required this.user}); // get data (user)
  final User user;

  @override
  Widget build(BuildContext context) {

    double widthSize = resWidthSize(context);
    double heightSize = resHeightSize(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(user.name + " " + user.lastName),
        backgroundColor: Colors.blueGrey[700],
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: widthSize*8, vertical: heightSize*5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: Image.network(user.imgUrl, width: widthSize*40,)),
              SizedBox(height: heightSize*5,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey[200],
                ),

                padding: EdgeInsets.all(widthSize*8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('${user.name} ${user.lastName}',
                      style: TextStyle(
                        color: Colors.blueGrey[700],
                        fontSize: widthSize*5.4,
                        fontWeight: FontWeight.w700

                      ),),
                    SizedBox(height: heightSize*2),
                    Text('${user.email}', style: TextStyle(
                        color: Colors.blueGrey[700],
                        fontSize: widthSize*4,
                        fontWeight: FontWeight.w300

                    )),
                    SizedBox(height: heightSize*2),
                    Text('${user.phone}', style: TextStyle(
                        color: Colors.blueGrey[700],
                        fontSize: widthSize*4,
                        fontWeight: FontWeight.w300

                    )),
                    SizedBox(height: heightSize*2),
                    Text('${user.gender}', style: TextStyle(
                        color: Colors.blueGrey[700],
                        fontSize: widthSize*4,
                        fontWeight: FontWeight.w300

                    )),
                    SizedBox(height: heightSize*2),
                    Text('${user.location}', style: TextStyle(
                        color: Colors.blueGrey[700],
                        fontSize: widthSize*4,
                        fontWeight: FontWeight.w300

                    )),
                  ],
                ),
              ),


            ],
          ),

      ),
    );
  }
  double resWidthSize(BuildContext context){   // device width & height size parameter
    double widthSize;
    if(MediaQuery.of(context).size.width>598)  widthSize = MediaQuery.of(context).size.width * 0.0072;
    else widthSize = MediaQuery.of(context).size.width * 0.01;
    return widthSize;
  }
  double resHeightSize(BuildContext context){
    double heightSize = MediaQuery.of(context).size.height * 0.01;
    return heightSize;
  }
}

