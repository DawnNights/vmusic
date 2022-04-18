import vmusic

const keyword = 'aliez'

fn test_kugou() {
	m := vmusic.kugou(keyword)
	println('歌名: ' + m.name)
	println('演唱者: ' + m.songer)
	println('跳转链接: ' + m.url)
	println('音频直链: ' + m.audio)
	println('封面直链: ' + m.cover)
	println('酷狗音乐平台测试完成\n')
}

fn test_kuwo() {
	m := vmusic.kuwo(keyword)
	println('歌名: ' + m.name)
	println('演唱者: ' + m.songer)
	println('跳转链接: ' + m.url)
	println('音频直链: ' + m.audio)
	println('封面直链: ' + m.cover)
	println('酷我音乐平台测试完成\n')
}

fn test_qqmusic() {
	m := vmusic.qqmusic(keyword)
	println('歌名: ' + m.name)
	println('演唱者: ' + m.songer)
	println('跳转链接: ' + m.url)
	println('音频直链: ' + m.audio)
	println('封面直链: ' + m.cover)
	println('QQ音乐平台测试完成\n')
}

fn test_wycloud() {
	m := vmusic.wycloud(keyword)
	println('歌名: ' + m.name)
	println('演唱者: ' + m.songer)
	println('跳转链接: ' + m.url)
	println('音频直链: ' + m.audio)
	println('封面直链: ' + m.cover)
	println('网易云音乐平台测试完成\n')
}
