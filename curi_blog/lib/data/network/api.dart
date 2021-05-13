class API {
  /// Base URL
  static const old = 'https://curibd.org/wp-json/';
  static const test = 'https://curibd.org/api.php?req=';
  static const base = test;

  /// Posts
  static const posts = 'posts';

  static post(postID) => 'post_details&post_id=$postID';
  static postsByCategory(categoryID) => 'posts&category_id=$categoryID';

  /// Categories
  static const categories = 'categories';
}
