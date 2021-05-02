import 'package:get/get.dart';
import 'package:my_portfolio/api/Back4AppApi.dart';
import 'package:my_portfolio/api/model/Model.dart';

class BlogsController extends GetxController {
  var blogs = <Blog>[].obs;

  var blog = Blog().obs;

  BlogsController() {
    blog.value = null;
  }

  loadData() async {
    blogs.value = await Back4AppApi.instance.loadBlogs();
  }

  getBlog(String id) async {
    blog.value = await Back4AppApi.instance.getDetailBlog(id);
  }
}
