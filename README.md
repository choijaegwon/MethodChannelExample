# method_channel_example
## 플러터 iOS Method Channel Exmaple
channel 이름을 정한후, 각각 지정.  
flutter 에선 .invokeMethod()를 사용하여 swift에 있는 code실행, arguments도 필요하면 같이 넘겨주면 된다.

swift 에선 .setMethodCallHandler()를 사용하여 호출된 메서드 이름 확인, methodCall로 호출된 메서드 이름 확인후 원하는 함수 실행 후 반환