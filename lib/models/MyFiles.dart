import 'package:mir_expense_tracker/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage,id;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.id,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    id: 1,
    title: "Expense List",
    numOfFiles: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "55 items",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    id: 1,
    title: "Income List",
    numOfFiles: 1328,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "23 items",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    id: 2,
    title: "Projects",
    numOfFiles: 4,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "12",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    id: 3,
    title: "Donation List", // Tasks
    numOfFiles: 66,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "75",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
