import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housr_app/Theme/theme_data.dart';
import 'package:housr_app/business_logic/cubits/counter/booking_state.dart';
import 'package:housr_app/ui/widgets/CTA/cta_button_carousel.dart';
import 'package:housr_app/ui/widgets/custom_loader.dart';
import 'package:housr_app/utils/app_utils.dart';
import '../../../business_logic/cubits/counter/booking_cubit.dart';
import '../../../business_logic/cubits/hotel_cubit/hotel_cubit.dart';
import '../../../business_logic/cubits/hotel_cubit/hotel_state.dart';
import '../../../business_logic/cubits/navigationBar_cubit/navigation_cubit.dart';
import '../../../data/repositories/JWT/jwt_token.dart';
import '../../widgets/counter.dart';


int selectedIndex = 0;

class RoomCardExpanded extends StatefulWidget {
  final String bG;
  final int index;
  const RoomCardExpanded({super.key, required this.bG, required this.index});

  @override
  State<RoomCardExpanded> createState() => _RoomCardExpandedState();
}

CarouselController controller = CarouselController();

class _RoomCardExpandedState extends State<RoomCardExpanded> {

  @override
  Widget build(BuildContext context) {

    return Material(
      child: BlocConsumer<BookingCubit, BookingState>(
        builder: (context, state) {
          final hotelstate =
              context.watch<HotelCubit>().state;
          if (hotelstate is HotelFetched) {

            return Scaffold(
              body: Stack(
                children: [

                  CarouselSlider.builder(
                    carouselController: controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        autoPlayInterval: const Duration(seconds: 5),
                        viewportFraction: 1,
                        aspectRatio: 16 / 9,
                        height: MediaQuery.of(context).size.height),
                    itemCount: hotelstate.hotelList[widget.index]
                        .roomTypes?[selectedIndex].images?.length,
                    itemBuilder:
                        (BuildContext context, int indexC, int realIndex) {
                      return Hero(
                        tag: realIndex,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          imageUrl: hotelstate.hotelList[widget.index]
                                  .roomTypes?[selectedIndex].images?[indexC] ??
                              "",
                          placeholder: (context, url) => Container(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      Hero(
                        tag: widget.bG,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SizedBox(
                                height: 20,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: hotelstate.hotelList[widget.index]
                                      .roomTypes?[selectedIndex].images?.length,
                                  itemBuilder:
                                      (BuildContext context, int indexD) {
                                    return GestureDetector(
                                      onTap: () {
                                        controller.nextPage(
                                            duration:
                                                const Duration(seconds: 5),
                                            curve: Curves.linear);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 20,
                                          width:
                                              selectedIndex == indexD ? 40 : 20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColor.ctaRedcolor,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.black.withOpacity(0.50),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //   crossAxisAlignment: CrossAxisAlignment.center,
                                        //   children: [
                                        //     Column(
                                        //       crossAxisAlignment: CrossAxisAlignment.start,
                                        //       children: [
                                        //         Text(
                                        //           hotelstate.hotelList[index].roomTypes?[0].name??"",
                                        //           style: myTheme.textTheme.titleLarge?.copyWith(
                                        //               color: AppColor.cream,
                                        //               fontSize: 40,
                                        //               fontWeight: FontWeight.w700),
                                        //         ),
                                        //         const SizedBox(
                                        //           height: 8,
                                        //         ),
                                        //         Row(
                                        //           children: [
                                        //             const Icon(Icons.location_on_outlined,color: AppColor.ctaRedcolor,size: 20,),
                                        //             const SizedBox(
                                        //               width: 4,
                                        //             ),
                                        //             Text(
                                        //               hotelstate.hotelList[index].location??"",
                                        //               style: myTheme.textTheme.displaySmall?.copyWith(
                                        //                   color: AppColor.cream,
                                        //                   fontWeight: FontWeight.w700),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //
                                        //
                                        //
                                        //       ],
                                        //     ),
                                        //     Column(
                                        //       crossAxisAlignment: CrossAxisAlignment.start,
                                        //       children: [
                                        //         Container(
                                        //           decoration:  BoxDecoration(
                                        //
                                        //             color: AppColor.snackBarGreen,
                                        //             borderRadius: BorderRadius.circular(10),),
                                        //           child: Padding(
                                        //             padding: const EdgeInsets.all(8.0),
                                        //             child: Row(
                                        //               mainAxisAlignment: MainAxisAlignment.start,
                                        //               children: [
                                        //                 Image.asset(AppImages.star,width: 30,color: AppColor.cream,),
                                        //                 const SizedBox(width: 3,),
                                        //                 Text(
                                        //                   hotelstate.hotelList[index].starRating.toString()??"",
                                        //                   style: myTheme.textTheme.displayMedium?.copyWith(
                                        //                       color: AppColor.cream,
                                        //
                                        //                       fontWeight: FontWeight.w500),
                                        //                 ),
                                        //
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         const SizedBox(
                                        //           height: 8,
                                        //         ),
                                        //
                                        //       ],
                                        //     ),
                                        //
                                        //   ],
                                        // ), SizedBox(height: 25,),
                                        // const Divider(color: AppColor.darkGrey,thickness: 1,),
                                        // SizedBox(height: 25,),
                                        Text(
                                          "Select Your Room",
                                          style: myTheme.textTheme.displayLarge
                                              ?.copyWith(
                                                  color: AppColor.cream,
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 150,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: hotelstate
                                                .hotelList[widget.index]
                                                .roomTypes
                                                ?.length,
                                            itemBuilder: (BuildContext context,
                                                int indexA) {
                                              return Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = indexA;
                                                      });
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10.0),
                                                      child: Container(
                                                        width: 100,
                                                        height: 90,
                                                        decoration:
                                                            BoxDecoration(
                                                                border: Border.all(
                                                                    width: 0.5,
                                                                    color: selectedIndex ==
                                                                            indexA
                                                                        ? AppColor
                                                                            .ctaRedcolor
                                                                        : AppColor
                                                                            .black),
                                                                color: AppColor
                                                                    .black
                                                                    .withOpacity(
                                                                        0.5),
                                                                // boxShadow: [
                                                                //   BoxShadow(
                                                                //     color: AppColor.cream,
                                                                //     offset: const Offset(0, 0),
                                                                //     blurRadius: 4.0,
                                                                //     spreadRadius: 0.0,
                                                                //   ),
                                                                // ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                        child: Center(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Image.asset(
                                                                  AppImages
                                                                      .room,
                                                                  width: 30,
                                                                  color: AppColor
                                                                      .white,
                                                                ),
                                                                Text(
                                                                  hotelstate
                                                                          .hotelList[widget
                                                                              .index]
                                                                          .roomTypes?[
                                                                              indexA]
                                                                          .name ??
                                                                      "",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: myTheme
                                                                      .textTheme
                                                                      .bodyMedium
                                                                      ?.copyWith(
                                                                          color: AppColor
                                                                              .cream,
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  selectedIndex ==
                                                      indexA? PlusMinusCounter():const SizedBox(),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        // Text(
                                        //   hotelstate.hotelList[index].description??"",
                                        //   textAlign: TextAlign.start,
                                        //
                                        //   style: myTheme.textTheme.displaySmall?.copyWith(
                                        //       letterSpacing: 1.1,
                                        //       wordSpacing: 2,
                                        //       color: AppColor.cream,
                                        //       fontWeight: FontWeight.w500),
                                        // ),
                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 30.0, top: 30),
                                      child: Row(
                                        children: [
                                          Text(
                                            "\$${hotelstate.hotelList[widget.index].roomTypes?[selectedIndex].price.toString() ?? ""}/",
                                            style: myTheme.textTheme.titleMedium
                                                ?.copyWith(
                                                    color: AppColor.ctaRedcolor,
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                          Text(
                                            "Night",
                                            style: myTheme.textTheme.bodyLarge
                                                ?.copyWith(
                                                    color: AppColor.cream,
                                                    fontWeight:
                                                        FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // ListView.builder(
                                    //   shrinkWrap: true,
                                    //   itemCount: hotelstate.hotelList[index].roomTypes?.length,
                                    //   itemBuilder: (BuildContext context, int indexR) {
                                    //   return  Padding(
                                    //     padding: const EdgeInsets.only(bottom: 8.0),
                                    //     child: const RoomTile(appImages: '', title: '',),
                                    //   );
                                    // },),

                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 40.0),
                                      child: CtaCarouselButton(
                                        textStyle: myTheme
                                            .textTheme.displayLarge
                                            ?.copyWith(color: AppColor.white),
                                        title: "Book Now",
                                        onPressed: () {
                                          BlocProvider.of<BookingCubit>(context)
                                              .postBooking(hotelstate.hotelList[widget.index]);


                                        },
                                        isEnable: true,
                                        color: AppColor.ctaRedcolor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return CustomLoader();
          }
        },
        listener: (context, state) async {
          if( state is BookingPost){
            BlocProvider.of<NavigationBarCubit>(context).selectItem(NavigationBarItem.booking);
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/homepage",arguments: {"hotelData": await loadListFromSharedPreferences()}, (Route<dynamic> route) => false);

          }
        },
      ),
    );
  }
}
