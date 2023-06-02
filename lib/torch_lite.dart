import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class TorchLite extends StatefulWidget {
  const TorchLite({super.key});

  @override
  State<TorchLite> createState() => _TorchLiteState();
}

class _TorchLiteState extends State<TorchLite> {
  final bgColor = const Color(0xff2C3333);
  final textColor = const Color(0xffE7F6F2);
  var isActive = false;
  var controller = TorchController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Torch Lite',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  isActive ? 'assets/torch_on.png' : 'assets/torch_off.png',
                  width: 200,
                  height: 200,
                  color: isActive ? null : textColor.withOpacity(0.3),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                CircleAvatar(
                  maxRadius: 45,
                  minRadius: 30,
                  child: Transform.scale(
                    scale: 1.5,
                    child: IconButton(
                      onPressed: () {
                        controller.toggle();
                        isActive = !isActive;
                        setState(() {});
                      },
                      icon: const Icon(Icons.power_settings_new),
                    ),
                  ),
                )
              ],
            ),
          )),
          const Center(
            child: Text(
              'Developed By Chirag',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
        ],
      ),
    );
  }
}
