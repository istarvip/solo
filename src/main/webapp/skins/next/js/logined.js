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
