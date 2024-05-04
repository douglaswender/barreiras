import 'package:barreiras/src/pages/config/config_page.dart';
import 'package:barreiras/src/pages/home/home_store.dart';
import 'package:barreiras/src/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = GetIt.I.get<HomeStore>();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberOfPlayersController =
      TextEditingController(text: '3');
  FocusNode focus = FocusNode();

  @override
  void initState() {
    store.loadLocal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Barreiras'),
          scrolledUnderElevation: 0,
          actions: [
            Observer(
              builder: (_) {
                if (store.history.isNotEmpty) {
                  return IconButton(
                      onPressed: () {
                        store.loadLastHistory();
                      },
                      icon: const Icon(Icons.undo));
                }
                return const SizedBox();
              },
            ),
            IconButton(
                onPressed: () async {
                  focus.unfocus();
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConfigPage()));
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                          ),
                          onPressed: () {
                            store.blueTeamOut();
                          },
                          child: const Text(
                            'azul sai',
                            style: TextStyle(color: Colors.white),
                          ))),
                  SizedBox(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {
                            store.allTeamOut();
                          },
                          child: const Text(
                            'sai os 2',
                            style: TextStyle(color: Colors.white),
                          ))),
                  SizedBox(
                      child: Observer(
                    builder: (_) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen),
                        onPressed: store.winStreak == store.maxWinStreak - 1
                            ? null
                            : () {
                                store.greenTeamOut();
                              },
                        child: const Text(
                          'verde sai',
                          style: TextStyle(color: Colors.white),
                        )),
                  ))
                ],
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  return Stack(
                    children: [
                      ListView.builder(
                        itemCount: store.names.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            tileColor: index < store.numberOfPlayers
                                ? Colors.blue
                                : index >= store.numberOfPlayers &&
                                        index < store.numberOfPlayers * 2
                                    ? Colors.lightGreen
                                    : Colors.red,
                            title: Text(
                              store.names[index],
                              style: index < store.numberOfPlayers * 2
                                  ? const TextStyle(
                                      color: Colors.black, fontSize: 36)
                                  : const TextStyle(
                                      color: Colors.black, fontSize: 18),
                            ),
                            onLongPress: () {
                              store.removeName(store.names[index]);
                            },
                            onTap: () {
                              showDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (context) {
                                  TextEditingController controller =
                                      TextEditingController(
                                          text: store.names[index]);
                                  return Scaffold(
                                    backgroundColor: Colors.transparent,
                                    body: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () => Navigator.pop(context),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: AlertDialog(
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Nome:'),
                                              TextFieldWidget(
                                                textEditingController:
                                                    controller,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                      onPressed: () async {
                                                        FocusScope.of(context)
                                                            .unfocus();

                                                        final response =
                                                            await store
                                                                .updatePlayer(
                                                                    controller
                                                                        .text,
                                                                    index);
                                                        if (!response) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                              behavior:
                                                                  SnackBarBehavior
                                                                      .floating,
                                                              backgroundColor:
                                                                  Colors.red,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          80,
                                                                      left: 16,
                                                                      right:
                                                                          16),
                                                              content: Text(
                                                                  'Já existe um jogador com este nome!'),
                                                            ),
                                                          );
                                                        } else {
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      },
                                                      child:
                                                          const Text('Salvar'))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Observer(
                            builder: (_) =>
                                Text('Vitórias: ${store.winStreak}')),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
