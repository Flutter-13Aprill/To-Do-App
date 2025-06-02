import 'package:flutter/material.dart';
import 'package:project6/extensions/theming.dart';

class ScrollTimePickerWheel extends StatefulWidget {
  const ScrollTimePickerWheel({super.key});

  @override
  ScrollTimePickerWheelState createState() => ScrollTimePickerWheelState();
}

class ScrollTimePickerWheelState extends State<ScrollTimePickerWheel> {
  
  final FixedExtentScrollController hourController =
      FixedExtentScrollController();
  final FixedExtentScrollController minuteController =
      FixedExtentScrollController();
  final FixedExtentScrollController ampmController =
      FixedExtentScrollController();
  DateTime selectedTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializePickers();
  }

  void initializePickers() {
    int currentHour = DateTime.now().hour % 12;
    int currentMinute = DateTime.now().minute;
    int ampmIndex = DateTime.now().hour >= 12 ? 1 : 0;

    hourController.jumpToItem(currentHour);
    minuteController.jumpToItem(currentMinute);
    ampmController.jumpToItem(ampmIndex);
  }

  void _onHourChanged(int index) {
    setState(() {
      selectedTime = selectedTime.copyWith(hour: index % 12);
    });
  }

  void _onMinuteChanged(int index) {
    setState(() {
      selectedTime = selectedTime.copyWith(minute: index);
    });
  }

  void _onAmpmChanged(int index) {
    setState(() {
      int currentHour = selectedTime.hour;
      if (index == 0 && currentHour >= 12) {
        selectedTime = selectedTime.copyWith(hour: currentHour - 12);
      } else if (index == 1 && currentHour < 12) {
        selectedTime = selectedTime.copyWith(hour: currentHour + 12);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPicker(
              hourController,
              12,
              _onHourChanged,
              (index) => (index + 1).toString().padLeft(2, '0'),
              'HH',
              const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))),
          
            Text(':',style: context.titleL()!.copyWith(fontWeight: FontWeight.normal),),
          _buildPicker(
              minuteController,
              60,
              _onMinuteChanged,
              (index) => index.toString().padLeft(2, '0'),
              'MM',
              BorderRadius.zero),
          _buildPicker(
              ampmController,
              2,
              _onAmpmChanged,
              (index) => index == 0 ? 'AM' : 'PM',
              'AM/PM',
              const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
        ],
      ),
    );
  }

  Widget _buildPicker(
    FixedExtentScrollController controller,
    int itemCount,
    ValueChanged<int> onSelectedItemChanged,
    String Function(int) formatLabel,
    String semanticLabel,
    BorderRadius borderRadius,
  ) {
    return SizedBox(
      width: 75,
      height: 100,
      child: Center(
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(backgroundBlendMode: BlendMode.colorDodge,
                color: const Color.fromARGB(255, 39, 39, 39),
                borderRadius: borderRadius,
              
              ),
            child: Stack(
        children: [
          ListWheelScrollView.useDelegate(
            controller: controller,
            itemExtent: 25,
            diameterRatio: 1.2,
            offAxisFraction: 0,
            onSelectedItemChanged: onSelectedItemChanged,
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  child: TimeTileWidget(
                      time: formatLabel(index), isSelected: false),
                );
              },
              childCount: itemCount,
            ),
          ),
         
        ],
      ),
            ),

          ),
    );
  }
}


 
class TimeTileWidget extends StatelessWidget {
  final String time;
  final bool isSelected;

  const TimeTileWidget(
      {super.key, required this.time, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          time,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold, fontSize: 25, color:  Colors.white),
        ),
      ),
    );
  }
}