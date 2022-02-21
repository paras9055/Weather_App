import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Provider/provider.dart';
import 'package:weather_app/Repositories/repo.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FocusScope.of(context).requestFocus(FocusNode());

    DateTime now = DateTime.now();
    String formattedDate = DateFormat("dd-MM-yyyy").format(now);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.search,
              onEditingComplete: () => ref.read(homeProvider).onSearchPressed(),
              controller: ref.read(homeProvider).textFieldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: "Search your city",
                suffixIcon: IconButton(
                  onPressed: () => ref.read(homeProvider).onSearchPressed(),
                  icon: const Icon(CupertinoIcons.search),
                ),
              ),
            ),
            const SizedBox(height: 18),
            ref.watch(weatherSearcProvider).when(
                  data: (data) {
                    return Column(
                      children: [
                        Text(
                          (data.location?.name ?? '') + " Temperature",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const SizedBox(height: 22),
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 12, spreadRadius: -5),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.cloud_outlined, size: 140),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(formattedDate, style: const TextStyle(fontSize: 20)),
                                      const SizedBox(height: 8),
                                      Text(
                                        (data.current?.tempC?.ceil() ?? "").toString() + " \u2103",
                                        style: const TextStyle(color: Colors.black, fontSize: 40),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        (data.current?.tempF?.ceil() ?? "").toString() + " \u2109",
                                        style: const TextStyle(color: Colors.grey, fontSize: 26),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Humidity"),
                                      Row(
                                        children: [
                                          Text(data.current?.humidity.toString() ?? ""),
                                          const Text("%"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Uv Index"),
                                      Text(data.current?.uv.toString() ?? ""),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Wind Speed"),
                                      Row(
                                        children: [
                                          Text(data.current?.windKph.toString() ?? ""),
                                          const Text(" Kph"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Rain Probabilty"),
                                      Row(
                                        children: [
                                          Text(data.current?.cloud.toString() ?? ""),
                                          const Text("%"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Pressure"),
                                      Row(
                                        children: [
                                          Text(data.current?.pressureIn.toString() ?? ""),
                                          const SizedBox(width: 2),
                                          const Text("Pa"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  error: (error, st) => Text('$error'),
                  loading: () => const CircularProgressIndicator(),
                ),
          ],
        ),
      ),
    );
  }
}
