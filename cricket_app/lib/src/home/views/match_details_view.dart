import '../../../main.dart';

class MatchDetailsView extends StatefulWidget {
  final MatchDetailsResponse match;
  final int index;

  const MatchDetailsView({Key? key, required this.match, required this.index}) : super(key: key);

  @override
  State<MatchDetailsView> createState() => _MatchDetailsViewState();
}

class _MatchDetailsViewState extends State<MatchDetailsView> with TickerProviderStateMixin {
  late TabController _mainTabController;
  late TabController _inningsTabController;

  @override
  void initState() {
    super.initState();
    _mainTabController = TabController(length: 2, vsync: this);
    _inningsTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _mainTabController.dispose();
    _inningsTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildMatchInfoCard(),
            Expanded(
              child: TabBarView(
                controller: _mainTabController,
                children: [
                  _buildInningsTab(),
                  SquadView(match: widget.match),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Match Details'),
      elevation: 0,
      bottom: TabBar(
        controller: _mainTabController,
        tabs: const [
          Tab(text: 'SCORECARD'),
          Tab(text: 'SQUADS'),
        ],
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.white,
      ),
    );
  }

  Widget _buildMatchInfoCard() {
    final teamA = widget.match.teams?.teamA;
    final teamB = widget.match.teams?.teamB;
    final matchDetail = widget.match.matchDetail;

    return CommonCard(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildMatchDetails(matchDetail),
        _buildTeamScores(teamA, teamB),
        const SizedBox(height: 8),
        Text(
          matchDetail?.result ?? "",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildMatchDetails(MatchDetail? matchDetail) {
    return Column(
      children: [
        Text(
          matchDetail?.series?.name ?? "",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          matchDetail?.venue?.name ?? "",
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Text(
          "${matchDetail?.match?.date ?? ""} ${matchDetail?.match?.time ?? ""}",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildTeamScores(Team? teamA, Team? teamB) {
    final innings = widget.match.innings;

    if (innings == null || innings.isEmpty) {
      return const Center(child: Text("No innings data available"));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTeamScore(teamA, innings.isNotEmpty ? innings[0] : null),
        _buildTeamScore(teamB, innings.length > 1 ? innings[1] : null),
      ],
    );
  }

  Widget _buildTeamScore(Team? team, Innings? innings) {
    if (team == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Text(
          team.nameFull ?? "",
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Text(
          innings != null ? "${innings.total ?? 0}/${innings.wickets ?? 0}" : "-/-",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildInningsTab() {
    final teamA = widget.match.teams?.teamA;
    final teamB = widget.match.teams?.teamB;

    return Column(
      children: [
        TabBar(
          controller: _inningsTabController,
          tabs: [
            Tab(text: teamA?.nameFull ?? "Team A"),
            Tab(text: teamB?.nameFull ?? "Team B"),
          ],
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.blue,
        ),
        const SizedBox(height: 12),
        Expanded(
          child: TabBarView(
            controller: _inningsTabController,
            children: [
              _buildInningsCard(0, teamA?.nameFull ?? "Team A"),
              _buildInningsCard(1, teamB?.nameFull ?? "Team B"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInningsCard(int index, String teamName) {
    return SingleChildScrollView(
      child: CommonCard(
        children: [
          Text(
            teamName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBattingTable(index),
              const SizedBox(height: 16),
              _buildBowlingTable(index),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBattingTable(int inningsIndex) {
    final innings = widget.match.innings;

    if (innings == null || inningsIndex >= innings.length) {
      return const Text("No innings data available");
    }

    final currentInnings = innings[inningsIndex];
    final batsmen = currentInnings.batsmen;

    if (batsmen == null || batsmen.isEmpty) {
      return const Text("No batting data available");
    }

    const columnTitles = ['Batter', 'R', 'B', '4s', '6s', 'SR'];

    final isTeamABatting = inningsIndex % 2 == 0;
    final players = isTeamABatting ? widget.match.teams?.teamA?.players : widget.match.teams?.teamB?.players;

    final rowData = batsmen.map((item) {
      final playerName = players?[item.batsman]?.nameFull ?? "Unknown";
      return [
        playerName,
        item.runs ?? "",
        item.balls ?? "",
        item.fours ?? "",
        item.sixes ?? "",
        item.strikeRate ?? "",
      ];
    }).toList();

    return _buildTableSection("Batting", columnTitles, rowData);
  }

  Widget _buildBowlingTable(int inningsIndex) {
    final innings = widget.match.innings;

    if (innings == null || inningsIndex >= innings.length) {
      return const Text("No innings data available");
    }

    final currentInnings = innings[inningsIndex];
    final bowlers = currentInnings.bowlers;

    if (bowlers == null || bowlers.isEmpty) {
      return const Text("No bowling data available");
    }

    const columnTitles = ['Bowler', 'O', 'M', 'R', 'W', 'Econ'];

    final isTeamABatting = inningsIndex % 2 == 0;
    final players = isTeamABatting ? widget.match.teams?.teamB?.players : widget.match.teams?.teamA?.players;

    final rowData = bowlers.map((item) {
      final playerName = players?[item.bowler]?.nameFull ?? "Unknown";
      return [
        playerName,
        item.overs ?? "",
        item.maidens ?? "",
        item.runs ?? "",
        item.wickets ?? "",
        item.economyRate ?? "",
      ];
    }).toList();

    return _buildTableSection("Bowling", columnTitles, rowData);
  }

  Widget _buildTableSection(String title, List<String> columnTitles, List<List<String>> rowData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildDataTable(columnTitles: columnTitles, rowData: rowData),
      ],
    );
  }

  Widget _buildDataTable({
    required List<String> columnTitles,
    required List<List<String>> rowData,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 16,
        headingRowHeight: 32,
        columns: columnTitles.map((title) => DataColumn(label: Text(title))).toList(),
        rows: rowData.map((row) {
          return DataRow(
            cells: row.map((cell) => DataCell(Text(cell))).toList(),
          );
        }).toList(),
      ),
    );
  }
}
