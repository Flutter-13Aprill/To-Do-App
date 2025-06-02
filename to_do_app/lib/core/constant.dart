import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/auth/login/bloc/login_bloc.dart'as log;
import 'package:to_do_app/features/auth/registertion/bloc/registertion_bloc.dart' as reg;

String? usernameLoginCondition(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username is required';
  } else if (value.length < 3) {
    return 'Username should be more than 3 characters';
  }
  return null;
}
String? passwordLoginCondtion(String? value ) {
 if (value == null || value.isEmpty){
      return 'Password is required';
        }else if(value.length < 8 ) {
      return 'Password should be more than 8 character ';
        }

         
        return null;
}
String? usernameRegistertionCondition(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username is required';
  } else if (value.length < 3) {
    return 'Username should be more than 3 characters';
  }
  return null;
}
String? passwordRegistertionCondtion(String? value ) {
 if (value == null || value.isEmpty){
      return 'Password is required';
        }else if(value.length < 8 ) {
      return 'Password should be more than 8 character ';
        }

         
        return null;
}

 String? passwordConfrimRegistertionCondtion(String? value , TextEditingController controller) {
 if (value == null || value.isEmpty){
      return 'PasswordConfrim is required';
        }else if(value.length < 8 ) {
      return 'Password should be more than 8 character ';
        }else if(value != controller.text ) {
      return 'Confrim password should Match the Password ';
        }

         
        return null;
}
void usernameLoginOnChanged(String value, BuildContext context, TextEditingController controller, GlobalKey<FormState> key) {
  final bloc = context.read<log.LoginBloc>();

  if (value.isNotEmpty && controller.text.isNotEmpty) {
    if (value.length > 3 && controller.text.length >= 8) {
      if (key.currentState!.validate()) {
        bloc.add(log.ChangeEvent(true));
      } else {
        bloc.add(log.ChangeEvent(false));
      }
    } else {
      bloc.add(log.ChangeEvent(false));
    }
  } else {
    bloc.add(log.ChangeEvent(false));
  }
}
void passwordLoginOnChanged(String value, BuildContext context, TextEditingController controller, GlobalKey<FormState> key) {
  final bloc = context.read<log.LoginBloc>();

  if (value.isNotEmpty && controller.text.isNotEmpty) {
    if (value.length >= 8 && controller.text.length > 3) {
      if (key.currentState!.validate()) {
        bloc.add(log.ChangeEvent(true));
      } else {
        bloc.add(log.ChangeEvent(false));
      }
    } else {
      bloc.add(log.ChangeEvent(false));
    }
  } else {
    bloc.add(log.ChangeEvent(false));
  }
}
void usernameRegistertionOnChanged(String value, BuildContext context, TextEditingController controller,TextEditingController controller2, GlobalKey<FormState> key) {
  final bloc = context.read<reg.RegistertionBloc>();

   if (value.isNotEmpty && controller.text.isNotEmpty && controller2.text.isNotEmpty) {
    if (value.length > 3 && controller.text.length >= 8 && controller2.text.length >= 8) {
      if (controller.text == controller2.text) {
      if (key.currentState!.validate()) {
        bloc.add(reg.ChangeEvent(true));
      } else {
        bloc.add(reg.ChangeEvent(false));
      }
      }else {
      bloc.add(reg.ChangeEvent(false));
    }
    } else {
      bloc.add(reg.ChangeEvent(false));
    }
  } else {
    bloc.add(reg.ChangeEvent(false));
  }
}
void passwordRegistertionOnChanged(String value, BuildContext context, TextEditingController controller,TextEditingController controller2, GlobalKey<FormState> key) {
  final bloc = context.read<reg.RegistertionBloc>();

   if (value.isNotEmpty && controller.text.isNotEmpty && controller2.text.isNotEmpty) {
    if (value.length >= 8 && controller.text.length >= 3 && controller2.text.length >= 8) {
      if (value == controller2.text) {
      if (key.currentState!.validate()) {
        bloc.add(reg.ChangeEvent(true));
      } else {
        bloc.add(reg.ChangeEvent(false));
      }
      }else {
      bloc.add(reg.ChangeEvent(false));
    }
    } else {
      bloc.add(reg.ChangeEvent(false));
    }
  } else {
    bloc.add(reg.ChangeEvent(false));
  }
}
void passwordConfrimRegistertionOnChanged(String value, BuildContext context, TextEditingController controller,TextEditingController controller2, GlobalKey<FormState> key) {
  final bloc = context.read<reg.RegistertionBloc>();

  if (value.isNotEmpty && controller.text.isNotEmpty && controller2.text.isNotEmpty) {
    if (value.length >= 8 && controller.text.length >= 3 && controller2.text.length >= 8) {
      if (value == controller2.text) {
      if (key.currentState!.validate()) {
        bloc.add(reg.ChangeEvent(true));
      } else {
        bloc.add(reg.ChangeEvent(false));
      }
      }else {
      bloc.add(reg.ChangeEvent(false));
    }
    } else {
      bloc.add(reg.ChangeEvent(false));
    }
  } else {
    bloc.add(reg.ChangeEvent(false));
  }
}