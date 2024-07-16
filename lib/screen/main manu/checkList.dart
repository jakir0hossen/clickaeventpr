import 'package:clickaeventpr/screen/main%20manu/home.dart';
import 'package:clickaeventpr/screen/widgets/bodyBackground.dart';
import 'package:flutter/material.dart';

class CheckList  extends StatelessWidget {
  const CheckList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // enable Material 3
        useMaterial3: true,

      ),
      home: const HomePage(),
    );
  }
}

// Multi Select widget
// This widget is reusable
class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
            value: _selectedItems.contains(item),
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (isChecked) => _itemChange(item, isChecked!),
          ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

// Implement a multi select on the Home screen
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      'Food & Drink',
      'Floral Design',
      'Place Cards',
      'Dancer Floors',
      'Bouquets',
      'Lighting',
      'Wedding Planners',
      'Decor Companies',
      'Wedding Florists',
      'DJs & Bands',
      'Photographers',
      'Tent Companies',
      'Rental Companies',
      'Bakeries',
      'Videographers'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClickAEvent'),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder:
                (BuildContext context)=>Home()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BodyBackground(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // use this button to open the multi-select dialog
              ElevatedButton(
                onPressed: _showMultiSelect,
                child: const Text('CheckList Wedding Party , Birthday Party , Anniversary Party',
                  style:TextStyle(fontSize:20,color: Colors.black,backgroundColor: Colors.white),
                  textAlign: TextAlign.center,),

              ),
              const Divider(
                height: 35,
              ),
              // display selected items
              Wrap(
                children: _selectedItems
                    .map((e) => Chip(
                  label: Text(e),
                ))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}