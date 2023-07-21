
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubits/counter/booking_cubit.dart';
import '../../utils/app_utils.dart';


class RoomTile extends StatelessWidget {
  final String appImages;
  final String title;
  final int index;

  const RoomTile({Key? key,required this.appImages,required this.title, required this.index}) : super(key: key);

  @override
     Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return  Container(
      child: Stack(

        children: [

          ClipRRect(
      borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: 170,
              height: 150,
              imageUrl: appImages,
              placeholder: (context, url) => Container(),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
          ),

          Positioned(

            left: 150,
            bottom: 35,
            top: 35,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.ctaButtoncolor.withOpacity(0.25),
                      offset: const Offset(0, 0),
                      blurRadius: 4.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.read<BookingCubit>().hotelData[index].name??"",
                              style: textTheme.displayLarge?.copyWith(

                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined,color: AppColor.ctaButtoncolor,size: 15,),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  context.read<BookingCubit>().hotelData[index].location??"",
                                  style: textTheme.bodyMedium?.copyWith(
                                      color: AppColor.darkGrey,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),

                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(AppImages.star,width: 20,color: AppColor.tagYellow,),

                                Text(
                                  context.read<BookingCubit>().hotelData[index].starRating.toString()??"",
                                  style: textTheme.displayMedium?.copyWith(

                                      fontWeight: FontWeight.w300),
                                ),

                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),

                          ],
                        ),

                      ],
                    ),
                  )

                ],
              ),
            ),
          ),

        ],



      ),
    );
  }
}
// Future<void> _launchUrl(var _url) async {
//   if (!await launchUrl(Uri.parse("https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf"))) {
//     throw Exception('Could not launch $_url');
//   }
// }

