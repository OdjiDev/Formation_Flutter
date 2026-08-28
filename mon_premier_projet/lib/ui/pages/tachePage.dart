import 'package:flutter/material.dart';
import 'package:mon_premier_projet/models/tache_model.dart';
import 'package:mon_premier_projet/ui/widgets/main_drawer.dart';


class TachesPage extends StatefulWidget {
  const TachesPage({super.key});

  @override
  State<TachesPage> createState() => _TachesPageState();
}

class _TachesPageState extends State<TachesPage> {
  TextEditingController titreController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  List<TacheModel> taches = [
    TacheModel(titre: "Tache 1", description: "Tache 1 encours"),
    TacheModel(titre: "Tache 2", description: "Tache 2 encours")

  ];
  bool isUpdate = false;
  int tacheIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Taches"),),
         drawer: const MainDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/logo.png"),
            width: 100,
            height: 120,
            alignment: Alignment.center,
          ),
          Text("Gestion des taches"),
          Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: titreController,
                    decoration: InputDecoration(
                      labelText: "Titre",
                      hintText: "Entrez le titre de la tache"
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Entrez la description"
                    ),
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton.icon(
                      onPressed: (){
                        TacheModel tache = TacheModel(
                          titre: titreController.text,
                          description: descriptionController.text
                        );

                        if(isUpdate) {
                          taches[tacheIndex] = tache;
                          isUpdate = false;
                        } else {
                          taches.add(tache);
                        }
                        titreController.clear();
                        descriptionController.clear();
                        setState(() {
                        });
                      },
                      label: Text("Valider"), icon: Icon(Icons.check)
                  ),
                ],
              )
          ),
          Expanded(
            child: ListView.builder(
                itemCount: taches.length,
                itemBuilder: (BuildContext context, index) {
                  TacheModel tache = taches[index];
                  return ListTile(
                    title: Text(tache.titre),
                    subtitle: Text(tache.description ?? ""),
                    leading: Icon(Icons.task, size: 24, color: Colors.blue,),
                    trailing: Wrap(
                      spacing: 1,
                      children: [
                        IconButton(
                            onPressed: () {
                              isUpdate = true;
                              tacheIndex = index;
                              titreController.text = tache.titre;
                              descriptionController.text = tache.description ?? "";
                            },
                            icon: Icon(Icons.edit, size: 24, color: Colors.blue,)
                        ),
                        IconButton(
                            onPressed: () {
                              taches.removeAt(index);
                              setState(() {

                              });
                            },
                            icon: Icon(Icons.delete_forever, size: 24, color: Colors.red,)
                        ),
                      ],
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
