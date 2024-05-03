import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/qibla_provider.dart';

class QiblaTab extends StatefulWidget {
  const QiblaTab({super.key});

  @override
  State<QiblaTab> createState() => _QiblaTabState();
}

class _QiblaTabState extends State<QiblaTab> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QiblaProvider>(
      create: (_) => QiblaProvider(),
      child: Consumer<QiblaProvider>(
        builder: (context, provider, child) {
          if (provider.shouldShowLocationDialog) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showLocationServiceDialog(context);
              provider.shouldShowLocationDialog = false; // Reset the flag
            }
            );
          }
          return Center(
            child: provider.isLoading
                ? const CircularProgressIndicator()
                : provider.error.isNotEmpty
                    ? Text('Error: ${provider.error}')
                    : provider.locationData == null ||
                            provider.direction == null
                        ? const Text('No data available')
                        : Transform.rotate(
                            angle: ((provider.direction! -
                                    provider.calculateQiblaDirection()) *
                                (pi / 180) *
                                -1),
                            child: Icon(Icons.arrow_upward,
                                size: 100,
                                color: Theme.of(context).dividerColor),
                          ),
          );
        },
      ),
    );
  }

  void _showLocationServiceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Location Services Disabled"),
          content: const Text(
              "Please enable location services in settings to use this feature."),
          actions: <Widget>[
            TextButton(
              child: const Text("Open Settings"),
              onPressed: () {
                AppSettings.openLocationSettings();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
