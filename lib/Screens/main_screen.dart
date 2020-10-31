import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:versionbeta3/Profile/edit_profile.dart';
import 'package:versionbeta3/Profile/settings.dart';
import 'package:versionbeta3/Screens/all_requests/all_requests.dart';
import 'package:versionbeta3/Screens/all_requests/recent_chats.dart';
import 'package:versionbeta3/Screens/request_screen.dart';
import 'package:versionbeta3/Screens/search_screen.dart';
import 'package:versionbeta3/Screens/story.dart';
import 'package:versionbeta3/color/color.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  bool keyboardOpen = false;
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Story(),
    AllRequests(),
    RecentChats(),
    SettingsPage()
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Story();

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() => keyboardOpen = visible);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: keyboardOpen ? SizedBox() : FloatingActionButton(
        backgroundColor: red,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            currentScreen = Search_screen();
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Story(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0 ? red : Colors.grey,
                        ),
                        Text(
                          'Story',
                          style: TextStyle(
                            color: currentTab == 0 ? red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            AllRequests(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.record_voice_over,
                          color: currentTab == 1 ? red : Colors.grey,
                        ),
                        Text(
                          'Request',
                          style: TextStyle(
                            color: currentTab == 1 ? red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            RecentChats(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color: currentTab == 2 ? red : Colors.grey,
                        ),
                        Text(
                          'chat',
                          style: TextStyle(
                            color: currentTab == 2 ? red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            SettingsPage(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_rounded,
                          color: currentTab == 3 ? red : Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 3 ? red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
