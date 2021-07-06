// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:edcapp/services/auth.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth, @required this.onSignOut}) : super(key: key);
  final AuthBase auth;
  final VoidCallback onSignOut;
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    var titleList = [
      "ML Summit",
      "Mentor Talk",
      "Webinar on\nData Science",
      "StartUp LaunchPad",
      "Pixelence",
      "RoboMania",
      "Hacker-Yard"
    ];

    // Description List Here
    var descList = [
      "Today, many dream about a career in the lucrative fields of Artificial Intelligence & Machine Learning.",
      "Know how you can get your Dream Company with Subham Sinha alumuni of DIATM.",
      "Advance your Career with Data Science, the most in-demand skill in Industry.",
      "Unleash your Inner Entrepreneur with Idea LaunchPad, a initiative by EDC-DIATM",
      "Bored in LockDown!!So, here we are with the exciting quarantine photography competition.",
      "The robots are coming, whether we like it or not,so a workshop on Robotics has been organized",
      "A Cyber security awareness and hands-on workshop organized by EDC-DIATM."
    ];

    // Image Name List Here
    var imgList = [
      "images/images/imgmachine.jpeg",
      "images/images/imgmentor.jpg",
      "images/images/imgdata.jpg",
      "images/images/imgstart.jpg",
      "images/images/imgphoto.png",
      "images/images/imgrobo.jpg",
      "images/images/imgcyb.jpg"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          TextButton(
            onPressed: _signOut,
            child: Text(
              'logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(
                  context, imgList[index], titleList[index], descList[index]);
            },
            onLongPress: () {
              openURL();
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



void openURL() async {
  if (await canLaunch('https://www.google.com'))
    await launch('https://www.google.com');
  else
    // can't launch url, there is some error
    throw "Could not launch url";
}


// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 400,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
