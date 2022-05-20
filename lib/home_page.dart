import 'package:api/model.dart';
import 'package:flutter/material.dart';

import 'helper.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  dynamic fetchData="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     fetchData = APIHelper.apiHelper.fetchImagesData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("FLUTTER APP"),
              centerTitle: true,
            ),
            body:FutureBuilder(
              // future:  APIHelper.apiHelper.fetchImagesData(),
              future:fetchData,
              builder: (context, AsyncSnapshot snapshot) {
                if(snapshot.hasError) {
                  return Center(
                    child: Text("ERROR : ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<ImageModel> data = snapshot.data;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black,width: 8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(data[i].largeImageURL),
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
        ),
    );
  }
}
