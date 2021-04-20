class SkillModel {
  String name;
  String image;

  SkillModel({this.name, this.image});
}

class LanguageSkill extends SkillModel {
  LanguageSkill({name, image}) : super(image: image, name: name);
}

class DatabaseSkill extends SkillModel {
  DatabaseSkill({name, image}) : super(image: image, name: name);
}

class OtherSkill extends SkillModel {
  OtherSkill({name, image}) : super(image: image, name: name);
}

class PersonalProject {
  String name;
  String description;
  List<String> stack;
  String image;
  PersonalProject({this.name, this.image, this.description, this.stack});
}
