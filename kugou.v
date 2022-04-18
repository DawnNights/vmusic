module vmusic

pub struct KGAudioAuthors {
pub:
    author_id string  [json:author_id]
    author_name string  [json:author_name]
    is_publish string  [json:is_publish]
    sizable_avatar string  [json:sizable_avatar]
    avatar string  [json:avatar]
}

pub struct KGAudioData {
pub:
    hash string  [json:hash]
    timelength int  [json:timelength]
    filesize int  [json:filesize]
    audio_name string  [json:audio_name]
    have_album int  [json:have_album]
    album_name string  [json:album_name]
    album_id string  [json:album_id]
    img string  [json:img]
    have_mv int  [json:have_mv]
    video_id int  [json:video_id]
    author_name string  [json:author_name]
    song_name string  [json:song_name]
    lyrics string  [json:lyrics]
    author_id string  [json:author_id]
    privilege int  [json:privilege]
    privilege2 string  [json:privilege2]
    play_url string  [json:play_url]
    authors []KGAudioAuthors  [json:authors]
    is_free_part int  [json:is_free_part]
    bitrate int  [json:bitrate]
    recommend_album_id string  [json:recommend_album_id]
    audio_id string  [json:audio_id]
    has_privilege int  [json:has_privilege]
    play_backup_url string  [json:play_backup_url]
}

pub struct KGAudioResult {
pub:
    status int  [json:status]
    err_code int  [json:err_code]
    data KGAudioData  [json:data]
}

pub struct KGSearchRes {
pub:
    pkgprice int  [json:PkgPrice]
    privilege int  [json:Privilege]
    paytype int  [json:PayType]
    price int  [json:Price]
    failprocess int  [json:FailProcess]
}

pub struct KGSearchClassmap {
pub:
    attr0 int  [json:attr0]
}

pub struct KGSearchTransParam {
pub:
    cid int  [json:cid]
    musicpack_advance int  [json:musicpack_advance]
    cpy_attr0 int  [json:cpy_attr0]
    hash_multitrack string  [json:hash_multitrack]
    pay_block_tpl int  [json:pay_block_tpl]
    classmap KGSearchClassmap  [json:classmap]
    display int  [json:display]
    display_rate int  [json:display_rate]
}

pub struct KGSearchSingers {
pub:
    id int  [json:id]
    name string  [json:name]
}

pub struct KGSearchLists {
pub:
    sqfilehash string  [json:SQFileHash]
    publishtime string  [json:PublishTime]
    audioid int  [json:Audioid]
    superduration int  [json:SuperDuration]
    oldcpy int  [json:OldCpy]
    publishage int  [json:PublishAge]
    hqbitrate int  [json:HQBitrate]
    paytype int  [json:PayType]
    tagcontent string  [json:TagContent]
    accompany int  [json:Accompany]
    singername string  [json:SingerName]
    foldtype int  [json:FoldType]
    hqprivilege int  [json:HQPrivilege]
    topicremark string  [json:TopicRemark]
    oriothername string  [json:OriOtherName]
    source string  [json:Source]
    sqfilesize int  [json:SQFileSize]
    albumaux string  [json:AlbumAux]
    hqduration int  [json:HQDuration]
    failprocess int  [json:FailProcess]
    hqpaytype int  [json:HQPayType]
    m4asize int  [json:M4aSize]
    sqpkgprice int  [json:SQPkgPrice]
    uploadercontent string  [json:UploaderContent]
    sqextname string  [json:SQExtName]
    isoriginal int  [json:IsOriginal]
    filehash string  [json:FileHash]
    mvtrac int  [json:MvTrac]
    typ string  [json:Type]
    bitrate int  [json:Bitrate]
    sqprice int  [json:SQPrice]
    extname string  [json:ExtName]
    category int  [json:Category]
    superextname string  [json:SuperExtName]
    othername string  [json:OtherName]
    songname string  [json:SongName]
    res KGSearchRes  [json:Res]
    audiocdn int  [json:AudioCdn]
    sourceid int  [json:SourceID]
    sqduration int  [json:SQDuration]
    trans_param KGSearchTransParam  [json:trans_param]
    hqfilesize int  [json:HQFileSize]
    asqprivilege int  [json:ASQPrivilege]
    sqpaytype int  [json:SQPayType]
    pkgprice int  [json:PkgPrice]
    albumprivilege int  [json:AlbumPrivilege]
    hqprice int  [json:HQPrice]
    suffix string  [json:Suffix]
    hqfailprocess int  [json:HQFailProcess]
    albumid string  [json:AlbumID]
    albumname string  [json:AlbumName]
    vvid string  [json:vvid]
    hifiquality int  [json:HiFiQuality]
    mixsongid string  [json:MixSongID]
    singerid []int  [json:SingerId]
    superbitrate int  [json:SuperBitrate]
    hqextname string  [json:HQExtName]
    hqpkgprice int  [json:HQPkgPrice]
    matchflag int  [json:MatchFlag]
    scid int  [json:Scid]
    superfilehash string  [json:SuperFileHash]
    qualitylevel int  [json:QualityLevel]
    orisongname string  [json:OriSongName]
    resduration int  [json:ResDuration]
    resbitrate int  [json:ResBitrate]
    superfilesize int  [json:SuperFileSize]
    resfilehash string  [json:ResFileHash]
    songlabel string  [json:SongLabel]
    sqbitrate int  [json:SQBitrate]
    hasalbum int  [json:HasAlbum]
    mvtype int  [json:MvType]
    mvtotal int  [json:mvTotal]
    hqfilehash string  [json:HQFileHash]
    topicurl string  [json:TopicUrl]
    mvhash string  [json:MvHash]
    singers []KGSearchSingers  [json:Singers]
    auxiliary string  [json:Auxiliary]
    privilege int  [json:Privilege]
    filesize int  [json:FileSize]
    ownercount int  [json:OwnerCount]
    uploader string  [json:Uploader]
    duration int  [json:Duration]
    sqfailprocess int  [json:SQFailProcess]
    id string  [json:ID]
    topid int  [json:TopID]
    a320privilege int  [json:A320Privilege]
    filename string  [json:FileName]
    resfilesize int  [json:ResFileSize]
    sqprivilege int  [json:SQPrivilege]
    recommend_type int  [json:recommend_type]
    price int  [json:Price]
    publish int  [json:Publish]
}

pub struct KGSearchSecAggre {

}

pub struct KGSearchAggregation {

}

pub struct KGSearchSectagInfo {
pub:
    is_sectag int  [json:is_sectag]
}

pub struct KGSearchData {
pub:
    correctiontip string  [json:correctiontip]
    pagesize int  [json:pagesize]
    page int  [json:page]
    correctiontype int  [json:correctiontype]
    total int  [json:total]
    lists []KGSearchLists  [json:lists]
    sec_aggre KGSearchSecAggre  [json:sec_aggre]
    aggregation KGSearchAggregation  [json:aggregation]
    chinesecount int  [json:chinesecount]
    searchfull int  [json:searchfull]
    istagresult int  [json:istagresult]
    isshareresult int  [json:isshareresult]
    correctionforce int  [json:correctionforce]
    istag int  [json:istag]
    correctionsubject string  [json:correctionsubject]
    subjecttype int  [json:subjecttype]
    sectag_info KGSearchSectagInfo  [json:sectag_info]
    allowerr int  [json:allowerr]
}

pub struct KGSearchResult {
pub:
    error_msg string  [json:error_msg]
    data KGSearchData  [json:data]
    status int  [json:status]
    error_code int  [json:error_code]
}