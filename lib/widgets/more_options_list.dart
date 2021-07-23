import 'package:facebook/config/palette.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  const MoreOptionsList({Key? key, required this.currentUser})
      : super(key: key);

  final List<List> _moreOptionsList = const [
    [
      MdiIcons.shieldAccount,
      Colors.deepPurple,
      'COVID-19: Central de Informações'
    ],
    [MdiIcons.accountMultiple, Colors.cyan, 'Amigos'],
    [MdiIcons.facebookMessenger, Palette.facebookBlue, 'Messenger'],
    [MdiIcons.flag, Colors.orange, 'Páginas'],
    [MdiIcons.storefront, Palette.facebookBlue, 'Marketplace'],
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.calendarStar, Colors.red, 'Eventos'],
  ];

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: ListView.builder(
          itemCount: 1 + _moreOptionsList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: UserCard(user: currentUser),
              );
            }
            final List option = _moreOptionsList[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child:
                  _Option(icon: option[0], color: option[1], label: option[2]),
            );
          }),
    );
  }
}

class _Option extends StatelessWidget {
  const _Option(
      {Key? key, required this.color, required this.icon, required this.label})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            icon,
            size: 38.0,
            color: color,
          ),
          const SizedBox(
            width: 6.0,
          ),
          Flexible(
              child: Text(
            label,
            style: const TextStyle(fontSize: 16.0),
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}
