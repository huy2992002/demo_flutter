import 'package:demo_flutter/components/hi_boss_app_bar.dart';
import 'package:demo_flutter/models/event_model.dart';
import 'package:demo_flutter/pages/remote_sales/home/widgets/rs_event_item.dart';
import 'package:flutter/material.dart';

class RsAllEvents extends StatefulWidget {
  const RsAllEvents({super.key});

  @override
  State<RsAllEvents> createState() => _RsAllEventsState();
}

class _RsAllEventsState extends State<RsAllEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HiBossAppBar(
        leftIcon: 'assets/icons/ic_back.svg',
        leftPressed: () => Navigator.pop(context),
        title: 'Sự Kiện',
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return RsEventItem(event: event);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12.0),
      ),
    );
  }
}
