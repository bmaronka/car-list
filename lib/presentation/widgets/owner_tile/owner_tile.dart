import 'package:car_list/domain/person/model/person.dart';
import 'package:car_list/generated/l10n.dart';
import 'package:car_list/style/dimens.dart';
import 'package:car_list/style/locales.dart';
import 'package:car_list/utils/date_time_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnerTile extends StatelessWidget {
  const OwnerTile({
    required this.owner,
    this.onTap,
    super.key,
  });

  final Person? owner;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 3,
        child: ListTile(
          title: Text(owner?.displayName ?? Strings.of(context).ownerUnknown),
          subtitle: owner != null
              ? Text(
                  DateTimeFormatter.birthDate(
                    owner!.birthDate,
                    Provider.of<LocaleModel>(context, listen: false).currentLocale.languageCode,
                  ),
                )
              : null,
          trailing: owner != null
              ? Container(
                  alignment: Alignment.center,
                  width: Dimens.xl,
                  height: Dimens.xl,
                  decoration: BoxDecoration(
                    color: owner!.sex.color,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    owner!.sex.sexLetter,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              : null,
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
          ),
          onTap: onTap,
        ),
      );
}
