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
                _LoginPageTitle(width: width),
                SizedBox(height: width / 60),
                _LofinPageTitle2(width: width),
                SizedBox(height: width / 10),
                _LoginPageDescription(width: width),
                SizedBox(height: width / 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginPageDescription extends StatelessWidget {
  const _LoginPageDescription({Key? key, required this.width})
      : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Text(
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
    );
  }
}

class _LofinPageTitle2 extends StatelessWidget {
  const _LofinPageTitle2({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Anlık iş bulma uygulaması',
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: width / 19,
        ),
      ),
      textAlign: TextAlign.left,
    );
  }
}

class _LoginPageTitle extends StatelessWidget {
  const _LoginPageTitle({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Insta-Job',
      style: GoogleFonts.righteous(
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: width / 8,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
