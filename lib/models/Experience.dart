class ExperienceModel {
  String time;
  String company;
  String title;
  List<ProjectModel> projects = [];
  bool isActive;

  ExperienceModel({
    this.time,
    this.company,
    this.title,
    this.isActive = true,
    this.projects,
  });
}

class ProjectModel {
  String projectName;
  String position;
  String stack;
  String description;
  String task;
  ProjectModel(
      {this.projectName,
      this.position,
      this.stack,
      this.description,
      this.task});
}
