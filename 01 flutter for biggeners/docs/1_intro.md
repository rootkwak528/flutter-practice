# 1_2 why flutter

flutter 로 만든 게임
> https://flutter.dev/games?gclid=Cj0KCQjw27mhBhC9ARIsAIFsETHprHTk_2qfdb5JI2HvRuBToGZza-GA-jucsNmZ1ux-BNZGE0F-iqEaAltVEALw_wcB&gclsrc=aw.ds

flutter 로 만든 애니메이션
> https://flutterplasma.dev/

flutter 앱 예시
> https://flutter.dev/showcase<br>
> 특히 'wonderous' 앱

<br>

# 1_3 how flutter works

![flutter architectural overview](https://docs.flutter.dev/assets/images/docs/arch-overview/archdiagram.png)

> https://docs.flutter.dev/resources/architectural-overview

flutter 는 게임처럼 엔진을 사용한다.

운영체제의 네이티브 위젯을 사용하는 게 아니라, 최대한 비슷해 보이도록 만든 flutter 의 위젯을 엔진이 그려주는거다.

이미지에서 보이는 3개 레이어 구조로 구성되어 있고, 가장 하위의 Embedder 에서 운영체제 별로 만들어진 runner program 으로 Engine 을 실행하고, Engine 이 개발자가 작성한 Flutter/Dart 코드를 컴파일해 실행하는 것이다.

단점
- 운영체제의 네이티브 위젯을 사용하지 않기 때문에 조금 부자연스러울 수 수 있다.

장점
- 네이티브 위젯보다 다양한 룩을 보일 수 있다.
- 운영체제에 의한 제약이 없다.<br><br>

# 1_4 flutter vs. react native

둘다 유명한 크로스 플랫폼 프론트엔드 프레임워크.

flutter 가 엔진을 이용해 화면을 렌더링하는 반면, react native 는 javascript 를 이용해 운영체제와 통신해서 렌더링한다.

react native 가 운영체제의 네이티브 위젯을 그리기 적합하다면, flutter 는 100% 자유로운 화면 구성을 할 때 더 유용하다.<br><br>


**Fin.**
