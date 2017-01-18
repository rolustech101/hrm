{if $show_salary_panel == 1}
<div id='LBL_DETAILVIEW_SALARY_INFO' class='detail view'>
    <h4>{$MOD.LBL_EDITVIEW_SALARY_INFO}</h4>
    {foreach from=$salary key=k item=v}
        <table id='detailpanel_4' cellspacing='0'>
            <tr>
                <td width='12.5%' scope="row">
                    {$MOD.LBL_LABEL_SALARY}:
                </td>
                <td width='37.5%'>
                    {$k}
                </td>
                <td width='12.5%' scope="row">
                    {$MOD.LBL_TAXABLE_SALARY}:
                </td>
                <td width='37.5%'>
                    <input type="checkbox" class="checkbox" name="taxable_salary" class = "taxable_chbox" id="taxable_salary" disabled="true"
                           {if $v.taxable eq '1'}checked{/if}>
                </td>
            </tr>
            <tr>
                <td width='12.5%' scope="row">
                    {$MOD.LBL_AMOUNT_SALARY}:
                </td>
                <td width='37.5%' colspan='3'>
                    <span class="sugar_field" id="amount_salary">{$v.amount}</span>
                </td>
            </tr>
        </table>
    {/foreach}
</div>
<div id="LBL_EDITVIEW_TAX">

    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="edit view">
        <tr>
            <th align="left" colspan="8">
                <h4>Tax Information</h4>
            </th>
        </tr>
        <tr>
            <td width="1%" valign="top" scope="row">{$MOD.LBL_TAX}:</td>
            <td width="33.5%" valign="top" colspan="3">{$TAX}</td>
        </tr>
    </table>
</div>
{/if}