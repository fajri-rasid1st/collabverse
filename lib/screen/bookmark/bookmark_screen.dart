  import 'package:collabverse/provider/bookmark/data_list_provider.dart';
  import 'package:collabverse/screen/bookmark/bookmark_card_widget.dart';
  import 'package:collabverse/static/data_list_result_state.dart';
  import 'package:collabverse/static/navigation_route.dart';
  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';

  class BookmarkScreen extends StatefulWidget{
    const BookmarkScreen({super.key});

    @override
    State<BookmarkScreen> createState() => _BookmarkScreenState();
  }

  class _BookmarkScreenState extends State<BookmarkScreen>{
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: const Text("Bookmark"),
          // Bookmark dimunculkan sebelah kiri
          // Disebelah kanan ada button search
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // showSearchBar(context);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<DataListProvider>(
                builder: (context, value, child){
                  return switch (value.resultState){
                    DataListLoadingState() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    DataListLoadedState(data : var dataList) =>
                      ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index){
                          final data = dataList[index];
                          return DataCard(
                            data : data,
                            onTap: (){
                              Navigator.pushNamed(
                                context,
                                NavigationRoute.detailRoute.name,
                                arguments: data.uuid,
                              );
                            }
                          );
                        },
                      ),
                    DataListErrorState(error: var message) =>
                        Center(child: Text(message)),
                    _ => const SizedBox(),
                  };
                }
              )
            )
          ],
        ),
      );
    }
  }