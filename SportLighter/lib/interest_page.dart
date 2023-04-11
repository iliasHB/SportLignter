import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/otp_page.dart';
import 'package:flutter_dev_assessment/utils/app_decoration.dart';
import 'package:flutter_dev_assessment/utils/app_style.dart';

class InterestPage extends StatelessWidget {
  const InterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Choose your interest',
          style: AppStyle.pagetitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: AppDecoration.interestDecoration,
                  child: Text(
                    'Football',
                    style: AppStyle.intereststyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: AppDecoration.interestDecoration,
                  child: Text(
                    'Basketball',
                    style: AppStyle.intereststyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: AppDecoration.interestDecoration,
                  child: Text(
                    'Long Tennis',
                    style: AppStyle.intereststyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: AppDecoration.interestDecoration,
                  child: Text(
                    'Ice Hockey',
                    style: AppStyle.intereststyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: AppDecoration.interestDecoration,
                  child: Text(
                    'Motorsport',
                    style: AppStyle.intereststyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: AppDecoration.interestDecoration,
                  child: Text(
                    'Bandy',
                    style: AppStyle.intereststyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: AppDecoration.interestDecoration,
                  child: Text(
                    'Rugby',
                    style: AppStyle.intereststyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: AppDecoration.interestDecoration,
                  child: Text(
                    'Skiing',
                    style: AppStyle.intereststyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: AppDecoration.interestDecoration,
                  child: Text(
                    'Shooting',
                    style: AppStyle.intereststyle,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
                      },
                      child: const Text('Continue')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
