import 'package:flutter/material.dart';
import 'package:party_ui/animation/fade_animation.dart';

class PartyUiPage extends StatefulWidget {
  const PartyUiPage({Key? key}) : super(key: key);
  static const String id = "party_ui_page";

  @override
  _PartyUiPageState createState() => _PartyUiPageState();
}

class _PartyUiPageState extends State<PartyUiPage> {
  bool _isStart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/img.png'),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            FadeAnimation(
              2,
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.2),
                  ],
                )),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FadeAnimation(
                  3,
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: const Text(
                      "Find the best parties near you.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                FadeAnimation(
                  4,
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: 30,
                        left: 30,
                        right: 30,
                        bottom: MediaQuery.of(context).size.height * 0.19),
                    child: const Text(
                      "Let us find you a party for your interest.",
                      style: TextStyle(color: Colors.grey, fontSize: 23),
                    ),
                  ),
                ),
                FadeAnimation(
                  5,
                  Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin:
                          const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.5),
                        ),
                        color: !_isStart ? Colors.orange : Colors.redAccent,
                        onPressed: () {
                          setState(() {
                            _isStart = !_isStart;
                          });
                        },
                        child: !_isStart
                            ? const Text(
                                "Start",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            : const Text(
                                "Google+",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
