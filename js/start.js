$(function () {
    // 初始化Editor.md
    var EditormdView = editormd.markdownToHTML("page_md_content", {
        htmlDecode: "style,script,iframe",  // you can filter tags decode
        emoji: true,
        taskList: true,
        tex: false,  // 默认不解析
        flowChart: true,  // 默认不解析
        sequenceDiagram: true  // 默认不解析
    });
    // 初始化语法高亮
    hljs.initHighlighting();

    // 为md中的table标签添加bootstap支持的表格类
    $(".markdown-body table").addClass("table table-bordered");
    // 当表格列数过长时将自动出现滚动条
    $.each($('.markdown-body table'), function () {
        $(this).prop('outerHTML', '<div style="width:100%;overflow-x:auto;">' + $(this).prop('outerHTML') + '</div>');
    });

    // 超链接都在新窗口打开
    $('.markdown-body a[href^="http"]').each(function () {
        $(this).attr('target', '_blank');
    });

    // jsTree 插件
    $('#jstree').jstree({
        "plugins": ["wholerow", "search", "types", "state"],
        "state": {
            "key": "jstree_key"
        },
        "types": {
            "default": {
                "icon": false
            }
        }
    });
    // 搜索栏
    var to = false;
    $('#search').keyup(function () {
        if (to) {
            clearTimeout(to);
        }
        to = setTimeout(function () {
            var v = $('#search').val();
            $('#jstree').jstree(true).search(v);
        }, 250);
    });

    // 加载完毕后，激活目录对应的标题，并显示目录
    $('#jstree').on("ready.jstree", function (e, data) {
        var atag = $('a[href="' + decodeURI(window.location.pathname) + '"]');
        atag.parent().children('div').addClass("li-div-active");
        atag.addClass("atag-active");
        $('#jstree').show();
    });
});
