import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String image;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.image, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(image,
                          height: 30, width: 40, fit: BoxFit.fill)),
                  SizedBox(width: 20),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Colors.white),
                  )
                ],
              ),
              Divider(
                      color: Colors.white.withOpacity(0.3),
                      height: 30,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 5,
                    ),
            ],
          ),
        ));
  }
}
