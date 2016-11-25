<h1>Performance Review Form</h1>
<script type="text/javascript" src="custom/modules/RT_Performance_Reviews/funcs.js"></script>



<div id="main_container">

    <form id="review_form" name="review_form" action="index.php?module=RT_Performance_Reviews&action=generate_form&return_module=Administration&return_action=index" method="post">
        <table width="100%" border="0" cellspacing="1" cellpadding="0" class="edit view">
            <tr>
                <td>Form Name:</td>
                <td>
                    <select id="dropdown">
                        {foreach from=$drop_options key=k item=v}
                            <option value="{$k}">{$v}</option>
                        {/foreach}
                    </select>
                </td>
            </tr>
            <tr>
                <td>Related Employee:</td>
                <td>
                    <div class="col-xs-12 col-sm-8 edit-view-field  yui-ac" type="relate" field="emp_name">
                        <input type="text" name="emp_name" class="sqsEnabled yui-ac-input" tabindex="" id="emp_name" size="" value="" title="" autocomplete="off" required><div id="EditView_emp_name_results" class="yui-ac-container"><div class="yui-ac-content" style="display: none;"><div class="yui-ac-hd" style="display: none;"></div><div class="yui-ac-bd"><ul><li style="display: none;"></li><li style="display: none;"></li><li style="display: none;"></li><li style="display: none;"></li><li style="display: none;"></li><li style="display: none;"></li><li style="display: none;"></li><li style="display: none;"></li><li style="display: none;"></li><li style="display: none;"></li></ul></div><div class="yui-ac-ft" style="display: none;"></div></div></div>
                        <input type="hidden" name="rt_emp_id" id="rt_emp_id" value="">
<span class="id-ff multiple">
<button type="button" name="btn_emp_name" id="btn_emp_name" tabindex="" title="Select" class="button firstChild" value="Select" onclick="open_popup(
        'RT_Employees',
        600,
        400,
        '',
        true,
        false,
{literal}{'call_back_function':'set_return','form_name':'review_form','field_to_name_array':{'id':'rt_emp_id','name':'emp_name'}}{/literal},
        'single',
        true
        );"><img src="themes/SuiteP/images/id-ff-select.png?v=nwLir3UrI9wSxe4hNP0bWg"></button><button type="button" name="btn_clr_emp_name" id="btn_clr_emp_name" tabindex="" title="Clear Selection" class="button lastChild" onclick="SUGAR.clearRelateField(this.form, 'emp_name', 'rt_emp_id');" value="Clear Selection"><img src="themes/SuiteP/images/id-ff-clear.png?v=nwLir3UrI9wSxe4hNP0bWg"></button>
</span>
                        <script type="text/javascript">
                            SUGAR.util.doWhen(
                                    "typeof(sqs_objects) != 'undefined' && typeof(sqs_objects['EditView_emp_name']) != 'undefined'",
                                    enableQS
                            );
                        </script>
                    </div>
                </td>
            </tr>
        </table>
        <div id="populate_form">

        </div>

        <input type="hidden" name="form_id" id="form_id" value="">
        <input type="hidden" name="form_name" id="form_name" value="">
       <br> <input type="submit" value="Submit">
    </form>


</div>