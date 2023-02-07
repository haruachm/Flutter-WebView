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
