# 《追书神器》API总结

追书神器`api`官方地址:

```javascript
http://api.zhuishushenqi.com
http://api05iye5.zhuishushenqi.com
http://chapterup.zhuishushenqi.com/chapter
http://statics.zhuishushenqi.com
```

## 接口

1. 获取所有分类(带书籍数量)
2. 获取分类下小类别
3. 根据分类获取小说列表
4. 获取排行榜类型
5. 获取排行榜小说
6. 获取书单列表
7. 获取书单信息
8. 获取搜索热词
9. 搜索自动补充
10. 模糊搜索
11. 精确搜索
12. 获取小说最新章节
13. 获取小说信息
14. 获取小说正版源
15. 获取小说源(正版➕盗版)
16. 获取小说章节(根据小说id)
17. 获取小说章节(根据小说源id)
18. 获取小说章节内容

**所有接口都是`GET`请求**

##### 1. 获取所有分类

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | /cats/lv2/statistics                     |
| 参数     | null                                     |
| 实例接口地址 | http://api.zhuishushenqi.com/cats/lv2/statistics |

##### 2. 获取分类下小类别

| 类型     | 值                                     |
| ------ | ------------------------------------- |
| 接口地址   | /cats/lv2                             |
| 参数     | null                                  |
| 实例接口地址 | http://api.zhuishushenqi.com/cats/lv2 |

##### 3. 根据分类获取小说列表

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | /book/by-categories                      |
| 参数     | 说明                                     |
|        | gender: 男生:`mael`    女生:`female`     出版:`press` |
|        | type: 热门:`hot` 新书:`new` 好评:`repulation` 完结: `over` 包月: `month` |
|        | major: 大类别 从接口1获取                        |
|        | minor: 小类别 从接口2获取 (非必填)                  |
|        | start: 分页开始页                             |
|        | limit: 分页条数                              |
| 实例接口地址 | https://api.zhuishushenqi.com/book/by-categories?gender=male&type=hot&major=%E5%A5%87%E5%B9%BB&minor=&start=0&limit=20 |

##### 4. 获取排行榜类型

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | /ranking/gender                          |
| 参数     | null                                     |
| 实例接口地址 | http://api.zhuishushenqi.com/ranking/gender |

##### 5. 获取排行榜小说

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | /ranking/:rankId                         |
| 参数     | 排行榜的ID,不同字段对应不同的榜单,具体ID从接口4中获取           |
|        | _id: 周榜ID                                |
|        | monthRank: 月榜ID                          |
|        | totalRank: 总榜ID                          |
| 实例接口地址 | http://api.zhuishushenqi.com/ranking/54d43437d47d13ff21cad58b |

##### 6. 获取书单列表

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | /book-list                           |
| 参数     | 说明                             |
|sort|收藏人数降序：`collectorCount` 创建时间降序：`created`   |
|duration   |最近一周：`last-seven-days` 全部：`all`   |
|gender   |  男生:`mael`    女生:`female` |
|tags   | 暂且不知道从哪获取  |
|start   | 数字，从第几条开始获取  |
| 实例接口地址 | https://api.zhuishushenqi.com/book-list?sort=collectorCount&duration=last-seven-days&start=0 |

##### 7. 获取书单信息

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | /book/:booklistId                             |
| 参数     | booId具体书单的ID                             |
| 实例接口地址 | https://api.zhuishushenqi.com/book-list/5a2f35bb3226d6f042791fd4 |

##### 8. 获取搜索热词

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口     | /book/search-hotwords                    |
| 参数     | null                                     |
| 实例接口地址 | http://api.zhuishushenqi.com/book/search-hotword |

##### 9. 搜索自动补充

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口     | /book/auto-complete                      |
| 参数     | `query`:查询值                              |
| 实例接口地址 | http://api.zhuishushenqi.com/book/auto-complete?query=%E6%96%97%E7%BD%97 |

##### 10. 模糊搜索

| 类型   | 值                                        |
| ---- | ---------------------------------------- |
| 接口   | /book/fuzzy-search                       |
| 参数   | `query`:查询值                              |
| 实例地址 | http://api.zhuishushenqi.com/book/fuzzy-search?query=%E6%96%97%E7%BD%97 |

##### 11. 精确搜索

| 类型   | 值                                        |
| ---- | ---------------------------------------- |
| 接口   | /book/accurate-search                       |
| 参数   | 说明                            |
|author   | 作者名  |
|title   | 小说名  |
| 实例地址 | http://api.zhuishushenqi.com/book/accurate-search?title=一念永恒 |

##### 12. 获取小说信息

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | /book/:booId                             |
| 参数     | booId具体小说的ID                             |
| 实例接口地址 | http://api.zhuishushenqi.com/book/548d9c17eb0337ee6df738f5 |

##### 13. 获取小说正版源

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | /btoc                                    |
| 参数     | view: 暂时只知道`summary`这个参数 book: 对应的bookId |
| 实例接口地址 | http://api.zhuishushenqi.com/btoc?view=summary&book=548d9c17eb0337ee6df738f5 |

##### 14. 获取小说正版源与盗版源(混合)

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | /atoc                                    |
| 参数     | `view`: 暂时只知道`summary`这个参数` book`: 对应的bookId |
| 实例接口地址 | http://api.zhuishushenqi.com/atoc?view=summary&book=548d9c17eb0337ee6df738f5 |

##### 15. 获取小说章节(根据小说id)

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | /mix-atoc/:bookId                        |
| 参数     | `bookId`:对应小说id `view`:暂时只知道`chapters`   |
| 实例接口地址 | http://api.zhuishushenqi.com/mix-atoc/50bff3ec209793513100001c?view=chapters |

##### 16. 获取小说章节(根据小说源id)

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | /atoc 或者/btoc                            |
| 参数     | `sourceId`:对应小说源id `view`:暂时只知道`chapters |
| 实例接口地址 | http://api.zhuishushenqi.com/atoc/568fef99adb27bfb4b3a58dc?view=chapters |

##### 17. 获取小说章节内容

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口地址   | chapterup.zhuishushenqi.com/chapter/     |
| 参数     | link: 章节地址                               |
| 实例接口地址 | http://chapterup.zhuishushenqi.com/chapter/http://vip.zhuishushenqi.com/chapter/5817f1161bb2ca566b0a5973?cv=1481275033588 |

##### 18. 获取小说最新章节

| 类型     | 值                                        |
| ------ | ---------------------------------------- |
| 接口     | /book                                    |
| 参数     | `view`: updated `id`:以逗号分割的bookId        |
| 实例接口地址 | http://api05iye5.zhuishushenqi.com/book?view=updated&id=531169b3173bfacb4904ca67 |

书籍id -> 获取所有书源 -> 书源id -> 获取章节目录 -> 章节link -> 章节内容
