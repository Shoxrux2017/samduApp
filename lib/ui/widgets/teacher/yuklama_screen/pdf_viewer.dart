import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:samduapp/ui/widgets/teacher/yuklama_screen/pdf_viewer_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({super.key});

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyWebView(),
    );
  }
}

class MyWebView extends StatefulWidget {
  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  final String pdfUrl = "YOUR_PDF_URL_HERE";

  @override
  Widget build(BuildContext context) {
    final model = context.read<PdfViewerModel>();
    final url = model.pdfUrl;
    print(url);
    return Scaffold(
        appBar: AppBar(
          title: Text("Open URL in Browser"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
            child: SfPdfViewer.network(
                'https://www.africau.edu/images/default/sample.pdf')));
  }
}
