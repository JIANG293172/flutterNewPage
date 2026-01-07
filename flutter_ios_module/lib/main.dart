import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '长安汽车车控首页',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0066CC), // 长安汽车品牌主色（深蓝）
          primary: const Color(0xFF0066CC),
          secondary: const Color(0xFFF5A623), // 辅助色（橙色）
        ),
        fontFamily: 'PingFang SC', // 适配中文显示
        splashFactory: InkRipple.splashFactory, // 优化点击水波纹效果
      ),
      home: const ChanganCarControlHome(),
      debugShowCheckedModeBanner: false, // 移除调试水印
    );
  }
}

// 长安汽车车控首页主页面
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

  // 加载状态控制
  bool _isLoading = false;

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

    if (mounted) { // 防止页面销毁后调用context
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_isLock ? "车辆已上锁" : "车辆已解锁"),
          backgroundColor: _isLock ? Colors.green : Theme.of(context).primaryColor,
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
          // 修复：使用 colorScheme.secondary 替代 secondaryColor
          backgroundColor: _isAirOn ? Theme.of(context).colorScheme.secondary : Colors.grey[700],
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("暂无新通知")),
                );
              }
            },
            tooltip: "通知",
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(), // 弹性滚动
        child: Column(
          children: [
            // 车辆信息卡片
            _buildCarInfoCard(),
            const SizedBox(height: 16),
            // 常用控制区
            _buildControlArea(),
            const SizedBox(height: 16),
            // 车辆数据统计
            _buildCarDataArea(),
            const SizedBox(height: 16),
            // 功能入口区
            _buildFunctionEntrance(),
            const SizedBox(height: 20), // 底部留白
          ],
        ),
      ),
      // 底部导航栏
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // 车辆信息卡片
  Widget _buildCarInfoCard() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0066CC), Color(0xFF0088EE)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 车辆型号 + 车牌
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _carModel,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _licensePlate,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // 电量/油量 + 剩余里程
          Row(
            children: [
              // 电量图标 + 百分比
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // 修复：使用 battery_alert 替代 battery_low
                      Icon(
                        _batteryPercent > 20 ? Icons.battery_full : Icons.battery_alert,
                        color: Colors.white,
                        size: 40,
                      ),
                      if (_isLoading)
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "$_batteryPercent%",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              // 剩余里程
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "剩余里程",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "$_mileage km",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // 车辆状态标签
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _isLock ? Icons.lock : Icons.lock_open,
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _isLock ? "车辆已上锁" : "车辆未上锁",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 常用控制区
  Widget _buildControlArea() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
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
        children: [
          const Text(
            "常用控制",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 20),
          // 控制按钮网格
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: 1.2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 16,
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
                // 修复：使用 colorScheme.secondary 替代 secondaryColor
                color: _isAirOn ? Theme.of(context).colorScheme.secondary : null,
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("后备箱已开启")),
                    );
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
                icon: _batteryPercent > 0 ? Icons.ev_station : Icons.local_gas_station,
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
        ],
      ),
    );
  }

  // 单个控制按钮（优化点击反馈和加载状态）
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
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  icon,
                  size: 28,
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
            const SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: color ?? const Color(0xFF666666),
              ),
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
      padding: const EdgeInsets.all(20),
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
        children: [
          const Text(
            "车辆数据",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 20),
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
              const SizedBox(width: 16),
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
          const SizedBox(height: 16),
          Row(
            children: [
              // 累计里程
              Expanded(
                child: _buildDataCard(
                  title: "累计里程",
                  value: "12580 km",
                  // 修复：使用 speed 替代 odometer（Icons.speed 存在）
                  icon: Icons.speed,
                ),
              ),
              const SizedBox(width: 16),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF999999),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
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
      padding: const EdgeInsets.all(20),
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
        children: [
          const Text(
            "功能服务",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 20),
          // 功能入口网格
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: 1.1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 16,
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
        ],
      ),
    );
  }

  // 功能入口项（优化点击反馈）
  Widget _buildFunctionItem(IconData icon, String text) {
    return InkWell(
      onTap: () {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$text 功能待开通")),
          );
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: const Color(0xFF666666),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF666666),
              ),
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