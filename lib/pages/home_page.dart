import 'package:academia/exports/barrel.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final pages = const [
    DashBoard(),
    ToolsPage(),
    CoursesPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    Get.put(TaskManagerController());
    Get.put(CoursesPageController());
    Get.put(NotificationsController());
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: pages),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Ionicons.home),
            icon: Icon(Ionicons.home_outline),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.hammer_outline),
            activeIcon: Icon(Ionicons.hammer),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.golf_outline),
            activeIcon: Icon(Ionicons.golf),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.grid_outline),
            activeIcon: Icon(Ionicons.grid),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
