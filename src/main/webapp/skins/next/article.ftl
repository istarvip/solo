<#include "macro-head.ftl">
<#include "macro-comments.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${article.articleTitle} - ${blogTitle}">
        <meta name="keywords" content="${article.articleTags}" />
        <meta name="description" content="${article.articleAbstract?html}" />
        </@head>
    </head>
    <body>
        <#include "side.ftl">
        <main>
            <article class="post article-body">
                <header>
                    <h2>
                        <a rel="bookmark" href="${servePath}${article.articlePermalink}">
                            ${article.articleTitle}
                        </a>
                        <#if article.articlePutTop>
                        <sup>
                            ${topArticleLabel}
                        </sup>
                        </#if>
                        <#if article.hasUpdated>
                        <sup>
                            ${updatedLabel}
                        </sup>
                        </#if>
                    </h2>
                    <time><span class="icon-date"></span> ${article.articleCreateDate?string("yyyy-MM-dd")}</time>

                    <section class="tags">
                        <span class="icon-tag"></span>  &nbsp;
                        <#list article.articleTags?split(",") as articleTag>
                        <a class="tag" rel="tag" href="${servePath}/tags/${articleTag?url('UTF-8')}">
                            ${articleTag}</a>
                        </#list> 
                        <a rel="nofollow" href="${servePath}/authors/${article.authorId}">
                            <img class="avatar" title="${article.authorName}" alt="${article.authorName}" src="${article.authorThumbnailURL}"/>
                        </a>
                    </section>
                </header>
                <section class="abstract">
                    ${article.articleContent}
                    <#if "" != article.articleSign.signHTML?trim>
                    <div>
                        ${article.articleSign.signHTML}
                    </div>
                    </#if>

                    <#if nextArticlePermalink?? || previousArticlePermalink??>
                    <aside class="fn-clear">
                        <#if previousArticlePermalink??>
                        <a class="fn-left" rel="prev" href="${servePath}${previousArticlePermalink}">
                            <strong>&lt;</strong> ${previousArticleTitle}
                        </a>
                        </#if>
                        <#if nextArticlePermalink??>
                        <a class="fn-right" rel="next" href="${servePath}${nextArticlePermalink}">
                            ${nextArticleTitle} <strong>&gt;</strong>
                        </a>
                        </#if>
                    </aside>
                    </#if>
                </section>

                <footer class="fn-clear share">
                  <#include "share.ftl">
                    <div class="fn-right">
                        <span class="icon icon-t-weibo" data-type="tencent"></span>
                        <span class="icon icon-weibo" data-type="weibo"></span>
                        <span class="icon icon-twitter" data-type="twitter"></span>
                        <span class="icon icon-gplus" data-type="google"></span>
                    </div>
                </footer>
            </article>
			 <!--畅言-->  
	    	<div style="width: 90%; height: auto; margin:0 auto;">  
	        <button type="button" id="doc-single-toggle" class="button gray">切换留言系统</button>  
		    <div id="display"  style="display:block;">
			     <Tag> 
			    <div id="SOHUCS"></div> 
			    </Tag> 
		    </div>
	    </div>
	    <div id="hide"  style="display:none;">
		 <@comments commentList=articleComments article=article></@comments>
	    </div>
            <#include "footer.ftl">
 			<script type="text/javascript"> 
				    var src="";
				    var id=null;
				    var isPC="n"
				    function browserRedirect() {
					      var sUserAgent = navigator.userAgent.toLowerCase();
					      var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
					      var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
					      var bIsMidp = sUserAgent.match(/midp/i) == "midp";
					      var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
					      var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
					      var bIsAndroid = sUserAgent.match(/android/i) == "android";
					      var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
					      var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
					      document.writeln("您的浏览设备为：");
					      if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {  
							    document.writeln("移动端");  
							    id="changyan_mobile_js";
    							src="http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=cysdFdaH2&conf=prod_1a2fb091c35a174325636f20cae88df3";
							    loadAsyncScript(src,id,isPC);					
					      } else{
							    document.writeln("pc端"); 
							    src="http://changyan.sohu.com/upload/changyan.js";
							    isPC="Y"; 
							    loadAsyncScript(src,null,isPC);   
					      }
				    } 
				    browserRedirect(); 
			 /** 
		     * 异步加载依赖的javascript文件 
		     * src：script的路径 
		     * callback：当外部的javascript文件被load的时候，执行的回调 
		     */  
		    function loadAsyncScript(src, id,isPC) {  
					var head = document.getElementsByTagName("Tag")[0];  
					var script = document.createElement("script");  
					script.setAttribute("charset", "utf-8");  
					script.setAttribute("type", "text/javascript");  
					script.setAttribute("src", src);     
					if(id!=null){
						 script.setAttribute("id", id); 
					} 
					head.appendChild(script);   
					if (document.all) {  
					    script.onreadystatechange = function() {  
						var state = this.readyState;  
						if (state === 'loaded' || state === 'complete') {  
							if(isPC=="Y") { 
								  pc_config(); 
							 }
						    //callback();  
						}  
					    }  
					} else {  
					    //firefox, chrome  
					    script.onload = function() {
						if(isPC=="Y") { 
							  pc_config(); 
						 } 
						//callback();  
					    }  
					}  
		    } 
		    //pc端留言配置
		    function pc_config(){
			     isPC="n";
			     src="${staticServePath}/skins/${skinDirName}/js/pc.js"; 
			     loadAsyncScript(src,null,isPC);
		    }
            </script>
            <@comment_script oId=article.oId>
            page.tips.externalRelevantArticlesDisplayCount = "${externalRelevantArticlesDisplayCount}";
            </@comment_script>  
             <script>  
                $(function() {
				    var $toggleButton = $('#doc-single-toggle');
				    $toggleButton.on('click', function() { 
				      var divStyle =document.getElementById('display').style.display; 
				      DisplayAndHidden(divStyle);
				    }); 
				    function DisplayAndHidden(divStyle) { 
					    if (divStyle == "block") {
					      document.getElementById('display').style.display="none"; 
					      document.getElementById('hide').style.display="block"; 
					    }
					    else if (divStyle == "none") {
					     document.getElementById('display').style.display="block";  
					     document.getElementById('hide').style.display="none";  
					    }
				   }
			  })
		 </script>
        </main>
    </body>
</html>
