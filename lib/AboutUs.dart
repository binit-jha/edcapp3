import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  //const AboutUs({Key? key}) : super(key: key);
  AboutUs();
//   @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'EDC DIATM',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Rajbandh, Durgapur',
                  style: TextStyle(
                    color: Colors.orange[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('4'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    // Widget buttonSection = Container(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: [
    //       _buildButtonColumn(color, Icons.call, 'CALL'),
    //       _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    //       _buildButtonColumn(color, Icons.share, 'SHARE'),
    //     ],
    //   ),
    // );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Entrepreneurship Development Cell,DIATM'
        'strives to inspire and integrate a culture of innovation through'
        'nurturing Entrepreneurship mindset into the students.'
        'We  provide students a platform to pursue entrepreneurial activities'
        'skill development  programs  to ideate and bring innovative solutions'
        'We inspire students to transform their ideas into successful startups'
        'by connecting them with successful entrepreneurs and investors.​',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Edc',
      home: Scaffold(
        appBar: AppBar(
          title: Text('edc'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/images/edcdiatm.webp',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            //buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
