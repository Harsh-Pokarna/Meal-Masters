import 'package:flutter/material.dart';
import 'package:menu_masters/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegeterian = widget.currentFilters['vegeterian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(description),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian,
                };
                widget.saveFilters(selectedFilters);
              }),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Text(
              'Adjust your meal selection',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('Gluten-Free',
                    'Only meals that are gluten free', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-Free',
                    'Only meals that are lactose free',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile('Vegeterian food',
                    'Only meals that are vegeterian', _vegeterian, (newValue) {
                  setState(() {
                    _vegeterian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only meals that are Vegan', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
