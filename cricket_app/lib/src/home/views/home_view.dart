import 'package:shimmer/shimmer.dart';

import '../../../main.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cricket Score"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return Visibility(
            visible: !viewModel.isLoadingStatus,
            replacement: _buildLoadingShimmer(),
            child: _buildMatchList(context, viewModel),
          );
        },
      ),
    );
  }

  Widget _buildLoadingShimmer() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(.25),
            highlightColor: Colors.grey.withOpacity(.5),
            child: Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMatchList(BuildContext context, HomeViewModel viewModel) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(
          viewModel.matchDetailsResponses.length,
          (index) => MatchCard(
            matchTitle: "Match ${index + 1}",
            match: viewModel.matchDetailsResponses[index],
            onPressed: () => _navigateToMatchDetails(context, viewModel.matchDetailsResponses[index], index + 1),
          ),
        ),
      ),
    );
  }

  void _navigateToMatchDetails(BuildContext context, MatchDetailsResponse match, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          Provider.of<SquadViewModel>(context, listen: false).selectedTeam = "All";
          return MatchDetailsView(match: match, index: index);
        },
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final String matchTitle;
  final MatchDetailsResponse match;
  final VoidCallback onPressed;

  const MatchCard({
    Key? key,
    required this.matchTitle,
    required this.match,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          matchTitle,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TeamDetails(
                title: "Team A",
                teamName: match.teams?.teamA?.nameFull ?? "",
                subtitle: "Date & Time",
                detail: "${match.matchDetail?.match?.date ?? ""} ${match.matchDetail?.match?.time ?? ""}",
              ),
            ),
            const Text("V/S", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TeamDetails(
              title: "Team B",
              teamName: match.teams?.teamB?.nameFull ?? "",
              subtitle: "Venue",
              detail: match.matchDetail?.venue?.name ?? "",
              alignRight: true,
            ),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 0),
          onPressed: onPressed,
          child: const Text("Match Details"),
        ),
      ],
    );
  }
}

class TeamDetails extends StatelessWidget {
  final String title;
  final String teamName;
  final String subtitle;
  final String detail;
  final bool alignRight;

  const TeamDetails({
    Key? key,
    required this.title,
    required this.teamName,
    required this.subtitle,
    required this.detail,
    this.alignRight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(title, style: _kSubtitleStyle),
        Text(teamName, style: _kTitleStyle),
        const SizedBox(height: 8),
        Text(subtitle, style: _kSubtitleStyle),
        Text(detail, style: _kTitleStyle),
      ],
    );
  }
}

// Constants
const _kTitleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
const _kSubtitleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey);
