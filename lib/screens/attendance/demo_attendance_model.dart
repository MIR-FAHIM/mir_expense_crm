class AttendanceListModel {
  final String? icon, title, date, size, label;

  AttendanceListModel({this.icon, this.title, this.date, this.size, this.label});
}

List demoAttendanceListModels = [
  AttendanceListModel(
      icon: "assets/icons/xd_file.svg",
      title: "Mir Fahim Rahman",
      date: "01-03-2021",
      size: "3.5mb",
      label: 'yes'
  ),
  AttendanceListModel(
      icon: "assets/icons/Figma_file.svg",
      title: "Himel Mir",
      date: "27-02-2021",
      size: "19.0mb",
      label: "yes"
  ),
  AttendanceListModel(
      icon: "assets/icons/doc_file.svg",
      title: "Mir Hasibur Rahman",
      date: "23-02-2021",
      size: "32.5mb",
      label: "No"
  ),
  AttendanceListModel(
    icon: "assets/icons/sound_file.svg",
    title: "Anika Rahman",
    date: "21-02-2021",
    size: "3.5mb",
      label: "Yes"
  ),
  AttendanceListModel(
      icon: "assets/icons/media_file.svg",
      title: "Jannatul Ferdous",
      date: "23-02-2021",
      size: "2.5gb",
      label: "Yes"
  ),
  AttendanceListModel(
      icon: "assets/icons/pdf_file.svg",
      title: "Ashfaq Uddin",
      date: "25-02-2021",
      size: "3.5mb",
      label: "No"
  ),
  AttendanceListModel(
      icon: "assets/icons/excle_file.svg",
      title: "Rehman Shabab",
      date: "25-02-2021",
      size: "34.5mb",
      label: "Yes"
  ),
];
