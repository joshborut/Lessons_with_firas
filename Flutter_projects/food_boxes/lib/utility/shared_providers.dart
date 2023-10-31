import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_boxes/model/tickets_info.dart';

final intializeMainProviders = Provider.autoDispose(
  (ref) async {
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();
    ref.read(firstNameProvider.notifier).state =
        userData.data()?["firstName"] ?? "";
    ref.read(lastNameProvider.notifier).state =
        userData.data()?["lastName"] ?? "";
    ref.read(ageProvider.notifier).state = userData.data()?["age"] ?? "";
    ref.read(currentUserProvider.notifier).state = user;
    ref.read(ticketListProvider.notifier).update((state) => [
          ...state,
          TicketsInfo(
            date: "1/1/23",
            name: "Pancake",
            imageURL: "assets/images/dark_veggies.jpg",
            price: 5,
          ),
          TicketsInfo(
            date: "12/10/23",
            name: "Waffles",
            imageURL: "assets/images/veggie_pile.jpg",
            price: 7,
          ),
          TicketsInfo(
            date: "9/30/23",
            name: "Toast",
            imageURL: "assets/images/veggie_plates.jpg",
            price: 3,
          ),
        ]);
    ref.read(appProvidersInitialized.notifier).state = true;
  },
);

final appProvidersInitialized = StateProvider<bool>((ref) => false);

final currentUserProvider = StateProvider<User?>((ref) => null);

final firstNameProvider = StateProvider<String>((ref) => "");

final lastNameProvider = StateProvider<String>((ref) => "");

final ageProvider = StateProvider<String>((ref) => "");

final ticketListProvider = StateProvider<List<TicketsInfo>>((ref) => []);
