import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/constants/secure_storage_keys/secure_storage_keys.dart';
import 'package:dsplatform/features/authorization/screens/src/pin_code_page.dart';
import 'package:dsplatform/features/bookmark/screens/bookmark_page.dart';
import 'package:dsplatform/features/profile/bloc/src/user/user_bloc.dart';
import 'package:dsplatform/features/profile/domain/repositories/user_repository.dart';
import 'package:dsplatform/features/profile/profile.dart';
import 'package:dsplatform/features/search/screens/search_page.dart';
import 'package:dsplatform/features/work/bloc/dissertation/dissertation_bloc.dart';
import 'package:dsplatform/features/work/domain/repositories/dissertation_repository.dart';
import 'package:dsplatform/features/work/screens/src/work_page.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage> {

  int _selectedIndex = 0;

  late PageController _pageController;

  final pinCodeKey = GlobalKey<PinCodePageState>();

  @override
  bool get wantKeepAlive => true;

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

  final DissertationBloc _dissertationBloc = DissertationBloc(dissertationRepository: IDissertationRepository());
  final UserBloc userBloc = UserBloc(userRepository: IUserRepository());
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _dissertationBloc..add(DissertationLoadEvent()),
    ),
        BlocProvider(
          create: (context) => userBloc..add(UserLoadEvent()),
        ),
      ],
      child: Scaffold(
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          controller: _pageController,
          children: const [
            WorkPage(),
            SearchPage(),
            BookmarkPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.homeOutlined
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.homeFilled
              ),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.search
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.search
              ),
              label: "Search"
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.bookmarkOutlined,
                width: 24,
                height: 24,
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.bookmarkFilled,
                width: 24,
                height: 24,
              ),
              label: "Bookmark"
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.profileOutlined
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.profileFilled
              ),
              label: "Profile"
            ),
          ],
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.jumpToPage(index);
            });
          },
        ),
      ),
    );
  }
}
