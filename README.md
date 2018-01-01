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

![](https://github.com/thunderning/NovelReader/blob/master/images/main.png){:height="50%" width="50%"}
### 侧滑菜单
最终目标是实现三个添加接口，目前只有排行榜可以使用

![](https://github.com/thunderning/NovelReader/blob/master/images/mainmenu.png){:height="50%" width="50%"}
### 排行榜界面
![](https://github.com/thunderning/NovelReader/blob/master/images/rank.png){:height="50%" width="50%"}
### 排行榜具体信息
异步加载图片

![](https://github.com/thunderning/NovelReader/blob/master/images/ranklist.png){:height="50%" width="50%"}
### 书籍具体信息
自动查找本地信息，若此书已存在，则显示移除按钮，否则是添加按钮

![](https://github.com/thunderning/NovelReader/blob/master/images/detail.png){:height="50%" width="50%"}
![](https://github.com/thunderning/NovelReader/blob/master/images/detail2.png){:height="50%" width="50%"}
### 加载阅读界面
第一次打开某书籍要初始化其中的本地存储结构，耗时较长

![](https://github.com/thunderning/NovelReader/blob/master/images/firstopen.png){:height="50%" width="50%"}
### 阅读界面
顶部是章节名称，左下角读取电池信息和时间信息。采用仿真翻页效果

![](https://github.com/thunderning/NovelReader/blob/master/images/reader.png){:height="50%" width="50%"}
### 阅读界面设置
点击屏幕中央弹出设置界面，可以改变屏幕亮度，修改字体大小，白天的背景色

缓存按钮可以异步缓存此书所有章节

![](https://github.com/thunderning/NovelReader/blob/master/images/readersetting.png){:height="50%" width="50%"}
### 夜间模式
![](https://github.com/thunderning/NovelReader/blob/master/images/night.png){:height="50%" width="50%"}
### 选择章节
![](https://github.com/thunderning/NovelReader/blob/master/images/chapterchosen.png){:height="50%" width="50%"}
### 支持下拉刷新
![](https://github.com/thunderning/NovelReader/blob/master/images/refresh.png){:height="50%" width="50%"}
### 选择源
![](https://github.com/thunderning/NovelReader/blob/master/images/sourcechosen.png){:height="50%" width="50%"}
