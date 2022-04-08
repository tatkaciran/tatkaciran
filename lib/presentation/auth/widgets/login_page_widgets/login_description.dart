import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instajobs/constants/constants.dart';

class LoginDescription extends StatelessWidget {
  const LoginDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(width / 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Insta-Job',
                  style: GoogleFonts.righteous(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: width / 8,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: width / 60,
                ),
                Text(
                  'Anlık iş bulma uygulaması',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: width / 19,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: width / 10,
                ),
                Text(
                  '''
[  Garson, dağıtım elemanı, 
   boyacı, şoför, kurye, usta,
   mutfak personeli, vs.  ]''',
                  style: GoogleFonts.mali(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: width / 17,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: width / 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
