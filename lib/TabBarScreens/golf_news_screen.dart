import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Models/sports_res_model.dart';
import 'package:weather_app/Repositories/repo.dart';
import 'package:weather_app/screens/MyWidgets/custom_widgets.dart';
import 'package:weather_app/screens/football_data_screen.dart';

class GolfNewsScreen extends ConsumerWidget {
  const GolfNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sportsProvider).when(
          data: (data) {
            if ((data.golf?.length ?? 0) == 0) {
              return const NoDataMessage();
            } else {
              return ListView.builder(
                  itemCount: data.golf?.length ?? 0,
                  itemBuilder: (ctx, index) {
                    Football football = (data.golf ?? [])[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => FootballDataScreen(element: football),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 18, left: 18, right: 18, top: index == 0 ? 18 : 0),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 12, spreadRadius: -5),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              football.match.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Start at : ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  football.start.toString(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
          error: (Object error, StackTrace? stackTrace) => Text("$error"),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
