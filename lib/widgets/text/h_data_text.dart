import 'package:flutter/material.dart';
import 'package:hire_knock/widgets/text/h_text.dart';

import '../spacing/h_space.dart';

class HDataText extends StatelessWidget {
  const HDataText({
    Key? key,
    // required this.labels,
    // required this.values,
    required this.rows,
    this.dataSpace = 20,
    this.lineSpace = 10,
    this.fontSize,
    this.labelFontWeight,
    this.valueFontWeight,
    this.valueColors,
    this.valueWidth = 400,
    this.valueSuffix,
    this.color,
  }) : super(key: key);

  // final List<String> labels;
  // final List<String> values;
  final List<HDataTextRow> rows;
  final double dataSpace;
  final double lineSpace;
  final double? fontSize;
  final FontWeight? labelFontWeight;
  final FontWeight? valueFontWeight;
  final Map<int, Color>? valueColors;
  final Map<int, Widget>? valueSuffix;
  final double valueWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // labels.removeWhere((e) => e == '');
    // values.removeWhere((e) => e == '');
    // if (labels.length != values.length) {
    //   return HText(text: 'Invalid data');
    // } else {
    return Table(
      columnWidths: {
        0: IntrinsicColumnWidth(),
        1: FixedColumnWidth(dataSpace),
        2: FlexColumnWidth(),
      },
      // border: TableBorder.all(color: Colors.black),
      children: List.generate(rows.where((element) => element.visible).length,
          (index) {
        HDataTextRow row =
            rows.where((element) => element.visible).toList()[index];
        return TableRow(
          children: [
            // label text
            HText(
              text: "${row.label} ",
              fontSize: fontSize,
              fontWeight: labelFontWeight,
              color: color,
            ),
            Center(
              child: Column(
                children: [
                  HText(
                    text: ':',
                    fontSize: fontSize,
                    fontWeight: labelFontWeight,
                    color: color,
                  ),
                  HSpace.vertical(lineSpace)
                ],
              ),
            ),
            // value text

            if (row.suffix != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(child: _buildValueText(row)),
                  HSpace.horizonital(20),
                  SizedBox(
                    child: row.suffix,
                  )
                ],
              )
            else
              _buildValueText(row),
          ],
        );
      }),
    );

    // return Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: List.generate(labels.length, (index) {
    //         return Column(
    //           children: [
    //             HText(
    //               text: "${labels[index]} ",
    //               fontSize: fontSize,
    //               color: color,
    //               fontWeight: labelFontWeight,
    //             ),
    //             HSpace.vertical(lineSpace)
    //           ],
    //         );
    //       }),
    //     ),
    //     HSpace.horizonital(dataSpace),
    //     Column(
    //       // crossAxisAlignment: CrossAxisAlignment.end,
    //       children: List.generate(
    //         values.length,
    //         (index) => Column(
    //           children: [
    //             HText(
    //               text: ':',
    //               fontSize: fontSize,
    //               color: color,
    //               fontWeight: labelFontWeight,
    //             ),
    //             HSpace.vertical(lineSpace)
    //           ],
    //         ),
    //       ),
    //     ),
    //     HSpace.horizonital(dataSpace),
    //     Expanded(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: List.generate(values.length, (index) {
    //           return Column(
    //             children: [
    //               SizedBox(
    //                 width: valueWidth,
    //                 child: Row(
    //                   // mainAxisAlignment: MainAxisAlignment.start,
    //                   mainAxisSize: MainAxisSize.min,
    //                   children: [
    //                     if (valueSuffix?[index] != null)
    //                       _buildValueText(index)
    //                     else
    //                       Expanded(child: _buildValueText(index)),
    //                     HSpace.horizonital(20),
    //                     SizedBox(
    //                       child: valueSuffix?[index],
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               HSpace.vertical(lineSpace)
    //             ],
    //           );
    //         }),
    //       ),
    //     )
    //   ],
    // );
    // }
  }

  HText _buildValueText(HDataTextRow row) {
    return HText(
      text: "${row.value}",
      fontSize: fontSize,
      fontWeight: valueFontWeight,
      color: row.color ?? color,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
    );
  }
}

class HDataTextRow {
  final String label;
  final String value;
  final Color? color;
  final Widget? suffix;
  final bool visible;

  HDataTextRow({
    required this.label,
    required this.value,
    this.visible = true,
    this.color,
    this.suffix,
  });
}
