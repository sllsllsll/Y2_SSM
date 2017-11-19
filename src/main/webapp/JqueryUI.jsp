<%--
  Created by IntelliJ IDEA.
  User: linlin
  Date: 2017/9/6
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.9.1.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
    <style>
        #draggable { width: 85px; height: 50px; padding: 0.5em; }


        #feedback { font-size: 1.4em; }
        #selectable .ui-selecting { background: #FECA40; }
        #selectable .ui-selected { background: #F39814; color: white; }
        #selectable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
        #selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }

        .ui-menu { width: 150px; }

        #elem {
            color: #006;
            background-color: #aaa;
            font-size: 25px;
            padding: 1em;
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        <!--移动-->
        $(function () {
            $("#draggable").draggable();
        });
        <!--选择-->
        $(function () {
            $("#selectable").selectable();
        })

        <!--日期控件-->
        $(function() {
            $( "#datepicker" ).datepicker();
        });

        <!--对话框-->
        $(function() {
            $( "#dialog" ).dialog();
        });
        <!--菜单-->
        $(function() {
            $( "#menu" ).menu();
        });

        <!--进度条-->
        $(function () {
            var progressbar = $( "#progressbar" );
            var   progressLabel = $( ".progress-label" );

            progressbar.progressbar({
                value: false,
                /* change: function() {
                 progressLabel.text( progressbar.progressbar( "value" ) + "%" );
                 },
                 complete: function() {
                 progressLabel.text( "完成！" );
                 }*/
            });

            /* function progress() {
             var val = progressbar.progressbar( "value" ) || 0;

             progressbar.progressbar( "value", val + 1 );

             if ( val < 99 ) {
             setTimeout( progress, 100 );
             }
             }

             setTimeout( progress, 3000 );*/
        });

        <!--滑块-->
        $(function() {
            $( "#slider" ).slider();
        });

        <!--显示-->
        function aa() {
            $("#show").show();
        }
        <!--隐藏-->
        function bb() {
            $("#hidden").hide();
        }

        $(function () {
            $( "#toggle" ).click(function() {
                $( "#elem" ).animate({
                    color: "red",
                    backgroundColor: "yellow"
                });
            });
        });

    </script>
</head>
<body>

<div id="draggable" class="ui-widget-content">
    <p>请拖动我！</p>
</div>

<ol id="selectable">
    <li class="ui-widget-content">Item 1</li>
    <li class="ui-widget-content">Item 2</li>
    <li class="ui-widget-content">Item 3</li>
    <li class="ui-widget-content">Item 4</li>
    <li class="ui-widget-content">Item 5</li>
    <li class="ui-widget-content">Item 6</li>
    <li class="ui-widget-content">Item 7</li>
</ol>

<p>日期：<input type="text"  id="datepicker"></p>

<div id="dialog" title="基本的对话框">
    <p>这是一个默认的对话框，用于显示信息。对话框窗口可以移动，调整尺寸，默认可通过 'x' 图标关闭。</p>
</div>

<ul id="menu">
    <li class="ui-state-disabled"><a href="#">Aberdeen</a></li>
    <li><a href="#">Ada</a></li>
    <li><a href="#">Adamsville</a></li>
    <li><a href="#">Addyston</a></li>
    <li>
        <a href="#">Delphi</a>
        <ul>
            <li ><a href="#">Ada</a></li>
            <li><a href="#">Saarland</a></li>
            <li><a href="#">Salzburg</a></li>
        </ul>
    </li>
    <li><a href="#">Saarland</a></li>
    <li>
        <a href="#">Salzburg</a>
        <ul>
            <li>
                <a href="#">Delphi</a>
                <ul>
                    <li><a href="#">Ada</a></li>
                    <li><a href="#">Saarland</a></li>
                    <li><a href="#">Salzburg</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Delphi</a>
                <ul>
                    <li><a href="#">Ada</a></li>
                    <li><a href="#">Saarland</a></li>
                    <li><a href="#">Salzburg</a></li>
                </ul>
            </li>
            <li><a href="#">Perch</a></li>
        </ul>
    </li>
    <li class="ui-state-disabled"><a href="#">Amesville</a></li>
</ul>


<div id="progressbar"><div class="progress-label">加载...</div></div>


<div id="slider"></div>

<div><input id="show" type="text" hidden value="爱我吗？"/><input type="button" onclick="aa()" value="点击显示"/></div>

<div><input id="hidden" type="text"  value="爱我吗？"/><input type="button" onclick="bb()" value="点击隐藏"/></div>


<div id="elem">颜色动画</div>
<button id="toggle">改变颜色</button>
</body>
</html>