import 'package:flashytorch/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:torch_light/torch_light.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isFlashOn = true;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? kLightPrimaryColor : kDarkPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "Flashy",
            style: TextStyle(
                color: isDarkMode ? Colors.black : Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: h / 2.2,
                child: DayNightSwitcher(
                    isDarkModeEnabled: isFlashOn,
                    onStateChanged: (val) {
                      setState(() {
                        isFlashOn = val;
                        isDarkMode = !isDarkMode;
                      });

                      if (isFlashOn) {
                        _turnOffFlash();
                      } else {
                        _turnOnFlash();
                      }
                    }),
              ),
              Positioned(
                bottom: h / 7.5,
                child: Text(
                  "Made By Aayush Dc",
                  style: TextStyle(
                      color: isDarkMode ? Colors.black : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Positioned(
                bottom: 20,
                child: SizedBox(
                  width: w / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /// My Gmail
                      bottomSocial(
                          img: "assets/images/gmail.png",
                          url: "https://aayushdc1234@gmail.com",
                          // context: context,
                          isDarkMode: isDarkMode),

                      /// My Youtube
                      bottomSocial(
                          img: "assets/images/youtube.png",
                          url: "www.youtube.com/@dcaayushd",
                          // context: context,
                          isDarkMode: isDarkMode),

                      /// My Instagram
                      bottomSocial(
                          img: "assets/images/inst.png",
                          url: "https://www.instagram.com/dcaayushd/",
                          // context: context,
                          isDarkMode: isDarkMode),

                      /// My GitHub
                      bottomSocial(
                          img: "assets/images/github.png",
                          url: "https://github.com/dcaayushd",
                          // context: context,
                          isDarkMode: isDarkMode),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _turnOnFlash() async {
    if (mounted) {
      try {
        await TorchLight.enableTorch();
      } on Exception catch (_) {
        _showErrorMes('Could not enable Flashlight');
      }
    }
  }

  Future<void> _turnOffFlash() async {
    if (mounted) {
      try {
        await TorchLight.disableTorch();
      } on Exception catch (_) {
        _showErrorMes('Could not disable Flashlight');
      }
    }
  }

  void _showErrorMes(String mes) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mes)));
    }
  }
}