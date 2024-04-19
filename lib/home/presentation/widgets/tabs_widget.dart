import 'package:flutter/material.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({super.key, required this.onCallBackTabValue});
  final Function(String) onCallBackTabValue;

  @override
  Widget build(BuildContext context) {
    return _TabBarLetters(
      onCallBackTabValue: onCallBackTabValue,
    );
  }
}

class _TabBarLetters extends StatefulWidget {
  const _TabBarLetters({required this.onCallBackTabValue});
  final Function(String) onCallBackTabValue;
  @override
  State<_TabBarLetters> createState() => _TabBarLettersState();
}

class _TabBarLettersState extends State<_TabBarLetters>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int? tabIndex;

  @override
  void initState() {
    _tabController = TabController(length: letters().length, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      onTap: (value) {
        widget.onCallBackTabValue(letters()[value]);
      },
      unselectedLabelColor: const Color(0xFF99999D),
      unselectedLabelStyle: const TextStyle(
        fontSize: 17,
      ),
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: const EdgeInsets.only(
        bottom: 10,
      ),
      indicatorPadding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      labelStyle: const TextStyle(
        fontSize: 17,
        color: Color(0xFFFF4B3A),
        fontWeight: FontWeight.w700,
      ),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3.0,
          color: Color(0xFFFF4B3A),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      dividerColor: Colors.transparent,
      tabs: [
        ...letters()
            .map((letter) => Padding(
                padding: const EdgeInsets.only(right: 80, left: 10),
                child: Text(letter)))
            .toList(),
      ],
    );
  }

  List<String> letters() {
    return List.generate(26, (index) => String.fromCharCode(index + 65));
  }
}
