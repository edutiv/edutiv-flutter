import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../components/data.dart';

class CertificateAPI {
  static Future<File> generate(
      PdfPageFormat pageFormat, CustomData data) async {
    final pdf = pw.Document();
    // final lorem = pw.LoremText();

    final libreBaskerville = await PdfGoogleFonts.libreBaskervilleRegular();
    final libreBaskervilleItalic =
        await PdfGoogleFonts.libreBaskervilleItalic();
    final libreBaskervilleBold = await PdfGoogleFonts.libreBaskervilleBold();
    final robotoLight = await PdfGoogleFonts.robotoLight();
    final medail = await rootBundle.loadString('assets/medail.svg');
    final swirls = await rootBundle.loadString('assets/swirls.svg');
    final swirls1 = await rootBundle.loadString('assets/swirls1.svg');
    final swirls2 = await rootBundle.loadString('assets/swirls2.svg');
    final swirls3 = await rootBundle.loadString('assets/swirls3.svg');
    final garland = await rootBundle.loadString('assets/garland.svg');

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          children: [
            pw.Spacer(flex: 2),
            pw.RichText(
              text: pw.TextSpan(
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 25,
                  ),
                  children: [
                    const pw.TextSpan(text: 'CERTIFICATE '),
                    pw.TextSpan(
                      text: 'of',
                      style: pw.TextStyle(
                        fontStyle: pw.FontStyle.italic,
                        fontWeight: pw.FontWeight.normal,
                      ),
                    ),
                    const pw.TextSpan(text: ' COMPLETION'),
                  ]),
            ),
            pw.Spacer(),
            pw.Text(
              'THIS ACKNOWLEDGES THAT',
              style: pw.TextStyle(
                font: robotoLight,
                fontSize: 10,
                letterSpacing: 2,
                wordSpacing: 2,
              ),
            ),
            pw.SizedBox(
              width: 300,
              child: pw.Divider(color: PdfColors.grey, thickness: 1.5),
            ),
            pw.Text(
              data.name ?? '',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
                fontSize: 20,
              ),
            ),
            pw.SizedBox(
              width: 300,
              child: pw.Divider(color: PdfColors.grey, thickness: 1.5),
            ),
            pw.Text(
              'HAS SUCCESSFULLY COMPLETED THE',
              style: pw.TextStyle(
                font: robotoLight,
                fontSize: 10,
                letterSpacing: 2,
                wordSpacing: 2,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.SvgImage(
                  svg: swirls,
                  height: 10,
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 10),
                  child: pw.Text(
                    data.courseName ?? '',
                    style: const pw.TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                pw.Transform(
                  transform: Matrix4.diagonal3Values(-1, 1, 1),
                  adjustLayout: true,
                  child: pw.SvgImage(
                    svg: swirls,
                    height: 10,
                  ),
                ),
              ],
            ),
            pw.Spacer(),
            pw.SvgImage(
              svg: swirls2,
              width: 150,
            ),
            pw.Spacer(),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Flexible(
                  child: pw.Text(
                    '',
                    style: const pw.TextStyle(fontSize: 6),
                    textAlign: pw.TextAlign.justify,
                  ),
                ),
                pw.SizedBox(width: 100),
                pw.SvgImage(
                  svg: medail,
                  width: 100,
                ),
              ],
            ),
          ],
        ),
        pageTheme: pw.PageTheme(
          orientation: pw.PageOrientation.landscape,
          pageFormat: pageFormat,
          theme: pw.ThemeData.withFont(
            base: libreBaskerville,
            italic: libreBaskervilleItalic,
            bold: libreBaskervilleBold,
          ),
          buildBackground: (context) => pw.FullPage(
            ignoreMargins: true,
            child: pw.Container(
              margin: const pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(
                    color: const PdfColor.fromInt(0xffe435), width: 1),
              ),
              child: pw.Container(
                margin: const pw.EdgeInsets.all(5),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(
                      color: const PdfColor.fromInt(0xffe435), width: 5),
                ),
                width: double.infinity,
                height: double.infinity,
                child: pw.Stack(
                  alignment: pw.Alignment.center,
                  children: [
                    pw.Positioned(
                      top: 5,
                      child: pw.SvgImage(
                        svg: swirls1,
                        height: 60,
                      ),
                    ),
                    pw.Positioned(
                      bottom: 5,
                      child: pw.Transform(
                        transform: Matrix4.diagonal3Values(1, -1, 1),
                        adjustLayout: true,
                        child: pw.SvgImage(
                          svg: swirls1,
                          height: 60,
                        ),
                      ),
                    ),
                    pw.Positioned(
                      top: 5,
                      left: 5,
                      child: pw.SvgImage(
                        svg: swirls3,
                        height: 160,
                      ),
                    ),
                    pw.Positioned(
                      top: 5,
                      right: 5,
                      child: pw.Transform(
                        transform: Matrix4.diagonal3Values(-1, 1, 1),
                        adjustLayout: true,
                        child: pw.SvgImage(
                          svg: swirls3,
                          height: 160,
                        ),
                      ),
                    ),
                    pw.Positioned(
                      bottom: 5,
                      left: 5,
                      child: pw.Transform(
                        transform: Matrix4.diagonal3Values(1, -1, 1),
                        adjustLayout: true,
                        child: pw.SvgImage(
                          svg: swirls3,
                          height: 160,
                        ),
                      ),
                    ),
                    pw.Positioned(
                      bottom: 5,
                      right: 5,
                      child: pw.Transform(
                        transform: Matrix4.diagonal3Values(-1, -1, 1),
                        adjustLayout: true,
                        child: pw.SvgImage(
                          svg: swirls3,
                          height: 160,
                        ),
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(
                        top: 120,
                        left: 80,
                        right: 80,
                        bottom: 80,
                      ),
                      child: pw.SvgImage(
                        svg: garland,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return CertificateAPI.saveDocument(
      name: 'edutiv_certificate.pdf',
      pdf: pdf,
    );
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }

  static Future<File> saveDocument({
    required String name,
    required pw.Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }
}
