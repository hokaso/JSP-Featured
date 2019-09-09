'user strict';

window.onload = function () {
	var thisAddress;
	var url = location.search; // 获取url中"?"符后的字串
	if (url.indexOf("?") !== -1) { // 判断是否有参数
		var str = url.substr(1); // 获取所有除问号的所有符串
		strs = str.split("="); // 用等号进行分隔
		thisAddress = strs[1];
		}
	//alert(thisAddress);
    //初始化
    var video = $('#video1').videoCt({
        title: '动画',              //标题
        volume: 0.2,                //音量
        barrage: true,              //弹幕开关
        comment: true,              //弹幕
        reversal: true,             //镜像翻转
        playSpeed: true,            //播放速度
        update: true,               //下载
        autoplay: false,            //自动播放
        clarity: {
            type: ['360P','480P'],            //清晰度
            src: [thisAddress,
            	thisAddress]      //链接地址
        }
    });

    //扩展
    video.title;                    //标题
    video.status;                   //状态
    video.currentTime;              //当前时长
    video.duration;                 //总时长
    video.volume;                   //音量
    video.clarityType;              //清晰度
    video.claritySrc;               //链接地址
    video.fullScreen;               //全屏
    video.reversal;                 //镜像翻转
    video.playSpeed;                //播放速度
    video.cutover;                  //切换下个视频是否自动播放
    video.commentTitle;             //弹幕标题
    video.commentId;                //弹幕id
    video.commentClass;             //弹幕类型
    video.commentSwitch;            //弹幕是否打开
    $('#video1').bind('ended', function() {
        console.log('弹幕json数据：\n'+ video.comment());              //获取弹幕json数据
    });
    }