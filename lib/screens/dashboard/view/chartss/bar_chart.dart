

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';


class BarChartSample2 extends StatefulWidget {
  BarChartSample2({super.key});
  final Color leftBarColor = MyColors.customBlue;
  final Color rightBarColor = MyColors.customYellow;
  // final Color avgColor =
  //AppColors.contentColorOrange.avg(AppColors.contentColorRed);
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 3;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;
  // CollectionReference trainCanteen =
  // FirebaseFirestore.instance.collection('project_expense');
  List expenseData = [];
  List incomeData = [];
  double totalExpense = 0.0 ;
  double totalIncome = 0.0 ;
  // Future getData() async {
  //   expenseData.clear();
  //   incomeData.clear();
  //   print("working");
  //   // Get docs from collection reference
  //   // QuerySnapshot querySnapshot = await trainCanteen
  //   //     .doc("9dP3oajtd2Q7JWoqAAd7")
  //   //     .collection("transaction")
  //   //     .get();
  //
  //   // Get data from docs and convert map to List
  //   expenseData = querySnapshot.docs.where((element) => element["type"] == "expense").map((doc) => doc.data()).toList();
  //   print("expense data list is ${expenseData.length}");
  //   totalExpense = expenseData.fold(0, (previousValue, element) => previousValue + double.parse(element["amount"]));
  //
  //   incomeData = querySnapshot.docs.where((element) => element["type"] == "income").map((doc) => doc.data()).toList();
  //   print("income data list is ${expenseData.length}");
  //   totalIncome = incomeData.fold(0, (previousValue, element) => previousValue + double.parse(element["amount"]));
  //
  //
  //
  //   print("get all data ${expenseData.length} ");
  //   return expenseData;
  // }

 Future  method() async {
    List a = [
      "q",
      "x"
    ];
return a;
  }
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child:  FutureBuilder(
          future: method(),
          builder: (BuildContext context,
              AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              print("no data found");
            } else {

              final barGroup1 = makeGroupData(0,
                  34/10,
                 44/10);
              final barGroup2 = makeGroupData(1,
                 54/10,
                  12/10);
              final barGroup3 = makeGroupData(2,
                67/10,
                  34/10);
              final barGroup4 = makeGroupData(3,
                  65/10,
                  43/10);
              final barGroup5 = makeGroupData(4,
                 64/10,
                  12/10);
              final barGroup6 = makeGroupData(5,
                  45/10,
                  15/10);
              final barGroup7 = makeGroupData(6,
                  22/10,
                 18/10);
              final barGroup8 = makeGroupData(7,
                  31/10,
                  21/10);
              final barGroup9 = makeGroupData(8,
                54/10,
                  45/10);
              final barGroup10 = makeGroupData(9,
                 66/10,
                  36/10);
              final barGroup11 = makeGroupData(10,
                  19/10,
                55/10);
              final barGroup12 = makeGroupData(11,
                 66/10,
                74/10);

              final items = [
                barGroup1,
                barGroup2,
                barGroup3,
                barGroup4,
                barGroup5,
                barGroup6,
                barGroup7,
                barGroup8,
                barGroup9,
                barGroup10,
                barGroup11,
                barGroup12,
              ];

              rawBarGroups = items;

              showingBarGroups = rawBarGroups;
            }

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError)
                  return Center(child: Text('No Data Found'));
                if (snapshot.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          makeTransactionsIcon(),
                          const SizedBox(
                            width: 38,
                          ),
                          const Text(
                            'Transactions',
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            'state',
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      Expanded(
                        child: BarChart(
                          BarChartData(
                            maxY: 20,
                            barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: Colors.grey,
                                getTooltipItem: (a, b, c, d) => null,
                              ),
                              touchCallback: (FlTouchEvent event, response) {
                                if (response == null || response.spot == null) {
                                  setState(() {
                                    touchedGroupIndex = -1;
                                    showingBarGroups = List.of(rawBarGroups);
                                  });
                                  return;
                                }

                                touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                                setState(() {
                                  if (!event.isInterestedForInteractions) {
                                    touchedGroupIndex = -1;
                                    showingBarGroups = List.of(rawBarGroups);
                                    return;
                                  }
                                  showingBarGroups = List.of(rawBarGroups);
                                  if (touchedGroupIndex != -1) {
                                    var sum = 0.0;
                                    for (final rod
                                    in showingBarGroups[touchedGroupIndex].barRods) {
                                      sum += rod.toY;
                                    }
                                    final avg = sum /
                                        showingBarGroups[touchedGroupIndex]
                                            .barRods
                                            .length;

                                    showingBarGroups[touchedGroupIndex] =
                                        showingBarGroups[touchedGroupIndex].copyWith(
                                          barRods: showingBarGroups[touchedGroupIndex]
                                              .barRods
                                              .map((rod) {
                                            return rod.copyWith(
                                                toY: avg, color: Colors.green);
                                          }).toList(),
                                        );
                                  }
                                });
                              },
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: bottomTitles,
                                  reservedSize: 42,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 28,
                                  interval: 1,
                                  getTitlesWidget: leftTitles,
                                ),
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: showingBarGroups,
                            gridData: FlGridData(show: false),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  );
                }
            }
          },
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    if (value == 0) {
      text = '5K';
    } else if (value == 10) {
      text = '70K';
    } else if (value == 19) {
      text = '140K';
    } else if (value == 22) {
      text = '200K';
    }else if (value == 25) {
      text = '250K';
    }else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Jan', 'Feb', 'Mar', 'Apl', 'May', 'Jn', 'July', 'Aug', 'Sep', 'Oct', 'Nov','Dec'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 9,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 12, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.green.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.green.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.green.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.green.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.green.withOpacity(0.4),
        ),
      ],
    );
  }
}