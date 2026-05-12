
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
  var selectedSuit = Suit.Club;
  var selectedCategory = Category.Active;
  var selectedEffortValue = 8;
  var selectedDate = '';
  final controller = TextEditingController();
  final List<int> numbers = List<int>.generate(13, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AddViewModel>();
    return BlocBuilder<AddViewModel, AddState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                children: [
                  DropdownButtonFormField(
                    items: Category.values
                        .map((p) => DropdownMenuItem(value: p, child: Text(p.displayName)))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Select a Category',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (p) {
                      setState(() {
                        selectedCategory = p!;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    items: numbers
                        .map((p) => DropdownMenuItem(value: p, child: Text(p.toString())))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Select a Effort Value',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (p) {
                      setState(() {
                        selectedEffortValue = p!;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    items: Suit.values
                        .map((p) => DropdownMenuItem(value: p, child: Text(p.name)))
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Select a Suit',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (p) {
                      setState(() {
                        selectedSuit = p!;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextField(
                    minLines: 3,
                    maxLines: 10,
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'Enter your Date Idea',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 228,
                height: 55,
                child: ElevatedButton(
                  onPressed: () => {
                    vm.updateDate(
                      Date(
                        id: 0,
                        name: controller.text,
                        category: selectedCategory,
                        suit: selectedSuit,
                        effortValue: selectedEffortValue,
                      ),
                    ),
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SavePage())),
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE06F7C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    "Submit Date Idea",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
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
