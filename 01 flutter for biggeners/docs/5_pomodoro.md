# 5_0 User Interface

Flexible : 유연하게 화면을 비율대로 구성하는 위젯<br><br>

# 5_4 Code Challenge

```
Exception has occurred.
LateError (LateInitializationError: Field 'timer' has not been initialized.)
```

`late` 변수를 선언하지 않고 참조할 경우, `LateInitializationError` 가 발생할 수 있다.

`initState()` 에서 선언하지 않는다면 `late` 대신 `?` 사용을 고려해보자.<br><br>

**Fin.**