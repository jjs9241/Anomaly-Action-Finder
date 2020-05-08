

# Anomaly action recognition

Anomaly action recognition은 동영상내의 이상행동(폭행과 실신)을 실시간으로 인식하고 분류해내는 프로젝트이다

## 데이터셋

- [AIHUB](http://www.aihub.or.kr/)의 이상행동 CCTV 영상 데이터를 사용

## 데이터 정제

- 정제 전 데이터
  ![](video/video1.gif)
- 정제된 데이터
  ![](video\video2.gif)

## 기반 모델

- 딥마인드의 [I3d](https://github.com/deepmind/kinetics-i3d) 를 사용
- 케라스 i3d [모델](https://github.com/dlpbc/keras-kinetics-i3d)을 사용



## Installation

```
git clone -b v1_flask_formerge https://github.com/jjs9241/Anomaly-Action-Finder.git
cd flask/imagezmq-streaming/test1
pip install -r requirements.txt
```

