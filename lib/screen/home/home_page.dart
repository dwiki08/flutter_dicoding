import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/navigation.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/restaurants_list_view.dart';
import 'package:dicoding_flutter/providers/restaurant_provider.dart';
import 'package:dicoding_flutter/providers/state/restaurant_state.dart';
import 'package:dicoding_flutter/screen/detail/detail_screen.dart';
import 'package:dicoding_flutter/screen/favorites/favorite_screen.dart';
import 'package:dicoding_flutter/screen/search/search_screen.dart';
import 'package:dicoding_flutter/screen/setting/setting_screen.dart';
import 'package:dicoding_flutter/utils/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final NotificationHelper _notificationHelper = NotificationHelper();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget? _bodyPage() {
    switch (_selectedIndex) {
      case 0:
        return const RestaurantsListView();
      case 1:
        return const FavoriteScreen();
      case 2:
        return const SettingScreen();
      default:
        return null;
    }
  }

  PreferredSizeWidget? _appBar(RestaurantState state) {
    switch (_selectedIndex) {
      case 0:
        return AppBar(
          title: const Text('Restaurants'),
          actions: [
            Visibility(
              visible: state.listRestaurants.isEmpty && !state.isLoading,
              child: IconButton(
                onPressed: () =>
                    context.read<RestaurantProvider>().getListRestaurants(),
                icon: const Icon(Icons.refresh),
              ),
            ),
            IconButton(
              onPressed: () => Navigation.intent(route: SearchScreen.routeName),
              icon: const Icon(Icons.search),
            ),
          ],
        );
      case 1:
        return AppBar(
          title: const Text('Favorite'),
        );
      case 2:
        return AppBar(
          title: const Text('Settings'),
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RestaurantProvider>().state;

    return Scaffold(
      appBar: _appBar(state),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: navbarSelectedItemColor,
        unselectedItemColor: navbarItemColor,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              assetsIcons('ic_setting.svg'),
              colorFilter:
                  const ColorFilter.mode(navbarItemColor, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              assetsIcons('ic_setting_filled.svg'),
              colorFilter: const ColorFilter.mode(
                  navbarSelectedItemColor, BlendMode.srcIn),
            ),
            label: 'Settings',
          ),
        ],
      ),
      body: _bodyPage(),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RestaurantProvider>().getListRestaurants();
      _notificationHelper
          .configureSelectNotificationSubject(DetailScreen.routeName);
    });
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }
}
