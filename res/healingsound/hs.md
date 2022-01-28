## 개요

![666](https://user-images.githubusercontent.com/33044667/149703439-4a47cfe0-a56b-4d99-a14c-25a6cdb0059f.gif)

![Screenshot_1643372518](https://user-images.githubusercontent.com/33044667/151546467-02d3c9ed-6fbc-4a18-a3e7-ec41ca836334.png)
![Screenshot_1643372509](https://user-images.githubusercontent.com/33044667/151546480-e5aa2b3e-405b-47f9-8781-11655356c5e5.png)
![Screenshot_1643372525](https://user-images.githubusercontent.com/33044667/151546484-a0a7ace4-273c-425e-a8ac-f725a2ed5cfe.png)
![Screenshot_1643372565](https://user-images.githubusercontent.com/33044667/151546487-70f7abf7-103c-4ff7-9269-d5b779182915.png)
![Screenshot_1643372556](https://user-images.githubusercontent.com/33044667/151546493-f57b4e6b-5f7f-46be-954b-d9c066d64840.png)
![Screenshot_1643372553](https://user-images.githubusercontent.com/33044667/151546498-c04529bc-c976-4982-9835-46b18e2ad568.png)
![Screenshot_1643372543](https://user-images.githubusercontent.com/33044667/151546500-5b7fa341-c4a4-4928-adf8-be55beae486c.png)


```
Tensorflow lite 기반의 object detection 모델로 6.6.6운동을 하는 사람의 혀 를 탐지하고,
이를 기반으로 6.6.6 운동을 실행, 평가 하는 어플리케이션 입니다. 

기존 혀 object detection 모델은 외주로 맡겼던 pytorch 기반의 detectron2 모델이었는데, 해당 모델은
모바일에서 실행이 불가능해서, 기존의 데이터와 라벨링데이터를 가지고 tflite모델로 직접 재 학습시켰습니다.
일반적인 중급기 사양에서 추론시간은 약 200ms 정도 되며 정확한 탐지시 score는 약 0.8~0.9 사이가 나옵니다.

어플리케이션은 플러터 기반이지만 휴대폰 알림문제, 머신러닝 모델 문제로 안드로이드만 대응하기로 결정했고, 6.6.6운동을 담당하는 화면은
안드로이드 native로 개발하였습니다.
```


## 개발환경

```
프레임워크 : Flutter with Android native
Dart, Kotlin
```
## 
