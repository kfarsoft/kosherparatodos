import 'package:flutter/material.dart';
import 'package:kosherparatodos/src/Widget/export.dart';
import 'package:kosherparatodos/src/pages/admin_pages/pedidos/pedido_detail_page.dart';
import 'package:kosherparatodos/src/pages/admin_pages/provider/pedido_notifier.dart';
import 'package:kosherparatodos/src/utils/converter.dart';
import 'package:provider/provider.dart';

class PedidosListPage extends StatelessWidget {
  const PedidosListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PedidoNotifier>(
      builder: (context, pedido, _) => ListView.builder(
        itemBuilder: (BuildContext context, int index) => PedidoCardWidget(
          estado: Convert.enumEntregaToString(
              pedido.pedidoList[index].estadoEntrega),
          action: () {
            pedido.pedidoActual = pedido.pedidoList[index];
            _goToDetails(context);
          },
          pagado: pedido.pedidoList[index].pagado,
          title:
              '${pedido.pedidoList[index].cliente.nombre.nombre} ${pedido.pedidoList[index].cliente.nombre.apellido}',
          subtitle: 'Total: \$${pedido.pedidoList[index].total.truncate()}',
        ),
        itemCount: pedido.pedidoList.length,
      ),
    );
  }

  void _goToDetails(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PedidoDetailPage()));
  }
}