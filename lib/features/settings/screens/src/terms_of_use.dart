import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({Key? key}) : super(key: key);

  @override
  State<TermsOfUse> createState() => _TermsOfUseState();
}

class _TermsOfUseState extends State<TermsOfUse> {

  String pathPDF = "";

  final Completer<PDFViewController> controller = Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';


  @override
  void initState() {
    super.initState();
  }

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Пользовательское соглашение"),
        actions: [
          IconButton(onPressed: () {
            Share.shareXFiles([XFile("assets/docs/terms_of_use.pdf")], text: 'Terms of use Alga app');
          }, icon: const Icon(Icons.file_download_outlined,color: Colors.blue))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        color: Colors.white,
        child: FutureBuilder(
          future: fromAsset('assets/docs/terms_of_use.pdf', 'terms_of_use.pdf'),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  PDFView(
                    filePath: snapshot.data!.path,
                    enableSwipe: true,
                    swipeHorizontal: false,
                    autoSpacing: false,
                    pageFling: true,
                    pageSnap: true,
                    defaultPage: currentPage!,
                    fitPolicy: FitPolicy.BOTH,
                    preventLinkNavigation: false, // if set to true the link is handled in flutter
                    onRender: (pages) {
                      setState(() {
                        pages = pages;
                        isReady = true;
                      });
                    },
                    onError: (error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    },
                    onPageError: (page, error) {
                      setState(() {
                        errorMessage = '$page: ${error.toString()}';
                      });
                    },
                    onViewCreated: (PDFViewController pdfViewController) {
                      controller.complete(pdfViewController);
                    },
                    onLinkHandler: (String? uri) {
                    },
                    onPageChanged: (int? page, int? total) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                  ),
                  errorMessage.isEmpty
                      ? !isReady
                      ? const Center(
                    child: CircularProgressIndicator(),
                  )
                      : Container()
                      : Center(
                    child: Text(errorMessage),
                  )
                ],
              );
            }
            return const CircularProgressIndicator();

          }
        ),
      ),
    );
  }
}

