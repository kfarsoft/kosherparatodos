// import 'package:flutter/material.dart';
// import 'package:kosherparatodos/src/pages/admin_pages/productos/new_producto.dart';
// import 'package:kosherparatodos/src/pages/admin_pages/productos/producto_detail_page.dart';
// import 'package:kosherparatodos/src/pages/admin_pages/provider/producto_notifier.dart';
// import 'package:provider/provider.dart';

// class ProductosPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProductoNotifier>(
//       builder: (context, producto, _) => Column(
//         children: <Widget>[
//           Expanded(
//             flex: 4,
//             child: ListView.separated(
//               itemBuilder: (BuildContext context, int index) => Dismissible(
//                 background: Container(
//                   color: Colors.red,
//                   alignment: AlignmentDirectional.centerStart,
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Icon(
//                     Icons.delete,
//                     color: Colors.white,
//                   ),
//                 ),
//                 key: Key(producto.productoList[index].productoID),
//                 confirmDismiss: (direction) => _deleteProducto(
//                     producto.productoList[index].productoID, context),
//                 child: ListTile(
//                   leading: Icon(Icons.list),
//                   title: Text(producto.productoList[index].descripcion),
//                   onTap: () {
//                     producto.productoActual = producto.productoList[index];
//                     _goToDetails(context);
//                   },
//                   trailing: Icon(Icons.arrow_forward),
//                 ),
//               ),
//               itemCount: producto.productoList.length,
//               separatorBuilder: (BuildContext context, int index) =>
//                   const Divider(
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//           Container(
//               margin: const EdgeInsets.all(10),
//               child: FloatingActionButton.extended(
//                 onPressed: () => _addProducto(context),
//                 label: const Text('Agregar producto'),
//                 backgroundColor: Theme.of(context).accentColor,
//               ))
//         ],
//       ),
//     );
//   }

//   Future<bool> _deleteProducto(String idPorducto, BuildContext context1) async {
//     return showDialog(
//       context: context1,
//       builder: (context) => AlertDialog(
//         content: Text("¿Esta seguro que desea cancelar el turno?"),
//         actions: <Widget>[
//           FlatButton(
//               child: Text("Si"),
//               onPressed: () {
//                 Provider.of<ProductoNotifier>(context1, listen: false)
//                     .deleteProducto(idPorducto);
//                 Navigator.of(context).pop(true);
//               }),
//           FlatButton(
//             onPressed: () {
//               Navigator.of(context).pop(false);
//             },
//             child: Text("No"),
//           ),
//         ],
//       ),
//     );
//   }

//   void _goToDetails(BuildContext context) {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => ProductoDetailPage()));
//   }

//   void _addProducto(BuildContext context) {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => NewProducto()));
//   }
// }
