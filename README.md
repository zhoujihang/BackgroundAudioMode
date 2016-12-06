# BackgroundAudioMode
iOS后台播放无声音乐，延长app后台使用时间

* 检测进入到后台播放音乐，进入前台不再播放
* 处理中断事件，接到电话时停止播放，电话结束后自动再次播放
* 一键设置，侵入性小
* 混合模式，不影响其他app音乐播放

使用方法:
开启后台播放

```
AudioManager.shared.openBackgroundAudioAutoPlay = true 
```
关闭后台播放

```
AudioManager.shared.openBackgroundAudioAutoPlay = false
```


Mark:

```
 不要忘了info.plist中开启后台音乐播放模式
```