import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/main/bloc/user_bloc.dart';
import 'package:test_app/widgets/overflow_preloader.dart';

import 'bloc/main_bloc.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, this.folderId}) : super(key: key);
  final int? folderId;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainBloc mainBloc;
  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    mainBloc = context.read<MainBloc>();
    userBloc = context.read<UserBloc>();
    if (widget.folderId == null) {
      mainBloc.add(GetMyDocuments());
      userBloc.add(GetUser());
    } else {
      mainBloc.add(GetFolderById(widget.folderId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      bloc: mainBloc,
      listener: (context, state) {
        if (state is MainError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (state is GetFolderSucceed) {
              if (state.folder.current.parentId == 0) {
                await _logoutWindow(context);
              } else {
                Navigator.pushReplacementNamed(context, '/folder',
                    arguments: {"id": state.folder.current.parentId});
              }
            }
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(state is GetFolderSucceed
                  ? state.title
                  : state is MainError
                      ? "Возникла ошибка"
                      : state is MainLoading
                          ? "Loading"
                          : "Something Wrong"),
            ),
            body: OverlayPreloader(
              enablePreloader: state is MainLoading,
              child: state is GetFolderSucceed
                  ? ListView(
                      shrinkWrap: true,
                      children: [
                        state.folder.folders.length > 0
                            ? Text(
                                "Folders",
                                style: TextStyle(fontSize: 25),
                              )
                            : Wrap(),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.folder.folders.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(state.folder.folders[index].title),
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/folder', arguments: {
                                  'id': state.folder.folders[index].id
                                });
                              },
                            );
                          },
                        ),
                        state.folder.files.length > 0
                            ? Text(
                                "Files",
                                style: TextStyle(fontSize: 25),
                              )
                            : Wrap(),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.folder.files.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(state.folder.files[index].title),
                            );
                          },
                        ),
                      ],
                    )
                  : Wrap(),
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: BlocConsumer<UserBloc, UserState>(
                      bloc: userBloc,
                      listener: (context, state) {
                        if (state is UserError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)));
                        }
                      },
                      builder: (context, state) {
                        return state is UserSucceed
                            ? Row(
                                children: [
                                  Image.network(state.profile.avatar),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(state.profile.displayName),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(state.profile.email)
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : state is UserLoading
                                ? Row(children: [
                                    Image.network(
                                        "https://agzs164.ru/wp-content/uploads/2019/09/2816616767.jpg"),
                                    Column(
                                      children: [
                                        Text("loading"),
                                        Text("loading")
                                      ],
                                    )
                                  ])
                                : Text("Something Wrong");
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('My Documents'),
                    onTap: () {
                      mainBloc.add(GetMyDocuments());
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Common Documents'),
                    onTap: () {
                      mainBloc.add(GetCommonDocumets());
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  ListTile(
                    title: const Text('Logout'),
                    onTap: () async {
                      await _logoutWindow(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _logoutWindow(BuildContext context) async {
    var result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to log out of your account?"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    if (result != null && result) {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }
}
