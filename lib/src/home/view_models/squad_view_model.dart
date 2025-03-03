import '../../../main.dart';

class SquadViewModel extends ChangeNotifier {
  String selectedTeam = 'All';

  void setSelectedTeam(String? team) {
    if (team != null && selectedTeam != team) {
      selectedTeam = team;
      notifyListeners();
    }
  }

  String getPlayerDesignation(PlayerInfo player) {
    if (player.isCaptain == true && player.isKeeper == true) {
      return '(c & wk)';
    } else if (player.isCaptain == true) {
      return '(c)';
    } else if (player.isKeeper == true) {
      return '(wk)';
    }
    return '';
  }
}
