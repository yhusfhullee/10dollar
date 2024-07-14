import 'dart:async';
import 'dart:io' as io;
import 'package:appwrite/models.dart';
import "package:flutter/material.dart";
import 'package:appwrite/appwrite.dart' as a;
import 'package:provider/provider.dart';
import 'package:tendollarapp/features/sign_in_out/screens/login_screen.dart';
import 'package:tendollarapp/models/model.dart';
import 'package:tendollarapp/repository/stoorage.dart';
import 'package:tendollarapp/provider/secure_storage.dart';
import 'package:tendollarapp/enum/notificton_type_enum.dart';
import 'package:tendollarapp/models/userModel.dart' as model;
import 'package:tendollarapp/provider/appwrite_provider.dart';
import 'package:tendollarapp/repository/notification_api.dart';
import 'package:tendollarapp/features/auth/controller/ShowSnackBar.dart';
import '../core/constants/constant.dart';
import '../features/sign_in_out/forgetten_password/forgetVerifi.dart';
import '../provider/all_user_provider.dart';

// ignore_for_file: unnecessary_null_comparison

class AuthService {
  static final a.Account auth = AppWriteProvider().getaccount;
  static final a.Databases db = AppWriteProvider().getDatabases;
  static final a.Realtime _realtime = AppWriteProvider().getReatime;

  //Sign Up user
  static Future<Session?> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    // io.File? file,
  }) async {
    try {
      // register user
      var res = await auth.create(
        userId: a.ID.unique(),
        email: email,
        password: password,
      );
      await SecureStorage.saveId(res.$id);

      Session session = await auth.createEmailPasswordSession(
          email: email, password: password);

      await SecureStorage.saveSession(session.toString());
      await emailVerify(context: context, email: email, name: "User");
      return session;
    } on a.AppwriteException catch (e) {
      ShowSnackBar(context, e.message!);

      return null;
    }
  }

  static Future<UserModel?> creatNewUser({
    required String password,
    required String email,
    required String id,
    // io.File? file,
  }) async {
    try {
      model.UserModel user = model.UserModel(
          firebaseToken: '',
          isAdmin: false,
          userBalance: 0,
          accountName: "",
          accountNumber: "",
          bankName: "",
          email: email,
          photoUrl:
              'https://cloud.appwrite.io/v1/storage/buckets/64502ac8c4b8657c34ff/files/64ee5253802e49c22f6b/view?project=641cad6f2169798a4400&mode=admin',
          username: 'username',
          password: password,
          uid: id,
          musicbio: "musicbio",
          isVerified: false,
          followers: [],
          following: [],
          stacks: []);

      var u = await db.createDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.userdatabaseId,
          documentId: id,
          data: user.toMap());

      UserModel userModel = UserModel.fromMap(u.data);

      return userModel;
    } on a.AppwriteException catch (e) {
      Get.snackbar("${e.type}", e.message!);
      return null;
    }
  }

  static Future<UserModel?> UpdateUsernameUser({
    required BuildContext context,
    required String userName,
    required String bio,

    // io.File? file,
  }) async {
    try {
      var id = await SecureStorage.getId();

      if (id != null) {
        var u = await db.updateDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.userdatabaseId,
            documentId: id,
            data: {
              "username": userName,
              "musicbio": bio,
            });

        UserModel userModel = UserModel.fromMap(u.data);

        return userModel;
      }
      return null;
    } on a.AppwriteException catch (e) {
      ShowSnackBar(context, e.message!);
      return null;
    }
  }

  static Future<UserModel?> editPofile({
    required UserModel userModel,
    required BuildContext context,
    required String userName,
    required String bio,
    io.File? file,
    required String accountName,
    required String accountNumber,
    required String bankName,
  }) async {
    try {
      if (file == null) {
        var id = await SecureStorage.getId();
        var user = await db.updateDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.userdatabaseId,
            documentId: id!,
            data: userModel
                .copyWith(
                  username: userName,
                  musicbio: bio,
                  accountName: accountName,
                  accountNumber: accountNumber,
                  bankName: bankName,
                )
                .toMap());
        print('it is not null');
        return UserModel.fromMap(user.data);
      } else {
        print('it is null');
        String photoUrl =
            await StoraageMethod().uploadFileTostorage(file, false);
        print(photoUrl);
        var id = await SecureStorage.getId();
        var user = await db.updateDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.userdatabaseId,
            documentId: id!,
            data: userModel
                .copyWith(
                  username: userName,
                  musicbio: bio,
                  accountName: accountName,
                  accountNumber: accountNumber,
                  bankName: bankName,
                  photoUrl: photoUrl,
                )
                .toMap());
        return UserModel.fromMap(user.data);
      }
    } on a.AppwriteException catch (e) {
      ShowSnackBar(context, e.message!);
      return null;
    }
  }

  static Future<UserModel?> updateImage({
    required BuildContext context,
    required String uid,
    io.File? file,
  }) async {
    try {
      String photoUrl =
          await StoraageMethod().uploadFileTostorage(file!, false);

      var user = await db.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.userdatabaseId,
          documentId: uid,
          data: {
            "photoUrl": photoUrl,
          });
      return UserModel.fromMap(user.data);
    } on a.AppwriteException catch (e) {
      ShowSnackBar(context, e.message!);
      return null;
    }
  }

  static Future oAuthProvider(
    BuildContext context,
    String provider,
  ) async {
    try {
      // await auth.createOAuth2Session(
      //   provider: ,
      // );
      var res = await auth.get();

      ;
      ShowSnackBar(context, "E-mail verification has been sent");
      return res;
    } on a.AppwriteException catch (e) {
      ShowSnackBar(context, e.message!);
    }
  }

  static Future<bool> emailVerify({
    required BuildContext context,
    required String email,
    required String name,
  }) async {
    try {
      return false;
    } on a.AppwriteException catch (e) {
      ShowSnackBar(context, e.message!);
      rethrow;
    } catch (e) {
      ShowSnackBar(context, e.toString());
      return false;
    }
  }

  static Future<User?> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      Session res = await auth.createEmailPasswordSession(
          email: email, password: password);
      await SecureStorage.saveId(res.userId);
      if (res != null) {
        await SecureStorage.saveSession(res.toString());
        User account = await auth.get();

        if (account.emailVerification == false) {
          await emailVerify(context: context, email: email, name: "User");
        }
        return account;
      }
      return null;
    } on a.AppwriteException catch (e) {
      ShowSnackBar(context, e.message!);
      return null;
    }
  }

  static Future<model.UserModel> getCurrentetails() async {
    try {
      var id = await SecureStorage.getId();
      Document snap = await db.getDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.userdatabaseId,
          documentId: id!);

      model.UserModel user = model.UserModel.fromMap(snap.data);

      return user;
    } on a.AppwriteException catch (e) {
      if (e.code == 404) {
        SecureStorage.delecteId();
      }
      rethrow;
    }
  }

  static Future<model.UserModel> getUserDetails(String id) async {
    Document snap = await db.getDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.userdatabaseId,
        documentId: id);

    model.UserModel user = model.UserModel.fromMap(snap.data);
    return user;
  }

  static Future<List<model.UserModel>> getAllUser() async {
    DocumentList snap = await db.listDocuments(
      databaseId: AppWriteConstants.databaseId,
      collectionId: AppWriteConstants.userdatabaseId,
      queries: [
        a.Query.orderDesc(
          "\$createdAt",
        ),
      ],
    );

    return snap.documents.map(
      (user) {
        return model.UserModel.fromMap(user.data);
      },
    ).toList();
  }

  static Future verifyUser({required model.UserModel usermodel}) async {
    try {
      bool verify = usermodel.isVerified;
      if (usermodel.isVerified) {
        verify = false;
      } else {
        verify = true;
      }
      var user = usermodel.copyWith(isVerified: verify);

      await db.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.userdatabaseId,
          documentId: usermodel.uid,
          data: user.toMap());
    } catch (e) {}
  }

  static Future followUser({
    required model.UserModel frendModel,
    required model.UserModel usermodel,
  }) async {
    try {
      List frendtoFollow = usermodel.following;
      List theFolower = frendModel.followers;

      if (frendtoFollow.contains(frendModel.uid) &&
          theFolower.contains(usermodel.uid)) {
        frendtoFollow.remove(frendModel.uid);
        theFolower.remove(usermodel.uid);
      } else {
        frendtoFollow.add(frendModel.uid);
        theFolower.add(usermodel.uid);
      }

      await db.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.userdatabaseId,
          documentId: usermodel.uid,
          data: {"following": frendtoFollow});

      await db.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.userdatabaseId,
          documentId: frendModel.uid,
          data: {"followers": theFolower});
      if (theFolower.contains(usermodel.uid)) {
        NotificationApi.addnotification(
            text: "${usermodel.username} follow you",
            uid: frendModel.uid,
            postId: usermodel.uid,
            notificationType: NotificationType.follow);
      } else {
        NotificationApi.addnotification(
            text: "${usermodel.username} unfollow you",
            uid: frendModel.uid,
            postId: usermodel.uid,
            notificationType: NotificationType.follow);
      }
    } catch (e) {}
  }

  static Future addMoneyUserPayment(
      {required int amountPaid, required model.UserModel userModel}) async {
    int userBalance = userModel.userBalance;
    int newBalance = userBalance + amountPaid;
    await db.updateDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.userdatabaseId,
        documentId: userModel.uid,
        data: {"userBalance": newBalance});
  }

  static Future updateUserBank({
    required model.UserModel userModel,
    required String accountName,
    required String accountNumber,
    required String bank,
    required int amount,
  }) async {
    int userBalance = userModel.userBalance;
    int newBalance = userBalance - amount;
    model.UserModel user = userModel.copyWith(
        accountName: accountName,
        accountNumber: accountNumber,
        bankName: bank,
        userBalance: newBalance);

    await db.updateDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.userdatabaseId,
        documentId: userModel.uid,
        data: user.toMap());

    WithdrawModel withdrawModel = WithdrawModel(
        id: "",
        username: user.username,
        bankName: user.bankName,
        acountNumber: user.accountNumber,
        accountName: user.accountName,
        photoUrl: user.photoUrl,
        uid: user.uid,
        amount: amount,
        isPaid: false);
    await db.createDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.withdrawdatabaseId,
        documentId: a.ID.unique(),
        data: withdrawModel.toMap());
  }

  Stream<a.RealtimeMessage> reatimeUser() {
    return _realtime.subscribe([
      "databases.${AppWriteConstants.databaseId}.collections.${AppWriteConstants.userdatabaseId}.document"
    ]).stream;
  }

  static Future signOut() async {
    await SecureStorage.delecteId();
    await SecureStorage.delectSession();
    await auth.deleteSessions();
  }

  static deleteStacker(
    String id,
  ) async {
    getUserDetails(id).then((value) async {
      var stack = [];
      await db.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.userdatabaseId,
          documentId: id,
          data: {"stacks": stack});
    });
  }

  static recoverPassword(
      {required String email, required BuildContext context}) async {
    try {
      UserModel? user = context.read<AllUserProvider>().getuserByemail(email);

      if (user != null) {
        // Perform password recovery logic here

        // bool isSent = false;
        // if (isSent) {
        //   Get.snackbar("Password Recovery",
        //       "Password recovery email has been sent to ${user.email}");
        //   Get.to(() => ForgetVerifiScreen(
        //         email: user.email,
        //         password: user.username,
        //         userId: user.uid,
        //       ));
        // }
        return;
      } else {
        Get.snackbar("User Not Found", "User with email $email not found.");
      }
    } catch (e) {
      Get.snackbar(
          "Error occurred", "An error occurred during password recovery: $e");
    }
  }

  static resetPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      UserModel? user = context.read<AllUserProvider>().getuserByemail(email);

      if (user != null) {
        // Perform password recovery logic here
        // await DartAppwriteAuth()
        //     .updatePassword(password: password, userId: user.uid);
        await db.updateDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.userdatabaseId,
            documentId: user.uid,
            data: {"password": password});

        Get.snackbar("Password Recovery Success",
            "Your Password has been changed successfully, Kingly login with your new password");
        Get.to(() => LoginScreen());

        return;
      } else {
        Get.snackbar("User Not Found", "User with email $email not found.");
      }

      return;
    } catch (e) {
      Get.snackbar(
          "Error occurred", "An error occurred during password recovery: $e");
      return;
    }
  }

  static void updateUser({required UserModel usermodel}) async {
    try {
      await db.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.userdatabaseId,
          documentId: usermodel.uid,
          data: usermodel.toMap());
    } catch (e) {}
  }
}
