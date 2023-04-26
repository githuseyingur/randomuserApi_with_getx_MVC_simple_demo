import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_task/controller/list_controller.dart';
import 'package:my_task/main.dart';
import 'package:my_task/routes/app_router.dart';


class ListPage extends GetView<ListController> {

  var textValueController = TextEditingController();
  ListController controller = Get.put(ListController());


  @override
  Widget build(BuildContext context) {
    double widthSize = resWidthSize(context);
    double heightSize = resHeightSize(context);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: controller.obx(
              (data) => Column(
                children: [
                  Expanded(child: Container(
                    height: heightSize*4.8,
                    //color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: widthSize*4,vertical: 0),
                    alignment: Alignment.center,
                    child: TextField(
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                        fontSize: widthSize * 3.6,
                      ),
                      cursorColor: Colors.grey[400],
                      cursorWidth: widthSize*0.30,
                      cursorHeight: heightSize*3,
                      inputFormatters: [ FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),], // allow only Upper/Lower letters
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                        hintText: "Search",
                        hintStyle: TextStyle(fontSize: widthSize*3, color: Colors.grey[400]),

                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: widthSize*0.24,
                                style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(widthSize*2.4)
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey, width: widthSize*0.24),
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        controller.setText(value);

                      },
                    ),
                  ),flex: 2,),
                  Expanded(
                    child: Center(
                    child: ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (BuildContext context, int index){
                          if(data!.length>0){

                            if (data[index].name.toLowerCase().contains(controller.getText.toLowerCase())
                                || data[index].lastName.toLowerCase().contains(controller.getText.toLowerCase())) {
                              return Card(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(data[index].name, style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w600,
                                          fontSize: widthSize*4.4
                                      ),),
                                      subtitle: Text(data[index].lastName, style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w400,
                                          fontSize: widthSize*4.2
                                      )),
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            data[index].imgUrl
                                        ),
                                      ),
                                      onTap: (){
                                        router.push(DetailPageRoute(user:data[index])); // auto_route --> passing data (user object)
                                      },
                                      trailing: Icon(Icons.arrow_forward_ios),

                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }
                          // if the username or surname contains the text entered in the search box
                        })
                    ),
                    flex: 13,
                  ),
                ],
              )
      ),
    );
  }
  double resWidthSize(BuildContext context){    // device width & height size parameter
    double widthSize;
    if(MediaQuery.of(context).size.width>598)  widthSize = MediaQuery.of(context).size.width * 0.0072;
    else widthSize = MediaQuery.of(context).size.width * 0.01;
    return widthSize;
  }
  double resHeightSize(BuildContext context){
    double heightSize = MediaQuery.of(context).size.height * 0.01;
    return heightSize;
  }
  showSnackBar(BuildContext context){
    SnackBar snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
