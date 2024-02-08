import 'package:flutter/material.dart';

class Social extends StatelessWidget {
  const Social({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            side:const BorderSide(
                                color: Color.fromRGBO(209, 213, 219, 1))),
                        onPressed: () {},
                        child: Row(
                          children: [
                         const   SizedBox(
                              width: 15,
                            ),
                            Image.asset("assets/images/google.jpg"),
                           const SizedBox(
                              width: 5,
                            ),
                         const   Text(
                              "Google",
                              style: TextStyle(color: Colors.black),
                            ),
                          const  SizedBox(
                              width: 15,
                            ),
                          ],
                        )),
                 const   Spacer(),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            side:const BorderSide(
                                color: Color.fromRGBO(209, 213, 219, 1))),
                        onPressed: () {},
                        child: Row(
                          children: [
                          const  SizedBox(
                              width: 10,
                            ),
                            Image.asset("assets/images/Facebook.jpg"),
                          const  SizedBox(
                              width: 5,
                            ),
                          const  Text(
                              "Facebook",
                              style: TextStyle(color: Colors.black),
                            ),
                         const   SizedBox(
                              width: 10,
                            ),
                          ],
                        ))
                  ],
                );
  }
}