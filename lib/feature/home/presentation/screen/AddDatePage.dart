import 'package:date_deck/feature/home/domain/AddViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/category.dart' show Category;
import '../../data/model/date.dart';
import '../../data/model/suit.dart';
import 'SavePage.dart';

class AddDatePage extends StatefulWidget {
  const AddDatePage({super.key});

  @override
  State<StatefulWidget> createState() => _AddDatePage();
}

class _AddDatePage extends State<AddDatePage> {
  //Default State
  Suit? selectedSuit = Suit.Club;
  Category? selectedCategory = Category.Active;
  int? selectedEffortValue = 1;
  var selectedDate = '';
  final controller = TextEditingController();
  final List<int> numbers = List<int>.generate(13, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AddViewModel>();
    return BlocBuilder<AddViewModel, AddState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Contribute to the deck!", style: TextStyle(fontSize: 15, color: Color(0xFF949AA6))),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(fontSize: 15, color: Color(0xFF949AA6), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    key: ValueKey(selectedCategory),
                    initialValue: selectedCategory,
                    items: Category.values.map((p) => DropdownMenuItem(value: p, child: Text(p.displayName))).toList(),
                    icon: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.arrow_drop_down, color: Color(0xFF70A3F3)),
                    ),
                    iconSize: 30,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF70A3F3), width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF70A3F3), width: 0.5),
                      ),
                    ),
                    // 1. Customize the background color of the pop-up list
                    dropdownColor: Colors.grey[900]!.withValues(alpha: 0.90),
                    borderRadius: BorderRadius.circular(8),
                    menuMaxHeight: 200,
                    alignment: AlignmentDirectional.centerStart,
                    onChanged: (p) {
                      setState(() {
                        selectedCategory = p;
                      });
                    },
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Effort Level",
                    style: TextStyle(fontSize: 15, color: Color(0xFF949AA6), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  DropdownButtonFormField(
                    key: ValueKey(selectedEffortValue),
                    initialValue: selectedEffortValue,
                    items: numbers.map((p) => DropdownMenuItem(value: p, child: Text(p.toString()))).toList(),
                    icon: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.arrow_drop_down, color: Color(0xFF70A3F3)),
                    ),
                    iconSize: 30,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF70A3F3), width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF70A3F3), width: 0.5),
                      ),
                    ),
                    // 1. Customize the background color of the pop-up list
                    dropdownColor: Colors.grey[900]!.withValues(alpha: 0.90),
                    borderRadius: BorderRadius.circular(8),
                    menuMaxHeight: 200,
                    alignment: AlignmentDirectional.centerStart,
                    onChanged: (p) {
                      setState(() {
                        selectedEffortValue = p;
                      });
                    },
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Suit",
                    style: TextStyle(fontSize: 15, color: Color(0xFF949AA6), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    key: ValueKey(selectedSuit),
                    initialValue: selectedSuit,
                    items: Suit.values.map((p) => DropdownMenuItem(value: p, child: Text(p.name))).toList(),
                    icon: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.arrow_drop_down, color: Color(0xFF70A3F3)),
                    ),
                    iconSize: 30,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF70A3F3), width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF70A3F3), width: 0.5),
                      ),
                    ),
                    // 1. Customize the background color of the pop-up list
                    dropdownColor: Colors.grey[900]!.withValues(alpha: 0.90),
                    borderRadius: BorderRadius.circular(8),
                    menuMaxHeight: 200,
                    alignment: AlignmentDirectional.centerStart,
                    onChanged: (p) {
                      setState(() {
                        selectedSuit = p;
                      });
                    },
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Your Date Idea",
                    style: TextStyle(fontSize: 15, color: Color(0xFF949AA6), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    minLines: 3,
                    maxLines: 10,
                    controller: controller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF70A3F3), width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Color(0xFF70A3F3), width: 0.5),
                      ),
                    ),
                    cursorColor: Colors.white,
                    onChanged: (value) {
                      setState(() {}); // Trigger rebuild to update button state
                    },
                  ),
                ],
              ),
            ),

            Center(
              child: SizedBox(
                width: 228,
                height: 55,
                child: ElevatedButton(
                  onPressed: (controller.text.isEmpty || selectedCategory == null || selectedEffortValue == null || selectedSuit == null)
                      ? null // Disable button when fields are empty
                      : () {
                          vm.updateDate(Date(id: 0, name: controller.text, category: selectedCategory!, suit: selectedSuit!, effortValue: selectedEffortValue!, favorite: 0));

                          // Reset all form fields
                          setState(() {
                            controller.clear();
                            selectedCategory = null;
                            selectedEffortValue = null;
                            selectedSuit = null;
                          });

                          Navigator.push(context, MaterialPageRoute(builder: (context) => SavePage()));
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE06F7C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text("Submit Date Idea", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
