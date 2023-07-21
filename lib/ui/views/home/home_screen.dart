// Import required Dart packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housr_app/business_logic/cubits/hotel_cubit/hotel_cubit.dart';
import '../../../mockApi/hotel_data.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/Theme/theme_data.dart';
import '../../widgets/hotel_carousel.dart';
import '../../widgets/search_bar.dart';

// Create a TextEditingController instance to manage a text input field
TextEditingController controller = TextEditingController();

// Variable to store the index of the selected amenity in the search filter
int selectedIndex = -1;

List iconsMap = [AppImages.hotTub,AppImages.gym,AppImages.parking,AppImages.spa,AppImages.dinner,AppImages.wifi,AppImages.spa,AppImages.gym,AppImages.spa,AppImages.dinner,AppImages.wifi,AppImages.hotTub,];
// StatefulWidget for the HomePage
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// State class for the HomePage
class _HomePageState extends State<HomePage> {
  // Method called when the state changes
  @override
  void didChangeDependencies() {
    // Fetch hotel data when the state is first created
    context.read<HotelCubit>().fetchHotelData("");
    super.didChangeDependencies();
  }

  // Build method to construct the UI for the page
  @override
  Widget build(BuildContext context) {
    // Get the TextTheme from the current theme
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display the "Location" text with specific styling
                      Text(
                        "Location",
                        style: myTheme.textTheme.bodyLarge?.copyWith(
                            color: AppColor.darkGrey,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      // Display the current location
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, color: AppColor.ctaButtoncolor, size: 15,),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Bali,Indonesia",
                            style: myTheme.textTheme.displaySmall?.copyWith(
                                color: AppColor.black,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Display the search bar with a background image
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.searchBackGround,),
                              fit: BoxFit.cover,
                            )
                        ),
                        child: SearchBarCustom(controller: controller, hintText: 'Search by City or Hotel name',),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Display the "Search By Amenities" text with specific styling
                      Text(
                        "Search By Amenities",
                        style: myTheme.textTheme.bodyLarge?.copyWith(
                            color: AppColor.black,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5),
                      ),
                      // Display a horizontal ListView of amenities for filtering
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: amenities.length,
                          itemBuilder: (BuildContext context, int indexA) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (selectedIndex == indexA) {
                                    // Deselect the amenity and fetch all hotels
                                    selectedIndex = -1;
                                    context.read<HotelCubit>().fetchHotelData("");
                                  } else {
                                    // Select the amenity and fetch hotels based on the selected amenity
                                    selectedIndex = indexA;
                                    // Fetch hotel data based on the selected amenity
                                    context.read<HotelCubit>().fetchHotelData(amenities[indexA], isAmenities: true);
                                  }
                                });

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 80,
                                  decoration: BoxDecoration(
                                    // Apply a border color based on whether the amenity is selected or not
                                    border: Border.all(width: 1, color: selectedIndex == indexA ? AppColor.ctaRedcolor : AppColor.cream),
                                    // color: AppColor.ctaRedcolor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset(
                                            iconsMap[indexA],

                                            width: 35,
                                            color: AppColor.black,
                                          ),
                                          Text(
                                            amenities[indexA],
                                            textAlign: TextAlign.center,
                                            style: myTheme.textTheme.bodyLarge?.copyWith(
                                              color: AppColor.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // Display the "Recommended" text with specific styling
                      Text(
                        "Recommended",
                        style: myTheme.textTheme.displayLarge?.copyWith(
                            color: AppColor.black,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5),
                      ),
                      // Display the hotel carousel widget to show recommended hotels
                      const HotelCarousel(button: ''),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
