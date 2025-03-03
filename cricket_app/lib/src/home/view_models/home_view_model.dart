import '../../../main.dart';

class HomeViewModel extends ChangeNotifier {
  List<MatchDetailsResponse> matchDetailsResponses = [];
  bool isLoading = false;
  bool get isLoadingStatus => isLoading;

  List<String> urls = [
    "https://demo.sportz.io/nzin01312019187360.json",
    "https://demo.sportz.io/sapk01222019186652.json"
  ];

  Future fetchMatchData(BuildContext context) async {
    isLoading = true;
    try {
      matchDetailsResponses = await Future.wait(urls.map((url) async {
        final response = await NetworkService().prepareRequest().get(url);
        return MatchDetailsResponse.fromJson(response.data);
      }));
    } catch (e) {
      debugPrint("Error fetching match data: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to fetch match data")));
    }
    isLoading = false;
    notifyListeners();
  }

  void loadData(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    fetchMatchData(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }
}
