import 'package:clean_arch/app/modules/home/domain/models/dto/user_dto.dart';
import 'package:clean_arch/app/modules/home/presentation/controllers/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddPage extends StatefulWidget {
  final UserDto? userDto;
  const AddPage({super.key, this.userDto});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final controller = Modular.get<AddController>();
  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.userDto != null) {
      _nameController.text = widget.userDto!.name ?? '';
      _emailController.text = widget.userDto!.email ?? '';
      _phoneController.text = widget.userDto!.phone ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.userDto == null ? 'Novo Contato' : 'Alterar Contato',
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nome Completo'),
              TextFormField(
                controller: _nameController,
                validator: (v) {
                  if (v!.isEmpty) return 'required';
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Renan Zika',
                ),
              ),
              const SizedBox(height: 10),
              //
              const Text('E-mail'),
              TextFormField(
                controller: _emailController,
                validator: (v) {
                  if (v!.isEmpty) return 'required';
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'renanzika99@uol.com',
                ),
              ),
              const SizedBox(height: 10),
              //
              const Text('Telefone'),
              TextFormField(
                controller: _phoneController,
                validator: (v) {
                  if (v!.isEmpty) return 'required';
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: '(11) 99999-9999',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    // add
                    if (widget.userDto == null) {
                      var res = await controller.addContact(
                        UserDto(
                          name: _nameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                        ),
                      );

                      if (res.success) {
                        await alertMessage('Contato adicionado!');
                        Modular.to.pop();
                        Modular.to.pop(true); // Refresh list
                      } else {
                        await alertMessage(
                          res.message ?? 'ERROR',
                        );
                      }
                    } else {
                      // update
                      var res = await controller.editContact(
                        UserDto(
                          id: widget.userDto!.id,
                          name: _nameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                        ),
                      );

                      if (res.success) {
                        await alertMessage('Contato alterado!');
                        Modular.to.pop();
                        Modular.to.pop(true); // Refresh list
                      } else {
                        await alertMessage(
                          res.message ?? 'ERROR',
                        );
                      }
                    }
                  }
                },
                child: Text(widget.userDto == null ? 'Salvar' : 'Alterar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future alertMessage(String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Aviso"),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Modular.to.pop(),
              child: const Text("Fechar"),
            ),
          ],
        );
      },
    );
  }
}
