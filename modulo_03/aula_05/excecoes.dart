class Http {
  Future<List> get() => Future<List>.error(Exception('Error'));
}

void main(){
  final http = Http();
  Future<List> chamadaInternet() async {
    try {
      final result = await http.get();
      return result;
    } on Exception catch (e){
      print(e);
      throw e; //rethrow
    } catch (e){
      print(e);
      throw e; //rethrow
    } finally {
      print('terminou');
    }
  }

  chamadaInternet();
}