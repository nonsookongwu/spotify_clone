
// ignore: avoid_types_as_parameter_names
abstract class UseCase<Type,Params>{

  Future<Type> executeFunction({required Params params});
}


// where Type is the interface of the output and params is the interface of the input

abstract class SongsUseCase<outPutType>{

  Future<outPutType> executeFunctionWithoutArguments();
}