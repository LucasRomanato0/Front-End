import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: controller.contacts.length,
        itemBuilder: (_, index) {
          final model = controller.contacts[index];

          return ListTile(
            onTap: () => _confirmDelete(model),
            leading: CircleAvatar(
              child: Text(model.name?.substring(0, 2) ?? ''),
            ),
            title: Text(model.name ?? ''),
            subtitle: Text('${model.email} / ${model.phone}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var res = await Modular.to.pushNamed('/add');
          if (res == true) {
            getData();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _confirmDelete(UserDto dto) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Remover Contato"),
          content: Text("Deseja mesmo remover o ${dto.name ?? 'Contato'} "),
          actions: [
            ElevatedButton(
              onPressed: () async {
                var res = await controller.deleteData(dto.id);
                if (res.success) {
                  getData();
                }
                Modular.to.pop();
              },
              child: const Text("SIM"),
            ),
            OutlinedButton(
              onPressed: Modular.to.pop,
              child: const Text("Não"),
            ),
          ],
        );
      },
    );
  }
}
