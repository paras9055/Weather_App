import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Models/sports_res_model.dart';
import 'package:weather_app/Repositories/repo.dart';

class SportsScreen extends ConsumerWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sportsProvider).when(
          data: (data) => DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  "Sports",
                  style: TextStyle(color: Colors.black, fontSize: 28),
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                bottom: TabBar(
                  // indicatorSize: TabBarIndicatorSize.label,
                  // padding: EdgeInsets.all(26),
                  labelPadding: const EdgeInsets.symmetric(vertical: 8),
                  labelStyle: const TextStyle(fontSize: 16),
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(borderRadius: BorderRadius.circular(48), color: Colors.blue),
                  tabs: const [
                    Text("Footbal"),
                    Text("Creicket"),
                    Text("Golf"),
                  ],
                ),
              ),
              // body: TabBarView(children: []),
            ),
          ),
          error: (error, st) => Text("$error"),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );

    //   SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         const SizedBox(height: 40),
    //         const Text(
    //           "Football",
    //           style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    //         ),
    //         sportsCard(
    //           data: data,
    //           stadium: data.football?.elementAt(0).stadium.toString() ?? "",
    //           country: data.football?.elementAt(0).country.toString() ?? "",
    //           tournament: data.football?.elementAt(0).tournament.toString() ?? "",
    //           start: data.football?.elementAt(0).start.toString() ?? "",
    //           match: data.football?.elementAt(0).match.toString() ?? "",
    //         ),
    //         sportsCard(
    //           data: data,
    //           stadium: data.football?.elementAt(1).stadium.toString() ?? "",
    //           country: data.football?.elementAt(1).country.toString() ?? "",
    //           tournament: data.football?.elementAt(1).tournament.toString() ?? "",
    //           start: data.football?.elementAt(1).start.toString() ?? "",
    //           match: data.football?.elementAt(1).match.toString() ?? "",
    //         ),
    //         sportsCard(
    //           data: data,
    //           stadium: data.football?.elementAt(2).stadium.toString() ?? "",
    //           country: data.football?.elementAt(2).country.toString() ?? "",
    //           tournament: data.football?.elementAt(2).tournament.toString() ?? "",
    //           start: data.football?.elementAt(2).start.toString() ?? "",
    //           match: data.football?.elementAt(2).match.toString() ?? "",
    //         ),
    //         sportsCard(
    //           data: data,
    //           stadium: data.football?.elementAt(3).stadium.toString() ?? "",
    //           country: data.football?.elementAt(3).country.toString() ?? "",
    //           tournament: data.football?.elementAt(3).tournament.toString() ?? "",
    //           start: data.football?.elementAt(3).start.toString() ?? "",
    //           match: data.football?.elementAt(3).match.toString() ?? "",
    //         ),
    //         sportsCard(
    //           data: data,
    //           stadium: data.football?.elementAt(4).stadium.toString() ?? "",
    //           country: data.football?.elementAt(4).country.toString() ?? "",
    //           tournament: data.football?.elementAt(4).tournament.toString() ?? "",
    //           start: data.football?.elementAt(4).start.toString() ?? "",
    //           match: data.football?.elementAt(4).match.toString() ?? "",
    //         ),
    //         sportsCard(
    //           data: data,
    //           stadium: data.football?.elementAt(5).stadium.toString() ?? "",
    //           country: data.football?.elementAt(5).country.toString() ?? "",
    //           tournament: data.football?.elementAt(5).tournament.toString() ?? "",
    //           start: data.football?.elementAt(5).start.toString() ?? "",
    //           match: data.football?.elementAt(5).match.toString() ?? "",
    //         ),
    //         sportsCard(
    //           data: data,
    //           stadium: data.football?.elementAt(6).stadium.toString() ?? "",
    //           country: data.football?.elementAt(6).country.toString() ?? "",
    //           tournament: data.football?.elementAt(6).tournament.toString() ?? "",
    //           start: data.football?.elementAt(6).start.toString() ?? "",
    //           match: data.football?.elementAt(6).match.toString() ?? "",
    //         ),
    //         sportsCard(
    //           data: data,
    //           stadium: data.football?.elementAt(7).stadium.toString() ?? "",
    //           country: data.football?.elementAt(7).country.toString() ?? "",
    //           tournament: data.football?.elementAt(7).tournament.toString() ?? "",
    //           start: data.football?.elementAt(7).start.toString() ?? "",
    //           match: data.football?.elementAt(7).match.toString() ?? "",
    //         ),
    //         sportsCard(
    //           data: data,
    //           stadium: data.football?.elementAt(8).stadium.toString() ?? "",
    //           country: data.football?.elementAt(8).country.toString() ?? "",
    //           tournament: data.football?.elementAt(8).tournament.toString() ?? "",
    //           start: data.football?.elementAt(8).start.toString() ?? "",
    //           match: data.football?.elementAt(8).match.toString() ?? "",
    //         ),
    //         sportsCard(
    //           data: data,
    //           stadium: data.football?.elementAt(9).stadium.toString() ?? "",
    //           country: data.football?.elementAt(9).country.toString() ?? "",
    //           tournament: data.football?.elementAt(9).tournament.toString() ?? "",
    //           start: data.football?.elementAt(9).start.toString() ?? "",
    //           match: data.football?.elementAt(9).match.toString() ?? "",
    //         ),
    //         const Text(
    //           "Cricket",
    //           style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    //         ),
    //         sportsCard(
    //           data: data,
    //           stadium: data.cricket?.elementAt(0).stadium.toString() ?? "",
    //           country: data.cricket?.elementAt(0).country.toString() ?? "",
    //           tournament: data.cricket?.elementAt(0).tournament.toString() ?? "",
    //           start: data.cricket?.elementAt(0).start.toString() ?? "",
    //           match: data.cricket?.elementAt(0).match.toString() ?? "",
    //         ),
    //       ],
    //     ),
    //   ),
  }

  Widget sportsCard({
    required SportsResModel data,
    required String stadium,
    required String country,
    required String tournament,
    required String start,
    required String match,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 20, spreadRadius: -5)],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Stadium : ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(stadium),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Country : ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(country),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Tournament : ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Flexible(child: Text(tournament, maxLines: 1, textAlign: TextAlign.right))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Start : ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(start),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Match : ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(match),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
