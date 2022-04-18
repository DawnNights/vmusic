module vmusic

pub struct WySearchArtists {
pub:
    id int  [json:id]
    name string  [json:name]
    albumsize int  [json:albumSize]
    picid int  [json:picId]
    img1v1url string  [json:img1v1Url]
    img1v1 int  [json:img1v1]
}

pub struct WySearchArtist {
pub:
    id int  [json:id]
    name string  [json:name]
    albumsize int  [json:albumSize]
    picid int  [json:picId]
    img1v1url string  [json:img1v1Url]
    img1v1 int  [json:img1v1]
}

pub struct WySearchAlbum {
pub:
    id int  [json:id]
    name string  [json:name]
    artist WySearchArtist  [json:artist]
    publishtime int  [json:publishTime]
    size int  [json:size]
    copyrightid int  [json:copyrightId]
    status int  [json:status]
    picid int  [json:picId]
    mark int  [json:mark]
}

pub struct WySearchSongs {
pub:
    id int  [json:id]
    name string  [json:name]
    artists []WySearchArtists  [json:artists]
    album WySearchAlbum  [json:album]
    duration int  [json:duration]
    copyrightid int  [json:copyrightId]
    status int  [json:status]
    rtype int  [json:rtype]
    ftype int  [json:ftype]
    mvid int  [json:mvid]
    fee int  [json:fee]
    mark int  [json:mark]
}

pub struct WySearchResult_ {
pub:
    songs []WySearchSongs  [json:songs]
    order []string  [json:order]
}

pub struct WySearchResult {
pub:
    result WySearchResult_  [json:result]
    code int  [json:code]
}

pub struct WyAudioFreetrialprivilege {
pub:
    resconsumable int  [json:resConsumable]
    userconsumable int  [json:userConsumable]
}

pub struct WyAudioFreetimetrialprivilege {
pub:
    resconsumable int  [json:resConsumable]
    userconsumable int  [json:userConsumable]
    typ int  [json:'type']
    remaintime int  [json:remainTime]
}

pub struct WyAudioData {
pub:
    id int  [json:id]
    url string  [json:url]
    br int  [json:br]
    size int  [json:size]
    md5 string  [json:md5]
    code int  [json:code]
    expi int  [json:expi]
    typ string  [json:'type']
    fee int  [json:fee]
    payed int  [json:payed]
    flag int  [json:flag]
    canextend int  [json:canExtend]
    freetrialprivilege WyAudioFreetrialprivilege  [json:freeTrialPrivilege]
    freetimetrialprivilege WyAudioFreetimetrialprivilege  [json:freeTimeTrialPrivilege]
    urlsource int  [json:urlSource]
}

pub struct WyAudioResult {
pub:
    data []WyAudioData  [json:data]
    code int  [json:code]
}

pub struct WySongAr {
pub:
    id int  [json:id]
    name string  [json:name]
}

pub struct WySongAl {
pub:
    id int  [json:id]
    name string  [json:name]
    picurl string  [json:picUrl]
    pic_str string  [json:pic_str]
    pic int  [json:pic]
}

pub struct WySongH {
pub:
    br int  [json:br]
    fid int  [json:fid]
    size int  [json:size]
}

pub struct WySongM {
pub:
    br int  [json:br]
    fid int  [json:fid]
    size int  [json:size]
}

pub struct WySongL {
pub:
    br int  [json:br]
    fid int  [json:fid]
    size int  [json:size]
}

pub struct WySongs {
pub:
    name string  [json:name]
    id int  [json:id]
    pst int  [json:pst]
    t int  [json:t]
    ar []WySongAr  [json:ar]
    alia []string  [json:alia]
    st int  [json:st]
    fee int  [json:fee]
    v int  [json:v]
    cf string  [json:cf]
    al WySongAl  [json:al]
    dt int  [json:dt]
    h WySongH  [json:h]
    m WySongM  [json:m]
    l WySongL  [json:l]
    cd string  [json:cd]
    no int  [json:no]
    ftype int  [json:ftype]
    djid int  [json:djId]
    copyright int  [json:copyright]
    s_id int  [json:s_id]
    mark int  [json:mark]
    origincovertype int  [json:originCoverType]
    resourcestate int  [json:resourceState]
    version int  [json:version]
    single int  [json:single]
    mst int  [json:mst]
    cp int  [json:cp]
    rtype int  [json:rtype]
    mv int  [json:mv]
    publishtime int  [json:publishTime]
}

pub struct WySongResult {
pub:
    songs []WySongs  [json:songs]
    privileges string  [json:privileges]
    code int  [json:code]
}

