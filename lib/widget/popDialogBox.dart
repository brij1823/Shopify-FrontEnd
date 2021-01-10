import 'package:flutter/material.dart';

class ExitConfirmationDialog extends StatelessWidget {
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
        width: 550,
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
                  'assets/images/popcorn.png',
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
            Text(
              'Nominee Voting Limit Exceeded',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Text(
                'We are glad you liked more movies, but you can only 5 movies for this award.',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    return Navigator.of(context).pop(true);
                  },
                  child: Text('Ok, I understand'),
                  color: Colors.white,
                  textColor: Colors.black,
                )
              ],
            )
          ],
        ),
      );
}
