import 'package:contact_bloc/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactsRepository {
  Future<List<ContactModel>> findAll() async {
    final response = await Dio().get('http://localhost:3031/contacts');

    return response.data
        ?.map<ContactModel>((contact) => ContactModel.fromMap(contact))
        .toList();
  }

  Future<void> create(ContactModel model) async {
    Dio().post(
      'http://127.0.0.0:3031/contacts',
      data: model.toMap(),
    );
  }

  Future<void> update(ContactModel model) async {
    Dio().put(
      'http://127.0.0.0:3031/contacts/${model.id}',
      data: model.toMap(),
    );
  }

  Future<void> delete(ContactModel model) async {
    Dio().delete('http://127.0.0.0:3031/contacts/${model.id}');
  }
}
