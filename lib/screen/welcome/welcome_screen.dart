import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: size.height * 0.25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      assetsIcons('ic_chef.svg'),
                      height: 150,
                      width: 150,
                    ),
                    Text(
                      appName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: defaultPadding * 2,
                ),
                const Padding(
                  padding: EdgeInsets.all(defaultPadding * 2),
                  child: Text(
                    'We have many recommendation restaurants just for you!',
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: const Text("Let's go!"))
              ],
            )),
      ),
    );
  }
}
