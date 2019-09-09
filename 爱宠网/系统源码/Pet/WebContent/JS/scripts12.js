/**
 * 
 */
var zero = $("#danmup").val();
$("#danmup").danmuplayer({
src:"../vedio/A.mp4",//视频源
width:500,//视频宽度
height:445,//视频高度
url_to_get_danmu: "${base}/Manager_findDanmu.action?id="+1,            //用来接收弹幕信息的url  (稍后介绍)
url_to_post_danmu: "${base}/Manager_addDanmu.action"
});