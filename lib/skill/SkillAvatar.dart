import 'package:flutter/material.dart';
import 'package:my_portfolio/models/Skill.dart';

class SkillAvatar extends StatefulWidget {
  final SkillModel skill;
  SkillAvatar({Key key, @required this.skill});
  @override
  _SkillAvatarState createState() => _SkillAvatarState();
}

class _SkillAvatarState extends State<SkillAvatar> {
  final imageSize = 90.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageSize,
      width: imageSize,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(widget.skill.image)),
      ),
    );
  }
}
