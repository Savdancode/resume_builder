import 'dart:typed_data';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import '../../model/templete/templete_data_model.dart';

class TempleteService {
  static Future<Uint8List> generatePDF(
      {required TempleteDataModel resumeDetails}) async {
    final pdf = pw.Document();
    final Uint8List imageBytes =
        File(resumeDetails.profileImagePath).readAsBytesSync();

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                padding: const pw.EdgeInsets.all(15),
                color: PdfColor.fromHex('#89c0f0'),
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Container(
                      height: 100,
                      width: 100,
                      decoration: pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        border: pw.Border.all(
                          color: PdfColor.fromHex('#0980e8'),
                          width: 1.0, // Border width
                        ),
                        image: pw.DecorationImage(
                          image: pw.MemoryImage(imageBytes),
                          fit: pw.BoxFit.cover,
                        ),
                      ),
                    ),
                    pw.SizedBox(width: 15),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "${resumeDetails.firstName} ${resumeDetails.lastName}",
                          style: pw.TextStyle(
                            fontSize: 30,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          resumeDetails.position,
                          style: const pw.TextStyle(
                            fontSize: 17,
                            //fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  /// **Save the PDF as a file**
  static Future<void> savePDF(TempleteDataModel resumeDetails) async {
    final bytes = await generatePDF(resumeDetails: resumeDetails);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/resume.pdf');
    await file.writeAsBytes(bytes);
    await OpenFilex.open(file.path);
  }

  /// **Print or Share the PDF**
  // static Future<void> printPDF(BuildContext context) async {
  //   final bytes = await generatePDF();
  //   await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
  // }
}
