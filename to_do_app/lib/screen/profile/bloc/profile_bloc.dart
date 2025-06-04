import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  TextEditingController textController = TextEditingController();
  String name = "Aziz";
  File? image;
  Future pickImge() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    this.image = imageTemporary;
  }

  ProfileBloc() : super(ProfileInitial()) {
    on<ChnageName>(chnageNameMethod);
    on<UploadImgfromGallery>(uploadImgfromGalleryMethod);
  }

  FutureOr<void> chnageNameMethod(
    ChnageName event,
    Emitter<ProfileState> emit,
  ) {
    name = textController.text;
    emit(ChnageNamgeState());
  }

  FutureOr<void> uploadImgfromGalleryMethod(
    UploadImgfromGallery event,
    Emitter<ProfileState> emit,
  ) async {
    await pickImge();
    emit(SuccessUploadImg(image: image!));
  }
}
