import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kosherparatodos/src/Widget/admin_widgets/field_widget.dart';
import 'package:kosherparatodos/src/Widget/admin_widgets/habilitado_widget.dart';
import 'package:kosherparatodos/src/Widget/show_toast.dart';
import 'package:kosherparatodos/src/Widget/title_text.dart';
import 'package:kosherparatodos/src/pages/admin_pages/provider/producto_notifier.dart';
import 'package:provider/provider.dart';
import 'package:kosherparatodos/style/theme.dart' as MyTheme;

class ProductoDetailPage extends StatelessWidget {
  TextEditingController _codigoController;
  TextEditingController _descripcionController;
  TextEditingController _stockController;
  TextEditingController _precioController;
  TextEditingController _umController;
  final String image;

  ProductoDetailPage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductoNotifier producto = Provider.of<ProductoNotifier>(context);
    _fillControllerData(producto);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(
                  color: MyTheme.Colors.black,
                  text: 'Detalle del producto',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                Column(
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(image),
                        radius: 40,
                      ),
                      onTap: () => null,
                    ),
                    Text("Imagen")
                  ],
                ),
              ],
            ),
          ),
          Field(
              controller: _descripcionController,
              isNum: false,
              description: "Descripcion"),
          Field(
            controller: _codigoController,
            isNum: false,
            description: 'Codigo',
          ),
          Field(
            controller: _umController,
            isNum: false,
            description: 'Unidad de medida',
          ),
          Field(
            controller: _stockController,
            isNum: true,
            description: 'Stock',
          ),
          Field(
              controller: _precioController,
              isNum: true,
              description: 'Precio unitario,'),
          EstadoHabilitado(),
          // _getEstado(context),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _updateAllData(context),
        label: const Text('Guardar'),
        backgroundColor: MyTheme.Colors.primary,
      ),
    );
  }

  // Widget _getEstado(BuildContext context) {
  //   final ProductoNotifier producto =
  //       Provider.of<ProductoNotifier>(context, listen: false);
  //   return ListTile(
  //     title: TitleText(
  //       text: producto.productoActual.habilitado == true
  //           ? 'Habilitado para el cliente'
  //           : 'Deshabilitado para el cliente',
  //       fontSize: 14,
  //       fontWeight: FontWeight.w500,
  //     ),
  //     leading: Switch(
  //         value: producto.productoActual.habilitado == true,
  //         onChanged: (val) => _setHabilitado(producto)),
  //   );
  // }

  void _updateAllData(BuildContext context) {
    try {
      Provider.of<ProductoNotifier>(context, listen: false).updateAllData();
      Navigator.pop(context);
      ShowToast().show('Listo!', 5);
    } catch (e) {
      ShowToast().show('Error!', 5);
    }
  }

  void _saveData(BuildContext contex, BuildContext context, String tipo,
      TextEditingController controller) {
    Provider.of<ProductoNotifier>(context, listen: false)
        .setData(tipo, controller.text);
    Navigator.pop(contex);
  }

  void _fillControllerData(ProductoNotifier producto) {
    _codigoController =
        TextEditingController(text: producto.productoActual.codigo);
    _descripcionController =
        TextEditingController(text: producto.productoActual.descripcion);
    _umController =
        TextEditingController(text: producto.productoActual.unidadMedida);
    _stockController =
        TextEditingController(text: producto.productoActual.stock.toString());
    _precioController =
        TextEditingController(text: producto.productoActual.precio.toString());
  }
}
