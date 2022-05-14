import 'package:ache_facil/util/toasts/generic_toast.dart';

class ClassError {
  static void showFailureMessage(String mensagem) {
    GenericToast.show(mensagem);
  }
}
