import 'package:flutter/material.dart';
import 'package:kosherparatodos/src/Widget/title_text.dart';
import 'package:kosherparatodos/src/pages/admin_pages/provider/pedido_notifier.dart';
import 'package:provider/provider.dart';
import 'package:kosherparatodos/style/theme.dart' as MyTheme;

class PedidoDetailPage extends StatelessWidget {
  @override
  Widget build(context) {
    PedidoNotifier pedido = Provider.of<PedidoNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.Colors.dark,
        title: Text('Cliente: ' + pedido.pedidoActual.cliente.nombre),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: pedido.pedidoActual.productos == null
                ? Center(child: Text('No hay pedidos'))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: pedido.pedidoActual.productos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(pedido
                            .pedidoActual.productos[index].descripcion),
                        subtitle: Text('\$' +
                            pedido
                                .pedidoActual.productos[index].precio
                                .toString()),
                      );
                    },
                  ),
          ),
          Expanded(
            flex: 1,
            child: Divider(height: 5, color: Colors.grey,),
          ),
          Expanded(
            flex: 2,
            child: _getEstado(pedido),
          ),
          Expanded(
            flex: 2,
            child: _price(pedido),
          ),
        ],
      ),
    );
  }

  Widget _price(PedidoNotifier pedido) {
    return Container(
      decoration: BoxDecoration(color: MyTheme.Colors.dark),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
         TitleText(
                text: 'Cantidad:  ${pedido.pedidoActual.productos.length}',
                color: MyTheme.Colors.minLight,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
          TitleText(
            color: MyTheme.Colors.light,
            text: 'Total:  \$${pedido.pedidoActual.total}',
            fontSize: 18,
          ),
        ],
      ),
    );
  }
  Widget _getEstado(PedidoNotifier pedido) {
    return Container(
      decoration: BoxDecoration(color: MyTheme.Colors.minLight),
      padding: EdgeInsets.all(20),
      child: ListTile(
                 title: TitleText(
               text: pedido.pedidoActual.pagado == true
                   ? 'El pedido se encuentra Pagado'
                   : 'El pedido se encuentra No pagado',
               color: MyTheme.Colors.dark,
               fontSize: 14,
               fontWeight: FontWeight.w500,
             ),
             trailing: IconButton(icon: Icon(Icons.check_circle, color: pedido.pedidoActual.pagado == true ? Colors.green : Colors.red,), onPressed: ()=>_setPagado(pedido)),
      ),
    );
  }

  _setPagado(PedidoNotifier pedido){
    pedido.setPagado();
  }
}