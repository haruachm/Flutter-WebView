# Flutter WebView ๐ง

</br>

## Flutter WebView & AppBar

![image](https://user-images.githubusercontent.com/85959639/217237212-833b4e19-a0a8-4ffc-a610-e5ec90301d0c.png)


`javascriptMode: JavascriptMode.unrestricted,` : ์น๋ทฐ์์ JS ์ฌ์ฉ ๊ฐ๋ฅํ๋๋ก ์ค์ 

</br>

### **์น๋ทฐ(WebView) ์์ ฏ์ ์์ฑ**

| ์์ฑ | ์ค๋ช |
| --- | --- |
| initialUrl | ์น๋ทฐ์์ ์ฒ์ ์คํํ  ์น์ฌ์ดํธ์ URL์ String ๊ฐ์ผ๋ก ์ ๊ณตํ๋๋ฐ, ์น๋ทฐ๋ฅผ ์ฒ์ ์์ฑ๋์์ ๋ initialUrl์ ์์ฑํ ์ฌ์ดํธ๊ฐ ์ต์ด๋ก ์ด๋ฆฐ๋ค. |
| javascriptMode | ์น ๋ทฐ์์ ์๋ฐ์คํฌ๋ฆฝํธ์ ์คํ ์ฌ๋ถ๋ฅผ ๊ฒฐ์ ํ๋ค.- JavascriptMode.unrestricted : JS๋ฅผ ์คํ ๊ฐ๋ฅํ๊ฒ ์ค์ - JavascriptMode.disabled : JS๋ฅผ ์คํ ๋ถ๊ฐ๋ฅํ๊ฒ ์ค์  |
| onWebViewCreated | ์น๋ทฐ ์์ ฏ์ด ์์ฑ๋๋ฉด ์คํํ  ์ฝ๋ฐฑ ํจ์๋ฅผ ์์ฑํ๋ค.๋งค๊ฐ๋ณ์๋กย WebViewController๋ฅผ ๊ฐ์ ธ '์๋ก์ด URL ์คํ, ๋ค๋ก๊ฐ๊ธฐ, ์์ผ๋ก ๊ฐ๊ธฐ' ๋ฑ์ ๊ธฐ๋ฅ์ ์กฐ์ ๊ฐ๋ฅํ๊ฒ ํ๋ค. |
| onPageStarted | ์น๋ทฐ๊ฐ ์ฒ์ ์์ฑ๋๊ฑฐ๋, ์นํ์ด์ง๊ฐ ์๋ก ๋ก๋ฉ์ด ๋  ๋ ์คํํ  ์ฝ๋ฐฑํจ์๋ฅผ ์ ์ํ๋ค. |
| onPageFinished | ์นํ์ด์ง ๋ก๋ฉ์ด ๋๋๋ฉด ์คํํ  ์ฝ๋ฐฑํจ์๋ฅผ ์ ์ํ๋ค. |
| onProgress | ์นํ์ด์ง๊ฐ ๋ก๋ฉ ์ค์ผ ๋ ์ง์์ ์ผ๋ก ์คํ๋๊ณ  ๋ก๋ฉ์ด ๋๋  ๋๊น์ง ์คํํ  ์ฝ๋ฐฑํจ์๋ฅผ ์ ์ํ๋ค. |

</br>

## **์น๋ทฐ ์ปจํธ๋กค๋ฌ(WebViewController)**

ํ๋ฌํฐ ์ฑ ๋ด์ ๋ฒํผ์ ๊ฐ์ง๊ณ  ์น๋ทฐ ํ๋ฉด์ ๋ณ๊ฒฝํ๋ ๋ฑ์ ์ ์ด๋ฅผ ํ๊ธฐ ์ํด์๋ '**์น๋ทฐ ์ปจํธ๋กค๋ฌ**'๋ฅผ ์ด์ฉํด ์ ์ด๊ฐ ๊ฐ๋ฅํ๋ค.

```dart
body: WebView(
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller; //๋ฐ์์จ ์ปจํธ๋กค๋ฌ๋ฅผ ๋ณ์์ ๋ฃ์ด์ค๋ค.
        },
        initialUrl: 'https://parkjh7764.tistory.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
```

</br>
## **์ฑ๋ฐ(AppBar) ์์ด์ฝ ๋ฒํผ ๊ตฌํํ๊ธฐ**

์ฑ๋ฐ์ ์์ด์ฝ ๋ฒํผ์ ๊ตฌํํ๊ธฐ ์ํด์๋ AppBar์ย **actionsย ๋งค๊ฐ๋ณ์์ ์์ ฏ๋ค์ ๋ฃ์ผ๋ฉด**ย ์ค๋ฅธ์ชฝ๋ถํฐ ์ผ์ชฝ์ผ๋ก ์ฐจ๋ก๋๋ก ์์ ฏ๋ค์ด ๋ฐฐ์น๊ฐ ๋๋ค.

```dart
actions: [
          IconButton(
              onPressed: () {
                if (controller != null) {
                  controller!.loadUrl(homeUrl);
                }
              },
              icon: Icon(Icons.home_filled)),
        ],
```

**loadUrl(homeUrl)**ย : homeUrl๋ก ์ค์ ํ URL๋ก ์ด๋ํ๋๋ก ํ๋ค.

**controller!**ย : null์ด ์๋ ๊ฐ์ผ ๋๋ง homeUrl๋ก ์ด๋์ด ๊ฐ๋ฅํ๋๋ก ํ๋๋ก ํ๋ค.

์์ if๋ฌธ์ผ๋ก ๋ถ๋ช null์ด ์๋ ๋๋ผ๊ณ  ์กฐ๊ฑด์ ์ฃผ์์์๋ controller! ์ ํด์ค์ null์ด ์๋์ ๋ณด์ฅํด์ค์ผ ํ๋ค.

</br>

### **webview_flutter: ^3.0.0 ๋ฒ์ ๊ณผ webview_flutter: ^4.0.2 ๋ฒ์  ์ฐจ์ด**

**webview_flutter:ย ^3.0.0**

```dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;
  final homeUrl = 'https://parkjh7764.tistory.com';
  HomeScreen({super.key});//controller ๊ฐ const๊ฐ ์๋๊ธฐ ๋๋ฌธ์ const๋ฅผ ์์ ์ค๋ค.@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HwanE Blog'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: () {
                if (controller != null) {
                  controller!.loadUrl(homeUrl);
                }
              },
              icon: Icon(Icons.home_filled)),
        ],
      ),
      body: WebView(
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller;//๋ฐ์์จ ์ปจํธ๋กค๋ฌ๋ฅผ ๋ณ์์ ๋ฃ์ด์ค๋ค.
        },
        initialUrl: homeUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
```

**loadUrl(homeUrl)**ย : homeUrl๋ก ์ค์ ํ URL๋ก ์ด๋ํ๋๋ก ํ๋ค.

**controller!**ย : null์ด ์๋ ๊ฐ์ผ ๋๋ง homeUrl๋ก ์ด๋์ด ๊ฐ๋ฅํ๋๋ก ํ๋๋ก ํ๋ค.

์์ if๋ฌธ์ผ๋ก ๋ถ๋ช null์ด ์๋ ๋๋ผ๊ณ  ์กฐ๊ฑด์ ์ฃผ์์์๋ controller! ์ ํด์ค์ null์ด ์๋์ ๋ณด์ฅํด์ค์ผ ํ๋ค.

**webview_flutter:ย ^4.0.2**

```dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://parkjh7764.tistory.com');

class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);
  HomeScreen({super.key});//controller ๊ฐ const๊ฐ ์๋๊ธฐ ๋๋ฌธ์ const๋ฅผ ์์ ์ค๋ค.@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HwanE Blog'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
              onPressed: () {
                controller.loadRequest(homeUrl);
              },
              icon: Icon(Icons.home_filled)),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
```

---

### **webview_flutter 4.0.2 ๋ฒ์  ์ฐจ์ด์ **

1.ย **controller = WebViewController()**ย : controller๋ฅผ ์๋๋ onWebViewCreated ์์์ ๋ฐ์์๋๋ฐ, ์์์ ์ง์ ย **controller๋ฅผ ์ ์ธ**ํ ๋ค์์ webView๋ฅผ ๋ฃ์ด์ค๋ค.

2.ย **setJavaScriptMode()**ย :ย  javacriptMode๋ฅผ webview ์์ ฏ ์์ ๋ฃ์ง ์๊ณ  controller์ ํจ๊ป ์ ์ธํ๋ค.

3.ย **loadRequest(url)**ย : ์ด๊ธฐ URL์ธ initialUrl์ controller์ ํจ๊ป ์ ์ธํ๋ค. ์ด ํจ์๋ '**Uri**' ํ์์ ๊ฐ์ ๋ฃ์ด์ผ ํ๋ค.

4.ย **Uri.parse()**ย : Uri ํด๋์ค์์ parse๋ฅผ ์ฌ์ฉํด String ๊ฐ์ Uri๋ผ๋ ํด๋์ค๋ก ๋ณ๊ฒฝํ  ์ ์๊ฒ ํ๋ค.

5.ย **? ๋ฌผ์ํ ๋ฐ ! ๋๋ํ ์ ๊ฑฐ**ย : ์ปจํธ๋กค๋ฌ๊ฐ ์์ฑ๋  ๋ null ๊ฐ์ด ๋ค์ด๊ฐ ์ ์์ผ๋ฏ๋ก ?, !์ ์์ค๋ค.
