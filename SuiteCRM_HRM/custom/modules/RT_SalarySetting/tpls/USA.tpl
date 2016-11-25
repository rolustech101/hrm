<div id="usa">
    <form id="taxForm" method="POST">
        <input type="hidden" value="save" name="action">
        <input type="hidden" value="RT_SalarySetting" name="module">
        <input type="hidden" value="RT_SalarySetting" name="return_module">
        <input type="hidden" value="index" name="return_action">
        <input type="hidden" value="" name="tax_country" id="tax_country">
        <input type="hidden" id="sale_id" name="sale_id" value="1" />

        <table width="100%" border="0" cellspacing="1" cellpadding="0"  class="tabForm" id="tax_settings">
            <th class="dataLabel" align="left" colspan="8">
                <h4>Tax Settings USA</h4>
            </th>
            <tr>
                <td valign="top">
                    Filling Status:
                    <select name="filling_status" id="filling_status">
                        <option value="">Please Select</option>
                        <option value="single">Single</option>
                        <option value="married_filing_jointly_or_qualifying_widow">Married Filing Jointly or Qualifying Widow(er)</option>
                        <option value="married_filing_separately">Married Filing Separately</option>
                        <option value="head_of_household">Head of Household</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>
                    <table id="tt">
                        <tr><td></td></tr>
                    </table>
                </td>
            </tr>

            <tr><td></td><td></td><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input title="Click to add another salary range" class="button" type="button" name="addrow" value="Add Another Range" onclick="addRow();"></td></tr>
            <tr>
                {*<td valign="top" id='_label' class="dataLabel">*}
                    {*Provident Fund:*}
                {*</td>*}
                {*<td valign="top" >*}
                    {*Provident Fund:*}
                    {*<input type="text" name="provident_fund" id="provident_fund" required value="{$provident_fund}" size="5">%*}
                {*</td>*}
            </tr>
            <tr>
                <td><input type="submit" id="save-btn" name="save-btn" value="Save"/>&nbsp;<input type="button" value="  Cancel  " name="cancel" class="button" onclick="document.location.href='index.php?module=Administration&amp;action=index'" title=""></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </form>

</div>