import 'package:instajobs/constants/constants.dart';

class AddJobManager extends ChangeNotifier {
  bool _didSelectAddJob = false;
  int _selectedTab = -1;

  bool get didSelectAddJob => _didSelectAddJob;
  int get getSelectedTab => _selectedTab;

  void goToAddJob(bool selected) {
    _didSelectAddJob = selected;
    notifyListeners();
  }

  void goToTab(i) {
    _selectedTab = i;
    notifyListeners();
  }

  void goToIntroTab() {
    _selectedTab = AddJobTab.intro;
    notifyListeners();
  }

  void popAddJob() {
    _didSelectAddJob = false;
    _selectedTab = 0;
    notifyListeners();
  }
}
