# Playground usage



### iOS 常用命令
    
    pod install



### Android 下安装正式版本命令
cd android
// 打包
./gradlew assembleRelease
or
// 打包并安装()
./gradlew installRelease

备注：
  （1）需要真实设备。
  （2）暂时还没有解决打包安装到虚拟机时，因cpu架构引起的安装失败。INSTALL_FAILED_NO_MATCHING_ABIS。
  
    // adb 卸载  
   adb uninstall  com.example.firewood
   
    // gradle 卸载
   ./gradlew uninstallRelease


### 常见错误
有时候更新第三方库，导致ios无法编译，主要问题是cocoapods需要更新。
    sudo gem install cocoapods --pre