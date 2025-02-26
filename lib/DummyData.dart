import 'package:prj/Models/User.dart';
import 'package:prj/Models/WishList.dart';
import 'package:prj/Models/WishlistItem.dart';
import 'package:prj/Models/category.dart';
import 'package:prj/Models/Coffee.dart';

final List<category> categories = [
  category(name: 'All coffee', id: "all"),
  category(name: 'Espresso'),
  category(name: 'Latte'),
  category(name: 'Cappuccino'),
];

final List<Coffee> coffees = [
  Coffee(
    name: 'Caffe Mocha with extra milk and alot of thingfs',
    description: 'Strong and rich coffee shot.',
    price: 4.53,
    imageUrl:
        "https://images.pexels.com/photos/302896/pexels-photo-302896.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    categoryIDs: [categories[1].id],
    rating: 2.9,
  ),
  Coffee(
    name: 'Latte',
    description:
        'Smooth coffee with steamed milk.Smooth coffee with steamed milk.Smooth coffee with steamed milk.Smooth coffee with steamed milk.Smooth coffee with steamed milk.Smooth coffee with steamed milk.Smooth coffee with steamed milk.Smooth coffee with steamed milk. HELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOOHELLLPOOPOO',
    price: 3.99,
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSNw7oOeCCCIv_D1ok78I61XqgUl1ZU_S2DA&s",
    categoryIDs: [categories[2].id],
    rating: 4.8,
  ),
  Coffee(
    name: 'Cappuccino',
    description: 'Creamy coffee with foam.',
    price: 4.49,
    imageUrl:
        "https://sumatocoffee.com/cdn/shop/articles/espresso.png?v=1718370919&width=640",
    categoryIDs: [
      categories[3].id,
      categories[2].id,
      categories[3].id,
      categories[3].id,
    ],
    rating: 5.0,
  ),
];

user currentUser = user(
  name: 'John Doe',
  email: 'abdelaziz@sth.com',
  id: "2022",
  phoneNumber: "0101010101001",
  wishlist: Wishlist(),
);

WishlistItem item = WishlistItem(
  addedAt: DateTime.now(),
  coffee: coffees[0],
  quantity: 4,
  size: 'S',
);

WishlistItem item2 = WishlistItem(
  addedAt: DateTime.now(),
  coffee: coffees[2],
  quantity: 4,
  size: 'L',
);

WishlistItem item3 = WishlistItem(
  addedAt: DateTime.now(),
  coffee: coffees[1],
  quantity: 3,
  size: 'M',
);

Map<String, String> categoryMap = {
  categories[0].id: categories[0].name,
  categories[1].id: categories[1].name,
  categories[2].id: categories[2].name,
  categories[3].id: categories[3].name,
};
void start() {
  // print(item.coffeeId);
  // print(item2.coffeeId);
  print(item3.coffee);
  print(coffees[0].id);
  // print(coffees[1].id);
  // print(coffees[2].id);

  // currentUser.wishlist.add(item2);
  currentUser.wishlist.addItem(item);
  currentUser.wishlist.addItem(item2);
  currentUser.wishlist.addItem(item3);
}
