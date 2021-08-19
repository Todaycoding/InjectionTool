# InjectionTool

> **Injection**：可以代码修改之后，立即看到修改后的效果，少去了重新编译运行的麻烦，对于一些交互复杂页面层级较多的情况，可以大大的提升开发效率。

## 为什么选择这个

- **不再需要将你要修改的代码加入到-(void)injected{}方法中**

- 适配支持 **iOS 9.0+** 项目 

- **支持懒加载**

- 只需要Pod 引入/集成项目即可，不需要工程写任何集成代码。

- 网上通用做法如下【介入此组件后，不再需要如下操作！】 

```
打开你的源码，在AppDelegate.m的didFinishLaunchingWithOptions方法添加一行代码：
#if DEBUG
    [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
#endif

在需要修改界面的ViewController添加方法- (void)injected，所有修改控件的代码都写在这里面。
-(void)injected{
}

```

## 完整接入指南

- [ Injection III ](https://johnholdsworth.com/injection.html) 
	- 源作者维护的视频说明及下载链接
- 备注：如果是Cocoapods组装工程，则需要参考如下操作 即可生效。
	- Open Project：选择壳工程
	- Add Directory：选择修改子组件

- 仓库内也包含示例工程（OC+Swift），可以运行体验。

## TODO

- 源码完善后再开源 [8月底前]
- 是否支持懒加载支持动态更新 8月底前]

## Installation

InjectionTool is available through [CocoaPods](https://cocoapods.org/pods/InjectionTool). To install it, simply add the following line to your Podfile:

```ruby

  pod 'InjectionTool', '~> 1.0.0',:configurations => 'Debug'

```

## Author

> Dragonli@88.com

## License

InjectionTool is available under the MIT license. See the LICENSE file for more info.
