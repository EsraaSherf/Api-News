import 'package:apinew/repository.dart';
import 'package:apinew/screens/news_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:apinew/ApiManager.dart';
import 'models/NewsDataModel.dart';
import 'remote_api.dart';
import 'local_db.dart';
import 'package:apinew/models/sources_response.dart';
import 'package:apinew/screens/tab_controller.dart';

class search  extends StatefulWidget {
  static const String routeName = 'search';

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  String vari='';
  List<NewsDataModel>list=[];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        color: Colors.white,
      child:

            Image.asset(
              'C:/Users/Esraa/StudioProjects/apiNew/assest/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover),
        ),
        Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            shape: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            leading: const SizedBox(
    height: 10,
    ),
            leadingWidth: 10,
            title: Container(
              height: 60,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (String?val){
                    setState((){
                      vari=val!;
                    });

                  },
                  decoration: InputDecoration(
                    enabledBorder:
                    OutlineInputBorder(
                      borderRadius:   BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:   BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.white,
                        )
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: (){

                      },icon: Icon(Icons.search,color: Theme.of(context).primaryColor,),
                    ),
                    prefixIcon: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },icon: Icon(Icons.close,color: Theme.of(context).primaryColor,),
                    ),
                    hintText: "search artical",
                    hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),

                    ),
                    contentPadding: EdgeInsets.only(top:10),
                  ),
                )),
          ),
          body: ListView.builder(itemBuilder: (context,index)=>NewsItem(searching().elementAt(index),
          ),itemCount: searching().length,) ,

        ),
      ],
    );
  }

  List searching(){



    return list;
      }
}
