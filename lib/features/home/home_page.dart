import 'package:flutter/material.dart';
import 'package:surah_app/core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        body: Row(
          children: [
            Container(
              width:
                  MediaQuery.of(context).size.width * 0.3, // Fixed drawer width
              child: Stack(
                fit: StackFit
                    .expand, // Ensures the image covers the full container
                children: [
                  Image.asset(
                    "assets/images/second/6.png", // Your image path
                    fit: BoxFit.cover, // Ensures full coverage
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.surface,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 10),
                          ListTile(
                            leading: Icon(Icons.menu, color: Colors.white),
                            onTap: () {},
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 20),
                          // Expandable Menu
                          _buildExpandableTile(context, "Menu",
                              "assets/images/icons/User Menu Male.png", [
                            _buildSubMenuItem("Option 1", () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OptionPage("Option 1")),
                              );
                            }),
                            _buildSubMenuItem("Option 2", () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OptionPage("Option 2")),
                              );
                            }),
                            _buildSubMenuItem("Option 3", () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OptionPage("Option 3")),
                              );
                            }),
                          ]),

                          // Expandable Membership
                          _buildExpandableTile(context, "Membership",
                              "assets/images/icons/ID Verified.png", [
                            _buildSubMenuItem("View Membership", () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MembershipPage()),
                              );
                            }),
                            _buildSubMenuItem("Upgrade Membership", () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpgradeMembershipPage()),
                              );
                            }),
                          ]),

                          // Expandable Rooms
                          _buildExpandableTile(context, "Rooms",
                              "assets/images/icons/Waiting Room.png", [
                            _buildSubMenuItem("View Rooms", () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RoomsPage()),
                              );
                            }),
                            _buildSubMenuItem("Book a Room", () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookRoomPage()),
                              );
                            }),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          color: AppColors.backgroundColor,
          child: Stack(
            children: [
              Positioned(
                right: -40,
                top: -40,
                width: MediaQuery.of(context).size.width / 4,
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Image.asset(
                    'assets/images/logo/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width * 0.1,
                child: Image.asset('assets/images/second/4.png'),
              ),
              Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width * 0.35,
                child: Image.asset('assets/images/second/3.png', scale: 1.15),
              ),
              Align(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 0.4,
                  child: Image.asset('assets/images/second/5.png'),
                ),
              ),
            ]
          ),
        ),
          ],
        ),
      ),
    );
  }

  // Method to build each ListTile with an action
  Widget _buildListTile(
      BuildContext context, String title, String iconPath, VoidCallback onTap) {
    return ListTile(
      leading: Image.asset(
        iconPath,
        width: 24,
        height: 24,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  // Method to build the expandable Menu with sub-menu items
  Widget _buildExpandableTile(BuildContext context, String title,
      String iconPath, List<Widget> subMenuItems) {
    return ExpansionTile(
      leading: Image.asset(
        iconPath,
        width: 24,
        height: 24,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Icon(
        Icons.expand_more,
        color: Colors.white,
      ),
      children: subMenuItems,
    );
  }

  // Sub-menu item widget (each sub-item can navigate to a page)
  Widget _buildSubMenuItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}

// Example Pages for Navigation
class OptionPage extends StatelessWidget {
  final String optionName;

  OptionPage(this.optionName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          optionName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
          child: Text(
        'This is the $optionName page',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      )),
    );
  }
}
class MembershipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Membership')),
      body: Center(child: Text('This is the Membership Page')),
    );
  }
}

class UpgradeMembershipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upgrade Membership')),
      body: Center(child: Text('This is the Upgrade Membership Page')),
    );
  }
}

class RoomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rooms')),
      body: Center(child: Text('This is the Rooms Page')),
    );
  }
}

class BookRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Room')),
      body: Center(child: Text('This is the Book Room Page')),
    );
  }
}
