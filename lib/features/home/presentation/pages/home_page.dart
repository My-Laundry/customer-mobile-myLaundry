import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer_laundry_app/core/common/styles/colors.dart';
import 'package:customer_laundry_app/core/common/theme/font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(
              context: context,
              name: 'Nidu',
              statusName: 'Pakaian kamu sudah numpuk nih, pesan yuk',
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 20,
                right: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#PenggunaSetia',
                    style: mediumText20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Semua',
                      style: mediumText10.copyWith(
                        color: kColorScheme.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                int current = state is PageChanged ? state.current : 0;
                return _buildImageBannerCarousel(
                  context: context,
                  current: current,
                  imageList: context.read<HomeBloc>().listImage,
                  onPageChanged: context.read<HomeBloc>().onPageChanged,
                );
              },
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Layanan Kami',
                  style: mediumText20,
                ),
              ),
            ),
            _buildCategoryService(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
                left: 20,
                right: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cabang Terdekat',
                    style: mediumText20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lihat Semua',
                      style: mediumText10.copyWith(
                        color: kColorScheme.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 150.h,
              child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                itemBuilder: (context, index) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(22)),
                        child: Image.asset(
                          'assets/images/img_dummyLaundryStore.png',
                          fit: BoxFit.cover,
                          height: 145.h,
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: 16,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kColorScheme.surface,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 8,
                          ),
                          child: Text(
                            '+0.3 Km',
                            style: semiBoldText10.copyWith(
                              color: kColorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'myLaundry Bojongsoang',
                                style: semiBoldText16.copyWith(
                                  color: kColorScheme.surface,
                                ),
                              ),
                              Text(
                                'Jl. Sukapura No.15',
                                style: mediumText12.copyWith(
                                  color: kColorScheme.surface,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kColorScheme.surface,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 6,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber,
                                  size: 18.sp,
                                ),
                                const SizedBox(width: 1),
                                Text(
                                  '4.8',
                                  style: semiBoldText10,
                                ),
                                const SizedBox(width: 3)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kColorScheme.surface,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 4,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: kColorScheme.surface,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              child: Icon(
                                Icons.input_rounded,
                                color: kColorScheme.primary,
                                size: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 3,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  BlocProvider<HomeBloc> _buildCategoryService() {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadCategoriesEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is CategoriesLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: state.services.entries.map((entry) {
                  final service = entry.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(27),
                        margin: const EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                          color: service['color'],
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          service['icon'],
                          width: 25.w,
                          height: 25.w,
                        ),
                      ),
                      Text(
                        entry.key,
                        style: mediumText10,
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
          } else if (state is HomeInitial) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Failed to load categories'));
          }
        },
      ),
    );
  }

  _buildHeader({
    required BuildContext context,
    required String name,
    required String statusName,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kColorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(43),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            bottom: -30,
            child: SvgPicture.asset(
              'assets/images/img_shortPant.svg',
            ),
          ),
          Positioned(
            right: -20,
            top: -30,
            child: SvgPicture.asset(
              'assets/images/img_tshirt.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Text(
                  'Halo $name',
                  style: mediumText20.copyWith(
                    color: kColorScheme.surface,
                  ),
                ),
                Text(
                  statusName,
                  style: mediumText10.copyWith(
                    color: kColorScheme.surface,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                  ),
                  decoration: BoxDecoration(
                    color: kColorScheme.surface,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Yuk gunakan promo #BersihTanpaPusing',
                          style: mediumText10,
                        ),
                        Container(
                          width: 10.h,
                          height: 10.h,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageBannerCarousel({
    required BuildContext context,
    required int current,
    required List<String> imageList,
    required void Function(int index, CarouselPageChangedReason reason)
        onPageChanged,
  }) {
    return Column(
      children: [
        _buildImageSlider(
          context: context,
          current: current,
          imageList: imageList,
          onPageChanged: onPageChanged,
        ),
        const SizedBox(height: 10),
        _buildDotSlider(
          current: current,
          imageList: imageList,
        ),
      ],
    );
  }

  _buildImageSlider({
    required BuildContext context,
    required int current,
    required List<String> imageList,
    required void Function(int index, CarouselPageChangedReason reason)
        onPageChanged,
  }) {
    return CarouselSlider(
      options: CarouselOptions(
        clipBehavior: Clip.none,
        height: MediaQuery.of(context).size.width * 9 / 16,
        // viewportFraction: 0.98,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        onPageChanged: onPageChanged,
      ),
      items: imageList.map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              // return Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 5.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     image: DecorationImage(
              //       fit: BoxFit.cover,
              //       image: AssetImage(i),
              //     ),
              //   ),
              // );
              // return Image.asset("assets/images/img_dummyDiscount1.png");
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image.network(
                    'https://picsum.photos/seed/picsum/400/300',
                    // i,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }

  _buildDotSlider({
    required int current,
    required List<String> imageList,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imageList.map((url) {
        int index = imageList.indexOf(url);
        return Row(children: [
          index == current ? _buildDotWithProgress() : _buildDot(),
          if (index < imageList.length - 1) const SizedBox(width: 4),
        ]);
      }).toList(),
    );
  }

  _buildDotWithProgress() {
    return SizedBox(
      width: 24.0,
      height: 8.0,
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: TweenAnimationBuilder<double?>(
          duration: const Duration(seconds: 5),
          tween: Tween<double?>(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return LinearProgressIndicator(
              minHeight: 8.0,
              backgroundColor: Colors.white.withOpacity(0.8),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
              value: value ?? 0.0,
              borderRadius: BorderRadius.circular(10),
            );
          },
        ),
      ),
    );
  }

  _buildDot() {
    return Container(
      width: 8.0,
      height: 8.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: kColorScheme.primary,
      ),
    );
  }
}
