import 'package:flutter/material.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';

class BoardItemCard extends StatelessWidget {
  const BoardItemCard({super.key, required this.itemObject});

  final BoardTaskEntity itemObject;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Card(
        elevation: 0,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: width * 0.75,
                    minWidth: width * 0.60,
                  ),

                  child: Text(
                    itemObject.from,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        height: 1.5,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  itemObject.title,
                  maxLines: 3,
                  style: const TextStyle(
                      height: 1.5, fontSize: 16),
                ),
              ],
            )),
      ),
    );
  }
}
