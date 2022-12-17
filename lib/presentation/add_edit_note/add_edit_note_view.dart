import 'package:flutter/material.dart';
import 'package:flutter_noteapp/ui/colors.dart';

class AddEditNoteView extends StatefulWidget {
  const AddEditNoteView({super.key});

  @override
  State<AddEditNoteView> createState() => _AddEditNoteViewState();
}

class _AddEditNoteViewState extends State<AddEditNoteView> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final List<Color> noteColors = [
    roseBud,
    primRose,
    wisteria,
    skyBlue,
    illusion
  ];

  Color _color = roseBud;
  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 48),
        color: _color,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: noteColors
                  .map((color) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _color = color;
                          });
                        },
                        child: BuildBackgroundColor(
                          color: color,
                          isSelected: _color == color,
                        ),
                      ))
                  .toList(),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
            TextField(
              controller: _titleController,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: darkGray),
              decoration: const InputDecoration(
                  hintText: "제목을 입력하세요", border: InputBorder.none),
            ),
            TextField(
              controller: _contentController,
              maxLines: null,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: darkGray),
              decoration: const InputDecoration(
                  hintText: "내용을 입력하세요", border: InputBorder.none),
            )
          ],
        ),
      ),
    );
  }
}

class BuildBackgroundColor extends StatelessWidget {
  Color color;
  bool isSelected;
  BuildBackgroundColor(
      {super.key, required this.color, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 15.0,
              spreadRadius: 1.0,
            )
          ],
          border:
              isSelected ? Border.all(color: Colors.black, width: 2.0) : null),
    );
  }
}
