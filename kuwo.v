module vmusic

pub struct KwAudioData {
pub:
    url string
}

pub struct KwAudioResult {
pub:
    code int
    msg string
    reqid string
    tid string
    data KwAudioData
    profileid string
    curtime int
    success int
}

pub struct KwSearchMvpayinfo {
pub:
    play string
    vid string
    download string
}

pub struct KwSearchFeetype {
pub:
    song string
    album string
    vip string
    bookvip string
}

pub struct KwSearchPayinfo {
pub:
    nplay string
    play string
    overseas_nplay string
    local_encrypt string
    limitfree string
    refrain_start string
    feetype KwSearchFeetype
    ndown string
    download string
    cannotdownload string
    overseas_ndown string
    cannotonlineplay string
    listen_fragment string
    refrain_end string
    tips_intercept string
}

pub struct KwSearchList {
pub:
    musicrid string
    barrage string
    artist string
    mvpayinfo KwSearchMvpayinfo
    pic string
    isstar int
    rid int
    duration int
    score100 string
    content_type string
    track int
    haslossless int
    hasmv int
    album string
    albumid string
    pay string
    artistid int
    albumpic string
    originalsongtype int
    songtimeminutes string
    islistenfee int
    pic120 string
    name string
    online int
    payinfo KwSearchPayinfo
}

pub struct KwSearchData {
pub:
    total string
    list []KwSearchList
}

pub struct KwSearchResult {
pub:
    code int
    curtime int
    data KwSearchData
    msg string
    profileid string
    reqid string
    tid string
}

