import 'package:dsplatform/configurations/configurations.dart';
import 'package:dsplatform/features/profile/bloc/src/user/user_bloc.dart';
import 'package:dsplatform/features/profile/domain/repositories/user_repository.dart';
import 'package:dsplatform/features/shop/bloc/bloc.dart';
import 'package:dsplatform/features/shop/domain/models/category/category_model.dart';
import 'package:dsplatform/features/shop/domain/repositories/product_repository.dart';
import 'package:dsplatform/features/shop/widgets/src/item_widget.dart';
import 'package:dsplatform/features/shop/widgets/src/slider_item_widget.dart';
import 'package:dsplatform/gen/assets.gen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  late ScrollController _scrollController;
  bool categoryScrolled = false;
  UserBloc userBloc = UserBloc(userRepository: IUserRepository());
  ProductBloc productCategoryBloc = ProductBloc(productRepository: IProductRepository());
  ProductBloc productBloc = ProductBloc(productRepository: IProductRepository());

  int _currentSlider = 0;
  int _categorySelectedIndex = 0;
  List<CategoryModel> categories = [];
  final CarouselController _controller = CarouselController();

  _scrollListener() {

    if (_scrollController.offset >= 190) {
      setState(() {
        categoryScrolled = true;
      });
    }
    if (_scrollController.offset <= 190) {
      setState(() {
        categoryScrolled = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userBloc..add(UserLoadEvent()),
        ),
        BlocProvider(
          create: (context) => productBloc..add(ProductLoadEvent()),
        ),
      ],
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if(state is ProductLoadedState) {
            setState(() {
              categories = state.categories;
            });
          }
        },
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
                statusBarColor: Colors.black,
                statusBarIconBrightness: Brightness.light
            ),
            toolbarHeight: kToolbarHeight,
            title: Text(AppLocalizations.of(context)!.shop),
            backgroundColor: categoryScrolled ? Colors.white : Colors.transparent,

            /// TODO: make elevation listenable
            elevation: 0,

            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Chip(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  label: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if(state is UserLoadedState) {
                        return Text(
                          NumberFormat("#,##0.00").format(state.userModel.coins),
                          style: const TextStyle(
                            color: Colors.white
                          ),
                        );
                      }
                      return Shimmer.fromColors(
                        baseColor: Colors.white.withOpacity(0.2),
                        highlightColor: Colors.white,
                        child: Container(
                          width: 20,
                          height: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white.withOpacity(0.2)
                          ),
                        ),
                      );
                    },
                  ),
                  avatar: SvgPicture.asset(
                    Assets.icons.selectedCash,
                    // ignore: deprecated_member_use
                    color: Colors.white,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              )
            ],

            /// TODO: need add some animation
            bottom: categoryScrolled ? PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 61),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: categoryScrolled ? Colors.white : Colors.transparent,
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(width: 8),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            label: const Text(
                              'Все',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14
                              ),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Chip(
                            label: Text('Электроника'),
                            backgroundColor: Colors.white,
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Chip(
                            label: Text('Промокоды'),
                            backgroundColor: Colors.white,
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Chip(
                            label: Text('Кроссовки'),
                            backgroundColor: Colors.white,
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Chip(
                            label: Text('Ваучеры'),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                  )
                ],
              )
            ) : null,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              userBloc.add(UserLoadEvent());
            },
            child: ListView(
              controller: _scrollController,
              children: [

                /// Slider
                const SizedBox(height: 8),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [

                    /// Carousel
                    CarouselSlider.builder(
                      itemCount: 4,
                      carouselController: _controller,
                      options: CarouselOptions(
                        aspectRatio: 343 / 156,
                        autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlay: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentSlider = index;
                          });
                        },
                      ),
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => const SliderItemWidget()
                    ),

                    /// Indicator
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [1, 2, 3, 4].asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 8.0,
                              height: 8.0,
                              margin: const EdgeInsets.only(bottom: 36, right: 5, left: 5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                      .withOpacity(_currentSlider == entry.key ? 0.3 : 0.15)),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),

                /// Category
                categoryScrolled ? Container() : Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: categoryScrolled ? Colors.white : Colors.transparent,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index == 0 ? const EdgeInsets.all(6.0).copyWith(left: 16) : const EdgeInsets.all(6.0),
                        child: ChoiceChip(
                          label: Text(categories[index].name),
                          selected: index == _categorySelectedIndex,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              width: 1.5,
                              color: index == _categorySelectedIndex ?  HexColor.fromHex("#00A8FF") : HexColor.fromHex("#ABABAB")
                            )
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black.withOpacity(index == _categorySelectedIndex ? 1 : 0.5)
                          ),
                          selectedColor: Theme.of(context).scaffoldBackgroundColor,
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          onSelected: (bool selected) {
                            setState(() {
                              _categorySelectedIndex = index;
                            });
                          },
                        ),
                      );
                    }
                  ),
                ),

                /// Items
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if(state is ProductLoadedState) {
                        return GridView.builder(
                          shrinkWrap: true,
                          itemCount: state.products.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 165.5 / 215
                          ),
                          itemBuilder: (context, index) {
                            return ItemWidget(productModel: state.products[index]);
                          },
                        );

                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
