import 'package:dsplatform/constants/api/api_path.dart';
import 'package:flutter/material.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/interfaces.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:http/http.dart' as http;

class OAuth2Page extends StatefulWidget {
  const OAuth2Page({Key? key}) : super(key: key);

  @override
  State<OAuth2Page> createState() => _OAuth2PageState();
}

class _OAuth2PageState extends State<OAuth2Page> {
  late WebViewController controller;

  OAuth2Client client = OAuth2Client(
    redirectUri: "https://search-platform-front.vercel.app/auth_code",
    customUriScheme: "https",
    tokenUrl: '${ApiPath.apiPath}/oauth2/token',
    authorizeUrl: '${ApiPath.apiPath}/oauth2/authorize'
  );

  var headers = {
    'Authorization': 'Bearer eyJ4NXQjUzI1NiI6ImxBN0hmWk1IQXRzcXhqTEhsdjRUSFNySVJYM1BYcXMyQ0U4dDM1VFpjWUEiLCJraWQiOiJzZWFyY2gtcGxhdGZvcm0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJtYXJhdGJla292YWlkYXJAZ21haWwuY29tIiwiYXVkIjoic2VhcmNoLXBsYXRmb3JtLWNsaWVudCIsIm5iZiI6MTY4MzY5MjQzMywic2NvcGUiOlsib3BlbmlkIl0sImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MiIsImZ1bGxOYW1lIjoiIiwiaWQiOjEsImV4cCI6MTY4MzY5MzMzMywiaWF0IjoxNjgzNjkyNDMzLCJhdXRob3JpdGllcyI6WyJESUNfQ1JFQVRFIiwiRElDX0RFTEVURSIsIlJPTEVfVklFV0VSIiwiUE9TVF9SRUFEIiwiUE9TVF9DT01NRU5UIiwiRElDX0VESVQiLCJQT1NUX1NIQVJFIl19.Z_zPTxDP3jzRFfi-skkaCVhwkrlc8VIN8xqzUbrmagfIUVzNGDrrAr19PZNGITCxm3hK8RReDfLs6xf0_WHIFfEfzyagfFeD9FPCWQnV2KnSrFymYOiu3a5a_7SmwGrC0pTp8abY-I-QeBWXgd5Ez_qxWXlgWGlMJnE7Vzbb7qYqlr86TfsgV3otMGLsl-3XdEjDq9q--stQ8qqNqmrBY97wVgL-yEVQNrfEbs3RpvmJ35k3dvk9ZfyN5ZLI-5f1USadX6fX2wneNR3uCLKnmSt-yuDyZqbQcSLPuIqBfAgfDhnTLX6KsRSV1hW4ISX2-F_K-lphmE9H92Ll9OHmrg'
  };
  var request = http.Request('GET', Uri.parse(''));

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("${ApiPath.apiPath}/login"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {

                var accessTokenResponse = await client.getTokenWithAuthCodeFlow(
                  clientId: "search-platform-client",
                  clientSecret: "search-platform-secret",
                  scopes: [
                    "openid"
                  ],
                );
                print(accessTokenResponse);
                print(accessTokenResponse.accessToken);
                print(accessTokenResponse.httpStatusCode);
              },
              child: Text("Login"),
            ),
            ElevatedButton(
              onPressed: () async {
                await http.get(Uri.parse("${ApiPath.apiPath}/logout"));
              },
              child: Text("logout"),
            ),

          ],
        ),
      )
    );
  }
}
