# 💻 **프로젝트 매니저 (Project Manager)**
> **프로젝트 기간** : 2022.09.05 월 ~ 2022.09.30  </br>**팀원** : [재재](https://github.com/ZZBAE), [언체인](https://github.com/unchain123)</br>**리뷰어** : [Ryan](https://github.com/ryan-son)

<br>

# 🪧 목차
- [💻 프로젝트 소개](#-프로젝트-소개)
- [👥 팀원](#-팀원)
- [💾 개발환경 및 라이브러리](#-개발환경-및-라이브러리)
- [💡 핵심경험](#-핵심경험)
- [🌳 파일트리](#-파일트리)
- [🕰 타임라인](#-타임라인)
- [📱 구현한 화면](#-구현한-화면)
- [🤔 고민한 점](#-고민한-점)
- [🏀 트러블슈팅](#-트러블슈팅)
- [⌨️ 커밋 규칙](#%EF%B8%8F-커밋-규칙)


<br>

# 💻 프로젝트 소개
> 자신만의 계획을 정해놓은 날짜에 맞춰 계획 실행 여부를 손쉽게 관리할 수 있는 프로젝트 관리 앱입니다 😎

<br>

# 👥 팀원


| **[재재(ZZBAE)](https://github.com/ZZBAE)** | **[언체인(unchain)](https://github.com/unchain123)** |
|:---:|:---:|
|<img src=https://i.imgur.com/Xa9oBRA.png width=300, height=300>|<img src=https://i.imgur.com/bQpA64X.jpg width=300, height=300>|

<br>

# 💾 **개발환경 및 라이브러리**
[![swift](https://img.shields.io/badge/swift-5.0-orange)]()  [![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()  [![iOS](https://img.shields.io/badge/iOS-15.5-green)]()

<br>

# 💡 **핵심경험**
- [x] 다양한 기술 중 목적에 맞는 기술스택
- [x] 내가 선택한 기술을 통한 UI구현
- [x] Word wrapping 방식의 이해
- [x] 리스트에서 스와이프를 통한 삭제 구현
- [x] Date Picker를 통한 날짜입력

<br>

---
# 🌳 파일트리
```swift
├── ProjectManager
│   ├── ProjectManagerApp
│   └── Persistence
├── Model
│   └── project
├── View
│   ├── ProjectMainView
│   ├── ProjectEditView
│   └── ProjectAddView
├── subView
│   └── ProjectContentView
└── ViewModel
    ├── ProjectMainViewModel
    └── ProjectModalViewModel
```

<br>

# 🕰 **타임라인**
- **WEEK 1**

|날짜|프로젝트 진행 내용|
|:---:|:---|
|9월 5일|STEP1 요구명세서 공부 및 기술스택 선택|
|9월 6일|STEP1 PR 및 프로젝트 기본 구성 선택|
|9월 7일|STEP1 Merge 후 프로젝트 기본 세팅|
|9월 8일|SwiftUI 문서 공부 및 SwiftLint 적용|
|9월 9일|SwiftUI 문서 공부 및 기본 뷰 구성 시작|

- **WEEK 2**

|날짜|프로젝트 진행 내용|
|:---:|:---|
|9월 12일|ProjectMainView, AddView, EditView 구현|
|9월 13일|ProjectAddView와 EditView의 디테일 수정 및 mockData 적용|
|9월 14일|ProjectAddView를 통한 데이터 전달 및 ViewModel 생성|
|9월 15일|Project를 수정했을 때 수정된 데이터로 update하는 기능 구현|
|9월 16일|Project를 길게 눌렀을 때 다른 status로 이동하는 기능 구현|

- **WEEK 3**

|날짜|프로젝트 진행 내용|
|:---:|:---|
|9월 19일|Project를 swipe할 때 삭제하는 기능 구현|
|9월 20일|기능 구현 수정 및 로직의 MVVM 기준으로 분리|
|9월 21일|필요없는 코드 정리, View 구성 수정 및 전반적인 리팩토링|
|9월 22일|전체적인 뷰 및 코드 정리 후 STEP 2 PR|
|9월 23일|STEP2 리팩토링 및 리드미 작성|



---

# 📱 **구현한 화면**

|ProjectMainView|
|:---:|
|![](https://i.imgur.com/zg3EPy2.png)|

|ProjectEditView|ProjectAddView|
|:---:|:---:|
|![](https://i.imgur.com/Tpnrqck.png)|![](https://i.imgur.com/2v3sVyq.png)|

|프로젝트의 생성과 이동 기능|프로젝트의 수정과 삭제 기능|
|:---:|:---:|
|<img src=https://i.imgur.com/2yyvZWW.gif>|<img src=https://i.imgur.com/gM4iOwM.gif>|


<br>


---

# 🤔 **고민한 점**

## 기능의 일부가 다르고 같은 UI가 적용된 창을 만드는 방법을 고민
![](https://i.imgur.com/JUJbxVX.png)
- 일부 기능만 다르고 다른 UI디자인이 모두 동일한 뷰를 하나의 뷰로 할지 두개의 뷰로 나눠서 만들지를 고민 해봤습니다.
- 하나의 뷰에서 다른 기능 적인 부분만 분기 처리를 하여 만들게 되면 코드적으로 대응이 쉽고 디자인의 변경이 있더라도 한번에 적용할 수 있다는 장점이 있습니다. 여기서 단점은 만약에 디자인 요소가 처음의 방향과 다르게 수정과 추가 화면에서 다르게 적용이 된다면 대응하기 힘들다는 단점이 있습니다.
- 두개의 뷰로 만들어서 진행 할 경우에는 두개의 뷰에 대해 각각 다른 방향으로 디자인 변경이 이루어질경우에는 쉽게 대응할 수 있지만 같은 방향으로 변경이 되는 경우에는 같은 로직을 두번씩 써줘야 하는 번거로움이 있습니다.
- 여기서는 하나의 뷰에서 분기를 처리하는 것보다 두개의 뷰로 만들어서 관리하는게 더 깔끔한 코드가 될 것이라고 판단하여 두개를 뷰를 선택했습니다.

---

# 🏀 **트러블슈팅**

## T1. XCode 버전에 따른 시뮬레이터 프로젝트 터짐 현상

| 오류상황.gif | 오류상황.png |
| :--------: | :--------: |
| <img src = https://i.imgur.com/oSBwkeV.gif width=500, height=300> | <img src =https://i.imgur.com/wF5kTU6.png width=500, height=300>|

| 에러메세지(iOS16.0) | 에러메세지(iOS15.5) |
| :--------: | :--------: |
| <img src=https://i.imgur.com/QcMNpEU.png width=400, height=100> | <img src=https://i.imgur.com/ciBFS64.png width=400, height=100> |
- **문제**
    - 프로젝트 중간에 iOS와 MacOS, Xcode의 업데이트가 있었습니다. 저희 중 한명만 Xcode 14.0으로 업데이트를 하게 되면서 시뮬레이터의 iOS버전이 16.0으로 올라가게 되면서 기존 타겟팅이던 15.5에서는 일어나지 않던 오류가 발생했습니다. ProjectMainView에서 Popover를 통해 선택된 리스트의 내부의 뷰를 이동시키게 되었는데 다른 뷰로 보냈다가 다시 돌아오면 앱이 종료되는 현상이 발생했습니다.
- **해결**
    - 처음에는 업데이트된 엑스코드의 버전 차이로 인한 문제라고 생각했습니다. 하지만 리뷰어의 첨언 덕분에 저희 코드에서 popover를 하기 위해 만들었던 state프로퍼티인 isPopover를 onLongPressGesture를 이용해 true로 바꿔 준 다음 다시 false로 만들어주는 로직을 넣지 않았기 때문에 뷰의 state가 true인 곳으로 projectView를 이동시켰을 때 뷰가 들어가기도 전에 View에서 Popover를 띄우는 상태가 true이기 때문에 Popover를 띄워줘야 하는데 이 때 어디에 띄워야 하는지를 찾지 못해서 이런 에러가 발생을 했다고 판단을 했습니다.
    - 그래서 해결방법으로 Popover에서 눌려지는 버튼 내에 isPopover를 false로 만들어주는 로직을 추가 했습니다.

<br> 

---

## ⌨️ 커밋 규칙
* feat    : 기능 추가 (새로운 기능)
* refactor : 리팩토링 (네이밍 수정 등)
* style   : 스타일 (코드 형식, 세미콜론 추가: 비즈니스 로직에 변경 없음)

## 💻 코드 컨벤션
Swift Lint 형식 준수
