import 'package:flutter/material.dart';
//import 'package:flutter_demo/model/profileModel.dart';
import 'network.dart';
import 'package:flutter_demo/model/test.dart';
import 'package:camera/camera.dart';
import 'package:flutter_demo/camera_screen.dart';
import 'package:bottom_drawer/bottom_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CameraController controller;
  late Future<Album> profileDetails;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    profileDetails = Network().getProfileDetails();
    //profileDetails.then((profile) => {print(profile.)});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
              onTap: () {}, child: Icon(Icons.arrow_back, color: Colors.black)),
          centerTitle: true,
          title: Text("Savings",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
        ),
        body: Stack(children: [
          Container(
            height: height,
            child: Column(children: <Widget>[
              Container(
                  //   alignment: Alignment.topLeft,
                  height: height / 6,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Text("Pay through UPI",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 30, right: 30, bottom: 10),
                          child: TextField(
                            onEditingComplete: () {},
                            scrollPadding: EdgeInsets.only(left: 8),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Enter UPI Number",
                            ),
                          ),
                        ),
                      ])),
              //Container(height: height * 0.7, child: cameraScreen())
              ClipRect(
                  child: FittedBox(
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      child: new Container(
                          width: MediaQuery.of(context).size.width,
                          height: height * 0.7,
                          child: cameraScreen())))
            ]),
          ),
          _buildBottomDrawer(context),
        ]));
  }
}

String _button = 'None';
double _headerHeight = 60.0;
double _bodyHeight = 220.0;
BottomDrawerController _controller = BottomDrawerController();
Widget _buildBottomDrawer(BuildContext context) {
  return BottomDrawer(
    header: _buildBottomDrawerHead(context),
    body: _buildBottomDrawerBody(context),
    headerHeight: _headerHeight,
    drawerHeight: _bodyHeight,
    color: Colors.transparent,
    controller: _controller,
  );
}

Widget _buildBottomDrawerHead(BuildContext context) {
  return Container(
      child: Column(
    children: <Widget>[
      Container(
        height: 5,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.white),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
        ),
      ),
      Container(
        height: _headerHeight,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.white),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 20),
              child: Text("Search Contact",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ),
          ],
        ),
      ),
    ],
  ));
}

Widget _buildBottomDrawerBody(BuildContext context) {
  late Future<Album> profileDetails;
  profileDetails = Network().getProfileDetails();
  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: 0, color: Colors.white),
      color: Colors.white,
    ),
    width: double.infinity,
    height: 220,
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextField(
              decoration: InputDecoration(
                hintText: "  Select Number",
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.book_outlined,
                        size: 30, color: Colors.blueGrey)),
              ),
            ),
          ),
          Container(
              child: Row(
            children: [
              FutureBuilder<Album>(
                  future: profileDetails,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            child: Row(
                          children: <Widget>[
                            Container(
                                width: 60,
                                height: 60,
                                margin: EdgeInsets.only(
                                    top: 12.5, bottom: 12.5, right: 20),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(300),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('/Tabs', arguments: 1);
                                  },
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage:
                                        NetworkImage(snapshot.data!.imageUrl),
                                  ),
                                )),
                          ],
                        )),
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Text("Fetching the data...");
                  }),
              // SizedBox(
              //   width: 30,
              // ),
              Container(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sumanth Varma", style: TextStyle(fontSize: 17)),
                      SizedBox(height: 10),
                      Text("7530009088",
                          style: TextStyle(color: Colors.grey.shade600))
                    ],
                  ))
            ],
          ))
        ],
      ),
    ),
  );
}
