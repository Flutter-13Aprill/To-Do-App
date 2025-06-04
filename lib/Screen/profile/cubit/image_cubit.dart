import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageCubit extends Cubit<File?> {
  ProfileImageCubit() : super(null);

  final ImagePicker picker = ImagePicker();

  Future<void> pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) emit(File(image.path));
  }

  Future<void> pickFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) emit(File(image.path));
  }
}