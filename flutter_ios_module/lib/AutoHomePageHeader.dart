import 'package:flutter/material.dart';

class AutoHomePageHeader extends StatefulWidget {
  final String initTitle;

  const AutoHomePageHeader({super.key, required this.initTitle});

  @override
  State<StatefulWidget> createState() => _AutoHomePageHeaderState();
}

class _AutoHomePageHeaderState extends State<AutoHomePageHeader> {
  late String _currentTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentTitle = widget.initTitle;
  }

  void _changeTitle() {
    setState(() {
      _currentTitle = _currentTitle == "长安汽车车控首页"
          ? "当前车辆： 长安CS75 PLUS"
          : "长安汽车车控首页";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.blue[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _currentTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(onPressed: _changeTitle, child: const Text("切换标题")),
        ],
      ),
    );
  }
}


