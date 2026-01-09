import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AutoTopHomePageHeader extends StatefulWidget {
  const AutoTopHomePageHeader({super.key});

  @override
  State<StatefulWidget> createState() => _AutoTopHomePageHeaderState();
}

class _AutoTopHomePageHeaderState extends State<AutoTopHomePageHeader> {
  late String _currentTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentTitle = "布局+UI控件示例";
  }

  @override
  build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFFFFFFF),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _currentTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "---",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // _buildRowLayout(),
            // const SizedBox(height: 8),
            // _build1ColumLayout(),
            // const SizedBox(height: 8),
            // _buildStackLayout(),
            // const SizedBox(heighjit: 20),
            // _buildExpandedLayout(),
            // const SizedBox(height: 20),
            // _buildFlexLayout(),
            // const SizedBox(height: 20),
            // _buildGridViewLayout(),
            // _buildAlignLayout(),
            // _buildSizedBoxLayout(),
            // _buildConstrainedBoxLayout(),
            // _buildTextWidget(),
            // _buildButtonWidgets(),
            // _buildIconWidget(),
            // _buildImageWidget(),
            // _buildTextFieldWidget(),
            // _buildCheckBoxWidget(),
            // _buildRadioWidget(),
            // _buildSwitchWidget(),
            // _buildSliderWidget(),
            // _buildCardWidget(),
            // _buildProgressWidget(),
            // _buildChipWidget(),
            // _buildDividerWidget(),
            _buildListTitleWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildRowLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "一、Row横向布局",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: 80, height: 80, color: Colors.red[300]),
            Container(width: 80, height: 60, color: Colors.green[300]),
            Container(width: 80, height: 100, color: Colors.blue[300]),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _build1ColumLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "22. colum 纵向布局",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 150, height: 50, color: Colors.orange[300]),
            Container(width: 150, height: 50, color: Colors.purple[300]),
            Container(width: 150, height: 50, color: Colors.yellow[300]),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildStackLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "3. stack 堆叠布局",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 200, height: 200, color: Colors.grey[300]),
            const Text(
              "堆叠效果",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const Positioned(
              child: Icon(Icons.star, color: Colors.yellow, size: 30),
              top: 10,
              right: 10,
            ),
            const Positioned(
              bottom: 10,
              left: 10,
              child: Icon(Icons.favorite, color: Colors.red, size: 30),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // 弹性布局示例（修复核心问题：现在能获取到水平宽度约束）
  Widget _buildExpandedLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "四、Expanded 弹性布局",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        // 外层增加宽度约束（可选：确保Row占满父容器宽度）
        SizedBox(
          width: MediaQuery.of(context).size.width - 32, // 减去左右padding各16
          child: Row(
            children: [
              Container(width: 80, height: 80, color: Colors.red[300]),
              Expanded(
                flex: 1,
                child: Container(height: 80, color: Colors.green[300]),
              ),
              Expanded(
                flex: 2,
                child: Container(height: 80, color: Colors.blue[300]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildFlexLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "5. flex 弹性布局",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width - 32, // 减去左右padding各16
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Flexible(
                flex: 1,
                child: Container(height: 60, color: Colors.cyan[300]),
              ),
              Flexible(
                flex: 3,
                child: Container(height: 60, color: Colors.pink[300]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildWrapLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "6. wrap 自动换行布局",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        SizedBox(
          width: MediaQuery.of(context).size.width - 32, // 减去左右paddi
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Container(width: 100, height: 60, color: Colors.red[300]),
              Container(width: 100, height: 60, color: Colors.green[300]),
              Container(width: 100, height: 60, color: Colors.blue[300]),
              Container(width: 100, height: 60, color: Colors.yellow[300]),
              Container(width: 100, height: 60, color: Colors.purple[300]),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildGridViewLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "7. GridView 网格布局",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(height: 8),
        SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          height: 200,
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: [
              Container(color: Colors.red[300]),
              Container(color: Colors.green[300]),
              Container(color: Colors.blue[300]),
              Container(color: Colors.yellow[300]),
              Container(color: Colors.purple[300]),
              Container(color: Colors.orange[300]),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPaddingLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          "9. padding 内边距布局",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(width: 100, height: 100, color: Colors.red[300]),
          ),
        ),
        const SizedBox(height: 200),
      ],
    );
  }

  Widget _buildAlignLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "11. align 对齐方式",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: 200,
          height: 200,
          color: Colors.grey[200],
          child: const Align(
            alignment: Alignment.bottomRight,
            child: Icon(Icons.home, size: 40, color: Colors.blue),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSizedBoxLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "12. sizebox 固定尺寸",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const SizedBox(
          width: 150,
          height: 80,
          child: Center(child: Text("固定宽高的SizedBox")),
        ),
        const SizedBox(height: 16),
        const Text("sizebox 也可以作为纯文本间距使用"),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildConstrainedBoxLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "13. constrainedBox 的约束布局",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 100,
            minHeight: 40,
            maxWidth: 200,
            maxHeight: 200,
          ),
          child: Container(
            width: 50,
            height: 30,
            color: Colors.orange[300],
            child: const Center(child: Text("约束布局")),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTextWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "1. text 文本控制",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text("普通文本"),
        const Text("加粗文本", style: TextStyle(fontWeight: FontWeight.bold)),
        const Text("红色字体", style: TextStyle(color: Colors.red, fontSize: 16)),
        const Text(
          "多行文本： flutter是谷歌开发的跨平台UI框架，支持iOS 安卓 web等多个平台，语法简洁，性能优异",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildButtonWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "2.按钮控件",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => debugPrint("ElevatedButton 点击"),
          child: const Text("凸起按钮"),
        ),
        TextButton(
          onPressed: () => debugPrint("TextButton 点击"),
          child: const Text("文本按钮"),
        ),
        const SizedBox(height: 8),
        OutlinedButton(
          onPressed: () => debugPrint("OutlinedButton 点击"),
          child: const Text("边框按钮"),
        ),
        const SizedBox(height: 8),
        IconButton(
          onPressed: () => debugPrint("iconbutton点击"),
          icon: const Icon(Icons.settings),
          color: Colors.blue,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildIconWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "3. icon 图标控件",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(Icons.car_rental, color: Colors.blue, size: 30),
            SizedBox(width: 16),
            Icon(Icons.battery_full, color: Colors.green, size: 30),
            SizedBox(width: 16),
            Icon(Icons.lock, color: Colors.grey, size: 30),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildImageWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "4 image图片控件",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Image.network(
          "https://picsum.photos/200/100",
          width: 200,
          height: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        const Text("本地图片示例（请确保已添加到pubspec.yaml）"),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTextFieldWidget() {
    final screenWidth = MediaQuery.of(context).size.width - 32;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "5. textfield 输入控件",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: screenWidth,
          child: TextField(
            decoration: const InputDecoration(
              hintText: "请输入用户名",
              labelText: "用户名",
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) => debugPrint("输入内容： $value"),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: screenWidth,
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "请输入密码",
              labelText: "密码",
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  bool isChecked = false;
  Widget _buildCheckBoxWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "6. checkbox 复选框控件",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          child: CheckboxListTile(
            value: isChecked,
            onChanged: (value) => setState(() => isChecked = value!),
            title: const Text("自动落锁"),
            secondary: const Icon(Icons.lock),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  // 1. 把单选框状态变量移到类顶部（方法外）
  String selectedValue = "option1";

  // 2. 修复后的单选框方法
  Widget _buildRadioWidget() {
    final screenWidth = MediaQuery.of(context).size.width - 32;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "7. Radio 单选框组件",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white, // 适配深色背景
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: screenWidth,
          child: RadioListTile(
            value: "option1",
            groupValue: selectedValue, // 引用类级别变量
            onChanged: (value) {
              // 3. 修改类级别变量，触发重建
              setState(() {
                selectedValue = value!;
                debugPrint("选中：$selectedValue"); // 打印日志验证
              });
            },
            title: const Text("节能模式", style: TextStyle(color: Colors.white)),
            activeColor: Colors.cyan, // 选中时的颜色（适配深色背景）
          ),
        ),
        SizedBox(
          width: screenWidth,
          child: RadioListTile(
            value: "option2",
            groupValue: selectedValue, // 引用类级别变量
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
                debugPrint("选中：$selectedValue");
              });
            },
            title: const Text("运动模式", style: TextStyle(color: Colors.white)),
            activeColor: Colors.cyan,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  bool isSwitched = false;
  Widget _buildSwitchWidget() {
    final screenWidth = MediaQuery.of(context).size.width - 32;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "8. switch 开关控件",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        SizedBox(
          width: screenWidth,
          child: SwitchListTile(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            title: const Text("远程定位"),
            activeColor: Colors.blue,
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  double sliderValue = 0.0;

  Widget _buildSliderWidget() {
    final screenWidth = MediaQuery.of(context).size.width - 32;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "9. Slider控件",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: screenWidth,
          child: Slider(
            value: sliderValue,
            min: 0,
            max: 100,
            divisions: 10,
            label: "${sliderValue.toInt()}%",
            onChanged: (value) {
              setState(() {
                sliderValue = value;
              });
            },
            activeColor: Colors.cyan,
            inactiveColor: Colors.grey[600],
          ),
        ),
        const Text("空调温度/风量调节示例", style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildCardWidget() {
    final screenWidth = MediaQuery.of(context).size.width - 32;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "10. Card 卡片控件",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: screenWidth,
          child: Card(
            elevation: 4,
            color: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Padding(
              padding: EdgeInsetsGeometry.all(16),

              child: Column(
                children: [
                  Text(
                    "今日里程",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "45.8km",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProgressWidget() {
    final screenWidth = MediaQuery.of(context).size.width - 32;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "11. progressindicator 进度条控件",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        const Center(
          child: CircularProgressIndicator(
            value: 0.75,
            color: Colors.cyan,
            // backgroundColor: Colors.grey[700],
            strokeWidth: 4,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: screenWidth,
          child: LinearProgressIndicator(
            value: 0.6,
            backgroundColor: Colors.grey[700],
            color: Colors.greenAccent,
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildChipWidget() {
    final screenWidth = MediaQuery.of(context).size.width - 32;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "12, chip 标签控件",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        SizedBox(height: 8),
        SizedBox(
          width: screenWidth,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                label: Text("节能模式", style: TextStyle(color: Colors.black87)),
                backgroundColor: Colors.green[200],
              ),
              Chip(
                label: Text(
                  "运动模式",
                  style: TextStyle(
                    color: Colors.black87,
                    backgroundColor: Colors.red[200],
                  ),
                ),
              ),
              Chip(
                label: Text("已充电85%", style: TextStyle(color: Colors.black87)),
                avatar: Icon(
                  Icons.battery_charging_full,
                  color: Colors.black87,
                ),
                backgroundColor: Colors.blue[200],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildDividerWidget() {
    final screenWidth = MediaQuery.of(context).size.width - 32;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "13. divider分割线控件",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "分割线上内容",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: screenWidth,
          child: const Divider(height: 20, thickness: 1, color: Colors.grey),
        ),
        const Text(
          "分割线下方内容",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  final MethodChannel_channel = MethodChannel('com.changan.carcontrol/channel');

  Widget _buildListTitleWidget() {
    final screenWidth = MediaQuery.of(context).size.width - 32;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "14. ListTile 列表项控件",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: screenWidth,
          child: Column(
            children: [
              ListTile(
                tileColor: Colors.grey[800],
                leading: const Icon(Icons.settings, color: Colors.cyan),
                title: const Text(
                  "通用设置",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: const Text(
                  "修改基础配置",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.white70,
                ),
                onTap: () async {
                  try {
                    final String result =
                        await MethodChannel_channel.invokeMethod(
                          'playFindCarSound',
                          {"volume": 0.8},
                        );

                    debugPrint("点击了通用设置 ${result}");
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("原生返回: $result")));


                  } on PlatformException catch (e) {
                    debugPrint("点击了通用设置，调用原生失败：${e.message}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("调用失败：${e.message}")),
                    );
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


  
}
  ////

