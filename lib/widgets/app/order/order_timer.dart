import 'package:flutter/material.dart';
import 'package:tiendero/core/cc.dart';
import 'dart:async';

class OrderTimer extends StatefulWidget {
  const OrderTimer({
    this.viewTitleDuration,
    this.durationOrder,
    this.dateTimeInit,
    Key key,
  }) : super(key: key);
  final bool viewTitleDuration;
  final Duration durationOrder;
  final DateTime dateTimeInit;

  @override
  _OrderTimerState createState() => _OrderTimerState();
}

class _OrderTimerState extends State<OrderTimer> {
  ValueNotifier<int> minute = ValueNotifier<int>(0);
  ValueNotifier<double> percent = ValueNotifier<double>(0);
  int durationOrder;
  Timer timer;
  @override
  void initState() {
    durationOrder =
        widget.durationOrder == null ? 0 : widget.durationOrder.inMinutes;
    minute.value = calculeMinute();
    percent.value = calculePercent();

    setTimeProgress();
    super.initState();
  }

  void setTimeProgress() {
    final time = Duration(seconds: 3);
    timer = Timer.periodic(time, (timer) {
      minute.value = calculeMinute();
      percent.value = calculePercent();
    });
  }

  double calculePercent() {
    if (minute.value == 0 || durationOrder == 0) {
      return 0.0;
    } else {
      return ((minute.value / durationOrder) * 100) / 100;
    }
  }

  int calculeMinute() {
    final init = widget.dateTimeInit ?? DateTime.now();
    final actual = DateTime.now();
    final difference = actual.difference(init).inMinutes;
    final totalMinute = durationOrder - difference;
    if (totalMinute <= 0)
      return 0;
    else
      return totalMinute.toInt();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          widget.viewTitleDuration
              ? Text(
                  '$durationOrder Minutos',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: CColors.blue,
                    fontSize: 16,
                  ),
                )
              : const SizedBox.shrink(),
          //TIME ELAPSED
          ValueListenableBuilder(
            valueListenable: percent,
            builder: (_, value, __) {
              return LineTime(percent: value);
            },
          ),

          //DATOS
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30.0,
                child: Text(
                  '$durationOrder',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: CColors.blue,
                    fontSize: 15,
                  ),
                ),
              ),
              const Text(
                'Tiempo disponible',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: CColors.blue,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                width: 30.0,
                child: Text(
                  '0',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: CColors.blue,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 30.0,
                child: Text(
                  'Min',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: CColors.blue,
                    fontSize: 15,
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: minute,
                builder: (_, value, __) {
                  return Text(
                    '${value.toString()} Minutos',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: CColors.pinkish,
                      fontSize: 20,
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 30.0,
                child: Text(
                  'Min',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: CColors.blue,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LineTime extends StatelessWidget {
  const LineTime({
    Key key,
    this.percent = 0.0,
  }) : super(key: key);

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        const Mark(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            width: double.infinity,
            height: 25,
            color: CColors.grey,
            child: FractionallySizedBox(
              widthFactor: percent >= 1 ? 1 : percent,
              alignment: Alignment.centerRight,
              child: Container(color: CColors.orange),
            ),
          ),
        ),
        const Positioned(
          right: 0,
          child: Mark(),
        ),
      ],
    );
  }
}

class Mark extends StatelessWidget {
  const Mark({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 3,
          height: 30,
          color: CColors.orange,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: const BoxDecoration(
            color: CColors.orange,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
