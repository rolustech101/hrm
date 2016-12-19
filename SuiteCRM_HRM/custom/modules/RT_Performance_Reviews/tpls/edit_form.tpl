<h1>Performance Review Form edit</h1>
{*<pre>
    {$form_meta|print_r}
    {$form_meta|@count}
    </pre>*}
<script type="text/javascript" src="custom/modules/RT_Performance_Reviews/funcs.js"></script>

<div id="main_container">
    <form id="create_pr_form" name="create_pr_form" action="index.php?module=RT_Performance_Reviews&action=submit_form&return_module=Administration&return_action=index" method="post">

        <table width="100%" border="0" cellspacing="1" cellpadding="0" class="edit view">
            <tr>
                <td>Form Name:</td>
                <td>
                    <input type="text" name="form_name" id="form_name" value="{$f_name}" required>
                </td>
            </tr>
            <tr>
                <td valign="top" id='_label' width='12.5%' scope="row">
                    Add Questions:
                </td>
                <td valign="top" width='37.5%' colspan='3'>
                    <input tabindex="130" type="button" value="Add" onclick="addQuestion()"><br>
                    <table id="salary_table">
                        <tr>
                            <td></td>
                        </tr>
                        {assign var=val value=500}
                        {assign var=mmval value=500}
                        {foreach from=$form_meta key=k item=v}
                            {if $v.type == 'mutliple_choice'}
                                <tr id="tr{$val}"><td><table><tr><td width="12.5%" valign="top" scope="row">Question: </td><td width="33.5%" valign="top" colspan="3"><input type="text" name="label_question{$val}" id="label_question{$val}" value="{$v.question}" required></td></tr><tr><td width="12.5%" valign="top" scope="row">Question Type: </td><td width="33.5%" valign="top" colspan="3"> <input type="checkbox" name="question_type{$val}" id="{$val}" value="text_area"  class="taOpt text_area{$val}" > TextArea <input type="checkbox" name="question_type{$val}" id="{$val}" value="mutliple_choice" class="mcOpt muti_choice{$val}" checked = "checked"> Multiple Choice </td></tr>
                                {if isset($v.options)}
                                    {foreach from=$v.options key=k1 item=v1}
                                        <tr id="mop{$mmval}" class="muti-options{$val}"><td><table id="option_table"><tr><td width="12.5%" valign="top" scope="row">Option Label: </td><td width="33.5%" valign="top" colspan="3"><input type="text" name="label_question{$val}_option[]" id="label_option" value="{$v1}"></td></tr><tr><td><input type="button" onclick="removeTr('mop{$mmval}');" id="remove_tr" value="Remove tr"></td></tr></table></td></tr>
                                        {assign var=mmval value=$mmval-1}
                                    {/foreach}
                                    <tr><td><input type="button" onclick="removeQuestion('tr{$val}');" id="remove_question" value="Remove"></td></tr></table></td></tr>
                                {/if}
                                {else}
                                <tr id="{$val}"><td><table><tr><td width="12.5%" valign="top" scope="row">Question: </td><td width="33.5%" valign="top" colspan="3"><input type="text" name="label_question{$val}" id="label_question{$val}" value="{$v.question}" required></td></tr><tr><td width="12.5%" valign="top" scope="row">Question Type: </td><td width="33.5%" valign="top" colspan="3"> <input type="checkbox" name="question_type{$val}" id="{$val}" value="text_area"  class="taOpt text_area{$val}" checked = "checked"> TextArea <input type="checkbox" name="question_type{$val}" id="{$val}" value="mutliple_choice" class="mcOpt muti_choice{$val}" > Multiple Choice </td></tr><tr><td><input type="button" onclick="removeQuestion('tr'{$val});" id="remove_question" value="Remove"></td></tr></table></td></tr>
                            {/if}
                            {assign var=val value=$val-1}
                            <script type="text/javascript">

                                {literal}
                                $(".taOpt").off('change').on('change', function() {
                                    var id = $(this).attr('id');
                                    $(".muti_choice"+id).prop('checked', false);
                                    if($(this).is(":checked")) {
                                        var r_id = $(this).prop('id');
                                        $('#op'+r_id).remove();
                                        $('.muti-options'+r_id).remove();
                                    }
                                    else if($(this).is(":not(:checked)")){

                                    }
                                });
                                $(".mcOpt").off('change').on('change', function() {
                                    var id = $(this).attr('id');
                                    $(".text_area"+id).prop('checked', false);
                                    if($(this).is(":checked")) {
                                        var row = $(this).closest('tr');
                                        prevId = $(row).prev().find('input').attr('id');
                                        resss = prevId.split('n');
                                        console.log("checked");
                                        $(this).closest( "tr" ).after('<input tabindex="130" type="button" name="option_btn" id=op'+resss[1]+' value="Add option" onclick="addOptions(this,prevId,resss[1])">');
                                    }
                                    else if($(this).is(":not(:checked)")){
                                        var r_id = $(this).prop('id');
                                        $('#op'+r_id).remove();
                                        $('.muti-options'+r_id).remove();
                                    }
                                });
                                {/literal}
                            </script>
                        {/foreach}
                    </table>
                </td>
            </tr>
        </table>
        <input type="hidden" name="total_count" id="total_count" value="">
        <input type="button" id="submit-btn" value="Submit">
    </form>
</div>