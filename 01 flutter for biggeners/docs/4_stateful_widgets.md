# 4_2 Recap

StatefulWidget 에서 State 는 사실 그렇게 자주 사용하지 않는다.
- 더 좋은 방법이 있는데, 그건 아마 나~~중 강의에서 (틱톡강의쯤?)

6_6 에서 나왔다
- 그것은 바로 `FutureBuilder`
- `state` 가 자주 바뀌는 것이 아니라 한번 로딩할 때 사용하는 것이라면 `FutureBuilder` 로 충분해 보인다.

<br><br>

# 4_3 BuildContext

앱에서 `ThemeData` 설정
```
MaterialApp(
  theme: ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.deepOrange,
      ),
    ),
  ),
  ...
)
```

이후 하위 `CustomWidget` 에서 `Theme.of(context).textTheme` 으로 불러내 사용
```
Text(
  'My Large Title',
  style: TextStyle(
    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
    color: Theme.of(context).textTheme.titleLarge?.color,
  ),
);
```
<br>

# 4_4 Widget LifeCycle

`StatefulWidget` 에서 `state` 를 초기화하기 위해 아래와 같이 직접 멤버변수로 선언을 해줘도 되지만,
```
class _MyAppState extends State<MyApp> {
  List<int> numbers = [];
  ...
}
```

`context` 를 사용한다거나 API 호출 등 연산이 필요할 경우에는 `initState()` 메서드를 사용하면 된다.
```
class _MyAppState extends State<MyApp> {
  late List<int> numbers;

  @override
  void initState() {
    super.initState();  <- 먼저 해줘야 함
    numbers = [];
  }
  ...
}
```

화면에서 사라질 경우 실행할 것은 `dispose()` 메서드를 사용하면 된다.
```
class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    super.dispose();
  }
  ...
}
```

순서대로 보자면 `initState()` -> `build()` -> `dispose()` 순서로 실행된다.<br><br>

**Fin.**