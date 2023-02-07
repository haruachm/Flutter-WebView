# Flutter WebView 🧐

</br>

## Flutter WebView & AppBar

![image](https://user-images.githubusercontent.com/85959639/217237212-833b4e19-a0a8-4ffc-a610-e5ec90301d0c.png)


`javascriptMode: JavascriptMode.unrestricted,` : 웹뷰에서 JS 사용 가능하도록 설정

</br>

### **웹뷰(WebView) 위젯의 속성**

| 속성 | 설명 |
| --- | --- |
| initialUrl | 웹뷰에서 처음 실행할 웹사이트의 URL을 String 값으로 제공하는데, 웹뷰를 처음 생성되었을 때 initialUrl에 작성한 사이트가 최초로 열린다. |
| javascriptMode | 웹 뷰에서 자바스크립트의 실행 여부를 결정한다.- JavascriptMode.unrestricted : JS를 실행 가능하게 설정- JavascriptMode.disabled : JS를 실행 불가능하게 설정 |
| onWebViewCreated | 웹뷰 위젯이 생성되면 실행할 콜백 함수를 작성한다.매개변수로 WebViewController를 가져 '새로운 URL 실행, 뒤로가기, 앞으로 가기' 등의 기능을 조작 가능하게 한다. |
| onPageStarted | 웹뷰가 처음 생성되거나, 웹페이지가 새로 로딩이 될 때 실행할 콜백함수를 정의한다. |
| onPageFinished | 웹페이지 로딩이 끝나면 실행할 콜백함수를 정의한다. |
| onProgress | 웹페이지가 로딩 중일 때 지속적으로 실행되고 로딩이 끝날 때까지 실행할 콜백함수를 정의한다. |

</br>

## **웹뷰 컨트롤러(WebViewController)**

플러터 앱 내의 버튼을 가지고 웹뷰 화면을 변경하는 등의 제어를 하기 위해서는 '**웹뷰 컨트롤러**'를 이용해 제어가 가능하다.

```dart
body: WebView(
        onWebViewCreated: (WebViewController controller) {
          this.controller = controller; //받아온 컨트롤러를 변수에 넣어준다.
        },
        initialUrl: 'https://parkjh7764.tistory.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
```

</br>
## **앱바(AppBar) 아이콘 버튼 구현하기**

앱바에 아이콘 버튼을 구현하기 위해서는 AppBar의 **actions 매개변수에 위젯들을 넣으면** 오른쪽부터 왼쪽으로 차례대로 위젯들이 배치가 된다.

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

**loadUrl(homeUrl)** : homeUrl로 설정한 URL로 이동하도록 한다.

**controller!** : null이 아닌 값일 때만 homeUrl로 이동이 가능하도록 하도록 한다.

위에 if문으로 분명 null이 아닐 때라고 조건을 주었음에도 controller! 을 해줘서 null이 아님을 보장해줘야 한다.

</br>

### **webview_flutter: ^3.0.0 버전과 webview_flutter: ^4.0.2 버전 차이**

**webview_flutter: ^3.0.0**

```
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;
  final homeUrl = 'https://parkjh7764.tistory.com';
  HomeScreen({super.key});//controller 가 const가 아니기 때문에 const를 없애준다.@override
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
          this.controller = controller;//받아온 컨트롤러를 변수에 넣어준다.
        },
        initialUrl: homeUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
```

**loadUrl(homeUrl)** : homeUrl로 설정한 URL로 이동하도록 한다.

**controller!** : null이 아닌 값일 때만 homeUrl로 이동이 가능하도록 하도록 한다.

위에 if문으로 분명 null이 아닐 때라고 조건을 주었음에도 controller! 을 해줘서 null이 아님을 보장해줘야 한다.

**webview_flutter: ^4.0.2**

```
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://parkjh7764.tistory.com');

class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(homeUrl);
  HomeScreen({super.key});//controller 가 const가 아니기 때문에 const를 없애준다.@override
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

### **webview_flutter 4.0.2 버전 차이점**

1. **controller = WebViewController()** : controller를 원래는 onWebViewCreated 안에서 받았었는데, 위에서 직접 **controller를 선언**한 다음에 webView를 넣어준다.

2. **setJavaScriptMode()** :  javacriptMode를 webview 위젯 안에 넣지 않고 controller와 함께 선언한다.

3. **loadRequest(url)** : 초기 URL인 initialUrl을 controller와 함께 선언한다. 이 함수는 '**Uri**' 타입의 값을 넣어야 한다.

4. **Uri.parse()** : Uri 클래스에서 parse를 사용해 String 값을 Uri라는 클래스로 변경할 수 있게 한다.

5. **? 물음표 및 ! 느낌표 제거** : 컨트롤러가 생성될 때 null 값이 들어갈 수 없으므로 ?, !을 없앤다.
