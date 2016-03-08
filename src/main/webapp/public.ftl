<!--
<link type="text/css" rel="stylesheet" href="${staticServePath}/js/lib/sg/css/sg.css" />
<script src="${staticServePath}/js/lib/sg/sg.js"></script>
<script src="${staticServePath}/js/lib/sg/sgutil.js"></script>
--> 
<script src="${staticServePath}/js/lib/jquery/jquery.min.js"></script>
<script src="${staticServePath}/js/lib/jquery/file-upload-9.10.1/vendor/jquery.ui.widget.js"></script>
<script src="${staticServePath}/js/lib/jquery/file-upload-9.10.1/jquery.iframe-transport.js"></script>
<script src="${staticServePath}/js/lib/jquery/file-upload-9.10.1/jquery.fileupload.js"></script>
<script src="${staticServePath}/js/lib/jquery/jquery.bowknot.min.js?${staticResourceVersion}"></script>
<script src="${servePath}/js/lib/tiny_mce/tiny_mce.js"></script>
<script src="${staticServePath}/js/lib/KindEditor/kindeditor-min.js"></script>
<script src="${staticServePath}/js/lib/CodeMirror/codemirror.js"></script>
<script src="${staticServePath}/js/lib/ueditor/ueditor.config.js"></script>
<script src="${staticServePath}/js/lib/ueditor/ueditor.all.js"></script>
<script src="${staticServePath}/js/common${miniPostfix}.js"></script> 
<#if "" == miniPostfix>
<script src="${staticServePath}/js/admin/admin.js"></script>
<script src="${staticServePath}/js/admin/editor.js"></script>
<script src="${staticServePath}/js/admin/editorTinyMCE.js"></script>
<script src="${staticServePath}/js/admin/editorUeditor.js"></script>
<script src="${staticServePath}/js/admin/editorKindEditor.js"></script>
<script src="${staticServePath}/js/admin/editorCodeMirror.js"></script>
<script src="${staticServePath}/js/admin/tablePaginate.js"></script>
<script src="${staticServePath}/js/admin/article.js"></script>
<script src="${staticServePath}/js/admin/comment.js"></script>
<script src="${staticServePath}/js/admin/articleList.js"></script>
<script src="${staticServePath}/js/admin/draftList.js"></script>
<script src="${staticServePath}/js/admin/pageList.js"></script>
<script src="${staticServePath}/js/admin/others.js"></script>
<script src="${staticServePath}/js/admin/linkList.js"></script>
<script src="${staticServePath}/js/admin/preference.js"></script>
<script src="${staticServePath}/js/admin/pluginList.js"></script>
<script src="${staticServePath}/js/admin/userList.js"></script>
<script src="${staticServePath}/js/admin/commentList.js"></script>
<script src="${staticServePath}/js/admin/plugin.js"></script>
<script src="${staticServePath}/js/admin/main.js"></script>
<script src="${staticServePath}/js/admin/about.js"></script>
<#else>
<script src="${staticServePath}/js/admin/latkeAdmin${miniPostfix}.js?${staticResourceVersion}"></script>
</#if>  