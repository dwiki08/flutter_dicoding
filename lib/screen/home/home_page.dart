import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/dropdown_flags.dart';
import 'package:dicoding_flutter/components/error_view.dart';
import 'package:dicoding_flutter/components/loading.dart';
import 'package:dicoding_flutter/components/story_card.dart';
import 'package:dicoding_flutter/data/model/story.dart';
import 'package:dicoding_flutter/providers/screen_reload_provider.dart';
import 'package:dicoding_flutter/providers/state/data_state.dart';
import 'package:dicoding_flutter/providers/story_provider.dart';
import 'package:dicoding_flutter/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.onLogout,
    required this.onDetailStory,
    required this.onAddStory,
    required this.onDialogLogout,
  });

  final Function(bool isLoggedIn) onLogout;
  final Function(String storyId) onDetailStory;
  final Function() onAddStory;
  final Function() onDialogLogout;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  ValueNotifier<bool> isNeedReload = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    final page = context.read<StoryProvider>().page;
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (page != 0) {
          getListStory();
        }
      }
    });
    Future.microtask(() async {
      isNeedReload.addListener(() {
        getListStory(reload: true);
      });
      getListStory();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  getListStory({bool? reload}) {
    context.read<StoryProvider>().getListStory(reload: reload);
  }

  appBar() {
    final localize = AppLocalizations.of(context)!;
    return AppBar(
      leading: null,
      actions: [
        const DropdownFlags(),
        const SizedBox(width: defaultPadding),
        IconButton(
          onPressed: () => widget.onDialogLogout(),
          icon: const Icon(Icons.logout),
          tooltip: localize.logout,
        ),
      ],
      title: const Text(appName),
    );
  }

  fab() {
    final localize = AppLocalizations.of(context)!;
    return FloatingActionButton(
      onPressed: () => widget.onAddStory(),
      tooltip: localize.addStory,
      child: const Icon(Icons.edit),
    );
  }

  @override
  Widget build(BuildContext context) {
    isNeedReload.value = context.watch<ScreenReloadProvider>().homeScreen;
    return Scaffold(
      appBar: appBar(),
      floatingActionButton: fab(),
      body: Consumer<StoryProvider>(builder: (context, state, child) {
        switch (state.state) {
          case DataState.isLoading:
            return const Loading();
          case DataState.error:
            return ErrorView(error: state.error);
          case DataState.hasData:
            final List<Story> list = state.list;
            return RefreshIndicator(
              onRefresh: () => getListStory(reload: true),
              child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                itemCount: list.length + (state.page != 0 ? 1 : 0),
                itemBuilder: (context, i) {
                  if (i == list.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      StoryCard(
                        story: list[i],
                        onCardTap: widget.onDetailStory,
                      ),
                    ],
                  );
                },
              ),
            );
          case DataState.noData:
            return Container();
        }
      }),
    );
  }
}
