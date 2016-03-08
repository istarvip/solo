<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="robots" content="none" />
        <title>${blogTitle} - ${adminConsoleLabel}</title>
        <link type="text/css" rel="stylesheet" href="${staticServePath}/css/default-base${miniPostfix}.css?${staticResourceVersion}" />
        <link type="text/css" rel="stylesheet" href="${staticServePath}/css/default-admin${miniPostfix}.css?${staticResourceVersion}" />
        <link type="text/css" rel="stylesheet" href="${staticServePath}/js/lib/CodeMirror/codemirror.css?${staticResourceVersion}" />
        <link rel="icon" type="image/png" href="${staticServePath}/favicon.png" />
    </head>
    <body onhashchange="admin.setCurByHash();">
        <div class="tip"><span id="loadMsg">${loadingLabel}</span></div>
        <div class="tip tip-msg"><span id="tipMsg"></span></div>
        <div id="allPanel">
            <div id="top">
                <a href="http://b3log.org" target="_blank" class="hover">
                    Solo
                </a>
               
                <span class="right"> 
                    <span>${userName}</span><a href="${servePath}" title='${indexLabel}'>${indexLabel}</a><a href='javascript:admin.logout();' title='${logoutLabel}'>${logoutLabel}</a>
                </span>
                <div class="clear"></div>
            </div>
            <div id="tabs">
                <ul>
                    <li>
                        <div id="tabs_main">
                            <a href="#main">
                                <span class="left usersIcon"></span>${adminIndexLabel}
                            </a>
                        </div>
                    </li>
                    <li>
                        <div onclick="admin.collapseNav(this)">
                            <span class="left postIcon"></span>
                            ${articleLabel}
                            <span class="ico-arrow-up"></span>
                        </div>
                        <ul id="tabArticleMgt">
                            <li>
                                <div id="tabs_article">
                                    <a href="#article/article" onclick="admin.article.prePost()">${postArticleLabel}</a>
                                </div>
                            </li>
                            <li>
                                <div id="tabs_article-list">
                                    <a href="#article/article-list">${articleListLabel}</a>
                                </div>
                            </li>
                            <li>
                                <div id="tabs_draft-list">
                                    <a href="#article/draft-list">${draftListLabel}</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <div id="tabs_comment-list">
                            <a href="#comment-list">
                                <span class="left commentIcon"></span>${commentListLabel}
                            </a>
                        </div>
                    </li>
                    <li>
                        <div id="tabToolsTitle" onclick="admin.collapseNav(this)">
                            <span class="left preferenceIcon"></span>
                            ${ToolLabel}
                            <span class="ico-arrow-down"></span>
                        </div>
                        <ul class="none" id="tabTools">
                            <li>
                                <div id="tabs_preference">
                                    <a href="#tools/preference">${preferenceLabel}</a>
                                </div>
                            </li>
                            <li>
                                <div id="tabs_page-list">
                                    <a href="#tools/page-list">${navMgmtLabel}</a>
                                </div>
                            </li>
                            <li>
                                <div id="tabs_link-list">
                                    <a href="#tools/link-list">${linkManagementLabel}</a>
                                </div>
                            </li>
                            <li>
                                <div id="tabs_user-list">
                                    <a href="#tools/user-list">${userManageLabel}</a>
                                </div>
                            </li>
                            <li>
                                <div id="tabs_plugin-list">
                                    <a href="#tools/plugin-list">${pluginMgmtLabel}</a>
                                </div>
                            </li>
                            <li>
                                <div id="tabs_others">
                                    <a href="#tools/others">${othersLabel}</a>
                                </div>
                            </li>  
                        </ul>
                    </li>
                    <li>
                        <div id="tabs_about">
                            <a href="#about">
                                <span class="left aboutIcon"></span>${aboutLabel}
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="tabsPanel">
                <div id="tabsPanel_main" class="none"></div>
                <div id="tabsPanel_article" class="none"></div>
                <div id="tabsPanel_article-list" class="none"></div>
                <div id="tabsPanel_draft-list" class="none"></div>
                <div id="tabsPanel_link-list" class="none"></div>
                <div id="tabsPanel_preference" class="none"></div>
                <div id="tabsPanel_page-list" class="none"></div>
                <div id="tabsPanel_others" class="none"></div>
                <div id="tabsPanel_user-list" class="none"></div>
                <div id="tabsPanel_comment-list" class="none"></div>
                <div id="tabsPanel_plugin-list" class="none"></div>
                <div id="tabsPanel_about" class="none"></div>
            </div>
            <div class="footer">
                Powered by <a href="http://b3log.org" target="_blank">B3log 开源</a> • <a href="http://b3log.org/services/#solo" target="_blank">Solo</a> ${version}
            </div>
        </div>
        <#include "public.ftl">
        <#include "admin-label.ftl">
        ${plugins}
        <script >
            admin.inited();
        </script>
    </body>
</html>