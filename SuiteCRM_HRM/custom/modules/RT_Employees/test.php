<html>
<head>
<!--    <script src="cache/include/javascript/sugar_grp_yui_widgets.js"></script>-->
<!--    <script src="jssource/src_files/include/javascript/sugar_3.js"></script>-->
    <script>
        function check_alert()
        {
//            alert('asdsa');
//            YAHOO.SUGAR.MessageBox.show({msg: 'hello alert'} );
//            var ajaxStatus = new SUGAR.ajaxStatusClass();
//            ajaxStatus.flashStatus(SUGAR.language.get('hdasdvjsad', 2000);
//            ajaxStatus.showStatus('asdasdas');
//            ajaxStatus.createStatus('sadasdsad');
//            ajaxStatus.flashStatus('asdsada',9000);
            SUGAR.ajaxUI.loadingPanel = new YAHOO.widget.Panel("ajaxloading", {
                width: "240px",
                fixedcenter: true,
                close: false,
                draggable: false,
                constraintoviewport: false,
                modal: true,
                visible: false
            });
            SUGAR.ajaxUI.loadingPanel.setBody('<div id="loadingPage" align="center" style="vertical-align:middle;"><img src="' + SUGAR.themes.loading_image + '" align="absmiddle" /> <b>' + SUGAR.language.get('app_strings', 'LBL_LOADING_PAGE') + '</b></div>');
            SUGAR.ajaxUI.loadingPanel.render(document.body);

            if (document.getElementById('ajaxloading_c'))
                document.getElementById('ajaxloading_c').style.display = '';

            SUGAR.ajaxUI.loadingPanel.show();

            setTimeout(function(){
                SUGAR.ajaxUI.loadingPanel.hide();

                if (document.getElementById('ajaxloading_c'))
                    document.getElementById('ajaxloading_c').style.display = 'none';
                
            }, 2000);

        }

    </script>

</head>
<body>
<button onclick="check_alert();">click me!</button>
<?php
echo 'hello';
global $app_list_strings;
$list = array();
if (isset($app_list_strings['countries_dom']))
{
    $list = $app_list_strings['countries_dom'];
    foreach ($list as $key => $value){
        echo "<option value='$key'>$value<option>";
    }
}
?>

</body>
</html>

