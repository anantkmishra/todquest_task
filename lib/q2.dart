import 'package:flutter/material.dart';

class Q2UI extends StatelessWidget {
  const Q2UI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Q2 UI'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1,),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink, Colors.yellow],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(150),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Text("Breakfast", style: TextStyle(fontSize: 45,color: Colors.white, fontWeight: FontWeight.w800, ), ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
                  const Text("Bread,", style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.w500, ), ),
                  const Text("Peanut Butter,", style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.w500, ), ),
                  const Text("Apple", style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.w500, ), ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text("525 ", style: TextStyle(fontSize: 70,color: Colors.white, fontWeight: FontWeight.w800, ), ),
                      Text("kCal", style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.w500, ), ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -120,
              left: -20,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withAlpha(100),
                ),
              ),
            ),
            Positioned(
              top: -90,
              left: 25,
              child: Image.asset('assets/imgs/breakfast.png', height: 150, width: 150, fit: BoxFit.fill,),
            ),
          ],
        ),
      ),
    );
  }
}
