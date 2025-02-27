import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterMenu extends StatefulWidget {
  const FilterMenu({super.key});

  @override
  State<FilterMenu> createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {
  bool isSugary = false;
  bool isDairy = false;
  bool isDecaf = false;
  bool containsNuts = false;
  bool containsCaffeine = false;

  void onChanged(String key, bool value) {
    setState(() {
      switch (key) {
        case 'Sugary':
          isSugary = value;
          break;
        case 'Dairy':
          isDairy = value;
          break;
        case 'Decaf':
          isDecaf = value;
          break;
        case 'Contains Nuts':
          containsNuts = value;
          break;
        case 'Contains Caffeine':
          containsCaffeine = value;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 196, 124, 72),
        borderRadius: BorderRadius.circular(14),
      ),
      child: PopupMenuButton<String>(
        icon: SvgPicture.asset(
          'assets/icons/tune.svg',
          width: 28,
          height: 28,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        itemBuilder:
            (BuildContext context) => [
              _buildMenuItem('Sugary', isSugary),
              _buildMenuItem('Dairy', isDairy),
              _buildMenuItem('Decaf', isDecaf),
              _buildMenuItem('Contains Nuts', containsNuts),
              _buildMenuItem('Contains Caffeine', containsCaffeine),
            ],
        onSelected: (String key) {
          onChanged(key, !_getValue(key));
        },
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(String label, bool value) {
    return PopupMenuItem(
      value: label,
      child: SwitchListTile(
        title: Text(label),
        value: value,
        onChanged: (newValue) {
          setState(() => onChanged(label, newValue));
          setState(() {}); // Rebuild the whole widget to reflect changes
        },
      ),
    );
  }

  bool _getValue(String key) {
    switch (key) {
      case 'Sugary':
        return isSugary;
      case 'Dairy':
        return isDairy;
      case 'Decaf':
        return isDecaf;
      case 'Contains Nuts':
        return containsNuts;
      case 'Contains Caffeine':
        return containsCaffeine;
      default:
        return false;
    }
  }
}
