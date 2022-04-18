module vmusic

pub struct QQAudioMidurlinfo {
pub:
    songmid string
    filename string
    purl string
    errtype string
    p2pfromtag int
    qmdlfromtag int
    common_downfromtag int
    vip_downfromtag int
    pdl int
    premain int
    hisdown int
    hisbuy int
    ui_alert int
    isbuy int
    pneedbuy int
    pneed int
    isonly int
    onecan int
    result int
    tips string
    opi48kurl string
    opi96kurl string
    opi192kurl string
    opiflackurl string
    opi128kurl string
    opi192koggurl string
    wififromtag string
    flowfromtag string
    wifiurl string
    flowurl string
    vkey string
    opi30surl string
    ekey string
    auth_switch int
    subcode int
    opi96koggurl string
    auth_switch2 int
}

pub struct QQAudioData {
pub:
    uin string
    retcode int
    verify_type int
    login_key string
    msg string
    sip []string
    thirdip []string
    testfile2g string
    testfilewifi string
    midurlinfo []QQAudioMidurlinfo
    servercheck string
    expiration int
}

pub struct QQAudioQQReq_0 {
pub:
    code int
    data QQAudioData
}

pub struct QQAudioResult {
pub:
    code int
    ts int
    start_ts int
    traceid string
    req string
    req_0 QQAudioQQReq_0
}

pub struct QQSearchSemantic {
pub:
    curnum int
    curpage int
    totalnum int
}

pub struct QQSearchPay {
pub:
    payalbum int
    payalbumprice int
    paydownload int
    payinfo int
    payplay int
    paytrackmouth int
    paytrackprice int
}

pub struct QQSearchPreview {
pub:
    trybegin int
    tryend int
    trysize int
}

pub struct QQSearchSinger {
pub:
    id int
    mid string
    name string
    name_hilight string
}

pub struct QQSearchList {
pub:
    albumid int
    albummid string
    albumname string
    albumname_hilight string
    alertid int
    belongcd int
    cdidx int
    chinesesinger int
    docid string
    interval int
    isonly int
    lyric string
    lyric_hilight string
    media_mid string
    msgid int
    newstatus int
    nt int
    pay QQSearchPay
    preview QQSearchPreview
    pubtime int
    pure int
    singer []QQSearchSinger
    size128 int
    size320 int
    sizeape int
    sizeflac int
    sizeogg int
    songid int
    songmid string
    songname string
    songname_hilight string
    strmediamid string
    stream int
    switch int
    t int
    tag int
    typ int
    ver int
    vid string
}

pub struct QQSearchSong {
pub:
    curnum int
    curpage int
    list []QQSearchList
    totalnum int
}

pub struct QQSearchZhida {
pub:
    chinesesinger int
    typ int
}

pub struct QQSearchData {
pub:
    keyword string
    priority int
    semantic QQSearchSemantic
    song QQSearchSong
    tab int
    totaltime int
    zhida QQSearchZhida
}

pub struct QQSearchResult {
pub:
    code int
    data QQSearchData
    message string
    notice string
    subcode int
    time int
    tips string
}

pub struct QQParamA {
pub:
    guid string  [json:guid]
    calltype int  [json:calltype]
    userip string  [json:userip]
}

pub struct QQReq {
pub:
    mod string  [json:'module']
    method string  [json:method]
    param QQParamA  [json:param]
}

pub struct QQParamB {
pub:
    guid string  [json:guid]
    songmid []string  [json:songmid]
    songtype []int  [json:songtype]
    uin string  [json:uin]
    loginflag int  [json:loginflag]
    platform string  [json:platform]
}

pub struct QQReq_0 {
pub:
    mod string  [json:'module']
    method string  [json:method]
    param QQParamB  [json:param]
}

pub struct QQComm {
pub:
    uin int  [json:uin]
    format string  [json:format]
    ct int  [json:ct]
    cv int  [json:cv]
}

pub struct QQReqParam {
pub:
    comm QQComm  [json:comm]
    req QQReq  [json:req]
    req_0 QQReq_0  [json:req_0]
}