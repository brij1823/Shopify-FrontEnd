import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mailto/mailto.dart';
import 'package:shopify/models/search_movie_model.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailExitConfirmationDialog extends StatefulWidget {
  List<SearchMovieModel> nomineeList;
  EmailExitConfirmationDialog(this.nomineeList);

  @override
  _EmailExitConfirmationDialogState createState() =>
      _EmailExitConfirmationDialogState();
}

class _EmailExitConfirmationDialogState
    extends State<EmailExitConfirmationDialog> {
  String userEmail = "";
  String sentEmail = "";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
        height: 350,
        width: 650,
        decoration: BoxDecoration(
            color: Colors.amber[900],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/gmail.png',
                  height: 120,
                  width: 120,
                ),
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Glad, you want to share your nomination with your friends',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: TextField(
                cursorColor: Colors.black,
                onChanged: (val) {
                  this.setState(() {
                    sentEmail = val;
                  });
                },
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText:
                      'Please enter the mail of whom you would like to share',
                  contentPadding:
                      const EdgeInsets.only(left: 10.0, bottom: 4.0, top: 4.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.7),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    print(sentEmail);
                    var mailtoLink = Mailto(
                      to: [sentEmail],
                      subject: 'Shopify Movie Awards',
                      body: 'temp',
                    );
                    // Convert the Mailto instance into a string.
                    // Use either Dart's string interpolation
                    // or the toString() method.
                    await launch('$mailtoLink');

                    return Navigator.of(context).pop(true);
                  },
                  child: Text('Share'),
                  color: Colors.white,
                  textColor: Colors.black,
                )
              ],
            )
          ],
        ),
      );

  String getMovieList(List<SearchMovieModel> nomineeList) {
    String movies;
    for (var i = 0; i < nomineeList.length; i++) {
      movies += nomineeList[i].Title + " ";
    }
    return movies;
  }
}
