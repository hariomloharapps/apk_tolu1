
// lib/widgets/body_widgets.dart
import 'package:flutter/material.dart';
import 'package:tolu_7/screens/home/widgets/shared_widgets.dart';
import '../data/app_data.dart';

class HomeBody extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  const HomeBody({
    super.key,
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatsRow(),
                SizedBox(height: 16),
                AppUsageCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOutCubic,
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Row(
        children: const [
          Expanded(child: WeeklyAverageCard()),
          SizedBox(width: 12),
          Expanded(child: TasksProgressCard()),
        ],
      ),
    );
  }
}

class WeeklyAverageCard extends StatelessWidget {
  const WeeklyAverageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomCard(
      color: theme.colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Average',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.access_time_rounded,
                color: theme.colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                '4h 23m',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          AnimatedPercentage(text: '+15% vs last week', color: Colors.green),
        ],
      ),
    );
  }
}

class TasksProgressCard extends StatelessWidget {
  const TasksProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomCard(
      color: theme.colorScheme.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Tasks',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.secondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                color: theme.colorScheme.secondary,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                '8/12',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicatorAnimated(
            progress: 8 / 12,
            color: theme.colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}









// ... (previous code remains the same until AppUsageCard) ...

class AppUsageCard extends StatelessWidget {
  const AppUsageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOutCubic,
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: CustomCard(
        color: theme.colorScheme.tertiary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most Used Apps',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.tertiary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Last 7 days',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...mockAppUsageData.asMap().entries.map((entry) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: entry.key != mockAppUsageData.length - 1 ? 12 : 0,
                ),
                child: AppUsageItem(
                  data: entry.value,
                  delay: entry.key * 200,
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class AppUsageItem extends StatelessWidget {
  final AppUsageData data;
  final int delay;

  const AppUsageItem({
    super.key,
    required this.data,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOutCubic,
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(20 * (1 - value), 0),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: data.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(data.icon, size: 20, color: data.color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.appName,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      data.duration,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: data.color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                LinearProgressIndicatorAnimated(
                  progress: data.progress,
                  color: data.color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
