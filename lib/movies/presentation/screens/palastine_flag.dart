import 'package:flutter/material.dart';
import 'package:movie/core/utility/images.dart';
import 'package:movie/movies/presentation/screens/movies_screen.dart';

class PalestineFlag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 165, 61, 203),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300, // Set a width for the flag
              height: 200, // Set a height for the flag
              child: Stack(
                children: [
                  // Black stripe
                  Container(
                    height: 66.67, // 1/3 height of the flag
                    color: Colors.black,
                  ),
                  // White stripe
                  Positioned(
                    top: 66.67, // Move down by the height of the black stripe
                    child: Container(
                      height: 66.67, // 1/3 height of the flag
                      color: Colors.white,
                      width: 300,
                    ),
                  ),
                  // Green stripe
                  Positioned(
                    top:
                        133.33, // Move down by the height of the black and white stripes
                    child: Container(
                      height: 66.67, // 1/3 height of the flag
                      color: Colors.green,
                      width: 300,
                    ),
                  ),
                  // Red triangle
                  Positioned(
                    left: 0,
                    top: 0,
                    child: ClipPath(
                      clipper: TriangleClipper(),
                      child: Container(
                        height: 200,
                        width: 100, // Width of the triangle
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton.icon(
              icon: Icon(
                Icons.arrow_forward_outlined,
                size: 40,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return MoviesScreen();
                }));
              },
              label: Text(
                "Go to Movies",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
          Image.network(elsnawrImage)
        ],
      ),
    );
  }
}

// Custom clipper for the red triangle
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
