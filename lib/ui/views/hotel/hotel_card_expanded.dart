// Import required Dart packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housr_app/Theme/theme_data.dart';
import 'package:housr_app/business_logic/cubits/hotel_cubit/hotel_cubit.dart';
import 'package:housr_app/business_logic/cubits/hotel_cubit/hotel_state.dart';
import 'package:housr_app/ui/widgets/CTA/cta_button_carousel.dart';
import 'package:housr_app/ui/widgets/custom_loader.dart';
import 'package:housr_app/utils/app_utils.dart';

import '../../widgets/room_tile.dart';

// Expanded view of a hotel card
class HotelCardExpanded extends StatelessWidget {
  final String bG;
  final int index;
  const HotelCardExpanded({super.key, required this.bG, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      builder: (context, state) {
        if (state is HotelFetched) {
          // If hotel data is fetched, show the expanded hotel card
          return Scaffold(
            body: Stack(
              children: [
                // Display the background image of the hotel card using a Hero widget
                Hero(
                  tag: index,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    imageUrl: bG,
                    placeholder: (context, url) => Container(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
                // Apply a gradient overlay to the background image
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.ctaButtoncolor.withOpacity(0.2),
                        offset: const Offset(0, 0),
                        blurRadius: 4.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [AppColor.black.withOpacity(0.0), AppColor.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                // Content of the expanded hotel card
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Show a back button to return to the previous screen
                    SafeArea(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.cream.withOpacity(0.50),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: AppColor.cream,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Hotel information and amenities
                    Hero(
                      tag: bG,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Display hotel name, location, and star rating
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.hotelList[index].name ?? "",
                                            style: myTheme.textTheme.titleLarge
                                                ?.copyWith(
                                                color: AppColor.cream,
                                                fontSize: 40,
                                                fontWeight:
                                                FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on_outlined,
                                                color: AppColor.ctaRedcolor,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                state.hotelList[index]
                                                    .location ??
                                                    "",
                                                style: myTheme
                                                    .textTheme.displaySmall
                                                    ?.copyWith(
                                                    color: AppColor.cream,
                                                    fontWeight:
                                                    FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: AppColor.snackBarGreen,
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    AppImages.star,
                                                    width: 30,
                                                    color: AppColor.cream,
                                                  ),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    state.hotelList[index]
                                                        .starRating
                                                        .toString() ??
                                                        "",
                                                    style: myTheme
                                                        .textTheme.displayMedium
                                                        ?.copyWith(
                                                        color:
                                                        AppColor.cream,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  const Divider(
                                    color: AppColor.darkGrey,
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  // Display hotel amenities
                                  Text(
                                    "What we Offer",
                                    style: myTheme.textTheme.displayLarge
                                        ?.copyWith(
                                        color: AppColor.cream,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 90,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                      state.hotelList[index].amenities?.length,
                                      itemBuilder:
                                          (BuildContext context, int indexA) {
                                        return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: AppColor.ctaRedcolor
                                                  .withOpacity(0.2),
                                              borderRadius:
                                              BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(4.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  children: [
                                                    Image.asset(
                                                      AppImages.feature,
                                                      width: 30,
                                                      color: AppColor.white,
                                                    ),
                                                    Text(
                                                      state.hotelList[index]
                                                          .amenities?[
                                                      indexA] ??
                                                          "",
                                                      textAlign:
                                                      TextAlign.center,
                                                      style: myTheme
                                                          .textTheme.bodyMedium
                                                          ?.copyWith(
                                                          color: AppColor
                                                              .cream,
                                                          fontWeight:
                                                          FontWeight
                                                              .w700),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // Display hotel description
                                  Text(
                                    state.hotelList[index].description ?? "",
                                    textAlign: TextAlign.start,
                                    style: myTheme.textTheme.displaySmall
                                        ?.copyWith(
                                        letterSpacing: 1.1,
                                        wordSpacing: 2,
                                        color: AppColor.cream,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 30.0, top: 30),
                                child: Row(
                                  children: [
                                    // Display hotel price per night
                                    Text(
                                      "\$${state.hotelList[index].price.toString() ?? ""}/",
                                      style: myTheme.textTheme.titleMedium
                                          ?.copyWith(
                                          color: AppColor.ctaRedcolor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "Night",
                                      style: myTheme.textTheme.bodyLarge
                                          ?.copyWith(
                                          color: AppColor.cream,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                              // CTA Button for selecting rooms
                              Padding(
                                padding: const EdgeInsets.only(bottom: 40.0),
                                child: CtaCarouselButton(
                                  textStyle: myTheme.textTheme.displayLarge
                                      ?.copyWith(color: AppColor.white),
                                  title: "Select Rooms",
                                  onPressed: () {
                                    Navigator.of(context).pushNamed("/RoomExpanded",arguments: {"bg":state.hotelList[index].images?[0]??"","index":index});
                                  },
                                  isEnable: true,
                                  color: AppColor.ctaRedcolor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        } else {
          // If hotel data is not yet fetched, show a custom loader
          return CustomLoader();
        }
      },
      listener: (context, state) {},
    );
  }
}
