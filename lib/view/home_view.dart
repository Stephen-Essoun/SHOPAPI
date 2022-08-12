import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:setstate_demo/Network/network.dart';
import 'package:setstate_demo/model/product_model.dart';
import 'package:setstate_demo/view/detailed_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

Network network = Network();

class _HomeViewState extends State<HomeView> {
  final spinkit = const SpinKitRotatingCircle(
  color: Colors.blue,
  size: 50.0,
);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Working With API'),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: network.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
          if (snapshot.connectionState == ConnectionState.done)   {
            return Center(
              child: GridView.builder(
                semanticChildCount: 40,
                  itemCount: snapshot.data!. length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onDoubleTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailedView(reciever: snapshot.data![index],))),
                        child: Card(
                          color: Colors.black38,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height*0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                      snapshot.data![index].images![0],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                child: Center(
                                  child: Text(
                                    snapshot.data![index].title!,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          } }
           {return
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
              spinkit,
              const SizedBox(height: 5,),
              const Text('Loading ...'),
                ],
              ),
            );
          } 
        },
      ),
    );
  }
}
