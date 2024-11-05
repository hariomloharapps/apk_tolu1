import 'package:flutter/material.dart';

class WeeklyAverageData {
  final String duration;
  final double percentageChange;
  final bool isIncrease;

  WeeklyAverageData({
    required this.duration,
    required this.percentageChange,
    required this.isIncrease,
  });
}

class TasksData {
  final int completedTasks;
  final int totalTasks;
  final double progress;

  TasksData({
    required this.completedTasks,
    required this.totalTasks,
  }) : progress = completedTasks / totalTasks;

  String get taskRatio => '$completedTasks/$totalTasks';
}

// Sample data
final weeklyAverageData = WeeklyAverageData(
  duration: '6h 23m',
  percentageChange: 15,
  isIncrease: true,
);

final tasksData = TasksData(
  completedTasks: 8,
  totalTasks: 12,
);