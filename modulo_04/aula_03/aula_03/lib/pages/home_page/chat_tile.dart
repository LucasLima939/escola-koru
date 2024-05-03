import 'package:flutter/material.dart';

class ChatTile extends StatefulWidget {
  final String title;
  final String date;
  final int? notifications;
  final ImageProvider<Object>? image;
  const ChatTile({
    super.key,
    required this.title,
    required this.date,
    this.notifications,
    this.image,
  });

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  int? notifications;

  @override
  void initState() {
    notifications = widget.notifications;
    super.initState();
  }

  void cleanNotification() {
    setState(() {
      notifications = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        cleanNotification();
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(  
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(30),
                image: widget.image != null ? DecorationImage(image: widget.image!) : null,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const Text('Lorem Ipsum dolor sit amet',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ]),
            ),
            const Spacer(),
            Column(
              children: [
                Text(widget.date, style: const TextStyle(fontSize: 10)),
                const SizedBox(height: 3),
                if (notifications != null) _buildNotification(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotification(BuildContext context) => Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(widget.notifications?.toStringAsFixed(0) ?? '',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.white))),
      );
}
