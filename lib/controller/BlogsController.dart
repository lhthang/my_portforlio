import 'package:get/get.dart';
import 'package:my_portfolio/api/Back4AppApi.dart';
import 'package:my_portfolio/api/model/Model.dart';

class BlogsController extends GetxController {
  var blogs = <Blog>[].obs;

  loadData() async {
    blogs.value = await Back4AppApi.instance.loadBlogs();
  }
}
