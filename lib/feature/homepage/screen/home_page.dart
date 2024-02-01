import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:walletapp/constant/app_assets_images.dart';
import 'package:walletapp/feature/cards/screen/cards_screen.dart';
import 'package:walletapp/feature/homepage/widgets/home_page_item.dart';
import 'package:walletapp/feature/profile/screen/profile_screen.dart';
import 'package:walletapp/feature/addWallet/screen/add_wallet_screen.dart';
import 'package:walletapp/feature/transaction/screen/transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePageItem(),
    const TransactionScreen(),
    const AddWalletScreen(),
    const CardScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: SvgPicture.asset(
                AppAssetsImages.homeIcon,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: SvgPicture.asset(
                AppAssetsImages.statisticsIcon,
              ),
            ),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: SvgPicture.asset(
                AppAssetsImages.addIcon,
              ),
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: SvgPicture.asset(
                AppAssetsImages.cardIcon,
              ),
            ),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: SvgPicture.asset(
                AppAssetsImages.profileIcon,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
