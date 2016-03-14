<footer class="footer">
    <div class="fn-clear">
        <span class="fn-right">
            ${viewCount1Label}${statistic.statisticBlogViewCount}
            &nbsp;
            ${articleCount1Label}${statistic.statisticPublishedBlogArticleCount}
            &nbsp; 
            ${commentCount1Label}${statistic.statisticPublishedBlogCommentCount}
            &nbsp; 
            ${onlineVisitor1Label}${onlineVisitorCnt}
            &nbsp; 
			当前IP:<span id="Ip"></span>
			&nbsp; 
			登陆地点:<span id="Isp"></span>
			&nbsp;  
			OS:<span id="OS"></span>
			&nbsp; 
        </span>
    </div>
    <div class="fn-clear">
        <a href="${servePath}">${blogTitle}</a> 
        &copy; ${year}
        <!--start 该功能需要自己去注册相关信息---->
        <!--备案-->
	<!--<a href="http://icp.aizhan.com/" target="_blank"><script type="text/javascript" src="http://icp.aizhan.com/geticp/?host=istarvip.cn&style=1" charset="utf-8"></script></a>
		<!--站长统计-->
	<!--<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1257706615'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1257706615%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
		<!--51统计-->
	<!--<script language="javascript" type="text/javascript" src="http://js.users.51.la/18784080.js"></script>
		<noscript><a href="http://www.51.la/?18784080" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/18784080.asp" style="border:none" /></a></noscript>
		<!--360安全-->
	<!--<a href="http://webscan.360.cn/index/checkwebsite/url/istarvip.cn" name="465ce53ab51fcace9770863e4e8b428d" >360网站安全检测平台</a>
	   <!--end 该功能需要自己去注册相关信息----->     
        ${footerContent}
        <span class="fn-right">
            Powered by <a href="http://istarvip.cn" target="_blank">istarvip</a> •
            <a href="http://b3log.org/services/#solo" target="_blank">Solo</a> ${version}
        </span>
    </div>
    <span onclick="Util.goTop()" class="icon-goup"></span>
</footer>
<div class="modal-bg" style="display:none;">
	 <div id="modal">
		<span>登陆<a href="#close" id="close">×</a></span>
		<form>
			<input id="userEmail" name="username"  placeholder="userEmail"   />
			<input id="userPassword" name="password" type="password" placeholder="Password"   />
			<a href="javascript:void(0);" onclick="getPwd(this);"  >忘记密码？</a>  
			<span id="forgot" style="display:none;">
                             <input id="emailPassword" placeholder="请输入邮箱"/>
			     <span id="tip">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
			     <input id="sendBtn" onClick="forgot();" type="button"  value="${sendLabel}" /> 
			 </span>
			 <span id="loginBtn"  > 
				<a  onClick="qqLogin();" title="QQ登录" ><i class="icon  iconfont">&#xe6a1;</i></a> &nbsp; 
				<a id="sinaLoginBtn" title="新浪微博" ><i class="icon  iconfont">&#xe6a5;</i></a>  &nbsp; 
				<input id="login" onClick="checkLogin();" type="button"  value="登陆" /> 
				<span id="tip"> </span>
			</span>
		</form>
	</div>
</div>  
<script type="text/javascript" src="${staticServePath}/js/lib/jquery/jquery.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${staticServePath}/js/common${miniPostfix}.js?${staticResourceVersion}" charset="utf-8"></script>
<script type="text/javascript" src="${staticServePath}/skins/${skinDirName}/js/${skinDirName}${miniPostfix}.js?${staticResourceVersion}" charset="utf-8"></script>

<script type="text/javascript" src="${staticServePath}/skins/${skinDirName}/js/login.js" charset="utf-8"></script>
<script type="text/javascript">
    var latkeConfig = {
        "servePath": "${servePath}",
        "staticServePath": "${staticServePath}",
        "isLoggedIn": "${isLoggedIn?string}",
        "userName": "${userName}"
    };

    var Label = {
        "skinDirName": "${skinDirName}",
        "em00Label": "${em00Label}",
        "em01Label": "${em01Label}",
        "em02Label": "${em02Label}",
        "em03Label": "${em03Label}",
        "em04Label": "${em04Label}",
        "em05Label": "${em05Label}",
        "em06Label": "${em06Label}",
        "em07Label": "${em07Label}",
        "em08Label": "${em08Label}",
        "em09Label": "${em09Label}",
        "em10Label": "${em10Label}",
        "em11Label": "${em11Label}",
        "em12Label": "${em12Label}",
        "em13Label": "${em13Label}",
        "em14Label": "${em14Label}"
    };
</script>
<!--foot下统计数据-->
<script language="javascript"> 
	jQuery(function($){ 
	    var url = 'http://chaxun.1616.net/s.php?type=ip&output=json&callback=?&_='+Math.random(); 
	    $.getJSON(url, function(data){ 
			console.log(data);    
		document.getElementById("Ip").innerHTML =data.Ip;
		document.getElementById("Isp").innerHTML =data.Isp; 
		document.getElementById("OS").innerHTML =data.OS;  
	    }); 
	}); 
</script>
<!--login-->
<script>
  //登陆
$('.icon-login').click(function () {
	    $('#modal').css('display', 'block'); 
	    $('.modal-bg').fadeIn();
	    $("#userEmail").focus(); 
	    $("#userPassword, #userEmail").keypress(function(event) {
		if (13 === event.keyCode) { // Enter pressed  
		     checkLogin();
		}
	    });

	    // if no JSON, add it.
	    try {
		JSON
	    } catch (e) {
	       
		document.write("<script src=\"${staticServePath}/js/lib/json2.js\"><\/script>");
	    }
});
$('#close').click(function () {
    $('.modal-bg').fadeOut();
    $('#modal').fadeOut();
    return false;
});
var checkLogin= function() { 

    if (!/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test($("#userEmail" + status).val())) {
	$("#loginBtn #tip").text("${mailInvalidLabel}");
	$("#userEmail").focus();   
        return  ;
    } 
        
    if ($("#userPassword").val() === "") {
	$("#loginBtn #tip").text("${passwordEmptyLabel}");
	$("#userPassword").focus();
	return;
    }

    var requestJSONObject = {
	"userEmail": $("#userEmail").val(),
	"userPassword": $("#userPassword").val()
    };
    
    $("#loginBtn #tip").html("<img src='${staticServePath}/images/loading.gif'/> loading...")
 
    $.ajax({
	url: "${servePath}/login",
	type: "POST",
	contentType: "application/json",
	data: JSON.stringify(requestJSONObject),
	error: function() {
		return;
	    // alert("Login error!");
	},
	 success: function(data, textStatus) {
	    if (!data.isLoggedIn) {
		$("#loginBtn #tip").text(data.msg);
		return;
	    }

	    window.location.href = data.to;
	}
    }); 
};  
//忘记密码获取
(function() {
    $("#emailPassword").focus();

    $("#emailPassword").keypress(function(event) {
        if (13 === event.keyCode) { // Enter pressed
            $('#sendBtn').click();
        }
    });

    // if no JSON, add it.
    try {
        JSON
    } catch (e) {
        document.write("<script src=\"${staticServePath}/js/lib/json2.js\"><\/script>");
    }
})(); 
var forgot = function() {
    if (!/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test($("#emailPassword" + status).val())) {
        $("#tip").text("${mailInvalidLabel}"); 
        $("#emailPassword").focus();
        return;
    }

    var requestJSONObject = {
        "userEmail": $("#emailPassword").val()
    };

    $("#tip").html("<img src='${staticServePath}/images/loading.gif'/> loading...")
    $.ajax({
        url: "${servePath}/forgot",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(requestJSONObject),
        error: function() {
            // alert("reset password error!");
        },
        success: function(data, textStatus) {
            if (data.succeed) {
  $("#tip").text(data.msg); 
            } else {
                $("#tip").text(data.msg);
            }
        }
    });
};
//切换登陆或获取密码
function getPwd(obj){ 
            var divStyle =document.getElementById("forgot").style.display;   
	    if (divStyle == "none") { 
	      document.getElementById('loginBtn').style.display="none"; 
	      document.getElementById('forgot').style.display="block"; 
	    }
	    else if (divStyle == "block") { 
	     document.getElementById('loginBtn').style.display="block";  
	     document.getElementById('forgot').style.display="none";  
	    } 
} 
     
</script>
${plugins}
