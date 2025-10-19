// Copyright (c) 2025. Alexandr Moroz

import 'package:flutter/material.dart';
import 'package:morozteam_ui/morozteam_ui.dart';

class DialogsDemo extends StatefulWidget {
  const DialogsDemo({super.key});

  @override
  State<DialogsDemo> createState() => _DialogsDemoState();
}

class _DialogsDemoState extends State<DialogsDemo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // MTDialog
        MTListText.h3('MTDialog'),
        MTButton.secondary(
          titleText: 'Show MTDialog',
          onTap: () => _showCustomDialog(context),
          margin: context.sizing.defMargin,
        ),
        SizedBox(height: context.sizing.hPadding),

        // MTAlertDialog
        MTListText.h3('MTAlertDialog'),
        MTButton.secondary(
          titleText: 'Show MTAlertDialog',
          onTap: () => _showAlertDialog(context),
          margin: context.sizing.defMargin,
        ),
        SizedBox(height: context.sizing.hPadding),

        // MTSnackbar
        MTListText.h3('MTSnackbar'),
        MTButton.secondary(
          titleText: 'Show MTSnackbar',
          onTap: () => _showSnackbar(context),
          margin: context.sizing.defMargin,
        ),
        SizedBox(height: context.sizing.hPadding),

        // MTLoader
        MTListText.h3('MTLoader'),
        MTButton.secondary(
          titleText: 'Show Loader',
          margin: context.sizing.defMargin,
          onTap: () {
            final navigator = Navigator.of(context);
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const MTLoader(),
            );
            // Auto hide after 2 seconds
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) {
                navigator.pop();
              }
            });
          },
        ),
        SizedBox(height: context.sizing.hPadding),

        // MTRefresh
        MTListText.h3('MTRefresh'),
        MTCard(
          margin: context.sizing.defMargin,
          child: Column(
            children: [
              const MTListText('Pull to refresh example'),
              SizedBox(height: context.sizing.vPadding),
              SizedBox(
                height: 200,
                child: MTRefresh(
                  onRefresh: () async {
                    // Simulate network delay
                    await Future.delayed(const Duration(seconds: 2));
                  },
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return MTListTile(
                        titleText: 'Refresh Item ${index + 1}',
                        middle: const SmallText('Pull down to refresh this list'),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showAlertDialog(BuildContext context) async {
    final result = await showMTAlertDialog<String>(
      context: context,
      title: 'Alert Dialog',
      description: 'This is an alert dialog example with three button types',
      actions: [
        const MTDialogAction(title: 'OK', result: 'ok', type: MTButtonType.main),
        const MTDialogAction(title: 'Secondary', result: 'secondary', type: MTButtonType.secondary),
        const MTDialogAction(title: 'Cancel', result: 'cancel', type: MTButtonType.text),
      ],
    );
    if (context.mounted) {
      showMTSnackbar('Result: $result', context: context);
    }
  }

  void _showSnackbar(BuildContext context) async {
    await showMTSnackbar(
      'This is a snackbar dialog example',
      context: context,
      onTap: () {
        showMTSnackbar('Snackbar tapped!', context: context);
      },
    );
  }

  void _showCustomDialog(BuildContext context) async {
    await showMTDialog(
      MTDialog(
        body: ListView(
          shrinkWrap: true,
          children: [
            MTListText.h3('Custom Dialog'),
            SizedBox(height: context.sizing.vPadding),
            const MTListText('This is a custom dialog using MTDialog component.'),
            SizedBox(height: context.sizing.vPadding),
            const MTListText('Features:'),
            const MTListText('• Responsive design'),
            const MTListText('• Safe area handling'),
            const MTListText('• Custom content'),
            const MTListText('• Bottom sheet on mobile'),
            const MTListText('• Dialog on desktop'),
            SizedBox(height: context.sizing.hPadding),
            MTButton.main(
              titleText: 'Close',
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      context: context,
    );
  }
}
