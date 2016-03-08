/*
 * Copyright (c) 2010-2015, b3log.org
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/**
 * @fileoverview ueditor editor
 *
 * @author <a href="http://vanessa.b3log.org">Liyuan Li</a>
 * @version 1.1.0.6, May 30, 2015
 */
admin.editors.ueditor = {
    /*
     * @description 初始化编辑器
     * @param conf 编辑器初始化参数
     * @param conf.kind 编辑器类型
     * @param conf.id 编辑器渲染元素 id
     * @param conf.fun 编辑器首次加载完成后回调函数
     */
    init: function (conf) {
        var language = Label.localeString.substring(0, 2);
        if (language === "zh") {
            language = "zh-cn";
        }

        if (conf.kind && conf.kind === "simple") {
            try {
            	var ue = UE.getEditor('abstract',{
            		toolbars: [
            		           [ 
            		               'undo', //撤销
            		               'redo', //重做
            		               'bold', //加粗
            		               'indent', //首行缩进
            		               'snapscreen', //截图
            		               'italic', //斜体
            		               'underline', //下划线 
            		               'subscript', //下标
            		               'fontborder', //字符边框
            		               'superscript', //上标
            		               'formatmatch', //格式刷 
            		               'blockquote', //引用
            		               'pasteplain', //纯文本粘贴模式
            		               'selectall', //全选 
            		               'preview', //预览
            		               'horizontal', //分隔线
            		               'removeformat', //清除格式
            		               'time', //时间
            		               'date', //日期
            		               'unlink', //取消链接
            		               'insertrow', //前插入行
            		               'insertcol', //前插入列
            		               'mergeright', //右合并单元格
            		               'mergedown', //下合并单元格
            		               'deleterow', //删除行
            		               'deletecol', //删除列
            		               'splittorows', //拆分成行
            		               'splittocols', //拆分成列
            		               'splittocells', //完全拆分单元格
            		               'deletecaption', //删除表格标题
            		               'inserttitle', //插入标题
            		               'mergecells', //合并多个单元格
            		               'deletetable', //删除表格
            		               'cleardoc', //清空文档
            		               'insertparagraphbeforetable', //"表格前插入行" 
            		               'fontfamily', //字体
            		               'fontsize', //字号
            		               'paragraph', //段落格式
            		               'simpleupload', //单图上传
            		               'insertimage', //多图上传
            		               'edittable', //表格属性
            		               'edittd', //单元格属性
            		               'link', //超链接
            		               'emotion', //表情
            		               'spechars', //特殊字符
            		               'searchreplace', //查询替换  
            		               'help', //帮助
            		               'justifyleft', //居左对齐
            		               'justifyright', //居右对齐
            		               'justifycenter', //居中对齐
            		               'justifyjustify', //两端对齐
            		               'forecolor', //字体颜色
            		               'backcolor', //背景色
            		               'insertorderedlist', //有序列表
            		               'insertunorderedlist', //无序列表
            		               'fullscreen', //全屏
            		               'directionalityltr', //从左向右输入
            		               'directionalityrtl', //从右向左输入
            		               'rowspacingtop', //段前距
            		               'rowspacingbottom', //段后距
            		               'pagebreak', //分页 
            		               'imagenone', //默认
            		               'imageleft', //左浮动
            		               'imageright', //右浮动
            		               'attachment', //附件
            		               'imagecenter', //居中
            		               'wordimage', //图片转存
            		               'lineheight', //行间距
            		               'edittip ', //编辑提示
            		               'customstyle', //自定义标题
            		               'autotypeset', //自动排版
            		               'webapp', //百度应用
            		               'touppercase', //字母大写
            		               'tolowercase', //字母小写
            		               'background', //背景
            		               'template', //模板
            		               'scrawl', //涂鸦
            		               'music', //音乐
            		               'inserttable', //插入表格
            		               'drafts', // 从草稿箱加载 
            		           ]
            		       ]  
            	});   
            } catch (e) {
            	 $("#tipMsg").text("TinyMCE load fail");
            }
        } else {
            try {
            	var ue = UE.getEditor('articleContent',{
            		toolbars: [
            		           [
            		               'anchor', //锚点
            		               'undo', //撤销
            		               'redo', //重做
            		               'bold', //加粗
            		               'indent', //首行缩进
            		               'snapscreen', //截图
            		               'italic', //斜体
            		               'underline', //下划线
            		               'strikethrough', //删除线
            		               'subscript', //下标
            		               'fontborder', //字符边框
            		               'superscript', //上标
            		               'formatmatch', //格式刷
            		               'source', //源代码
            		               'blockquote', //引用
            		               'pasteplain', //纯文本粘贴模式
            		               'selectall', //全选
            		               'print', //打印
            		               'preview', //预览
            		               'horizontal', //分隔线
            		               'removeformat', //清除格式
            		               'time', //时间
            		               'date', //日期
            		               'unlink', //取消链接
            		               'insertrow', //前插入行
            		               'insertcol', //前插入列
            		               'mergeright', //右合并单元格
            		               'mergedown', //下合并单元格
            		               'deleterow', //删除行
            		               'deletecol', //删除列
            		               'splittorows', //拆分成行
            		               'splittocols', //拆分成列
            		               'splittocells', //完全拆分单元格
            		               'deletecaption', //删除表格标题
            		               'inserttitle', //插入标题
            		               'mergecells', //合并多个单元格
            		               'deletetable', //删除表格
            		               'cleardoc', //清空文档
            		               'insertparagraphbeforetable', //"表格前插入行"
            		               'insertcode', //代码语言
            		               'fontfamily', //字体
            		               'fontsize', //字号
            		               'paragraph', //段落格式
            		               'simpleupload', //单图上传
            		               'insertimage', //多图上传
            		               'edittable', //表格属性
            		               'edittd', //单元格属性
            		               'link', //超链接
            		               'emotion', //表情
            		               'spechars', //特殊字符
            		               'searchreplace', //查询替换
            		               'map', //Baidu地图
            		               'gmap', //Google地图
            		               'insertvideo', //视频
            		               'help', //帮助
            		               'justifyleft', //居左对齐
            		               'justifyright', //居右对齐
            		               'justifycenter', //居中对齐
            		               'justifyjustify', //两端对齐
            		               'forecolor', //字体颜色
            		               'backcolor', //背景色
            		               'insertorderedlist', //有序列表
            		               'insertunorderedlist', //无序列表
            		               'fullscreen', //全屏
            		               'directionalityltr', //从左向右输入
            		               'directionalityrtl', //从右向左输入
            		               'rowspacingtop', //段前距
            		               'rowspacingbottom', //段后距
            		               'pagebreak', //分页
            		               'insertframe', //插入Iframe
            		               'imagenone', //默认
            		               'imageleft', //左浮动
            		               'imageright', //右浮动
            		               'attachment', //附件
            		               'imagecenter', //居中
            		               'wordimage', //图片转存
            		               'lineheight', //行间距
            		               'edittip ', //编辑提示
            		               'customstyle', //自定义标题
            		               'autotypeset', //自动排版
            		               'webapp', //百度应用
            		               'touppercase', //字母大写
            		               'tolowercase', //字母小写
            		               'background', //背景
            		               'template', //模板
            		               'scrawl', //涂鸦
            		               'music', //音乐
            		               'inserttable', //插入表格
            		               'drafts', // 从草稿箱加载
            		               'charts', // 图表
            		           ]
            		       ] 
            	});  
            } catch (e) {
            	 $("#tipMsg").text("TinyMCE load fail");
            }
        }
    },
    /*
     * @description 获取编辑器值
     * @param {string} id 编辑器id
     * @returns {string} 编辑器值
     */
    getContent: function (id) {
        var content = "";
        try {  
			content=UE.getEditor(id).getContent();
        } catch (e) {
            content = $("#" + id).val();
        }
        return content;
    },
    /*
     * @description 设置编辑器值
     * @param {string} id 编辑器 id
     * @param {string} content 设置编辑器值
     */
    setContent: function (id, content) {
    	
        try {   
        	 
		    UE.getEditor(id).setContent(content);    
	    
        } catch (e) {
            $("#" + id).val(content);
        }
    },
    /*
     * @description 移除编辑器
     * @param {string} id 编辑器 id
     */
    remove: function (id) { 
         UE.getEditor(id).destroy(); 
    }
};
