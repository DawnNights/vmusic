# vmusic
V语言编写的对[酷狗](https://www.kugou.com/)、[酷我](http://www.kuwo.cn/)、[QQ](http://m.y.qq.com/)、[网易云](https://music.163.com/)这几个音乐平台的简单爬虫

其实也就是对[vlang](https://github.com/vlang/v)这门语言简单的试试水，语言本身的语法和特性还是挺有意思的，且能与C语言无缝衔接等等。但也架不住作者摆烂、文档稀缺、开发环境聊胜于无，网上搜不到什么相关的东西，想写点什么还要自己翻翻标准库以及示例是怎么写的......

```
import vmusic

keyword := 'aliez'
println(vmusic.kugou(keyword))
println(vmusic.kuwo(keyword))
println(vmusic.qqmusic(keyword))
println(vmusic.wycloud(keyword))
```