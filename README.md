# SwiftyEcharts
[![Build Status](https://travis-ci.org/Pluto-Y/SwiftyEcharts.svg)](https://travis-ci.org/Pluto-Y/SwiftyEcharts)
[![codecov](https://codecov.io/gh/Pluto-Y/SwiftyEcharts/branch/master/graph/badge.svg)](https://codecov.io/gh/Pluto-Y/SwiftyEcharts)
![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftyEcharts.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

____
## 简介
SwiftyEchart 是针对 [ECharts 3](http://echarts.baidu.com/) 进行封装的一个开源库。 主要方便针对不熟悉 `Javascript` 的小伙伴快速使用 `ECharts 3` 的特性，能做出细致的配置。 该项目将适用于 `iOS`, `MacOS`, `tvOS` 以及 `Server`， 并且有可能方便服务器的小伙伴能产生出正确的 `JSON` 交于前端（ `ECharts` ）处理。

目前该项目还在紧急开发中，由于项目有点大，也只有一个人开发，所以可能进度有点慢，希望小伙伴见谅~

同时如果遇到任何问题欢迎小伙伴提 [Issue](https://github.com/Pluto-Y/SwiftyEcharts/issues/new) 以及如果有兴趣的小伙伴也可以提 [Pull Request](https://github.com/Pluto-Y/SwiftyEcharts/compare) 给我， 加快项目的进度。

## TODO （开发计划）
___

接下来一段时间会针对以下这些开发计划逐步完整，也会根据大家反馈进行添加计划以及调整计划的优先级，目前即将要处理的主要有以下几块：

- [ ] 支持多种图形类型
  - [x] 散点图(已支持)
  - [x] 折线图(已支持)
  - [x] 柱状图(已支持)
  - [x] 地图(已支持)
  - [x] 饼图(已支持)
  - [x] 雷达图(已支持)
  - [x] k线图(已支持)
  - [x] 箱线图(已支持)
  - [x] 热力图(已支持)
  - [ ] 关系图
  - [ ] 矩形树图
  - [ ] 平行坐标
  - [x] 桑基图(已支持)
  - [x] 漏斗图(已支持)
  - [x] 仪表盘(已支持)
  - [x] 象形柱图(已支持)
  - [x] 主题河流图(已支持)
  - [ ] 日历图
- [x] 支持 `Swift` 语言各版本
> （ branch - Swift 2.3, master - Swift 3.x）
- [ ] 支持 `iOS`, `MacOS`, `tvOS`, `Server`
- [x] 支持事件处理
- [ ] 支持 `Echarts` 更多方法
- [ ] 支持模块化

## 安装

* 手动导入：
    * 将项目下的`SwiftyEcharts`目录拷贝到项目中
    * `Remove References`移除js目录，然后通过`create floder references`的方式添加js目录
* 通过 `Cocoapods` 进行导入：pod 'SwiftyEcharts'
* 通过 `Carthage` 进行导入： github "Pluto-Y/SwiftyEcharts"

⚠️  *** 请确保js目录是蓝色的 *** ⚠️ 


## 教程

## 系统要求
* iOS 8.0 + 
* Swift 3(master), Swift2.3(branch)

## 联系我

由于这个项目需要封装的内容有点多，希望有小伙伴一起来封装，有兴趣的小伙伴可以通过[@叫什么都都不如叫Pluto-Y](http://weibo.com/5690716723/info)来联系我。

## 许可证

SwiftyEcharts 使用 `MIT` 许可证，详情见 [LICENSE](https://github.com/Pluto-Y/SwiftyEcharts/blob/master/LICENSE) 文件。
