module vmusic

import time
import strings
import net.http
import net.urllib
import crypto.md5
import crypto.aes
import crypto.cipher
import encoding.base64

fn quote(query string) string {
	return urllib.query_escape(query)
}

fn timestamp() i64 {
	return time.now().unix * 1000
}

fn md5str(hash string) string {
	return md5.sum(hash.bytes()).hex().to_upper()
}

fn find(str string, pre string, suf string) string {
	return strings.find_between_pair_string(str, pre, suf)
}

fn slice(str &string, start int, end int) {
	if end < 0 {
		unsafe {
			str.str = str.str + start
			str.len = str.len - start + end
		}
	} else {
		unsafe {
			str.str = str.str + start
			str.len = str.len - start - end - 1
		}
	}
}

fn webget(url string, params map[string]string, headers map[string]string) string {
	mut query := '?'
	for k, v in params {
		query = query + '&$k=$v'
	}
	
	mut req := http.Request{
		method: .get
		url: url + query
	}

	for key, value in headers{
		req.add_custom_header(key, value) or { panic(err.msg) }
	}

	rsp := req.do() or { panic(err.msg) }
	return rsp.text
}

fn webpost(api string, data string, headers map[string]string) string {
	mut req := http.Request{
		method: .post
		url: api
		data: data
	}

	for key, value in headers{
		req.add_custom_header(key, value) or { panic(err.msg) }
	}

	rsp := req.do() or { panic(err.msg) }
	return rsp.text
}

fn aes_encrypt(mut src []byte, key []byte, iv []byte) string {
	block := aes.new_cipher(key)
	mut mode := cipher.new_cbc(block, iv)

	pad := 16 - src.len % 16
	for i := 0; i < pad; i++ {
		src << byte(pad)
	}

	mode.encrypt_blocks(mut src, src.clone())
	return base64.encode(src)
}

fn wy_encrypt(data string) string {
	mut src := data.bytes()
	key := '0CoJUm6Qyw8W8jud'.bytes()
	iv := '0102030405060708'.bytes()

	src = aes_encrypt(mut src, key, iv).bytes()
	params := quote(aes_encrypt(mut src, key, iv))
	encseckey := 'bf50d0bcf56833b06d8d1219496a452a1d860fd58a14c0aafba3e770104ca77dc6856cb310ed3309039e6865081be4ddc2df52663373b20b70ac25b4d0c6ca466daef6b50174e93536e2d580c49e70649ad1936584899e85722eb83ceddfb4f56c1172fca5e60592d0e6ee3e8e02be1fe6e53f285b0389162d8e6ddc553857cd'
	return 'params=$params&encSecKey=$encseckey'
}