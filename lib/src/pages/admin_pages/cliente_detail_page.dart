import 'package:flutter/material.dart';
import 'package:kosherparatodos/src/pages/admin_pages/provider/cliente_notifier.dart';
import 'package:provider/provider.dart';

class ClienteDetailPage extends StatelessWidget {

  @override
  Widget build(context) {
    ClienteNotifier cliente = Provider.of<ClienteNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(cliente.clienteActual.name),
      ),
      body: Center(
        child: Container(
          child: Text(cliente.clienteActual.email),
        ),),
    );
  }
}