import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_vault/ui/item/item_screen.dart';
import 'package:the_vault/ui/item_list/cubit/item_list_cubit.dart';
import 'package:the_vault/ui/item_list/item_list_screen.dart';
import 'package:the_vault/ui/menu/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen>
    with TickerProviderStateMixin<HomeScreen> {
  static const List<Destination> allDestinations = [
    Destination(0, 'Home', Icons.home),
    Destination(1, 'Menu', Icons.menu),
  ];

  late final List<GlobalKey<NavigatorState>> _navigatorKeys;
  late final List<AnimationController> _destinationFaders;
  late final List<Widget> _destinationViews;
  int _selectedIndex = 0;

  AnimationController _buildFaderController() {
    return AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void initState() {
    super.initState();

    _navigatorKeys =
        List<GlobalKey<NavigatorState>>.generate(
          allDestinations.length,
          (int index) => GlobalKey(),
        ).toList();

    _destinationFaders =
        List<AnimationController>.generate(
          allDestinations.length,
          (int index) => _buildFaderController(),
        ).toList();
    _destinationFaders[_selectedIndex].value = 1.0;

    final CurveTween tween = CurveTween(curve: Curves.fastOutSlowIn);
    _destinationViews =
        allDestinations.map<Widget>((Destination destination) {
          return FadeTransition(
            opacity: _destinationFaders[destination.index].drive(tween),
            child: DestinationView(
              destination: destination,
              navigatorKey: _navigatorKeys[destination.index],
            ),
          );
        }).toList();
  }

  @override
  void dispose() {
    for (final AnimationController controller in _destinationFaders) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigatorPopHandler(
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Stack(
            fit: StackFit.expand,
            children:
                allDestinations.map((Destination destination) {
                  final int index = destination.index;
                  final Widget view = _destinationViews[index];
                  if (index == _selectedIndex) {
                    _destinationFaders[index].forward();
                    return Offstage(offstage: false, child: view);
                  } else {
                    _destinationFaders[index].reverse();
                    if (_destinationFaders[index].isAnimating) {
                      return IgnorePointer(child: view);
                    }
                    return Offstage(child: view);
                  }
                }).toList(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items:
              allDestinations.map<BottomNavigationBarItem>((
                Destination destination,
              ) {
                return BottomNavigationBarItem(
                  icon: Icon(destination.icon),
                  label: destination.title,
                );
              }).toList(),
        ),
      ),
    );
  }
}

class Destination {
  const Destination(this.index, this.title, this.icon);
  final int index;
  final String title;
  final IconData icon;
}

class DestinationView extends StatefulWidget {
  const DestinationView({
    super.key,
    required this.destination,
    required this.navigatorKey,
  });

  final Destination destination;
  final Key navigatorKey;

  @override
  State<DestinationView> createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) {
            switch (settings.name) {
              case '/':
                if (widget.destination.title == 'Menu') return MenuScreen();
                return BlocProvider(
                  create: (context) => ItemListCubit(context),
                  child: ItemListScreen(),
                );
              case '/details':
                return ItemScreen();
            }
            assert(false);
            return const SizedBox();
          },
        );
      },
    );
  }
}
