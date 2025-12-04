import 'package:date_deck/feature/home/domain/HomeViewModel.dart';
import 'package:date_deck/feature/home/presentation/components/EmptyHandler.dart';
import 'package:date_deck/feature/home/presentation/screen/SaveScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/model/category.dart' show Category;
import '../../data/model/date.dart';
import '../../data/model/suit.dart';


//TODO: Add screen for when successfully added a new data idea
class AddDateScreen extends StatefulWidget {
  const AddDateScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddDateScreen();
}

class _AddDateScreen extends State<AddDateScreen> {
  //Default State
  var selectedSuit = Suit.Club;
  var selectedCategory = Category.Active;
  var selectedEffortValue = 8;
  var selectedDate = '';
  final controller = TextEditingController();
  final List<int> numbers = List<int>.generate(13, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    return (Column(
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
                vm.setDate(
                  Date(
                    id: 0,
                    shortName: '',
                    fullDescription: controller.text,
                    category: selectedCategory,
                    suit: selectedSuit,
                    favorite:true,
                    effortValue: selectedEffortValue
                  )
                ),
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SaveScreen())
                )
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
    ));
  }
}
