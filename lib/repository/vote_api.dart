import 'dart:async';
import 'package:get/get.dart';
import '../models/model.dart';
import 'package:appwrite/models.dart';
import '../provider/userProvider.dart';
import 'package:appwrite/appwrite.dart';
import 'package:tendollarapp/core/constants/app_write.dart';
import 'package:tendollarapp/enum/notificton_type_enum.dart';
import 'package:tendollarapp/provider/appwrite_provider.dart';
import 'package:tendollarapp/repository/notification_api.dart';

class VoteApi {
  static final Databases db = Databases(AppWriteProvider().getclClient);

  static addPoll({
    required String question,
  }) async {
    try {
      print(DateTime.wednesday);
      print(DateTime.saturday);
      VoteModel voteModel = VoteModel(
          usersId: [],
          winner: [],
          dateStackStart: DateTime.wednesday.toInt(),
          dateVoteStart: DateTime.saturday.toInt(),
          amountstake: 0,
          totalToBePay: 0,
          stakers: [],
          endTime: DateTime.sunday,
          option: [],
          question: question,
          vote: []);
      await db.createDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.voteDataBaseid,
          documentId: ID.custom("10dollarappvote"),
          data: voteModel.toMap());

      DocumentList snap = await db.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.userdatabaseId,
        queries: [
          Query.orderDesc(
            "\$createdAt",
          ),
        ],
      );
      var allu = snap.documents.map((user) {
        return UserModel.fromMap(user.data);
      }).toList();

      for (var element in allu) {
        NotificationApi.addnotification(
            text: "10 Dollar has Created a poll vote And stack",
            uid: element.uid,
            postId: "postId",
            notificationType: NotificationType.voteStart);
      }
    } on AppwriteException {
      rethrow;
    }
  }

  static upDatePullOptions(
      {required Option option, required VoteModel voteModel}) async {
    try {
      List options = voteModel.option;
      List usersId = voteModel.usersId;
      options.add(option.optionId);
      usersId.add(option.uid);
      db.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.voteDataBaseid,
          documentId: ID.custom("10dollarappvote"),
          data: voteModel.copyWith(option: options, usersId: usersId).toMap());
      db.createDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.optionCollection,
          documentId: option.optionId,
          data: option.toMap());
    } on AppwriteException {
      rethrow;
    }
  }

  static Future addMoney(VoteModel voteModel, int amount) async {
    var amont = voteModel.totalToBePay;
    var newamount = amont + amount;
    await db.updateDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.voteDataBaseid,
        documentId: ID.custom("10dollarappvote"),
        data: voteModel.copyWith(totalToBePay: newamount).toMap());
    try {} on AppwriteException catch (e) {
      Get.snackbar("error", e.message.toString());
    }
  }

  static Future<VoteModel> getVote() async {
    try {
      Document document = await db.getDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.voteDataBaseid,
        documentId: ID.custom("10dollarappvote"),
      );

      VoteModel voteModel = VoteModel.fromMap(document.data);
      return voteModel;
    } on AppwriteException {
      rethrow;
    }
  }

  static Future<List<StackerModel>> getStakers() async {
    try {
      var document = await db.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.stackCollection,
      );
      print(document.documents.first.data);
      List<StackerModel> voteModel =
          document.documents.map((e) => StackerModel.fromMap(e.data)).toList();
      print(voteModel);
      return voteModel;
    } on AppwriteException {
      rethrow;
    }
  }

  static Future deleteAll(VoteModel voteModel) async {
    try {
      DocumentList data = await db.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.optionCollection,
      );
      data.documents
          .map((e) => Option.fromMap(e.data))
          .toList()
          .forEach((element) async {
        await db.deleteDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.optionCollection,
            documentId: element.optionId);
      });
      await db.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.voteDataBaseid,
          documentId: ID.custom("10dollarappvote"),
          data: voteModel
              .copyWith(
                vote: [],
                totalToBePay: 0,
                amountstake: 0,
                option: [],
                usersId: [],
                stakers: [],
                winner: [],
              )
              .toMap());
    } on AppwriteException {
      rethrow;
    }
  }

  static Future deleteOption(Option option, VoteModel voteModel) async {
    try {
      List options = voteModel.option;
      List usersId = voteModel.usersId;

      options.remove(option.optionId);
      usersId.remove(option.uid);
      await db.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.voteDataBaseid,
          documentId: ID.custom("10dollarappvote"),
          data: voteModel.copyWith(
            option: options,
            usersId: usersId,
            stakers: [],
            winner: [],
          ).toMap());
      await db.deleteDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.optionCollection,
          documentId: option.optionId);
    } on AppwriteException {
      rethrow;
    }
  }

  static updateOption(Option opt) async {
    try {
      await db.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.optionCollection,
          documentId: opt.optionId,
          data: opt.toMap());
      return;
    } catch (e) {
      return;
    }
  }

  static Future stack({
    required StackerModel stackerModel,
    required VoteModel voteModel,
    required UserModel userModel,
  }) async {
    var stackers = voteModel.stakers;
    var stacks = userModel.stacks;
    var total = voteModel.amountstake;
    var userAmount = userModel.userBalance;
    stackers.add(stackerModel.toJson());
    stacks.add(stackerModel.toJson());
    var usertotalAmount = userAmount - stackerModel.amount;
    var tas = total + stackerModel.amount;
    var percent = 70;
    var totalTobePaid = (percent / 100) * tas;
    VoteModel voteM = voteModel.copyWith(
        stakers: stackers,
        amountstake: tas,
        totalToBePay: totalTobePaid.toInt());
    UserModel user = userModel.copyWith(
      stacks: stacks,
      userBalance: usertotalAmount,
    );
    await db.updateDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.voteDataBaseid,
        documentId: ID.custom("10dollarappvote"),
        data: voteM.toMap());
    await db.updateDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.userdatabaseId,
        documentId: userModel.uid,
        data: user.toMap());
    UserProvider().refreshUser();
  }

  static Future<VoteModel> update(VoteModel voteModel) async {
    try {
      Document document = await db.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.voteDataBaseid,
          documentId: ID.custom("10dollarappvote"),
          data: voteModel.toMap());

      VoteModel voteMod = VoteModel.fromMap(document.data);
      return voteMod;
    } on AppwriteException {
      rethrow;
    }
  }

  static Future<List<Option>> getOption() async {
    try {
      var d = await db.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.optionCollection,
        queries: [
          Query.orderDesc(
            "\$createdAt",
          ),
        ],
      );
      var options = d.documents.map((e) => Option.fromMap(e.data)).toList();
      return options;
    } on AppwriteException {
      rethrow;
    }
  }

  static Future<bool> likeOption(Option option, String uid, String name) async {
    try {
      List Likes = option.likes;
      print(option.optionId);

      if (Likes.contains(uid)) {
        Likes.remove(uid);
        db.updateDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.optionCollection,
            documentId: option.optionId,
            data: {"likes": Likes});
        return false;
      } else {
        Likes.add(uid);

        db.updateDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.optionCollection,
            documentId: option.optionId,
            data: {"likes": Likes});
        if (Likes.contains(uid)) {
          NotificationApi.addnotification(
              text: "$name like your vote Option video",
              uid: option.uid,
              postId: option.optionId,
              notificationType: NotificationType.likes);
        } else {
          NotificationApi.addnotification(
              text: "$name dislike your Option video",
              uid: option.uid,
              postId: option.optionId,
              notificationType: NotificationType.likes);
        }

        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
