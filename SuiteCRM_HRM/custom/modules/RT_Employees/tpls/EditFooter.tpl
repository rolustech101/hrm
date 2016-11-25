<script type="text/javascript" src="custom/modules/RT_Employees/funcs.js"></script>
<input type="hidden" name="taxable_status" id="taxable_status" value="">
<div id="LBL_EDITVIEW_SALARY_INFO">

    <table width="100%" border="0" cellspacing="1" cellpadding="0" class="edit view">
        <tr>
            <th align="left" colspan="8">
                <h4>Salary Information</h4>
            </th>
        </tr>
        <tr>
            <td>
                <select name="countries_filling_s" id="countries_filling_s" style="display: none">
                </select>
            </td>
        </tr>
        <tr>
            <td valign="top" id='_label' width='12.5%' scope="row">
                Add Salary:
            </td>
            <td valign="top" width='37.5%' colspan='3'>
                <input tabindex="130" type="button" value="Add" onclick="addSalary()"><br>
                <table id="salary_table">
                    <tr>
                        <td></td>
                    </tr>
                    {$tr_table}
                </table>
            </td>
        </tr>
    </table>
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
            <td width="33.5%" valign="top" colspan="3"><input type="text" name="tax" id="tax"
                                                              value="{$TAX}">&nbsp;<input type="button"
                                                                                          id="calculate_tax"
                                                                                          onclick="calculateTax()"
                                                                                          value="Calculate Tax"></td>
        </tr>
    </table>
</div>