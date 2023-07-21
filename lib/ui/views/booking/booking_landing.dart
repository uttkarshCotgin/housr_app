// Import required Dart packages
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housr_app/business_logic/cubits/counter/booking_cubit.dart';
import 'package:housr_app/business_logic/cubits/hotel_cubit/hotel_cubit.dart';
import 'package:housr_app/business_logic/cubits/hotel_cubit/hotel_state.dart';
import 'package:housr_app/data/models/hotel/hotel_model.dart';
import 'package:housr_app/data/repositories/JWT/jwt_token.dart';
import 'package:housr_app/ui/widgets/custom_loader.dart';
import 'package:housr_app/ui/widgets/room_tile.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/Theme/theme_data.dart';

// Create a TextEditingController instance to manage a text input field
TextEditingController controller = TextEditingController();

// StatefulWidget for the Booking Landing page
class BookingLanding extends StatefulWidget {
  const BookingLanding({super.key});

  @override
  State<BookingLanding> createState() => _BookingLandingState();
}

// Global variable to store the hotel state (assuming it's used elsewhere)
late final hotelState;

// State class for the Booking Landing page
class _BookingLandingState extends State<BookingLanding> {
  // Method called when the state changes
  @override
  void didChangeDependencies() async {
    // Check if the context is still mounted before accessing it
    if (context.mounted) {
      // Get the current hotel state from the HotelCubit using the context
      hotelState = context.watch<HotelCubit>().state;
    }
    super.didChangeDependencies();
  }

  // Build method to construct the UI for the page
  @override
  Widget build(BuildContext context) {
    // Get the TextTheme from the current theme
    TextTheme _textTheme = Theme.of(context).textTheme;

    return BlocConsumer<HotelCubit, HotelState>(
      // Builder function to handle the state when HotelCubit emits a state
      builder: (BuildContext context, state) {
        if (state is HotelFetched) {
          // If the state is HotelFetched, show the Scaffold with the booking data
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
                            // Display the "My Bookings" text with specific styling
                            Text(
                              "My Bookings",
                              style: myTheme.textTheme.titleLarge?.copyWith(
                                color: AppColor.black,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // Display a ListView.builder to show the booking data
                            ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              // Get the length of hotelData from BookingCubit
                              itemCount:
                                  context.read<BookingCubit>().hotelData.length,
                              itemBuilder: (BuildContext context, int index) {
                                // Return a RoomTile widget for each booking entry
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RoomTile(
                                    appImages: context
                                            .read<BookingCubit>()
                                            .hotelData[index]
                                            .images?[0] ??
                                        "",
                                    title: "",
                                    index: index,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          // If the state is not HotelFetched, show a custom loader (fallback while loading data)
          return CustomLoader();
        }
      },
      // Listener function to handle side-effects when HotelCubit emits a state
      listener: (BuildContext context, Object? state) {},
    );
  }
}
