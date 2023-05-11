// ignore_for_file: deprecated_member_use

import 'package:dsplatform/components/extension/date_only.dart';
import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/configurations/language_provider/language_local_provider.dart';
import 'package:dsplatform/constants/constants.dart';
import 'package:dsplatform/features/cash/bloc/operation/operation_bloc.dart';
import 'package:dsplatform/features/cash/cash.dart';
import 'package:dsplatform/features/cash/domain/models/operation/operation_model.dart';
import 'package:dsplatform/features/cash/domain/repositories/operation_repository.dart';
import 'package:dsplatform/features/profile/bloc/src/user/user_bloc.dart';
import 'package:dsplatform/features/profile/domain/repositories/user_repository.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CashPage extends StatefulWidget {
  const CashPage({Key? key}) : super(key: key);

  @override
  State<CashPage> createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {

  UserBloc userBloc = UserBloc(userRepository: IUserRepository());
  OperationBloc operationBloc = OperationBloc(operationRepository: IOperationRepository());

  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiPath.apiPath,
      validateStatus: (status) {
        return status! < 500;
      }
    )
  );

  @override
  void initState() {
    super.initState();
  }

  List<List<OperationModel>> getSortedOperationsByDate(List<OperationModel> operations) {

    List<List<OperationModel>> result = [];
    DateTime currentDateTime = DateTime(2000);
    List<OperationModel> currentSublist = [];

    for (int i = 0; i < operations.length; i++) {
      if (!currentDateTime.isSameDate(DateTime.fromMillisecondsSinceEpoch(operations[i].created))) {
        if (currentSublist.isNotEmpty) {
          result.add(currentSublist);
        }
        currentDateTime = DateTime.fromMillisecondsSinceEpoch(operations[i].created);
        currentSublist = [operations[i]];
      } else {
        currentSublist.add(operations[i]);
      }
    }

    if (currentSublist.isNotEmpty) {
      result.add(currentSublist);
    }

    return result;
  }

  String getDateTitle(DateTime dateTime) {
    if(dateTime.isSameDate(DateTime.now())) {
      switch(AppLocalizations.of(context)!.language) {
        case "English":
          return "Today";
        case "Russian":
          return "Сегодня";
        case "Kazakh":
          return "Бүгін";
        default:
          return "Сегодня";
      }
    }
    if(dateTime.isSameDate(DateTime.now().subtract(const Duration(days: 1)))) {
      switch(AppLocalizations.of(context)!.language) {
        case "English":
          return "Yesterday";
        case "Russian":
          return "Вчера";
        case "Kazakh":
          return "Кеше";
        default:
          return "Вчера";
      }
    }
    return DateFormat("MMMMd", GetIt.I.get<LanguageLocalProvider>().locale.toString()).format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userBloc..add(UserLoadEvent()),
    ),
        BlocProvider(
          create: (context) => operationBloc..add(OperationLoadEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(AppLocalizations.of(context)!.cash),
          actions: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).pushNamed(AppRouteConstants.landingRouteName);
              },
              icon: const Icon(
                Icons.help_outline_rounded,
                color: Colors.blue,
              )
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            userBloc.add(UserLoadEvent());
            operationBloc.add(OperationLoadEvent());
          },
          child: ListView(
            children: [

              /// Balance
              Container(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  right: 0
                ),
                height: (MediaQuery.of(context).size.width - 42) * 0.42,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    /// Balance
                    Container(
                      width: MediaQuery.of(context).size.width - 42,
                      height: (MediaQuery.of(context).size.width - 42) * 0.42,
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.only(
                        left: 16,
                        right: 10
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: HexColor.fromHex("#00A8FF")
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Info about balance
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              /// Title
                              const Text(
                                "Мой баланс",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                                ),
                              ),
                              /// Count balance
                              BlocBuilder<UserBloc, UserState>(
                                builder: (context, state) {
                                  if(state is UserLoadedState) {
                                    return Text(
                                      NumberFormat("#,##0.00").format(state.userModel.coins),
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white
                                      ),
                                    );
                                  }
                                  return Shimmer.fromColors(
                                    baseColor: Colors.white.withOpacity(0.2),
                                    highlightColor: Colors.white,
                                    child: Container(
                                      width: 100,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.white.withOpacity(0.2)
                                      ),
                                    ),
                                  );
                                },
                              ),
                              /// Exchange rate
                              const Text(
                                "1,000 шагов -> 1 TER",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),

                          /// Logo
                          SvgPicture.asset("assets/logo/balance_logo.svg")
                        ],
                      ),
                    ),

                    /// Other stuff
                    Container(
                      width: MediaQuery.of(context).size.width - 42,
                      height: (MediaQuery.of(context).size.width - 42) * 0.42,
                      padding: const EdgeInsets.all(25),
                      margin: const EdgeInsets.only(
                        left: 0,
                        right: 16
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Пройдено за сегодня",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                                ),
                              ),
                              const Text(
                                "12313",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: Colors.black
                                ),
                              ),
                              Text(
                                "123123 TER начислим в конце дня",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.5)
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.icons.activity,
                                height: 72,
                                width: 56,
                                color: HexColor.fromHex("#FF9500", opacity: 0.5)
                              ),
                              const SizedBox(width: 21,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Transaction History
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: BlocBuilder<OperationBloc, OperationState>(
                  builder: (context, state) {
                    if(state is OperationLoadedState) {

                      // return Column(
                      //   children: state.operations.map((e) => OperationWidget(operationModel: e)).toList(),
                      // );
                      return Column(
                        children: getSortedOperationsByDate(state.operations).map((operations) {
                          return Column(
                            children: [
                              /// Date
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      getDateTitle(DateTime.fromMillisecondsSinceEpoch(operations.first.created)),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ...operations.map((operation) {
                                return OperationWidget(operationModel: operation);
                              }).toList(),
                            ],
                          );
                        }).toList(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
