import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:taxi_app/core/util/app_colors.dart';
import 'package:taxi_app/features/presentation/common/icon_title_subtitle_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isOpen = false;

  MapController controller = MapController(
    initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
  );

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OSMFlutter(
              controller: controller,
              osmOption: OSMOption(
                userTrackingOption: const UserTrackingOption(
                  enableTracking: true,
                  unFollowUser: false,
                ),
                zoomOption: const ZoomOption(
                  initZoom: 8,
                  minZoomLevel: 3,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
                ),
                userLocationMarker: UserLocationMaker(
                  personMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.location_history_rounded,
                      color: Colors.red,
                      size: 48,
                    ),
                  ),
                  directionArrowMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.double_arrow,
                      size: 48,
                    ),
                  ),
                ),
                roadConfiguration: const RoadOption(
                  roadColor: Colors.yellowAccent,
                ),
                markerOption: MarkerOption(
                    defaultMarker: const MarkerIcon(
                  icon: Icon(
                    Icons.person_pin_circle,
                    color: Colors.blue,
                    size: 56,
                  ),
                )),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 40,
                      height: 40,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: TColor.secondary,
                                  borderRadius: BorderRadius.circular(35),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10,
                                        offset: Offset(0, 5))
                                  ]),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1.5),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: const Center(
                                child: Text(
                                  "GO",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await controller.currentLocation();
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              )
                            ]),
                        child: const Icon(
                          Icons.my_location_rounded,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, -5))
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isOpen = !isOpen;
                            });
                          },
                          icon: Icon(
                            isOpen
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            size: 30,
                          ),
                        ),
                        Center(
                          child: Text(
                            "You're Offline",
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 18,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        const SizedBox(
                          width: 60,
                          height: 50,
                        ),
                      ],
                    ),
                    if (isOpen)
                      Container(
                        height: 0.5,
                        width: double.maxFinite,
                        color: TColor.placeholder.withOpacity(0.5),
                      ),
                    if (isOpen)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: IconTitleSubtitleButton(
                                title: "95.0%",
                                subTitle: "Acceptance",
                                icon: const Icon(
                                  Icons.done,
                                  size: 20,
                                ),
                                onPressed: () {}),
                          ),
                          Container(
                            height: 100,
                            width: 0.5,
                            color: TColor.placeholder.withOpacity(0.5),
                          ),
                          Expanded(
                            child: IconTitleSubtitleButton(
                                title: "4.75%",
                                subTitle: "Rating",
                                icon: const Icon(
                                  Icons.rate_review_outlined,
                                  size: 20,
                                ),
                                onPressed: () {}),
                          ),
                          Container(
                            height: 100,
                            width: 0.5,
                            color: TColor.placeholder.withOpacity(0.5),
                          ),
                          Expanded(
                            child: IconTitleSubtitleButton(
                                title: "2%",
                                subTitle: "Cancellation",
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  size: 20,
                                ),
                                onPressed: () {}),
                          )
                        ],
                      )
                  ],
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 60),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 25),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                              )
                            ]),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "\$",
                                style: TextStyle(
                                    color: TColor.secondary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              "157.75",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            )
                          ],
                        )),
                    SizedBox(
                      width: 60,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: const Icon(
                                Icons.account_circle_outlined,
                                size: 40,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            constraints: const BoxConstraints(minWidth: 15),
                            child: const Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
