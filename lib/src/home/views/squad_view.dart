import '../../../main.dart';

class SquadView extends StatelessWidget {
  final MatchDetailsResponse match;

  const SquadView({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SquadViewModel>(
      builder: (context, squadViewModel, child) {
        return Column(
          children: [
            _buildTeamSelector(context, squadViewModel, match),
            const SizedBox(height: 8),
            Expanded(
              child: _buildPlayersListView(context, squadViewModel, match),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTeamSelector(BuildContext context, SquadViewModel squadViewModel, MatchDetailsResponse match) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          const Text(
            'Select Team:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: squadViewModel.selectedTeam,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: TextStyle(color: Colors.blue.shade800),
                  onChanged: squadViewModel.setSelectedTeam,
                  items: [
                    const DropdownMenuItem(value: 'All', child: Text('All Teams')),
                    DropdownMenuItem(
                      value: match.teams?.teamA?.nameShort ?? 'Team A',
                      child: Text(match.teams?.teamA?.nameFull ?? 'Team A'),
                    ),
                    DropdownMenuItem(
                      value: match.teams?.teamB?.nameShort ?? 'Team B',
                      child: Text(match.teams?.teamB?.nameFull ?? 'Team B'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayersListView(BuildContext context, SquadViewModel viewModel, MatchDetailsResponse match) {
    if (viewModel.selectedTeam == 'All') {
      return _buildTeamsListView(context, match);
    } else if (viewModel.selectedTeam == match.teams?.teamA?.nameShort) {
      return _buildSingleTeamView(context, match.teams?.teamA);
    } else if (viewModel.selectedTeam == match.teams?.teamB?.nameShort) {
      return _buildSingleTeamView(context, match.teams?.teamB);
    }

    return const Center(child: Text('No team selected'));
  }

  Widget _buildTeamsListView(BuildContext context, MatchDetailsResponse match) {
    return ListView(
      children: [
        if (match.teams?.teamA != null) _buildTeamSection(context, match.teams!.teamA!),
        if (match.teams?.teamB != null) _buildTeamSection(context, match.teams!.teamB!),
        if (match.teams?.teamA == null && match.teams?.teamB == null)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text('No team data available'),
            ),
          ),
      ],
    );
  }

  Widget _buildSingleTeamView(BuildContext context, Team? team) {
    if (team == null) {
      return const Center(child: Text('Team data not available'));
    }

    return ListView(
      children: [
        _buildTeamSection(context, team),
      ],
    );
  }

  Widget _buildTeamSection(BuildContext context, Team team) {
    final players = team.players;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            team.nameFull ?? "Unknown Team",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
        ),
        if (players != null && players.isNotEmpty)
          ...players.entries.map((entry) => _buildPlayerCard(context, entry.value)).toList()
        else
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('No players available for this team'),
          ),
      ],
    );
  }

  Widget _buildPlayerCard(BuildContext context, PlayerInfo player) {
    final viewModel = Provider.of<SquadViewModel>(context, listen: false);
    final playerDesignation = viewModel.getPlayerDesignation(player);

    return GestureDetector(
      onTap: () => _showPlayerDetailsDialog(context, player),
      child: CommonCard(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: Text(
                        player.position ?? '#',
                        style: const TextStyle(color: Colors.black87),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  player.nameFull ?? 'Unknown Player',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: (player.isCaptain == true || player.isKeeper == true)
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                              if (playerDesignation.isNotEmpty)
                                Text(
                                  ' $playerDesignation',
                                  style: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ],
      ),
    );
  }

  void _showPlayerDetailsDialog(BuildContext context, PlayerInfo player) {
    final battingStyle = player.batting?.style ?? 'Not specified';
    final bowlingStyle = player.bowling?.style ?? 'Not specified';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(player.nameFull ?? 'Player Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Batting Style: $battingStyle', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Bowling Style: $bowlingStyle', style: const TextStyle(fontSize: 16)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
