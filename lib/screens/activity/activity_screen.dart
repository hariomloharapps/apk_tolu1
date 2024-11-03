import 'package:flutter/material.dart';
// import 'package:app_usage/app_usage.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  // List<AppUsageInfo> _usageInfo = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchAppUsageData();
  // }

  // Future<void> _fetchAppUsageData() async {
  //   try {
  //     DateTime now = DateTime.now();
  //     DateTime startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);

      // Ensure the AppUsage instance is created properly
      // AppUsage appUsage = AppUsage();
      // List<AppUsageInfo> infoList = await appUsage.getAppUsage(startOfDay, now);
  //
  //     setState(() {
  //       _usageInfo = infoList;
  //     });
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Screen"),
      ),
      body: Text('data'),
    );
  }
}
