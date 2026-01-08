import 'package:flutter/material.dart';

class AutoHomePageStateView extends StatelessWidget {
  // 接收父组件传递的状态参数
  final String licensePlate;
  final String carModel;
  final int batteryPercent;
  final int mileage;
  final bool isLock;
  final bool isLoading;

  // 构造函数（必传参数）
  const AutoHomePageStateView({
    super.key,
    required this.licensePlate,
    required this.carModel,
    required this.batteryPercent,
    required this.mileage,
    required this.isLock,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220, // 原60高度会导致内容溢出，需调整
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.blue[50],
      child: _buildCarInfoCard(),
    );
  }

  // 车辆信息卡片
  Widget _buildCarInfoCard() {
    return Builder(
      builder: (context) => Container(
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
          mainAxisSize: MainAxisSize.min,
          children: [  // 修复：缩进+空格
            // 车辆型号 + 车牌
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  carModel,
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
                    licensePlate,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          batteryPercent > 20
                              ? Icons.battery_full
                              : Icons.battery_alert,
                          color: Colors.white,
                          size: 40,
                        ),
                        if (isLoading)
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
                      "$batteryPercent%",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                // 剩余里程
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "剩余里程",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$mileage km",
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isLock ? Icons.lock : Icons.lock_open,
                        color: Colors.white,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isLock ? "车辆已上锁" : "车辆未上锁",
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}