import 'dart:async';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:guideaut/core/failures.dart';
import 'package:guideaut/features/auth/domain/entities/enuns/user_roles.dart';
import 'package:guideaut/features/auth/domain/entities/user_entity.dart';

class AuthFirebaseDatasource {
  StreamSubscription<User?> Function(void Function(User?)?,
      {bool? cancelOnError,
      void Function()? onDone,
      Function? onError}) authStateChanges() {
    return FirebaseAuth.instance.authStateChanges().listen;
  }

  StreamSubscription<User?> Function(void Function(User?)?,
      {bool? cancelOnError,
      void Function()? onDone,
      Function? onError}) idTokenChanges() {
    return FirebaseAuth.instance.idTokenChanges().listen;
  }

  StreamSubscription<User?> Function(void Function(User?)?,
      {bool? cancelOnError,
      void Function()? onDone,
      Function? onError}) userChanges() {
    return FirebaseAuth.instance.userChanges().listen;
  }

  Future<UserEntity> signin(String email, String password) async {
    FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        final userRef = FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user?.uid);
        final userDoc = await userRef.get();
        if (userDoc.data() != null) {
          final data = userDoc.data();
          return UserEntity(
            email: data?['email'],
            photoUrl: data?['photoUrl'],
            firstName: data?['firstName'],
            lastName: data?['lastName'],
            role: UserRolesExtension.fromString(data?['role']),
          );
        }
      }

      throw UserNotFound();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFound();
      } else if (e.code == 'wrong-password') {
        throw WrongPassword();
      }

      throw UnknownFailure();
    }
  }

  Future<void> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw UnknownFailure();
    }
  }

  Future<void> createUser(String email, String password, UserRoles role) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        final userRef = FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user?.uid);
        await userRef.set({
          'email': email,
          'role': 'user', // Assign default role
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPassword();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyExists();
      }
    } catch (e) {
      throw UnknownFailure();
    }
  }

  Future<void> updateUser(UserEntity user) async {
    if (user.id != null) {
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(user.id);
      await userRef.set({
        'email': user.email,
        'photoUrl': user.photoUrl,
        'lastName': user.lastName,
        'role': user.role.nameStr,
      });
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw WeakPassword();
      } else if (e.code == "user-not-found") {
        throw UserNotFound();
      } else {
        throw UnknownFailure();
      }
    } catch (e) {
      throw UnknownFailure();
    }
  }

  Future<String> uploadProfilePicture(String userId, File file) async {
    // FileUploadInputElement uploadInput = FileUploadInputElement();
    // uploadInput.click();

    // FileUploadInputElement().click();

    //     .click()
    //     .then((input) => input.files.first);
    // final storageRef = FirebaseStorage.instance
    //     .ref('profile/${userId}/${file.name}');
    // // final uploadTask = storageRef.putFile(file);

    // uploadTask.snapshotEvents.listen((event) {
    //   final progress = (event.bytesTransferred / event.totalBytes) * 100;
    //   print('Upload progress: $progress%');
    // });

    // try {
    //   final snapshot = await uploadTask;
    //   final downloadUrl = await snapshot.ref.getDownloadURL();
    //   print('Profile picture uploaded successfully: $downloadUrl');

    //   // Update the user's profile picture URL in Firestore
    //   final userDoc =
    //       FirebaseFirestore.instance.collection('users').doc(user.uid);
    //   await userDoc.update({'photoUrl': downloadUrl});
    // } catch (e) {
    //   print('Profile picture upload failed: $e');
    // }

    return "";
  }

  Future<UserEntity?> getLoggedUser() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return Future(() => null);

    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    final userDoc = await userRef.get();
    if (userDoc.data() != null) {
      final data = userDoc.data();
      return UserEntity(
        id: user.uid,
        email: data?['email'],
        photoUrl: data?['photoUrl'],
        firstName: data?['firstName'],
        lastName: data?['lastName'],
        role: UserRolesExtension.fromString(data?['role']),
      );
    }
    return Future(() => null);
  }
}
