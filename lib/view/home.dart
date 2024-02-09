import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scud/controller/home_controller.dart';
import 'package:scud/widget/loading_shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: depend_on_referenced_packages
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  HomeController homeController = Get.put(HomeController());

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  _launchURL(String data) async {
    final Uri url = Uri.parse(data);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News App",
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          if (homeController.loading) {
            return Shimmerloader();
          }

          return SmartRefresher(
            controller: refreshController,
            onRefresh: () {
              homeController.fetchData();
              refreshController.refreshCompleted();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    //  height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeController.article?.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _launchURL("${homeController.article?[index].url}");
                          },
                          child: Container(
                              margin: const EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              //   color: Colors.grey,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 2.0,
                                      offset: const Offset(0.0, 3.0)),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "${homeController.article?[index].title}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Image.network(
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return const Center(
                                        child: CupertinoActivityIndicator(),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.error);
                                    },
                                    "${homeController.article?[index].urlToImage}",
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                      "${homeController.article?[index].description}"),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        "${homeController.article?[index].source?.name}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "-${DateFormat("dd-MMM-yyy hh:mm a").format(DateTime.parse("${homeController.article?[index].publishedAt}"))}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
