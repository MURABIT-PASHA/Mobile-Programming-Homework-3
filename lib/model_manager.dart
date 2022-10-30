import 'model.dart';

class ModelManager{
  List<Model> addedModels = [];
  getModel(){
    return addedModels;
  }
  addModel(int amount, String name, int id, Function function){
    Model newModel = Model(amount: amount, name: name, id: id, function: function,);
    addedModels.add(newModel);
  }
  deleteModel(int id){
    addedModels.removeWhere((element) => element.id == id);
  }
}