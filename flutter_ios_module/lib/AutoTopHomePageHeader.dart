import 'package:flutter/material.dart';

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
      color: const Color(0xFF555555),
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
            _buildRowLayout(),
            const SizedBox(height: 8),
            _build1ColumLayout(),
            const SizedBox(height: 8),
            _buildStackLayout(),
            const SizedBox(height: 20),
            _buildExpandedLayout(),
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

  // // ====================== 第一部分：布局方式示例 ======================
  //   // 1. Row - 横向线性布局
  //   Widget _buildRowLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("1. Row 横向布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Row(
  //           // 对齐方式：spaceBetween 两端对齐
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           // 垂直方向居中
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Container(width: 80, height: 80, color: Colors.red[300]),
  //             Container(width: 80, height: 60, color: Colors.green[300]),
  //             Container(width: 80, height: 100, color: Colors.blue[300]),
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

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

  //   // 2. Column - 纵向线性布局
  //   Widget _buildColumnLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("2. Column 纵向布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Column(
  //           // 垂直方向均匀分布
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           // 水平方向靠左
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Container(width: 150, height: 50, color: Colors.orange[300]),
  //             Container(width: 150, height: 50, color: Colors.purple[300]),
  //             Container(width: 150, height: 50, color: Colors.yellow[300]),
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

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

  //   // 3. Stack - 堆叠布局（层叠）
  // Widget _buildStackLayout() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text("3. Stack 堆叠布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //       const SizedBox(height: 8),
  //       Stack(
  //         alignment: Alignment.center, // 子组件整体居中
  //         children: [
  //           // 底层容器
  //           Container(width: 200, height: 200, color: Colors.grey[300]),
  //           // 中层文本
  //           const Text("堆叠布局", style: TextStyle(fontSize: 20, color: Colors.black)),
  //           // 右上角图标（Positioned 定位）
  //           const Positioned(
  //             top: 10,
  //             right: 10,
  //             child: Icon(Icons.star, color: Colors.yellow, size: 30),
  //           ),
  //           // 左下角容器（Positioned 定位）
  //           const Positioned(
  //             bottom: 10,
  //             left: 10,
  //             child: Icon(Icons.favorite, color: Colors.red, size: 30),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 20),
  //     ],
  //   );
  // }



// 弹性布局示例（修复核心问题：现在能获取到水平宽度约束）
  Widget _buildExpandedLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "四、Expanded 弹性布局",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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

  //  // 4. Expanded - 弹性布局（Row/Column 中占剩余空间）
  //   Widget _buildExpandedLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("4. Expanded 弹性布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Row(
  //           children: [
  //             // 固定宽度
  //             Container(width: 80, height: 80, color: Colors.red[300]),
  //             // 占剩余空间的1份
  //             Expanded(
  //               flex: 1,
  //               child: Container(height: 80, color: Colors.green[300]),
  //             ),
  //             // 占剩余空间的2份
  //             Expanded(
  //               flex: 2,
  //               child: Container(height: 80, color: Colors.blue[300]),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 5. Flex - 弹性布局（可切换水平/垂直）
  //   Widget _buildFlexLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("5. Flex 弹性布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Flex(
  //           direction: Axis.horizontal, // 水平方向（可改为 vertical）
  //           children: [
  //             Flexible(flex: 1, child: Container(height: 60, color: Colors.cyan[300])),
  //             Flexible(flex: 3, child: Container(height: 60, color: Colors.pink[300])),
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 6. Wrap - 自动换行布局（避免溢出）
  //   Widget _buildWrapLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("6. Wrap 自动换行布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Wrap(
  //           spacing: 8, // 水平间距
  //           runSpacing: 8, // 垂直间距
  //           children: [
  //             Container(width: 100, height: 60, color: Colors.red[300]),
  //             Container(width: 100, height: 60, color: Colors.green[300]),
  //             Container(width: 100, height: 60, color: Colors.blue[300]),
  //             Container(width: 100, height: 60, color: Colors.yellow[300]),
  //             Container(width: 100, height: 60, color: Colors.purple[300]),
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 7. GridView - 网格布局
  //   Widget _buildGridViewLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("7. GridView 网格布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         SizedBox(
  //           height: 200, // 固定高度，避免GridView无限滚动
  //           child: GridView.count(
  //             crossAxisCount: 3, // 列数
  //             crossAxisSpacing: 8, // 列间距
  //             mainAxisSpacing: 8, // 行间距
  //             children: [
  //               Container(color: Colors.red[300]),
  //               Container(color: Colors.green[300]),
  //               Container(color: Colors.blue[300]),
  //               Container(color: Colors.yellow[300]),
  //               Container(color: Colors.purple[300]),
  //               Container(color: Colors.orange[300]),
  //             ],
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 8. ListView - 列表布局
  //   Widget _buildListViewLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("8. ListView 列表布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         SizedBox(
  //           height: 150, // 固定高度
  //           child: ListView(
  //             scrollDirection: Axis.vertical, // 垂直滚动（可改为 horizontal）
  //             children: [
  //               Container(height: 50, color: Colors.red[300], alignment: Alignment.center, child: const Text("列表项1")),
  //               Container(height: 50, color: Colors.green[300], alignment: Alignment.center, child: const Text("列表项2")),
  //               Container(height: 50, color: Colors.blue[300], alignment: Alignment.center, child: const Text("列表项3")),
  //             ],
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 9. Padding - 内边距布局
  //   Widget _buildPaddingLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("9. Padding 内边距布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Container(
  //           color: Colors.grey[200],
  //           child: Padding(
  //             padding: const EdgeInsets.all(16), // 上下左右16px内边距
  //             child: Container(width: 100, height: 100, color: Colors.red[300]),
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 10. Margin - 外边距布局（通过Container的margin实现）
  //   Widget _buildMarginLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("10. Margin 外边距布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Container(
  //           color: Colors.grey[200],
  //           child: Container(
  //             margin: const EdgeInsets.all(16), // 上下左右16px外边距
  //             width: 100,
  //             height: 100,
  //             color: Colors.green[300],
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 11. Align - 对齐布局
  //   Widget _buildAlignLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("11. Align 对齐布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Container(
  //           width: 200,
  //           height: 200,
  //           color: Colors.grey[200],
  //           child: const Align(
  //             alignment: Alignment.bottomRight, // 右下角对齐
  //             child: Icon(Icons.home, size: 40, color: Colors.blue),
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 12. SizedBox - 固定尺寸布局（占位/间距）
  //   Widget _buildSizedBoxLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("12. SizedBox 固定尺寸布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         const SizedBox(
  //           width: 150,
  //           height: 80,
  //           child: Center(child: Text("固定宽高的SizedBox")),
  //         ),
  //         const SizedBox(height: 16), // 仅作为垂直间距
  //         const Text("SizedBox也可作为纯间距使用"),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 13. ConstrainedBox - 约束布局（强制最小/最大尺寸）
  //   Widget _buildConstrainedBoxLayout() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("13. ConstrainedBox 约束布局", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         ConstrainedBox(
  //           constraints: const BoxConstraints(
  //             minWidth: 100, // 最小宽度
  //             minHeight: 50, // 最小高度
  //             maxWidth: 200, // 最大宽度
  //             maxHeight: 100, // 最大高度
  //           ),
  //           child: Container(
  //             width: 50, // 实际宽度会被约束为最小100
  //             height: 30, // 实际高度会被约束为最小50
  //             color: Colors.orange[300],
  //             child: const Center(child: Text("约束布局")),
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // ====================== 第二部分：基础UI控件示例 ======================
  //   // 1. Text - 文本控件
  //   Widget _buildTextWidget() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("1. Text 文本控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         const Text("普通文本"),
  //         const Text("加粗文本", style: TextStyle(fontWeight: FontWeight.bold)),
  //         const Text("红色文本", style: TextStyle(color: Colors.red, fontSize: 16)),
  //         const Text("多行文本：Flutter 是谷歌开发的跨平台UI框架，支持iOS、Android、Web等多个平台，语法简洁，性能优异。",
  //             maxLines: 2, overflow: TextOverflow.ellipsis),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 2. 按钮控件（ElevatedButton/TextButton/OutlinedButton/IconButton）
  //   Widget _buildButtonWidgets() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("2. 按钮控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         ElevatedButton(
  //           onPressed: () => debugPrint("ElevatedButton 点击"),
  //           child: const Text("凸起按钮"),
  //         ),
  //         const SizedBox(height: 8),
  //         TextButton(
  //           onPressed: () => debugPrint("TextButton 点击"),
  //           child: const Text("文本按钮"),
  //         ),
  //         const SizedBox(height: 8),
  //         OutlinedButton(
  //           onPressed: () => debugPrint("OutlinedButton 点击"),
  //           child: const Text("边框按钮"),
  //         ),
  //         const SizedBox(height: 8),
  //         IconButton(
  //           onPressed: () => debugPrint("IconButton 点击"),
  //           icon: const Icon(Icons.settings),
  //           color: Colors.blue,
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 3. Icon - 图标控件
  //   Widget _buildIconWidget() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("3. Icon 图标控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Row(
  //           children: const [
  //             Icon(Icons.car_rental, size: 30, color: Colors.blue), // 车辆图标
  //             SizedBox(width: 16),
  //             Icon(Icons.battery_full, size: 30, color: Colors.green), // 电池图标
  //             SizedBox(width: 16),
  //             Icon(Icons.lock, size: 30, color: Colors.grey), // 锁图标
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 4. Image - 图片控件（本地/网络）
  //   Widget _buildImageWidget() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("4. Image 图片控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         // 网络图片（示例）
  //         Image.network(
  //           "https://picsum.photos/200/100", // 测试图片地址
  //           width: 200,
  //           height: 100,
  //           fit: BoxFit.cover, // 填充方式
  //         ),
  //         const SizedBox(height: 8),
  //         // 本地图片（需在pubspec.yaml配置，此处仅示例）
  //         // Image.asset("images/car.png", width: 200, height: 100),
  //         const Text("本地图片需配置pubspec.yaml后使用"),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 5. TextField - 输入框控件
  //   Widget _buildTextFieldWidget() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("5. TextField 输入框控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         TextField(
  //           decoration: const InputDecoration(
  //             hintText: "请输入用户名", // 占位提示
  //             labelText: "用户名", // 标签
  //             prefixIcon: Icon(Icons.person), // 左侧图标
  //             border: OutlineInputBorder(), // 边框
  //           ),
  //           onChanged: (value) => debugPrint("输入内容：$value"),
  //         ),
  //         const SizedBox(height: 8),
  //         TextField(
  //           obscureText: true, // 密码隐藏
  //           decoration: const InputDecoration(
  //             hintText: "请输入密码",
  //             labelText: "密码",
  //             prefixIcon: Icon(Icons.lock),
  //             border: OutlineInputBorder(),
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 6. Checkbox - 复选框控件
  //   Widget _buildCheckboxWidget() {
  //     bool isChecked = false; // 示例状态
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("6. Checkbox 复选框控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         CheckboxListTile(
  //           value: isChecked,
  //           onChanged: (value) => setState(() => isChecked = value!),
  //           title: const Text("自动落锁"),
  //           secondary: const Icon(Icons.lock), // 左侧图标
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 7. Radio - 单选框控件
  //   Widget _buildRadioWidget() {
  //     String selectedValue = "option1"; // 示例状态
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("7. Radio 单选框控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         RadioListTile(
  //           value: "option1",
  //           groupValue: selectedValue,
  //           onChanged: (value) => setState(() => selectedValue = value!),
  //           title: const Text("节能模式"),
  //         ),
  //         RadioListTile(
  //           value: "option2",
  //           groupValue: selectedValue,
  //           onChanged: (value) => setState(() => selectedValue = value!),
  //           title: const Text("运动模式"),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 8. Switch - 开关控件
  //   Widget _buildSwitchWidget() {
  //     bool isSwitched = false; // 示例状态
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("8. Switch 开关控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         SwitchListTile(
  //           value: isSwitched,
  //           onChanged: (value) => setState(() => isSwitched = value),
  //           title: const Text("远程定位"),
  //           activeColor: Colors.blue, // 开启时颜色
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 9. Slider - 滑块控件
  //   Widget _buildSliderWidget() {
  //     double sliderValue = 50; // 示例状态
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("9. Slider 滑块控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Slider(
  //           value: sliderValue,
  //           min: 0,
  //           max: 100,
  //           divisions: 10, // 分段数
  //           label: "${sliderValue.toInt()}%", // 滑块标签
  //           onChanged: (value) => setState(() => sliderValue = value),
  //           activeColor: Colors.blue,
  //         ),
  //         const Text("空调温度/风量调节示例"),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 10. Card - 卡片控件
  //   Widget _buildCardWidget() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("10. Card 卡片控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Card(
  //           elevation: 4, // 阴影高度
  //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // 圆角
  //           child: const Padding(
  //             padding: EdgeInsets.all(16),
  //             child: Column(
  //               children: [
  //                 Text("今日里程", style: TextStyle(color: Colors.grey)),
  //                 SizedBox(height: 4),
  //                 Text("45.8 km", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //               ],
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 11. ProgressIndicator - 进度条控件
  //   Widget _buildProgressWidget() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("11. ProgressIndicator 进度条控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         // 圆形进度条
  //         const CircularProgressIndicator(
  //           value: 0.75, // 进度（0-1）
  //           color: Colors.blue,
  //           strokeWidth: 4,
  //         ),
  //         const SizedBox(height: 16),
  //         // 线性进度条
  //         LinearProgressIndicator(
  //           value: 0.6,
  //           backgroundColor: Colors.grey[200],
  //           color: Colors.green,
  //           minHeight: 8,
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 12. Chip - 标签控件
  //   Widget _buildChipWidget() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("12. Chip 标签控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         Wrap(
  //           spacing: 8,
  //           children: const [
  //             Chip(label: Text("节能模式"), backgroundColor: Colors.green[100]),
  //             Chip(label: Text("运动模式"), backgroundColor: Colors.red[100]),
  //             Chip(
  //               label: Text("已充电85%"),
  //               avatar: Icon(Icons.battery_charging_full, size: 16), // 左侧小图标
  //               backgroundColor: Colors.blue[100],
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 13. Divider - 分割线控件
  //   Widget _buildDividerWidget() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("13. Divider 分割线控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         const Text("分割线上方内容"),
  //         const Divider(
  //           height: 20, // 分割线高度
  //           thickness: 1, // 分割线粗细
  //           color: Colors.grey[300],
  //         ),
  //         const Text("分割线下方内容"),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // 14. ListTile - 列表项控件
  //   Widget _buildListTileWidget() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("14. ListTile 列表项控件", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //         const SizedBox(height: 8),
  //         ListTile(
  //           leading: const Icon(Icons.settings, color: Colors.blue), // 左侧图标
  //           title: const Text("通用设置"), // 主标题
  //           subtitle: const Text("修改基础配置"), // 副标题
  //           trailing: const Icon(Icons.arrow_forward_ios, size: 16), // 右侧箭头
  //           onTap: () => debugPrint("通用设置点击"),
  //         ),
  //         const Divider(),
  //         ListTile(
  //           leading: const Icon(Icons.car_repair, color: Colors.orange),
  //           title: const Text("车辆诊断"),
  //           subtitle: const Text("检测车辆故障"),
  //           trailing: const Badge(count: 1, child: Icon(Icons.arrow_forward_ios, size: 16)), // 角标
  //           onTap: () => debugPrint("车辆诊断点击"),
  //         ),
  //         const SizedBox(height: 20),
  //       ],
  //     );
  //   }

  //   // ====================== 整合所有示例（可选） ======================
  //   Widget _buildAllExamples() {
  //     return Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text("Flutter 布局+UI控件全示例", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)),
  //         const SizedBox(height: 16),
  //         _buildRowLayout(),
  //         _buildColumnLayout(),
  //         _buildStackLayout(),
  //         _buildExpandedLayout(),
  //         _buildWrapLayout(),
  //         _buildTextWidget(),
  //         _buildButtonWidgets(),
  //         _buildIconWidget(),
  //         _buildCardWidget(),
  //       ],
  //     );
  //   }
}
