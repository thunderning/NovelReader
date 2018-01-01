# 《御·览》v1.0
一款看网络小说的软件，使用《追书神器》的API来获取数据
____
## 开发环境
- Xcode：9.1
- Swift: 4.0
- 第三方包管理： Carthage
----
## 编译运行
1. 安装Carthage
    ```
    brew install Carthage
    ```
2. clone项目到本地
3. 进入项目目录下，更新第三方库
   ```
   carthage uodate
   ```
4. 编译运行
----
## 功能展示
### 主界面
主界面显示已经收藏的书籍，左上角可以打开菜单，也可以侧滑出菜单。书籍可以侧滑删除，自动保存至本地

<img src="https://github.com/thunderning/NovelReader/blob/master/images/main.png" width="50%" height="%50">

### 侧滑菜单
最终目标是实现三个添加接口，目前只有排行榜可以使用

<img src="https://github.com/thunderning/NovelReader/blob/master/images/mainmenu.png" width="50%" height="%50">

### 排行榜界面

<img src="https://github.com/thunderning/NovelReader/blob/master/images/rank.png" width="50%" height="%50">

### 排行榜具体信息
异步加载图片

<img src="https://github.com/thunderning/NovelReader/blob/master/images/ranklist.png" width="50%" height="%50">

### 书籍具体信息
自动查找本地信息，若此书已存在，则显示移除按钮，否则是添加按钮

<img src="https://github.com/thunderning/NovelReader/blob/master/images/detail.png" width="50%" height="%50">
<img src="https://github.com/thunderning/NovelReader/blob/master/images/detail2.png" width="50%" height="%50">

### 加载阅读界面
第一次打开某书籍要初始化其中的本地存储结构，耗时较长

<img src="https://github.com/thunderning/NovelReader/blob/master/images/firstopen.png" width="50%" height="%50">

### 阅读界面
顶部是章节名称，左下角读取电池信息和时间信息。采用仿真翻页效果

<img src="https://github.com/thunderning/NovelReader/blob/master/images/reader.png" width="50%" height="%50">

### 阅读界面设置
点击屏幕中央弹出设置界面，可以改变屏幕亮度，修改字体大小，白天的背景色

缓存按钮可以异步缓存此书所有章节

<img src="https://github.com/thunderning/NovelReader/blob/master/images/readersetting.png" width="50%" height="%50">

### 夜间模式
<img src="https://github.com/thunderning/NovelReader/blob/master/images/night.png" width="50%" height="%50">

### 选择章节
<img src="https://github.com/thunderning/NovelReader/blob/master/images/chapterchosen.png" width="50%" height="%50">

### 支持下拉刷新
<img src="https://github.com/thunderning/NovelReader/blob/master/images/refresh.png" width="50%" height="%50">

### 选择源
<img src="https://github.com/thunderning/NovelReader/blob/master/images/sourcechosen.png" width="50%" height="%50">

## 目标添加的功能
- [x] 阅读器分页
- [x] 阅读器修改字体和行间距
- [x] 阅读器换肤
- [x] 阅读器换源
- [x] 数据持久化
- [x] 网络连接问题提醒
- [x] 通过排行榜添加书籍
- [ ] 通过搜索选书
- [ ] 通过分类选书
- [ ] 通过书单选书
- [ ] 可修改翻页方式
- [ ] 整体主题统一可变
- [ ] 阅读时间提醒
- [ ] 低电量提醒

## 第三方库
- ESPullToRefresh   下拉刷新
- PKHUD 提醒框
- Segmentio 选择框
- SwiftTheme 换肤功能
- Chameleon 扁平化颜色
- FlowingMenu 侧滑菜单

## 结语
虽然距离理想目标还有一段距离，但是至少目前已经可以选书看书了，权当是1.0版本啦。以自己目前的使用感觉来看，无论是功能上还是性能上基本算是比较成功。在考试周忙完之后会继续该项目的开发，也欢迎大家使用。这是目前为止唯一一门课程让我写出了能够方便自己生活的程序，感谢曹老师一个学期的教导，下学期还会选您的课。
