import 'package:prj/Models/WishList.dart';

/*

Final Answer:
If you're using SQL, use a separate wishlist table linked to users.
If you're using NoSQL(Firebase :D), store the wishlist as a list inside the user document.
 */

class user {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final Wishlist wishlist;
  List<String> favorited = [];

  user({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.wishlist,
  });
}
