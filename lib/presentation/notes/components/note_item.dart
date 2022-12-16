import 'package:flutter/material.dart';
import 'package:flutter_noteapp/domain/model/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.lightBlue,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              "title",
              style: Theme.of(context).textTheme.headline6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "test",
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.recycling))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
