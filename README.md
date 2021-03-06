# Plastic Island(어떤 플라스틱인지 알려주고, 재활용 가능여부 자동으로 알려주는 앱)

Plastic Island는 DevPost라는 곳에서 주최한 HackUCI라는 미국남부대회에 출전하여 제작한 앱이에요.

40시간안에 팀원들끼리 자유주제로 아이디어를 구상하고 결정하여 어떤 플랫폼(앱/웹/데스크톱 등등)에서 제작할것인지, 그 플랫폼안에서 어떤 기술(예를들어 앱이라면, Hybrid/Native/Cross-Platform)을 사용할것인지 등을 결정하고 구현 완료 후 발표자료까지 제작하여 발표준비까지 40시간안에 완료해야하는 대회였기때문에, 즐길려고 나온 대회인것도맞지만, 개인적으로 수상하고 싶었어요.
그래서 수상하기위해서는 가능한한 20~30시간내에 제작가능할 정도로 간략하면서도 너무 간략하지만도 않고, 사람들에게 도움될만 여지가있으면서도 임팩트있는 무언가를 보여줄수있는 것을 제작해야만 한다고 생각했습니다.




## 아이디어 구상 및 토론

팀은 저 포함 총 4명이었고, 팀 구성원들을 간략히 소개하자면,  미국 남부쪽 대학생 2명(AI전공)/ 공동창업자(IT학부 전공,대학생,마케팅,기획,번역)/저(팀장) 이렇게 구성되었었습니다.

아이디어 구상할때는 약 10~15가지 아이디어가 나왔었는데, 전부다 각각 장단점이있었습니다. 시간이 촉박하기때문에 최대한 빨리 결정하고 해야하는와중에, 그렇다고 아이디어를 대충 결정하면 안되기도 하여 최대한 빠르게 신중히 결정하도록 노력하였습니다.

대회특성상 전 세계를 대상으로 세상의 문제를 해결하는데 집중하는 느낌의 대회였고, 그에 맞는 아이디어여야된다고 생각하였기때문에 요즘 가장큰 문제중 하나인 플라스틱 오염문제에 관련한 아이디어를 선정하였습니다.

## 기획

팀구성과 시간 관계상 최대한 빠르게 구현할수있는것들을 해야했기때문에, 팀원들이 이미가지고있는 역량으로 아이디어를 실현해보고자 노력했습니다.

최근 가장 많이다뤄본 기술이 Flutter이였고, AI전공자가 2명있었기때문에 이를 최대한 활용해서 

Flutter과 AI를 우리 프로젝트 기술의 중심으로두고, 공동창업자와 저는 기획과 UI,UX디자인에 집중하고, AI전공자들에게는 플라스틱을 분간하고, 재활용가능여부를 알아내주는 AI 모델을 제작하도록 지시하였습니다.

## 구현

기획-> UI,UX디자인 청사진 제작 까지 완료한 후 본격적으로 구현에 들어갔습니다.

약 25시간~30 정도를 투여하여 앱 제작이 완료는 되었으나, 가장 핵심 기능인 AI모델을 Flutter과 연동하는 기능을 만들어야되는데, 관련 경험이없어서 꽤 긴시간동안  고난의 삽질(?)을 한후 35시간쯔음에 겨우겨우 성공하여 구현이 완료되었습니다.

하지만 여전히 아쉬운점은 AI모델에 들어갈 데이터가 부족해서, 우리팀모두가 기대할만큼의 정확하고 똑똑한 AI모델을 제작하지는 못하겠다고하여...  어쩔수없이 애매한 AI모델을 연동한점이 아쉬웠습니다.

저 또한 더 나은 앱제작을위해 서버연동적인부분이나 다른 무언가를 더 추가하고싶었으나 시간이 촉박하여 그리하지 못한점이 아쉬웠으나 최대한 노력하고 완성까지했다는점에서 조금이나마 만족스러웠습니다.


## Emblem(플라스틱 사진을 서버로 전송해줄때마다 찍어주는 쿠폰!)

![Emblem](https://user-images.githubusercontent.com/42003685/116660526-1f64f800-a9ce-11eb-8c33-47009870ef49.gif)

AI camera를 이용해 플라스틱이 보이는 사진을 찍으면, 플라스틱인지 식별한 후 맞다면, 이 사진을 서버로 전송하고 저장하는 방식으로 구현하여, 이에 대한 감사함?으로 쿠폰을 찍어주는 컨셉으로 페이지를 제작하려고하였지만, 시간내에 기획한것만큼 제작할 수 없다고 판단하여, 할수있는만큼만 표현해보았답니다 ㅜ_ㅜ;


## AI Camera(사진을 찍으면 AI가 자동으로 어떤 플라스틱인지 식별해주고, 재활용가능여부 알려줘요!)

책상위에 나뒹굴던 코카콜라 PET병

![AI Camera](https://user-images.githubusercontent.com/42003685/116660574-30ae0480-a9ce-11eb-9c53-d0b7396ed934.gif)

마우스를 찍어보았어요!

![AI Camera 2](https://user-images.githubusercontent.com/42003685/116660630-458a9800-a9ce-11eb-9a5a-9fcdf2cd3f17.gif)

우리 프로젝트 핵심 기능인 AI와 Flutter연동하여 플라스틱 종류와 재활용가능여부를 자동으로 판단해주는 페이지에요!

위 gif에서 보면 아실 수 있듯이 학습된 것들에 대해서는 100%정확히는 구분 못해도, 100%에 최대한 가까운 확률로 구분을 하는것을 볼 수있으실거에요!

하지만 마우스같이 학습되지 않은 것들을 찍으면 아직 학습된 데이터가 많지않아서 정확하지않은 결과가 나오는 것이 아쉽네요 ㅜ_ㅜ;

## My Green Point(쿠폰 페이지에서 쿠폰을 찍는 만큼 포인트가 적립!)


![KakaoTalk_20210427_165541991_03](https://user-images.githubusercontent.com/42003685/116653088-76b09b80-a9c1-11eb-8516-40c25b09bb55.jpg)

Emblem 페이지에서 쿠폰을 적립하는만큼 포인트가 쌓이고, 쿠폰 10개를 다모으면 포인트를 더욱 더 많이! 적립해주는 페이지에요.

그래서 이 포인트를 모으면 현금으로 환전해서 사용할수있도록하거나, 특정 비트코인으로 전환해주도록하는 컨셉이에요~!






