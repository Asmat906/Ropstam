import 'package:flutter/material.dart';
import 'package:ropstam_task/src/Widget/action/list_detail_action.dart';
import 'package:ropstam_task/src/Widget/views/listview_model.dart';




class DetailApiPage extends StatefulWidget {
  const DetailApiPage({Key ?key, }) : super(key: key);

  @override
  _DetailApiPageState createState() => _DetailApiPageState();
}

class _DetailApiPageState extends State<DetailApiPage> {
 

  @override
  void initState() {
    super.initState();
    //futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
          title: const Text('Task 2 Detail API'),
        ),
        body: Center(
          child: FutureBuilder<List<Ropstam>>(
            future: getProductList(),
            builder: (context, snapshot) {
              // print("<><><GG<>VV<><VV>>$snapshot");
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int i) {
                      print("<><><GG<>VV<><VV>>${snapshot.data}");
                      return Padding(padding: new EdgeInsets.all(10.0),
                      child: new Card(
                        color: Colors.grey,
                        child:  Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                             // new ListTile(
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("User ID ="+'${snapshot.data![i].userId}', style:TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight. bold )),
                                  )),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("ID ="+'${snapshot.data![i].id}', style:TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight. bold )),
                                  )),
                               Align(
                                  alignment: Alignment.topLeft,
                                  child:  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Title ="+'${snapshot.data![i].title}', style:TextStyle(color:Colors.yellow,fontSize:15,fontWeight: FontWeight. bold )),
                                  )),
                               Align(
                                  alignment: Alignment.topLeft,
                                  child:  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Body ="+'${snapshot.data![i].body}', style:TextStyle(color:Colors.black,fontSize:15,fontWeight: FontWeight. bold )),
                                  )
                              ),
                            ],
                          ),
                        ),
                      )
                    );
                  }
                )
              );
              } 
              else if (snapshot.hasError) 
              {
                return Text("${snapshot.error}");
              }
            return CircularProgressIndicator();
          }),
        ),
      
    );
  }
}