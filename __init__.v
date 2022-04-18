module vmusic

import json

pub struct Music {
pub:
	name   string
	songer string
	url    string
	audio  string
	cover  string
}

pub fn kugou(keyword string) &Music {
	// 调用酷狗搜索API获取第一条搜索信息
	stamp := timestamp()
	hash := 'NVPh5oo715z5DIWAeQlhMDsWXXQV4hwtbitrate=0callback=callback123clienttime=$stamp' +
		'clientver=2000dfid=-inputtype=0iscorrection=1isfuzzy=0keyword=$keyword' + 'mid=$stamp' +
		'page=1pagesize=30platform=WebFilterprivilege_filter=0srcappid=2919tag=emuserid=-1uuid=$stamp' +
		'NVPh5oo715z5DIWAeQlhMDsWXXQV4hwt'

	mut data := webget('https://complexsearch.kugou.com/v2/search/song', {
		'callback':         'callback123'
		'keyword':          keyword
		'page':             '1'
		'pagesize':         '30'
		'bitrate':          '0'
		'isfuzzy':          '0'
		'tag':              'em'
		'inputtype':        '0'
		'platform':         'WebFilter'
		'userid':           '-1'
		'clientver':        '2000'
		'iscorrection':     '1'
		'privilege_filter': '0'
		'srcappid':         '2919'
		'clienttime':       '$stamp'
		'mid':              '$stamp'
		'uuid':             '$stamp'
		'dfid':             '-'
		'signature':        md5str(hash)
	}, {})
	slice(&data, 12, -2)
	search_result := json.decode(KGSearchResult, data) or { panic(err.msg) }
	info := search_result.data.lists[0]

	// 获取音频直链与相关信息
	data = webget('https://wwwapi.kugou.com/yy/index.php', {
		'r':        'play%2Fgetdata'
		'hash':     info.filehash
		'album_id': info.albumid
	}, {
		'cookie':     'kg_mid=d8e70a262c93d47599c6196c612d6f4f; Hm_lvt_aedee6983d4cfc62f509129360d6bb3d=1610278505,1611631363,1611722252; kg_dfid=33ZWee1kircl0jcJ1h0WF1fX; Hm_lpvt_aedee6983d4cfc62f509129360d6bb3d=1611727348; kg_dfid_collect=d41d8cd98f00b204e9800998ecf8427e'
		'host':       'wwwapi.kugou.com'
		'te':         'Trailers'
		'user-agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0'
	})
	audio_result := json.decode(KGAudioResult, data) or { panic(err.msg) }
	audio := audio_result.data

	return &Music{
		name: audio.song_name
		songer: audio.author_name
		url: 'https://www.kugou.com/song/#hash=$audio.hash&album_id=$audio.album_id'
		audio: audio.play_backup_url
		cover: audio.img
	}
}

pub fn kuwo(keyword string) &Music {
	// 调用酷我搜索API获取第一条搜索信息
	mut data := webget('https://www.kuwo.cn/api/www/search/searchMusicBykeyWord', {
		'pn':          '1'
		'rn':          '1'
		'httpsStatus': '1'
		'key':         quote(keyword)
	}, {
		'cookie':     'Hm_lvt_cdb524f42f0ce19b169a8071123a4797=1610284708,1610699237; _ga=GA1.2.1289529848.1591618534; kw_token=LWKACV45JSQ; Hm_lpvt_cdb524f42f0ce19b169a8071123a4797=1610699468; _gid=GA1.2.1868980507.1610699238; _gat=1'
		'csrf':       'LWKACV45JSQ'
		'user-agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0'
		'referer':    'https://www.kuwo.cn/search/list?key='
	})
	search_result := json.decode(KwSearchResult, data) or { panic(err.msg) }
	info := search_result.data.list[0]

	// 获取音频直链
	data = webget('http://www.kuwo.cn/api/v1/www/music/playUrl', {
		'mid': '$info.rid'
	}, {})
	audio_result := json.decode(KwAudioResult, data) or { panic(err.msg) }

	return &Music{
		name: info.name
		songer: info.artist
		url: 'https://www.kuwo.cn/play_detail/$info.rid'
		audio: audio_result.data.url
		cover: info.pic
	}
}

pub fn qqmusic(keyword string) &Music {
	// 调用QQ音乐搜索API获取第一条搜索信息
	mut data := webget('https://c.y.qq.com/soso/fcgi-bin/client_search_cp', {
		'w': quote(keyword)
	}, {})
	slice(&data, 9, -1)
	search_result := json.decode(QQSearchResult, data) or { panic(err.msg) }
	info := search_result.data.song.list[0]

	// 获取音频直链
	param := json.encode(QQReqParam{
		comm: QQComm{
			uin: 0
			format: 'json'
			ct: 24
			cv: 0
		}
		req: QQReq{
			mod: 'CDN.SrfCdnDispatchServer'
			method: 'GetCdnDispatch'
			param: QQParamA{
				guid: '3982823384'
				calltype: 0
				userip: ''
			}
		}
		req_0: QQReq_0{
			mod: 'vkey.GetVkeyServer'
			method: 'CgiGetVkey'
			param: QQParamB{
				guid: '3982823384'
				songmid: [info.songmid]
				songtype: [0]
				uin: '0'
				loginflag: 1
				platform: '20'
			}
		}
	})
	data = webget('https://u.y.qq.com/cgi-bin/musicu.fcg', {
		'data': quote(param)
	}, {})
	audio_result := json.decode(QQAudioResult, data) or { panic(err.msg) }

	// 获取页面并提取封面链接
	data = webget('https://y.qq.com/n/ryqq/songDetail/$info.songmid', {}, {})
	return &Music{
		name: info.songname
		songer: info.singer[0].name
		url: 'https://y.qq.com/n/ryqq/songDetail/$info.songmid'
		audio: 'http://dl.stream.qqmusic.qq.com/' + audio_result.req_0.data.midurlinfo[0].purl
		cover: 'https://y.qq.com/music/photo_new/' + find(data, 'photo_new\\u002F', '?max_age')
	}
}

pub fn wycloud(keyword string) &Music {
	// 调用网易云搜索API获取第一条搜索信息
	mut data := webpost('https://music.163.com/weapi/search/suggest/web?csrf_token=',
		wy_encrypt('{"s": "$keyword", "limit": "8", "csrf_token": ""}'), {
		'Content-Type': 'application/x-www-form-urlencoded'
	})
	search_result := json.decode(WySearchResult, data) or { panic(err.msg) }
	info := search_result.result.songs[0]

	// 通过歌曲ID获取歌曲完整信息
	data = webpost('https://music.163.com/weapi/v3/song/detail?csrf_token=', 
		wy_encrypt('{"id":"$info.id","c":"[{\\"id\\":\\"$info.id\\"}]","csrf_token":""}'), {
		'Content-Type': 'application/x-www-form-urlencoded'
	})
	song_result := json.decode(WySongResult, data) or { panic(err.msg) }

	// 获取音频直链
	data = webpost('https://music.163.com/weapi/song/enhance/player/url/v1?csrf_token=', 
		wy_encrypt('{"ids":"[$info.id]","level":"standard","encodeType":"aac","csrf_token":""}'), {
		'Content-Type': 'application/x-www-form-urlencoded'
	})
	audio_result := json.decode(WyAudioResult, data) or { panic(err.msg) }

	return &Music{
		name: info.name
		songer: info.artists[0].name
		url: 'https://music.163.com/#/song?id=$info.id'
		audio: 'https' + audio_result.data[0].url[4..]
		cover: song_result.songs[0].al.picurl
	}
}
