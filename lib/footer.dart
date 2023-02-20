import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

Widget footer() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy');
  String formattedDate = formatter.format(now);

  return Container(
    width: double.infinity,
    color: Color.fromARGB(255, 147, 147, 147),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(color: Colors.white, fontSize: 10),
        children: [
          const TextSpan(text: "v1.0.3 "),
          const TextSpan(text: "Developed by "),
          TextSpan(
            style: const TextStyle(fontWeight: FontWeight.bold),
            text: "Ricardo Huerta ",
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                var url = "https://ricardohs.com/";
                try {
                  await launchUrlString(url,
                      mode: LaunchMode.externalApplication);
                } catch (e) {
                  print(e);
                }
                /*
                if (!await launchUrlString(url,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception("Could not launch $url");
                }
                */
                /*
                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url);
                } else {
                  throw 'Could not launch $url';
                }
                */
              },
          ),
          TextSpan(text: "$formattedDate, powered by "),
          TextSpan(
            style: const TextStyle(fontWeight: FontWeight.bold),
            text: "Rick And Morty API ",
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                var url = "https://rickandmortyapi.com/";
                try {
                  await launchUrlString(url,
                      mode: LaunchMode.externalApplication);
                } catch (e) {
                  print(e);
                }
                /*
                if (!await launchUrlString(url,
                    mode: LaunchMode.externalApplication)) {
                  throw Exception("Could not launch $url");
                }
                */
                /*
                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url);
                } else {
                  throw 'Could not launch $url';
                }*/
              },
          ),
        ],
      ),
    ),
  );
}
