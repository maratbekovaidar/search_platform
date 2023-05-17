import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/constants/secure_storage_keys/secure_storage_keys.dart';
import 'package:dsplatform/features/authorization/screens/src/pin_code_page.dart';
import 'package:dsplatform/features/profile/profile.dart';
import 'package:dsplatform/features/work/screens/src/work_page.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  late PageController _pageController;

  final pinCodeKey = GlobalKey<PinCodePageState>();


  void _closePinCode() {
    Navigator.pop(context);
  }

  void _setPinCode() {
    GoRouter.of(context).pushReplacement("/set_pin_code");
  }

  void _showDialog(String? localAuth, String? userFullName) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      enableDrag: false,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - kBottomNavigationBarHeight,
        maxHeight: MediaQuery.of(context).size.height - kBottomNavigationBarHeight
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )
          ),
          child: PinCodePage(
            key: pinCodeKey,
            userFullName: userFullName ?? "Пользователь",
            localAuth: localAuth,
            pinCodeCallback: (String pinCode) async {
              String? pinCodeString = await const FlutterSecureStorage().read(key: AppSecureStorageKeys.pinCodeKey);
              if(pinCodeString == pinCode) {
                _closePinCode();
              } else {
                pinCodeKey.currentState!.vibrate();
                pinCodeKey.currentState!.clearPinCode();
              }
            },
            localAuthCallback: (bool result) {
              if(result) {
                _closePinCode();
              } else {
                pinCodeKey.currentState!.vibrate();
                pinCodeKey.currentState!.clearPinCode();
              }
            },
          )
        );
      }
    );
  }

  final List<Widget> _pages = [
    const WorkPage(),
    const ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (await const FlutterSecureStorage().read(key: AppSecureStorageKeys.pinCodeKey) != null) {
        String? localAuth = await const FlutterSecureStorage().read(key: AppSecureStorageKeys.localAuthKey);
        String? userFullName = await const FlutterSecureStorage().read(key: AppSecureStorageKeys.userFullName);
        _showDialog(localAuth, userFullName);
      } else {
        _setPinCode();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.vote,
              color: Colors.black38,
            ),
            activeIcon: SvgPicture.asset(
              Assets.icons.vote,
              color: Theme.of(context).primaryColor,
            ),
            label: "Работы",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/unselected_profile.svg"
            ),
            activeIcon: SvgPicture.asset(
                "assets/icons/selected_profile.svg"
            ),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            // _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
