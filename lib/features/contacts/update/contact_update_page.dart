import 'package:contact_bloc/features/contacts/update/bloc/bloc/contact_update_bloc.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/loader.dart';

class ContactUpdatePage extends StatefulWidget {
  final ContactModel contactModel;

  const ContactUpdatePage({
    super.key,
    required this.contactModel,
  });

  @override
  State<ContactUpdatePage> createState() => _ContactUpdatePageState();
}

class _ContactUpdatePageState extends State<ContactUpdatePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameEC;
  late final TextEditingController _emailEC;

  @override
  void initState() {
    _nameEC = TextEditingController(text: widget.contactModel.name);
    _emailEC = TextEditingController(text: widget.contactModel.email);
    super.initState();
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updade contact'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _nameEC,
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome obrigatorio';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailEC,
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'E-mail obrigatorio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final validate = _formKey.currentState?.validate() ?? false;

                  if (validate) {
                    context.read<ContactUpdateBloc>().add(
                          ContactUpdateEvent.save(
                            id: widget.contactModel.id!,
                            name: _nameEC.text,
                            email: _emailEC.text,
                          ),
                        );
                  }
                },
                child: const Text('Salvar'),
              ),
              Loader<ContactUpdateBloc, ContactUpdateState>(
                selector: (state) {
                  return state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
