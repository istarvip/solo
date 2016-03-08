 
var qqLogin= function() { 
	var appid="101293237";
	var code="";
	var appkey="ee101b8ee44918ceafd083769d9f3a6e";
	var redirect_uri="http://istarvip.cn";
	var access_token=""; 
	var openid="";
	var nickname="";

	var requestJSONObject = {
	"response_type": "code",//授权类型，此值固定为“code”
	"client_id": appid,//申请QQ登录成功后，分配给应用的appid。
	"redirect_uri":redirect_uri ,//成功授权后的回调地址，必须是注册appid时填写的主域名下的地址，建议设置为网站首页或网站的用户中心。注意需要将url进行URLEncode。
	"state": ""//client端的状态值。用于第三方应用防止CSRF攻击，成功授权后回调时会原样带回。请务必严格按照流程检查用户与state参数状态的绑定。
	//可选
	/**
    "scope": $("#userURL").val(),scope=get_user_info,list_album,upload_pic,do_like 不传则默认请求对接口get_user_info进行授权。
    "display": $("#userURL").val(),仅PC网站接入时使用。 用于展示的样式。不传则默认展示为PC下的样式。 如果传入“mobile”，则展示为mobile端下的样式
     "g_ut": $("#userURL").val() //仅WAP网站接入时使用。 QQ登录页面版本（1：wml版本； 2：xhtml版本），默认值为1。
	 * */
    }; 
	//获取Authorization Code
    $.ajax({
		url: "https://graph.qq.com/oauth2.0/authorize",
		type: "GET", 
		data: JSON.stringify(requestJSONObject),
		success: function(result) { 
			  code =result.code;
			  getToken(code);
		}
    });
    
     function getToken(code) {
		 var requestJSONObject = {
	        "grant_type	":"authorization_code",
	        "client_id":appid,//申请QQ登录成功后，分配给网站的appid
	        "client_secret": appkey,// 申请QQ登录成功后，分配给网站的appkey。
	        "code": code,//上一步返回的authorization code。   如果用户成功登录并授权，则会跳转到指定的回调地址，并在URL中带上Authorization Code。
	         
	         "redirect_uri": redirect_uri//与上面一步中传入的redirect_uri保持一致。
	    };
	    //过Authorization Code获取Access Token
	    $.ajax({
	        url: "https://graph.qq.com/oauth2.0/token",
	        type: "GET", 
	        data: JSON.stringify(requestJSONObject),
	        success: function(result) {
	        	  access_token=result.access_token;
	        	  getOpenID(access_token);
	        }
	    }); 
    } 
     //获取到用户OpenID
     function getOpenID(access_token) {
		 var requestJSONObject = {
				 "access_token	":access_token  
	    }; 
	    $.ajax({
	        url: "https://graph.qq.com/oauth2.0/me",
	        type: "GET", 
	        data: JSON.stringify(requestJSONObject),
	        success: function(result) { 
	        	  openid=result.openid;
	        }
	    }); 
    } 
     //调用OpenAPI接口
     function getNickName(openid) {
		 var requestJSONObject = {
			 "access_token":access_token ,
			 "oauth_consumer_key":appid ,//申请QQ登录成功后，分配给应用的appid
			 "openid":openid //用户的ID，与QQ号码一一对应。  可通过调用https://graph.qq.com/oauth2.0/me?access_token=YOUR_ACCESS_TOKEN 来获取。
	    };  
	    $.ajax({
	        url: "https://graph.qq.com/user/get_user_info?access_token="+access_token+"&oauth_consumer_key="+appid+"&openid="+openid+"",
	        type: "GET", 
	        data: JSON.stringify(requestJSONObject),
	        success: function(result) { 
	        	if(result.ret==0){
	        		var nickname=result.nickname; 
	        	}  
	        }
	    })
    }  
};  
