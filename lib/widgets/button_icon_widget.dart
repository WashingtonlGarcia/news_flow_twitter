import "package:flutter/material.dart";

class ButtonIconWidget extends StatelessWidget {
  final IconData icon;
  final void Function() onTap;

  const ButtonIconWidget({@required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) => Material(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
        child: InkWell(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
          splashColor: Theme.of(context).primaryColorDark,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              icon,
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ),
      );
}
