import 'package:kosherparatodos/src/models/producto.dart';
import 'package:kosherparatodos/src/repository/firestore_provider.dart';
import 'package:kosherparatodos/src/repository/repo.dart';
import 'package:rxdart/rxdart.dart';

class ProductosFirebaseBloc {
  final Repository _repository = FirestoreProvider();

  final _productFirebaseList = PublishSubject<List<Producto>>();

  //Stream que maneja los productos de Firebase para agregar al pedido
  Observable<List<Producto>> get getProductosVigentes => _productFirebaseList.stream;
  Function(List<Producto>) get addProductosVigentes => _productFirebaseList.sink.add;

  List<Producto> list = List();
  List<ItemPedido> listOpciones = List();

//Me trae los productos de Firebase
  getProductosFirebase() {
    list.clear();
    _repository.getProductList().onData((doc) {
      for (int i = 0; i < doc.documents.length; i++) {
        Producto producto = Producto.fromGetProductos(doc.documents[i].data, doc.documents[i].documentID);
        list.add(producto);
      }
      addProductosVigentes(list);
    });
  }

  void dispose() async {
    await _productFirebaseList.drain();
    _productFirebaseList.close();
  }
}

final blocProductosFirebase = ProductosFirebaseBloc();