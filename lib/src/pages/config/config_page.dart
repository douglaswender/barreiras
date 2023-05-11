import 'package:barreiras/src/pages/home/home_store.dart';
import 'package:barreiras/src/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final store = GetIt.I.get<HomeStore>();
  TextEditingController numberOfPlayersController = TextEditingController();
  TextEditingController maxWinStreakController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  FocusNode focus = FocusNode();

  @override
  void initState() {
    numberOfPlayersController =
        TextEditingController(text: store.numberOfPlayers.toString());
    maxWinStreakController =
        TextEditingController(text: store.maxWinStreak.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Barreiras'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Número de jogadores por barreira: '),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextFieldWidget(
                        textEditingController: numberOfPlayersController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty || value != '') {
                            store.setNumberOfPlayers(value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text('Número máximo de vitórias: '),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextFieldWidget(
                        textEditingController: maxWinStreakController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (value.isNotEmpty || value != '') {
                            store.setMaxWinStreak(value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () async {
                      await store.shuffleOthers();
                      Navigator.pop(context);
                    },
                    child: const Text('Embaralhar as barreiras'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () async {
                      await store.shuffleAll();
                      Navigator.pop(context);
                    },
                    child: const Text('Embaralhar todos'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () async {
                      await store.removeAll();
                      Navigator.pop(context);
                    },
                    child: const Text('Remover todos'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4,
                    ),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              focusNode: focus,
                              textEditingController: nameController,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                              height: double.maxFinite,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (nameController.text.trim() != '' ||
                                        nameController.text.isNotEmpty) {
                                      final response = await store
                                          .addName(nameController.text);

                                      if (!response) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.red,
                                            margin: EdgeInsets.only(
                                                bottom: 80,
                                                left: 16,
                                                right: 16),
                                            content: Text(
                                                'Já existe um jogador com este nome!'),
                                          ),
                                        );
                                      } else {
                                        nameController.clear();
                                      }
                                    }
                                  },
                                  child: const Text('Adicionar')))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Observer(builder: (_) {
                      return Text(
                        'Quantidade de jogadores: ${store.names.length}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      );
                    }),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Observer(builder: (_) {
                      return Text(
                        'Jogadores por barreira indicado: ${store.suggestedNumberOfPlayers}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      );
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
