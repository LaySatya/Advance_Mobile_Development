import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/rides/widgets/ride_pref_bar.dart';
import 'package:week_3_blabla_project/screens/rides/widgets/ride_pref_modal.dart';
import 'package:week_3_blabla_project/service/ride_prefs_service.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';

import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../service/rides_service.dart';
import '../../theme/theme.dart';
import 'widgets/rides_tile.dart';

///
///  The Ride Selection screen allow user to select a ride, once ride preferences have been defined.
///  The screen also allow user to re-define the ride preferences and to activate some filters.
///
class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
 
  // RidePreference currentPreference  = fakeRidePrefs[0];   // TODO 1 :  We should get it from the service
  RidePreference get currentPreference =>
      RidePrefService.instance.currentPreference!;

  RidesFilter currentFilter = RidesFilter();

  List<Ride> get matchingRides => RidesService.instance.getRidesFor(currentPreference, currentFilter);

  void onBackPressed() {
    Navigator.of(context).pop();     //  Back to the previous view
  } 
    onRidePrefSelected(RidePreference newPreference) async {}


  void onPreferencePressed() async {
    // TODO  6 : we should push the modal with the current pref
    // modal to edit ride pre
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
            AnimationUtils.createTopToBottomRoute(RidePrefModal(
      // initialPreference: currentPreference,
    )));

  //       // TODO 9 :  After pop, we should get the new current pref from the modal 

  //       // TODO 10 :  Then we should update the service current pref,   and update the view
  }

  void onFilterPressed() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
          left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
      child: Column(
        children: [
          // Top search Search bar
          RidePrefBar(
              ridePreference: currentPreference,
              onBackPressed: onBackPressed,
              onPreferencePressed: onPreferencePressed,
              onFilterPressed: onFilterPressed),

          Expanded(
            child: ListView.builder(
              itemCount: matchingRides.length,
              itemBuilder: (ctx, index) => RideTile(
                ride: matchingRides[index],
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
