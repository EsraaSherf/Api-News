import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:apinew/models/NewsDataModel.dart';
import 'package:apinew/new_detalise.dart';
import 'package:url_launcher/url_launcher.dart';

class new_detalise  extends StatelessWidget {
  const new_detalise({Key? key}) : super(key: key);
static const String routeName="new_detalise";

  @override
  Widget build(BuildContext context) {
    Articles articles =ModalRoute.of(context)!.settings.arguments as Articles;

    return Stack(
      children:[
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(
                    'C:/Users/Esraa/StudioProjects/apiNew/assest/pattern.png',
                  ),
                  fit: BoxFit.cover)),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: const Text('News Detalise'),
              shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: articles.urlToImage??"",
                      height: 180,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(articles.author??"",style: TextStyle(fontSize: 12,
                      color: Colors.grey.shade400),textAlign: TextAlign.start,),
                  SizedBox(
                    height: 10,
                  ),
                  Text(articles.title??"",style: TextStyle(fontSize: 22,
                      color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  SizedBox(
                    height: 10,
                  ),
                  Text(articles.publishedAt?.substring(0,10)??"",textAlign: TextAlign.end,),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                         color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 1,
                          offset: Offset(1,2),
                        )
                      ]
                  ),

                    child:Column(
                      children: [
                        Text(articles.description??"",),
                        InkWell(
                          onTap: (){
                            _launchUrl( Uri.parse(articles.url??"9o"));
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:const [
                                Text("View Full Artical" ,style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(66, 80, 92, 1.0),
                                  fontSize: 14,

                                ), ) ,
                                Icon(Icons.arrow_right,color: Color.fromRGBO(66, 80, 92, 1.0),size: 28,
                                ),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                  ),

                ],

              ),
            ),
          ),
        ),
      ]

    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
