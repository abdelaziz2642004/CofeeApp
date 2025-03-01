import 'package:prj/Models/Notification.dart';
import 'package:prj/Models/WishList.dart';

/*

Final Answer:
If you're using SQL, use a separate wishlist table linked to users.
If you're using NoSQL(Firebase :D), store the wishlist as a list inside the user document.
 */

class user {
  final String id;
  final String email;
  // final String UserName; // not needed ?
  final String ImageUrl;
  final String fullName;
  final Wishlist wishlist;
  List<String> favorited = [];
  List<myNotification> notifications = [];

  user({
    required this.id,
    required this.email,
    required this.wishlist,
    required this.ImageUrl,
    required this.fullName,
    required this.favorited,
    required this.notifications,
  });
}
