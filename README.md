# Big_Contest_2018
블레이드 앤 소울 게임 유저의 이탈 시점 예측

## 1. 모델 개요
![alt_text](https://github.com/Juhee-Maeng/Big_Contest_2018/blob/master/images/1.%20%EA%B0%9C%EC%9A%94.PNG)
- 파생 변수 생성 및 데이터 전처리
- 랜덤 포레스트를 통해, 최적 변수 선별
- 베이지안 최적화를 통해, 최적 하이퍼 파라미터 선별
- 최종적으로, Model stacking을 통해, 유저 이탈 예측

## 2. 파생변수

### 2.1 ) EDA
- Train, Test 데이터의 분포가 일치하지 않는 변수들 소량 존재
- 오 분류의 원인이 되는 변수일 수 있으므로 제거
![alt_text](https://github.com/Juhee-Maeng/Big_Contest_2018/blob/master/images/2.1.%ED%8C%8C%EC%83%9D%EB%B3%80%EC%88%98(EDA).PNG)

### 2.2 ) Isolation Forest
- Isolation Forest를 이용한 Outlier Feature 생성 기법
- 의사결정나무를 통해 어느 한 점 𝑥𝑖 가 고립될 때까지 공간을 분할
- 고립이 될 때까지의 분기 횟수를 기준으로 정상치와 이상치를 구분
- 이상치를 1, 그 외는 0으로 하는 Outlier Feature 생성
![alt_text](https://github.com/Juhee-Maeng/Big_Contest_2018/blob/master/images/2.2.%ED%8C%8C%EC%83%9D%EB%B3%80%EC%88%98(isolation%20forest).PNG)

## 3. 랜덤 포레스트
- 여러 개의 결정 트리들을 임의적으로 학습하는 방식의 앙상블 방법
- 최종적으로 여러 개의 결정 트리들의 결과를 종합함으로써 예측을 함
![alt_text](https://github.com/Juhee-Maeng/Big_Contest_2018/blob/master/images/3.%EB%9E%9C%EB%8D%A4%ED%8F%AC%EB%A0%88%EC%8A%A4%ED%8A%B8.PNG)

## 4. 베이지안 최적화

### 4.1 ) 예측모델의 성능 고도화
- 베이지안 최적화는 기계학습 모델의 최적 하이퍼 파라미터를 찾기 위해 사용할 수 있음
- f 함수를 하이퍼 파라미터에 따른 학습된 모델의 성능 함수로 설정하여, 기계학습 모델의 성능을 최대화 시키는 하이퍼 파라미터를 탐색할 수 있음
![alt_text](https://github.com/Juhee-Maeng/Big_Contest_2018/blob/master/images/4.%EB%B2%A0%EC%9D%B4%EC%A7%80%EC%95%88.PNG)

### 4.2 ) 하이퍼 파라미터 튜닝 결과
- 전처리와 Feature Engineering으로 구성한 다양한 데이터셋마다 베이지안 최적화를 통해 최적의 하이퍼 파라미터를 찾음
- 베이지안 최적화 히스토리를 기록함으로써, 앙상블 할 때 더 다양한 조합으로 사용
![alt_text](https://github.com/Juhee-Maeng/Big_Contest_2018/blob/master/images/4.2.%EB%B2%A0%EC%9D%B4%EC%A7%80%EC%95%88.PNG)

### 4.3 ) Model Stacking을 통한 앙상블
- 다수의 예측 모델로부터 얻어진 Label을 다시 학습에 활용하여 새로운 예측 모델을 만드는 모델 앙상블 기법 중 하나
- 각각의 베이스 모델이 잘 작동하는 부분과 작동하지 않는 부분을 기계학습을 통해  학습하여, 개별 모델보다 좋은 성능을 보임

## 5. 결론

![alt_text](https://github.com/Juhee-Maeng/Big_Contest_2018/blob/master/images/5.%20%EA%B2%B0%EB%A1%A0.PNG)
