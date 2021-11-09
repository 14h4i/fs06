import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T? model;
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final Widget? child;

  const BaseProvider({Key? key, required this.builder, this.model, this.child})
      : super(key: key);

  @override
  _BaseProviderState<T> createState() => _BaseProviderState<T>();
}

class _BaseProviderState<T extends ChangeNotifier>
    extends State<BaseProvider<T>> {
  late T? _model;

  @override
  void initState() {
    _model = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => _model!,
      builder: (context, child) => Consumer(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
