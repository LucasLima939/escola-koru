import 'package:aula_03/blocs/home_bloc/home_bloc.dart';
import 'package:aula_03/blocs/home_bloc/home_event.dart';
import 'package:aula_03/blocs/home_bloc/home_state.dart';
import 'package:aula_03/entities/home_entities/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc = HomeBloc();

  @override
  void initState() {
    bloc.add(FetchChats());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'WhatsApp',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 20),
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          _buildTabs(),
          BlocBuilder<HomeBloc, HomeBlocState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                } else if (state is SuccessState) {
                  return _buildChat(state.chats);
                } else {
                  return Container();
                }
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget _buildChat(List<ChatModel> chats) => Expanded(
          child: RefreshIndicator(
        onRefresh: () async => bloc.add(FetchChats()),
        child: ListView(
          children: chats
              .map((chat) => ChatTile(
                  title: chat.name,
                  date: chat.date,
                  notifications: chat.notifications,
                  image: AssetImage(chat.profilePicture)))
              .toList(),
        ),
      ));

  Widget _buildTabs() => Container(
        color: Theme.of(context).colorScheme.primary,
        height: 40,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.camera_alt, color: Colors.white, size: 22)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 40,
                      width: 50,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.white, width: 2.0))),
                      child: const Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text('CHAT',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ))),
                  const Text('STATUS',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  const Text('CALLS',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      );
}
