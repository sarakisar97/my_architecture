import 'package:flutter/material.dart';

class ErrorViewer extends StatelessWidget {
  const ErrorViewer({Key? key, required this.errorText, required this.onRetryClicked}) : super(key: key);
  final String errorText;
  final VoidCallback onRetryClicked;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorText, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 20.0),
          IconButton(onPressed: onRetryClicked, icon: const Icon(Icons.refresh))
        ],
      ),
    );
  }
}
