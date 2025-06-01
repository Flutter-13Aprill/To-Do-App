import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'bloc/profile_bloc.dart';
import 'bloc/profile_event.dart';
import 'bloc/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();
    final imagePicker = ImagePicker();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final picked = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (picked != null) {
                      bloc.add(ImageChanged(picked.path));
                    }
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: state.imagePath.isNotEmpty
                        ? FileImage(File(state.imagePath)) as ImageProvider
                        : const AssetImage('assets/images/profile.png'),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  onChanged: (value) => bloc.add(UsernameChanged(value)),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: Colors.white),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white38),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  onChanged: (value) => bloc.add(PasswordChanged(value)),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.white),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white38),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 32),
                state.isSubmitting
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          bloc.add(ProfileSubmitted());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8875FF),
                        ),
                        child: const Text('Save'),
                      ),
                if (state.isSuccess)
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text(
                      'Saved successfully!',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
