import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                MdiIcons.github,
                size: 150,
              ),
              SizedBox(
                height: 18,
              ),
              //    LinearProgressIndicator()
              //   Icon(MdiIcons.)
            ],
          ),
        ),
      ),
    );
  }
}
