

# Anomaly Action Finder

Anomaly Action Finder는 실시간으로 CCTV 영상을 딥러닝 모델을 통해 분석하고, 이상행동(폭행과 실신)을 인식 및 분류하면 관리자에게 알림을 보내주고 해당 영상을 기록하는 위기 관리 시스템이다.



## 주요 기능

- CCTV 영상을 실시간으로 분석하여 이상행동 검출 시 이상행동 검출 영상 저장 및 푸시 알림을 허용한 관리자에게 알림을 보낸다.
- 웹 페이지에 접속하여 실시간으로 CCTV 영상들을 볼 수 있다.
- 검출된 영상은 서버에 저장되며, 추후에 웹 페이지에서 확인할 수 있다.
- 회원가입, 로그인, 매장, 매장별 CCTV 웹 페이지를 제공하여 개인이 어디서든 온라인으로 본인의 매장 및 CCTV를 관리할 수 있다.
- 지도 api를 사용하여 본인이 등록한 매장을 지도에서 확인할 수 있다.


## 폴더 및 파일들 

- ex1 : Spirng 기반 웹 서버
- Flask : Flask 서버들
	- Streaming-Deeplearning-Server
		- server_strm_flask.py : 딥러닝 영상 인식, 분류, 저장, 알림 및 스트리밍하는 Flask 서버
		- cctv_stream.py :  imageZMQ로 영상을 보내주는 Python 파일
		- two_stream_final_model.py : 딥러닝 인식 및 분류 모델
	- VideoRestServer 
		- app.py : 딥러닝 서버에서 보내준 영상과 데이터를 로컬 저장소와 DB에 저장하는 서버


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
git clone https://github.com/jjs9241/Anomaly-Action-Finder.git
cd flask/Streaming-Deeplearning-Server
pip install -r requirements.txt
```

