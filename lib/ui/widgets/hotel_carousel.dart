import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housr_app/business_logic/cubits/hotel_cubit/hotel_cubit.dart';
import 'package:housr_app/business_logic/cubits/hotel_cubit/hotel_state.dart';
import 'package:housr_app/ui/widgets/custom_loader.dart';

import '../../utils/app_utils.dart';




class HotelCarousel extends StatelessWidget {

  final String button;
  const HotelCarousel({super.key, required this.button});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return BlocConsumer<HotelCubit,HotelState>(builder: (context,state){
      if(state is HotelFetched) {
        return SizedBox(
        child: ListView.builder(
          physics: ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount:  state.hotelList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed("/HotelCardExpanded",arguments: {"bg":state.hotelList[index].images?[0]??"","index":index});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                  child: Container(

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
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(

                              borderRadius: BorderRadius.circular(4.0),
                            child: Hero(
                              tag: index,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width-40,
                                height: 170,
                                imageUrl: state.hotelList[index].images?[0]??"",
                                placeholder: (context, url) =>
                                    Container(),
                                errorWidget: (context, url, error) =>
                                const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(
                                state.hotelList[index].name??"",
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
                                        state.hotelList[index].location??"",
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
                                        state.hotelList[index].starRating.toString()??"",
                                        style: textTheme.displayMedium?.copyWith(

                                            fontWeight: FontWeight.w300),
                                      ),

                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$${state.hotelList[index].price.toString()??""}",
                                        style: textTheme.displaySmall?.copyWith(
                                          color: AppColor.ctaRedcolor,

                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "/Person",
                                        style: textTheme.bodyLarge?.copyWith(

                                            fontWeight: FontWeight.w300),
                                      ),

                                    ],
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
              );
            }),
      );
      }else{
        return const CustomLoader();

      }
    }, listener:  (context,state){});

  }
}
