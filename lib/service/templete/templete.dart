import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class TempleteService {
  static Future<Uint8List> generatePDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text("Resume Maker",
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text("Generated using Flutter",
                  style: const pw.TextStyle(fontSize: 16)),
              pw.SizedBox(height: 20),
              pw.Container(
                padding: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.blue),
                  borderRadius: pw.BorderRadius.circular(5),
                ),
                child: pw.Text("This is a bordered container in a PDF."),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  /// **Save the PDF as a file**
  static Future<void> savePDF() async {
    final bytes = await generatePDF();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/resume.pdf');
    await file.writeAsBytes(bytes);
    await OpenFilex.open(file.path);
    print("PDF saved to ${file.path}");
  }

  /// **Print or Share the PDF**
  static Future<void> printPDF(BuildContext context) async {
    final bytes = await generatePDF();
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
  }
}
