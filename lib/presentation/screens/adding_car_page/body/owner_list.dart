import 'package:car_list/domain/person/model/person.dart';
import 'package:car_list/extensions/extension_mixin.dart';
import 'package:car_list/generated/l10n.dart';
import 'package:car_list/presentation/screens/adding_car_page/cubit/adding_car_cubit.dart';
import 'package:car_list/presentation/widgets/owner_tile/owner_tile.dart';
import 'package:car_list/style/dimens.dart';
import 'package:flutter/material.dart';

class OwnerList extends StatelessWidget {
  const OwnerList({
    required this.cubit,
    required this.owners,
    super.key,
  });

  final AddingCarCubit cubit;
  final List<Person> owners;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            Strings.of(context).pickOwner,
            style: TextStyle(fontSize: Dimens.ms),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: owners.length,
              separatorBuilder: (context, index) => SizedBox(height: Dimens.xm),
              itemBuilder: (context, index) => OwnerTile(
                owner: owners[index],
                onTap: () => cubit.pickOwner(owners[index]),
              ),
            ),
          ),
        ].insertBetweenElements(() => SizedBox(height: Dimens.m)),
      );
}
