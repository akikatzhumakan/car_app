import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_bloc.dart';
import '../model/example_list.dart';
import 'util/story_circles.dart';
import 'storypage.dart';

class ExampleListPage extends StatefulWidget {
  const ExampleListPage({super.key});

  @override
  State<ExampleListPage> createState() => _ExampleListPageState();
}

class _ExampleListPageState extends State<ExampleListPage> {
  late ListBloc listBloc;
  List<ExampleList> exampleList = [];

  @override
  void initState() {
    listBloc = ListBloc();
    listBloc.add(FetchedListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('News'),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder(
        bloc: listBloc,
        builder: (context, state) {
          if (state is LoadingListState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is LoadedListState) {
            exampleList = state.exampleList;
            return SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return StoryCircle(
                        function: _openStory,
                      );
                    },
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: buildBody(),
                  ),
                )
              ]),
            );
          }
          if (state is FailureProfileState) {
            String error = state.e;
            return Center(
              child: Text(error),
            );
          }
          return Container();
        },
      ),
    );
  }

  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryPage(),
      ),
    );
  }

  Widget buildBody() {
    List<Widget> children = [];
    for (var item in exampleList) {
      children.add(
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.black,
          ),
          height: 120,
          width: 380,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  '${item.make ?? "NULL"} ${item.model ?? "NULL"} ${item.year}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Horsepower: ${item.horsepower} HP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Price: \$${item.price.toString()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Center(
      child: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }
}
