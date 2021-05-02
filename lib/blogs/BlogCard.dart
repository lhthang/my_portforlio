import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_portfolio/api/Store.dart';
import 'package:my_portfolio/api/model/Model.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/functions.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:my_portfolio/routes/route_path.dart';

class BlogCard extends StatefulWidget {
  final bool isLoggedIn;
  final Blog blog;
  final Function onClick;
  final Function onEdit;
  final Function onDelete;
  BlogCard(
      {Key key,
      @required this.blog,
      this.onClick,
      this.onDelete,
      this.onEdit,
      this.isLoggedIn = false});
  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 300,
        child: InkWell(
          onTap: widget.onClick,
          child: ListTile(
            title: Text(widget.blog.title),
            trailing: widget.isLoggedIn
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        customBorder: CircleBorder(),
                        onTap: () {},
                        child: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        customBorder: CircleBorder(),
                        onTap: widget.onDelete,
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    ],
                  )
                : null,
          ),
        ));
  }
}
