<div id="uk">
    <form id="taxForm" method="POST">
        <input type="hidden" value="save" name="action">
        <input type="hidden" value="RT_SalarySetting" name="module">
        <input type="hidden" value="RT_SalarySetting" name="return_module">
        <input type="hidden" value="index" name="return_action">
        <input type="hidden" value="" name="tax_country" id="tax_country">
        <input type="hidden" id="sale_id" name="sale_id" value="1" />

        <table width="100%" border="0" cellspacing="1" cellpadding="0"  class="tabForm" id="tax_settings">
            <th class="dataLabel" align="left" colspan="8">
                <h4>Tax Settings UK</h4>
            </th>
            <tr>
                <td valign="top" >
                </td>
            </tr>
            {assign var=i value=1}
            {foreach from=$row item=rrow}

                {assign var=tax_rate value=$rrow.tax_rate}
                {assign var=provident_fund value=$rrow.provident_fund}

                <tr id="e_{$i}">
                    <td valign="top" >
                        Tax Rate:
                    </td>
                    <td valign="top" >
                        <input type="text" required name="tax_rate[]" id="tax_rate{$i}" value=" {if !empty($rrow.tax_rate)} {$rrow.tax_rate} {else} 0 {/if}" size="5">%
                    </td>
                    <td valign="top" >
                        Salary From:  <input type="text" required name="sal_from[]" id="sal_from{$i}" value="{if !empty($rrow.sal_from)} {$rrow.sal_from} {else} 0 {/if}">
                    </td>
                    <td valign="top" >
                        Salary To:  <input type="text" required name="sal_to[]" id="sal_to{$i}" value="{if !empty($rrow.sal_to)} {$rrow.sal_to} {else} 0 {/if}">
                    </td>
                    <td valign="top" >
                        Fix Amount:  <input type="text" name="fix_amount[]" id="fix_amount{$i}" value="{if !empty($rrow.fix_amount)} {$rrow.fix_amount} {else} 0 {/if}">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="delete_row" id="del_{$i}" value="Delete" onClick="deleteRow('{$i}')">
                    </td>
                </tr>

                {assign var=i value=$i+1}
            {/foreach}

            <tr><td></td><td></td><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input title="Click to add another salary range" class="button" type="button" name="addrow" value="Add Another Range" onclick="addRow();"></td></tr>
            <tr>
                {*<td valign="top" id='_label' class="dataLabel">
                    Provident Fund:
                </td>
                <td valign="top" >
                    <input type="text" required name="provident_fund" id="provident_fund" value="{$provident_fund}" size="5">%
                </td>*}
            </tr>
            <tr>
                <td><input type="submit" id="save-btn" name="save-btn" value="Save" class="button"/>&nbsp;<input type="button" value="  Cancel  " name="cancel" class="button" onclick="document.location.href='index.php?module=Administration&amp;action=index'" title=""></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </form>

</div>