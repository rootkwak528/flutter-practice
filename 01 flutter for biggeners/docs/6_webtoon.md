# 6_6 FutureBuilder

StatefulWidget 을 많이 사용하지 않는 이유가 나왔다.

그것은 StatelessWidget 에서 FutureBuilder 를 사용하면 되기 때문.

최초에 api 서버로부터 데이터를 가져오는 등 초기에 state 변경에 대한 대응이 필요한 경우 사용하기 좋다.

```
body: FutureBuilder(
  future: webtoons,
  builder: (context, snapshot) {
    // snapshot 은 future 의 snapshot 이다.
    if (!snapshot.hasData) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ...
  }
```
<br>

# 6_7 ListView

ListView 를 무턱대고 쓰면, 많은 데이터가 한번에 로드되어 메모리를 낭비하거나 로딩에 시간이 오래걸리는 문제가 생길 수 있다.

그럴때는 ListView.builder() 를 사용하자.

ListView 에 itemBuilder 필드가 필수 필드로 추가된 것인데, 이걸 사용하면 flutter 가 알아서 화면에 보이는 item 만 빌드해서 보여주고, 화면에 보이지 않는 item 은 없애서 메모리를 풀어준다.

사실 더 자주 사용하게 될 방법은 ListView.seperated() 다.

builder() 에 seperatorBuilder 필드가 필수 필드로 추가된 것인데, 이걸 사용하면 item 사이사이에 위젯을 추가해준다.

```
ListView.separated(
  scrollDirection: Axis.horizontal,
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    print(index);  <- 이걸로 디버그 콘솔을 보면 스크롤할때마다 itemBuilder 가 동작하는걸 볼 수 있다.
    var webtoon = snapshot.data![index];
    return Text(webtoon.title);
  },
  separatorBuilder: (context, index) {
    return const SizedBox(
      width: 10,
    );
  },
);
```
<br>

# 6_8 Webtoon Card

ListView (Axis.horizontal) 로 Column 을 만드려고 하면 에러가 발생한다.
- 그럴땐 Expanded 로 감싸주면 된다.
```
FlutterError (Horizontal viewport was given unbounded height.
Viewports expand in the cross axis to fill their container and constrain their children to match their extent in the cross axis. In this case, a horizontal viewport was given an unlimited amount of vertical space in which to expand.)
```

그림자가 잘릴 땐, padding 값을 추가해주자.<br><br>

# 6_9 Detail Screen

fullscreenDialog: true 하면 아래에서 화면이 올라오고 < 대신 X 로 화면을 닫는다.

GestureDetector 를 사용하면 엄청나게 다양한 사용자 제스처를 인지할 수 있다.

Navigator 를 사용하면 다른 페이지로 이동할 수 있다. (사실 이동하는 느낌을 낼 수 있다.)

```
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          webtoon: webtoon,
        ),
      ),
    );
  },
  ...
)
```
<br>

# 6_10 Hero

두 스크린에서 각각의 위젯을 애니메이션으로 연결시키고 싶다면 Hero 를 사용하자.
- 두 위젯의 tag 값을 고유하게 공유하면 알아서 된다.
<br><br>

# 6_16 Episodes

ScrollView 안에 ListView 를 넣고 싶다면 ?
- SingleChildScrollView 로는 되지 않음.
- 앞서 6_8 Webtoon Card 에서 설명했던 ListView 를 Expanded 로 감싸는 거로도 충분하지 않음.
- 이유는 ListView 의 높이가 정해지지 않았기 때문.

해결책 1. ListView 를 한번에 다 불러오기
```
SingleChildScrollView(
  physics: const ScrollPhysics(),  <- 얘만 스크롤 가능하게 하고
  child: Column(
    children: [
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        <- ListView 는 스크롤을 막는다.
        ...
      ),
    ],
  ),
)
```

해결책 2. CustomScrollView
sliver 를 사용하는 방법인데, 생각보다 복잡하다.

나중에 필요할 때 써봐야지.

> 참고 : https://www.youtube.com/watch?v=LUqDNnv_dh0&t=4s

<br>

**Fin.**