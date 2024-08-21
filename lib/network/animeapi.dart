import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Anime extends StatelessWidget {
  final String animeType;
  const Anime({super.key, required this.animeType});

  Future<dynamic> getAnime() async {
    // https://api.jikan.moe/v4/anime
    var url = Uri.https('api.jikan.moe', '${animeType}');


    if(animeType == '/v4/recommendations/anime'){
      await Future.delayed(Duration(seconds: 2));
    }
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body);
    } else {
      throw Exception('Failed to load anime data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAnime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Something went wrong!');
            } else {
              var data = snapshot.data;
              print(data);
              return Container(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data['data'].length,
                  itemBuilder: (context, index) {
                    // print(data['data'][0]['titles'][0]['title']);
                    var title = '';
                    var image ='';
                    if(animeType == '/v4/recommendations/anime') {
                      // https://api.jikan.moe/v4/recommendations/anime
                      if(data != null){

                      title = data['data'][index]['entry'][0]['title'];
                      image = data['data'][index]['entry'][0]['images']['jpg']['image_url'];
                      }

                    }else{
                      title =data['data'][index]['titles'][0]['title'];
                      image =data['data'][index]['images']['jpg']['image_url'];
                    }

                    return Container(
                      height: 350,
                      width: 200,
                      child: Card(
                    color: Colors.transparent,
                        elevation: 0,
                        child: Column(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(13),
                                      topRight: Radius.circular(13)),
                                  child: Image.network(
                                    image,
                                    height: 280,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Expanded(
                              child: Center(
                                child: Text(title != null
                                    ? title
                                    : 'Title is not available',
                                style: TextStyle(
                                  fontSize: 16,

                                ),textAlign: TextAlign.center,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
