import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum menuOptions {
  clearCache,
  clearCookie
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late WebViewController _webController;
  double loadingProgress = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Stay in app
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WebView'),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () async {
                if (await _webController.canGoBack()) {
                  _webController.goBack();
                } else {
                  log('Нет записи в истории');
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () async {
                if (await _webController.canGoForward()) {
                  _webController.goForward();
                } else {
                  log('Нет записи в истории');
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () => _webController.reload(),
            ),
            PopupMenuButton(
                onSelected: (value) {
                  switch(value) {
                    case menuOptions.clearCache: {
                      _onClearCache(_webController, context);
                      break;
                    }
                    case menuOptions.clearCookie: {
                      _onClearCookies(context);
                      break;
                    }
                    default: {

                    }
                  }
                },
                itemBuilder: (context) => [
              PopupMenuItem(
                value: menuOptions.clearCache,
                child: Text('Удалить кеш')
              ),
              PopupMenuItem(
                  value: menuOptions.clearCookie,
                  child: Text('Почистить куки')
              ),
            ])
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(value: loadingProgress.toDouble(), color: Colors.red, backgroundColor: Colors.black,),
            Expanded(
              child: WebView(
                onProgress: (int progress) {
                  loadingProgress = progress / 100;
                  setState(() {});
                },
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: 'https://flutter.dev',
                onWebViewCreated: (controller) {
                  _webController = controller;
                },
                onPageStarted: (url) {
                  log('Новый сайт $url');
                },
                onPageFinished: (url){
                  log('Страница полностью загружена');
                },
                navigationDelegate: (request) {
                  if(request.url.startsWith('https://www.youtube.com')) {
                    log('Навигация заблокирована к реквесту');
                    return NavigationDecision.prevent;
                  }
                  log('Навигация разрешена к реквесту');
                  return NavigationDecision.navigate;
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.next_plan, size: 32),
          onPressed: () async {
            final currentUrl = await _webController.currentUrl();
            log('Previous url: $currentUrl');
            // _webController.loadUrl('https://www.youtube.com/');
            Future.delayed(Duration(milliseconds: 3000)).then((value) => {
            _webController.runJavascript(
            "document.getElementsByTagName('footer')[0].style.display = 'none'"
            )
            });
          },
        ),
      )
    );
  }

  void _onClearCache(WebViewController webController, BuildContext context) async {
    await webController.clearCache();;
    String message = '';
    message = 'Кеш почищен';
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _onClearCookies(BuildContext context) async {
    final bool hasCookie = await CookieManager().clearCookies();
    String message = '';
    if (!hasCookie) {
      message = 'Кук нет, нечего чистить';
    } else {
      message = 'Куки почищены';
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
