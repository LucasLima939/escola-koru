import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String title;
  final String date;
  final int? notifications;
  const ChatTile({
    super.key,
    required this.title,
    required this.date,
    this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(30)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const Text('Lorem Ipsum dolor sit amet',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ]),
          ),
          const Spacer(),
          Column(
            children: [
              Text(date, style: const TextStyle(fontSize: 10)),
              const SizedBox(height: 3),
              if (notifications != null)
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(notifications?.toStringAsFixed(0) ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white))),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
