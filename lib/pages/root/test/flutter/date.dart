import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class FlutterDatePage extends StatefulWidget {
  const FlutterDatePage({super.key});

  @override
  State<FlutterDatePage> createState() => _FlutterDatePageState();
}

class _FlutterDatePageState extends State<FlutterDatePage> {
  // 初始化当前日期
  DateTime _nowDate = DateTime.now();
  // 初始化当前时间
  TimeOfDay _nowTime = TimeOfDay(hour: 12, minute: 30);

  @override
  void initState() {
    super.initState();
  }

  void _showDatePicker() async {
    var result = await showDatePicker(
      // 上下文环境
      context: context,
      // 初始化时间
      initialDate: _nowDate,
      // 最早时间
      firstDate: DateTime(1980),
      // 最晚时间
      lastDate: DateTime(2100),
    );
    // 异步回调的结果
    print(result);
    // 将选择的时间进行赋值
    setState(() {
      _nowDate = result!;
    });
  }

  // 时间选择器，异步调用
  void _showTimePicker() async {
    var result = await showTimePicker(context: context, initialTime: _nowTime);
    setState(() {
      _nowTime = result!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter日期'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 日期选择器
              InkWell(
                  // 点击有水波纹效果
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // 用第三方插件将选择的日期进行格式化
                      Text("${formatDate(_nowDate, [yyyy, '年', mm, '月', dd])}"),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: this._showDatePicker),

              // 时间选择器
              InkWell(
                  // 点击有水波纹效果
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // 将选择的时间进行格式化
                      Text("${_nowTime.format(context)}"),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  onTap: this._showTimePicker)
            ],
          )
        ],
      ),
    );
  }
}
