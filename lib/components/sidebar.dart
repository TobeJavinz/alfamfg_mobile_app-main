import 'package:alfamfg_mobile_app/components/constants.dart';
import 'package:alfamfg_mobile_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class AlfaSidebarX extends StatelessWidget {
  const AlfaSidebarX({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/logo.jpg'),
              ),
              const SizedBox(height: 14),
              if (extended)
                const Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
            ],
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.person,
          label: 'Profile',
          onTap: () {
            // debugPrint('Profile');
          },
        ),
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            // debugPrint('Home');
          },
        ),
        SidebarXItem(
          icon: Icons.build,
          label: 'Manufacturing',
          onTap: () {
            // _navigateToPage(context, 'Manufacturing');
            // debugPrint('Manufacturing');
          },
        ),
        SidebarXItem(
          icon: Icons.inventory,
          label: 'Inventory',
          onTap: () {
            // _navigateToPage(context, 'Inventory');
          },
        ),
        SidebarXItem(
          icon: Icons.shopping_bag,
          label: 'Purchasing',
          onTap: () {
            // _navigateToPage(context, 'Purchasing');
          },
        ),
        SidebarXItem(
          icon: Icons.shopping_cart,
          label: 'Sales',
          onTap: () {
            // _navigateToPage(context, 'Sales');
          },
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
          onTap: () {
            _logout(context);
          },
        ),
      ],
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}

String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Profile';
    case 1:
      return 'Home';
    case 2:
      return 'Manufacturing';
    case 3:
      return 'Inventory';
    case 4:
      return 'Purchasing';
    case 5:
      return 'Sales';
    case 6:
      return 'Logout';
    default:
      return 'Not found page';
  }
}
