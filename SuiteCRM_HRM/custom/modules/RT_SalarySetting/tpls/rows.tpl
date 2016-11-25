{assign var=i value=1}
{foreach from=$row item=rrow}
    {assign var=tax_rate value=$rrow.tax_rate}
    {assign var=provident_fund value=$rrow.provident_fund}
            <tr>
                <td valign="top" >
                    Tax Rate:
                </td>
                <td valign="top" >
                    <input type="text" required name="tax_rate[]" id="tax_rate{$i}" value=" {if !empty($rrow.tax_rate)} {$rrow.tax_rate} {else} 0 {/if}" size="5">%
                </td>
                <td valign="top" >
                    Salary From:  <input type="text" required name="sal_from[]" id="sal_from{$i}" value="{if !empty($rrow.sal_from)}{$rrow.sal_from}{else} 0 {/if}">
                </td>
                <td valign="top" >
                    Salary To:  <input type="text" required name="sal_to[]" id="sal_to{$i}" value="{$rrow.sal_to}">
                </td>
                <td valign="top" >
                    Fix Amount:  <input type="text" name="fix_amount[]" id="fix_amount{$i}" value="{if !empty($rrow.fix_amount)} {$rrow.fix_amount} {else} 0 {/if}">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="delete_row" value="Delete" onClick="deleteRow('{$i}')">
                </td>
            </tr>
    {if $i == 1}<tr></tr>{/if}
    {assign var=i value=$i+1}
{/foreach}