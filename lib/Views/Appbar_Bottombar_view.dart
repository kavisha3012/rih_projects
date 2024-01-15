import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mvc_quizbook/Views/Chaptername_view.dart';
import 'package:new_mvc_quizbook/Views/Signup_view.dart';
import 'package:new_mvc_quizbook/Views/Standardname_view.dart';
import '../Controller/Appbar_Bottombar_controller.dart';
import '../Controller/Chaptername_controller.dart';
import '../Utils/constants.dart';
import '../Widgets/common_appbar.dart';

class AppbarBottomBarScreen extends StatelessWidget {
  final AppbarBottombarController _controller =
      Get.put(AppbarBottombarController());
  final ChapterController chapterController = Get.put(ChapterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Obx(
            () => _controller.currentIndex.value == 2
                ? SizedBox.shrink()
                : CommonAppBarScreen(
                    title: _controller.getPageName(),
                    backgroundColor: whiteColor,
                    automaticallyImplyLeading:
                        _controller.currentIndex.value == 2,
                    isBackArrow: _controller.currentIndex.value == 2,
                  ),
          )),
      body: PageView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          controller: _controller.pageController,
          onPageChanged: (index) {
            _controller.onTabTapped(index);
          },
          itemBuilder: (_, index) {
            if (index == 0)
              return StandardNameScreen();
            else if (index == 1)
              return ItemList(
                subName: 'AppbarBottomBarScreen',
                showAppbar: false,
                items: chapterController.items,
              );
            else
              // return SignUpScreen(mobileNumber: '', isBackArrow: false);
              return SignUpScreen(
                mobileNumber: '',
              );
          }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue[800],
          showSelectedLabels: true,
          iconSize: 40,
          currentIndex: _controller.currentIndex.value,
          onTap: _controller.onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                // color: Colors.grey,
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.watch_later_outlined,
                // color: Colors.grey,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                // color: Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
