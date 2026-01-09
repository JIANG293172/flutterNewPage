import 'package:flutter/material.dart';
import 'AutoHomePageHeader.dart';
import 'AutoHomePageStateView.dart';
import 'AutoTopHomePageHeader.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '车控首页',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0066CC), // 品牌主色（深蓝）
          primary: const Color(0xFF0066CC),
          secondary: const Color(0xFFF5A623), // 辅助色（橙色）
        ),
        fontFamily: 'PingFang SC', // 适配中文显示（若项目未配置可注释）
        splashFactory: InkRipple.splashFactory, // 优化点击水波纹效果
      ),
      home: const ChanganCarControlHome(),
      debugShowCheckedModeBanner: false, // 移除调试水印
    );
  }
}

// 车控首页主页面
class ChanganCarControlHome extends StatefulWidget {
  const ChanganCarControlHome({super.key});

  @override
  State<ChanganCarControlHome> createState() => _ChanganCarControlHomeState();
}

class _ChanganCarControlHomeState extends State<ChanganCarControlHome> {
  // 模拟车辆状态数据
  final String _carModel = "长安CS75 PLUS";
  final String _licensePlate = "川A·88888";
  int _batteryPercent = 85; // 电量/油量
  int _mileage = 1258; // 剩余里程(km)
  bool _isLock = true; // 车辆是否上锁
  bool _isAirOn = false; // 空调是否开启
  final MethodChannel _channel = const MethodChannel(
    "com.changan.carcontrol/channel",
  );

  // 加载状态控制
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _listeniOSCall();
  }

  void _listeniOSCall() {
    _channel.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case "updateBattery":
          final int newBattery = call.arguments['battery'] as int;
          debugPrint("$newBattery");
          return "Flutter电量更新成功：$newBattery%"; // 返回给iOS的结果

        default:
          throw PlatformException(
            code: "METHOD_NOT_FOUND",
            message: "未实现方法：${call.method}",
          );
      }
    });
  }

  // 控制操作 - 车辆上锁/解锁（添加加载状态）
  Future<void> _toggleLock() async {
    if (_isLoading) return; // 防止重复点击

    setState(() {
      _isLoading = true;
    });

    // 模拟网络请求延迟
    await Future.delayed(const Duration(milliseconds: 800));

    setState(() {
      _isLock = !_isLock;
      _isLoading = false;
    });

    if (mounted) {
      // 防止页面销毁后调用context
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isLock ? "车辆已上锁" : "车辆已解锁"),
          backgroundColor: _isLock
              ? Colors.green
              : Theme.of(context).primaryColor,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  // 控制操作 - 空调开关（添加加载状态）
  Future<void> _toggleAirCondition() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 800));

    setState(() {
      _isAirOn = !_isAirOn;
      _isLoading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isAirOn ? "空调已开启" : "空调已关闭"),
          backgroundColor: _isAirOn
              ? Theme.of(context).colorScheme.secondary
              : Colors.grey[700],
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  // 模拟电量减少（演示用）
  Future<void> _simulateBatteryConsumption() async {
    if (_batteryPercent <= 0) return;

    setState(() {
      _batteryPercent -= 5;
      _mileage = (_mileage * (1 - 0.05)).round(); // 里程随电量减少
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // 页面背景色
      appBar: AppBar(
        title: const Text("长安车控"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // 通知入口点击事件
              if (mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("暂无新通知")));
              }
            },
            tooltip: "通知",
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(), // 弹性滚动
        padding: const EdgeInsets.only(bottom: 16), // 底部额外留白
        child: Column(
          children: [
            const AutoHomePageHeader(initTitle: "车控首页"),
            const SizedBox(height: 16),
            AutoTopHomePageHeader(),
            // 车辆信息卡片
            AutoHomePageStateView(
              licensePlate: _licensePlate,
              carModel: _carModel,
              batteryPercent: 85,
              mileage: 1258,
              isLock: _isLock,
              isLoading: _isLoading,
            ),
            const SizedBox(height: 16),
            // 常用控制区
            _buildControlArea(),
            const SizedBox(height: 16),
            // 车辆数据统计
            _buildCarDataArea(),
            const SizedBox(height: 16),
            // 功能入口区
            _buildFunctionEntrance(),
          ],
        ),
      ),
      // 底部导航栏
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // 常用控制区（彻底修复布局溢出）
  Widget _buildControlArea() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ), // 减少内边距
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // 关键：最小化Column高度
        children: [
          const Text(
            "常用控制",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12), // 进一步缩小间距
          // 控制按钮网格（固定高度+适配尺寸）
          SizedBox(
            height: 140, // 固定高度，防止溢出
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              childAspectRatio: 1.1, // 调整宽高比
              crossAxisSpacing: 8,
              mainAxisSpacing: 8, // 进一步减少间距
              children: [
                // 锁车/解锁
                _buildControlButton(
                  icon: _isLock ? Icons.lock : Icons.lock_open,
                  text: _isLock ? "解锁" : "上锁",
                  onPressed: _toggleLock,
                  isLoading: _isLoading,
                ),
                // 空调
                _buildControlButton(
                  icon: _isAirOn ? Icons.ac_unit : Icons.ac_unit_outlined,
                  text: "空调",
                  onPressed: _toggleAirCondition,
                  color: _isAirOn
                      ? Theme.of(context).colorScheme.secondary
                      : null,
                  isLoading: _isLoading,
                ),
                // 寻车
                _buildControlButton(
                  icon: Icons.location_searching,
                  text: "寻车",
                  onPressed: () {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("寻车模式已开启，车辆鸣笛+双闪"),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    }
                  },
                ),
                // 后备箱
                _buildControlButton(
                  icon: Icons.storage,
                  text: "后备箱",
                  onPressed: () {
                    if (mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text("后备箱已开启")));
                    }
                  },
                ),
                // 车窗
                _buildControlButton(
                  icon: Icons.window,
                  text: "车窗",
                  onPressed: () {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("车窗控制功能待开通")),
                      );
                    }
                  },
                ),
                // 天窗
                _buildControlButton(
                  icon: Icons.sunny,
                  text: "天窗",
                  onPressed: () {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("天窗控制功能待开通")),
                      );
                    }
                  },
                ),
                // 充电/加油（适配不同车型）
                _buildControlButton(
                  icon: _batteryPercent > 0
                      ? Icons.ev_station
                      : Icons.local_gas_station,
                  text: _batteryPercent > 0 ? "充电" : "加油",
                  onPressed: _simulateBatteryConsumption,
                ),
                // 更多控制
                _buildControlButton(
                  icon: Icons.more_horiz,
                  text: "更多",
                  onPressed: () {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("更多控制功能即将上线")),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 单个控制按钮（优化尺寸）
  Widget _buildControlButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
    Color? color,
    bool isLoading = false,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4), // 减少内边距
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // 关键：最小化Column高度
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  icon,
                  size: 26, // 稍微缩小图标
                  color: color ?? const Color(0xFF666666),
                ),
                if (isLoading)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Color(0xFF0066CC),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6), // 减少文字间距
            Text(
              text,
              style: TextStyle(
                fontSize: 11, // 稍微缩小文字
                color: color ?? const Color(0xFF666666),
              ),
              maxLines: 1, // 确保文字不换行
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // 车辆数据统计区
  Widget _buildCarDataArea() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ), // 减少内边距
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // 关键：最小化Column高度
        children: [
          const Text(
            "车辆数据",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16), // 减少间距
          // 数据卡片行
          Row(
            children: [
              // 今日里程
              Expanded(
                child: _buildDataCard(
                  title: "今日里程",
                  value: "45.8 km",
                  icon: Icons.route,
                ),
              ),
              const SizedBox(width: 12), // 减少间距
              // 平均油耗/电耗
              Expanded(
                child: _buildDataCard(
                  title: "平均电耗",
                  value: "15.2 kWh/100km",
                  icon: Icons.electric_car,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12), // 减少间距
          Row(
            children: [
              // 累计里程
              Expanded(
                child: _buildDataCard(
                  title: "累计里程",
                  value: "12580 km",
                  icon: Icons.speed,
                ),
              ),
              const SizedBox(width: 12), // 减少间距
              // 驾驶时长
              Expanded(
                child: _buildDataCard(
                  title: "本月驾驶",
                  value: "28.5 h",
                  icon: Icons.timer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 单个数据卡片
  Widget _buildDataCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12), // 减少内边距
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // 关键：最小化Column高度
        children: [
          Icon(
            icon,
            size: 18, // 稍微缩小图标
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 6), // 减少间距
          Text(
            title,
            style: const TextStyle(
              fontSize: 11, // 稍微缩小文字
              color: Color(0xFF999999),
            ),
          ),
          const SizedBox(height: 2), // 减少间距
          Text(
            value,
            style: const TextStyle(
              fontSize: 14, // 稍微缩小文字
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // 功能入口区
  Widget _buildFunctionEntrance() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ), // 减少内边距
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // 关键：最小化Column高度
        children: [
          const Text(
            "功能服务",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12), // 减少间距
          // 功能入口网格（固定高度）
          SizedBox(
            height: 130, // 固定高度，防止溢出
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              childAspectRatio: 1.0, // 调整宽高比
              crossAxisSpacing: 8,
              mainAxisSpacing: 8, // 减少间距
              children: [
                _buildFunctionItem(Icons.car_repair, "维保预约"),
                _buildFunctionItem(Icons.local_parking, "停车服务"),
                _buildFunctionItem(Icons.card_giftcard, "优惠券"),
                _buildFunctionItem(Icons.help_center, "客服中心"),
                _buildFunctionItem(Icons.settings, "车辆设置"),
                _buildFunctionItem(Icons.document_scanner, "电子手册"),
                _buildFunctionItem(Icons.shop, "精品商城"),
                _buildFunctionItem(Icons.history, "行程记录"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 功能入口项（优化尺寸）
  Widget _buildFunctionItem(IconData icon, String text) {
    return InkWell(
      onTap: () {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("$text 功能待开通")));
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4), // 减少内边距
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // 关键：最小化Column高度
          children: [
            Icon(
              icon,
              size: 22, // 稍微缩小图标
              color: const Color(0xFF666666),
            ),
            const SizedBox(height: 6), // 减少间距
            Text(
              text,
              style: const TextStyle(
                fontSize: 11, // 稍微缩小文字
                color: Color(0xFF666666),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // 底部导航栏
  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color(0xFF999999),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: Colors.white,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental_outlined),
            activeIcon: Icon(Icons.car_rental),
            label: "车辆",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route_outlined),
            activeIcon: Icon(Icons.route),
            label: "行程",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            activeIcon: Icon(Icons.person),
            label: "我的",
          ),
        ],
        onTap: (index) {
          // 底部导航点击事件
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("切换到 ${["首页", "车辆", "行程", "我的"][index]}")),
            );
          }
        },
      ),
    );
  }
}
