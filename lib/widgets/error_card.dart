import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  final dynamic error;

  const ErrorCard({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.warning),
        title: Text(error.toString()), // TODO: Make this more meaningful
      ),
    );
  }
}
