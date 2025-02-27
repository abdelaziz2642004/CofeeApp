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

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Filter Options'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSwitchTile('Sugary', isSugary, setState),
                  _buildSwitchTile('Dairy', isDairy, setState),
                  _buildSwitchTile('Decaf', isDecaf, setState),
                  _buildSwitchTile('Contains Nuts', containsNuts, setState),
                  _buildSwitchTile(
                    'Contains Caffeine',
                    containsCaffeine,
                    setState,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildSwitchTile(
    String label,
    bool value,
    void Function(void Function()) setState,
  ) {
    return SwitchListTile(
      title: Text(label),
      value: value,
      onChanged: (newValue) {
        setState(() {
          onChanged(label, newValue);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 196, 124, 72),
        borderRadius: BorderRadius.circular(14),
      ),
      child: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/tune.svg',
          width: 28,
          height: 28,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        onPressed: () => _showFilterDialog(context),
      ),
    );
  }
}
