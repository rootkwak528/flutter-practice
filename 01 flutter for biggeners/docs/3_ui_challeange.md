# 3_1 developer tools

## 3_1_1 Widget Inspector 구성 요소

![image](https://user-images.githubusercontent.com/46735998/231494814-e2ff6562-ed75-4701-a91f-b8059b030fa8.png)

### 3_1_1_1 메인 화면

1. Widget Tree : 모든 위젯을 트리 형태로 확인
2. Layout Explorer : 선택한 위젯의 형태적 구성 확인
    - 선택하는 방법 1: Widget Tree 에서 선택
    - 선택하는 방법 2: Select Widget Mode 를 켜고, 시뮬레이터에서 선택
3. Widget Details Tree : 선택한 위젯의 모든 속성 확인

### 3_1_1_2 툴바

> 토글로 아래 속성을 on/off 할 수 있음

1. ![image](https://user-images.githubusercontent.com/46735998/231493077-3d05a8bd-9712-45c2-8c36-3b012b423d7b.png)
Select Widget Mode : 시뮬레이터에서 클릭으로 위젯을 선택할 수 있음
    - 한번에 원하는 위젯을 클릭하기 어렵다면 클릭앤드래그를 해보자
    - 위젯을 새로 선택하려면 시뮬레이터 좌하단의 돋보기 버튼을 클릭하자
2. ![image](https://user-images.githubusercontent.com/46735998/231493126-40f1cc1f-4148-4747-8395-340be2e9ac91.png)
타이머 : 시뮬레이터에서 애니메이션 5배 느리게 재생
3. ![image](https://user-images.githubusercontent.com/46735998/231493176-e2f31f08-e14a-42d9-81fa-1955b696b3af.png)
가이드라인 : 시뮬레이터에서 모든 위젯 외곽선 표시
4. ![image](https://user-images.githubusercontent.com/46735998/231493217-da80b8a6-e42a-496d-ac44-6407aaac9c70.png)
베이스라인 : 시뮬레이터에서 모든 텍스트의 베이스라인 표시
5. ![image](https://user-images.githubusercontent.com/46735998/231493259-8c508f6c-3e41-4edb-8e79-464d0d180c32.png)
리페인트 : 시뮬레이터에서 위젯이 바뀌면 (리페인트 되면) 외곽선을 그려줌
6. ![image](https://user-images.githubusercontent.com/46735998/231493293-d4d2f49d-6fea-4c8e-851f-c062e9737cf7.png)
이미지 : 시뮬레이터에서 이미지를 단색으로 변경해 메모리 아껴줌<br><br>

# 3_3 VSCode Settings

Command Palette (⇧⌘P) 에서 `Preferences: Open User Setting (JSON)` 으로 들어가 `setting.json` 을 수정하면 VSCode 설정을 수정할 수 있다. 

```
"[dart]": {
    "editor.formatOnSave": true  <- 파일 저장하면 포맷 맞춰줌
},
"editor.codeActionsOnSave": {
    "source.fixAll": true  <- 파일 저장하면 IDE 가 자동 수정해줌 (const 지정 등)
},
"dart.previewFlutterUiGuides": true,  <- 위젯 구분선을 만들어줘 보기 편함
```

Extension 추천 : **Error Lens**<br><br>

# 3_4 Code Actions

VSCode 에서 제공하는 Code Actions (⌘.) 기능을 사용하면, 손쉽게 위젯을 감싸거나, extract 할 수 있다.
