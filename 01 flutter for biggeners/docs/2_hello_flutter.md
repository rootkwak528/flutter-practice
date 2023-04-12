# 2_3 hello world (부제 : everything is WODGET !!)

플러터는 모든 것이 위젯 ~!

위젯 예시 : https://docs.flutter.dev/development/ui/widgets
- 필요한 기능이 있다면 여기서 찾아보자 거의 다 있다

위젯은 flutter SDK 에 있는 3가지 core Widget 중 하나를 `extend` 해야 한다.

1. `StatelessWidget`
    - 가장 간단한 위젯
    - 메서드 : build()

2. `StatefulWidget`

3. (남은 하나는 무엇일까? `ProxyWidget`? `RenderObjectWidget`?)

`runApp()` 의 인자로 넘겨주는 root App 은 `MaterialApp` (구글st) 혹은 `CupertinoApp` (애플st) 중 하나여야 한다.

- 커스텀 스타일 앱으로 만들더라도 둘 중 하나에서 골라야 함

- 그러나 일단은 flutter 가 구글 서비스니 `MaterialApp` 으로 시작하는게 일반적<br><br>


**Fin.**
