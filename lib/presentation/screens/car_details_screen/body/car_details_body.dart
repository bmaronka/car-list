import 'package:car_list/domain/car/model/car.dart';
import 'package:car_list/domain/person/model/person.dart';
import 'package:car_list/generated/l10n.dart';
import 'package:car_list/presentation/screens/car_details_screen/cubit/car_details_cubit.dart';
import 'package:car_list/presentation/widgets/car_connect_app_bar/car_connect_app_bar.dart';
import 'package:car_list/presentation/widgets/loader/loader.dart';
import 'package:car_list/presentation/widgets/owner_tile/owner_tile.dart';
import 'package:car_list/style/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class CarDetailsBody extends StatefulWidget {
  const CarDetailsBody({
    required this.cubit,
    required this.car,
    required this.owner,
    super.key,
  });

  final CarDetailsCubit cubit;
  final Car car;
  final Person? owner;

  @override
  State<CarDetailsBody> createState() => _CarDetailsBodyState();
}

class _CarDetailsBodyState extends State<CarDetailsBody> {
  late MapController _controller;

  OSMOption get _mapOptions => const OSMOption(
        enableRotationByGesture: false,
        zoomOption: ZoomOption(
          initZoom: 17,
          maxZoomLevel: 17,
          minZoomLevel: 4,
        ),
      );

  @override
  void initState() {
    _controller = MapController(
      initPosition: GeoPoint(
        latitude: widget.car.lat!,
        longitude: widget.car.lng!,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CarConnectAppBar(title: Strings.of(context).carDetailsScreenTitle),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(Dimens.m),
              child: OwnerTile(owner: widget.owner),
            ),
            _buildMap(context),
          ],
        ),
      );

  Widget _buildMap(BuildContext context) {
    late Widget child;

    if (widget.car.lat == null && widget.car.lng == null) {
      child = Center(
        child: Text(Strings.of(context).mapNotAvailable),
      );
    } else {
      child = OSMFlutter(
        mapIsLoading: const CarConnectLoader(),
        controller: _controller,
        osmOption: _mapOptions,
        onMapIsReady: (_) => _addMarker(),
        onGeoPointClicked: (_) => widget.cubit.showCarDetailsDialog(),
      );
    }

    return Expanded(
      child: child,
    );
  }

  void _addMarker() => _controller.addMarker(
        GeoPoint(
          latitude: widget.car.lat!,
          longitude: widget.car.lng!,
        ),
        markerIcon: MarkerIcon(
          icon: Icon(
            Icons.car_repair,
            size: Dimens.xl,
          ),
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
