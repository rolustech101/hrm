<center>
    <link rel="stylesheet" href="themes/font-awesome/css/font-awesome.min.css">
    <script src="custom/modules/RT_Payroll/funcs.js"></script>
    <h3>Payroll of {$NAME} for {$MONTH} {$YEAR}</h3>
<div id="a_Employees_detailview_tabs" style="width:70%;">
<div id='LBL_DETAILVIEW_PANEL2' class='detail view'>
<h4>Personal Information</h4>
<table id='detailpanel_1' cellspacing='0'>
<tr>
<td width='12.5%' scope="row">
Employee No.:
</td>
<td width='37.5%'  >
<span class="sugar_field" id="first_name">{$EMP_NO} </span>
</td>
<td width='12.5%' scope="row">
</td>
<td width='37.5%'  >
</td>
</tr>
    <tr>
        <td width='12.5%' scope="row">
            Employee Name:
        </td>
        <td width='37.5%'  >
            <span class="sugar_field" id="last_name">{$NAME}</span>
        </td>
        <td width='12.5%' scope="row">
            Employment Type:
        </td>
        <td width='37.5%'  >
            <span class="sugar_field" id="last_name">{$TYPE_OF_EMPLOYMENT}</span>
        </td>
    </tr>
<tr>
<td width='12.5%' scope="row">
Designation:
</td>
<td width='37.5%'  >
<input type="hidden" class="sugar_field" id="gender_c" value="male">
{$DESIGNATION}
</td>
<td width='12.5%' scope="row">
Joining Date:
</td>
<td width='37.5%'  >
<input type="hidden" class="sugar_field" id="marital_status_c" value="Single">
{$JOINING}
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
Casual Leaves:
</td>
<td width='37.5%'  >
<span class="sugar_field" id="ntn_number_c">{$CASUAL}</span>
</td>
<td width='12.5%' scope="row">
Casual Balance:
</td>
<td width='37.5%'  >
<span class="sugar_field" id="date_of_birth_c">{$CASUAL_BALANCE}</span>
</td>
</tr>
<tr>
<td width='12.5%' scope="row">
Annual Leaves:
</td>
<td width='37.5%'  >
<span class="sugar_field" id="bank_account_c">{$ANNUAL}</span>
</td>
<td width='12.5%' scope="row">
Annual Balance:
</td>
<td width='37.5%'  >
<span class="sugar_field" id="account_name_c">{$ANNUAL_BALANCE}</span>
</td>
</tr>
</table>
</div>

<div id='LBL_DETAILVIEW_PANEL2' class='detail view'>
<h4>Salary Information</h4>
<table id='detailpanel_1' cellspacing='0'>
    {if $PAY_TYPE == 'regular' || $PAY_TYPE == 'fixed_monthly' }

        {foreach from=$SALARY key=k item=v}
            <tr>
                <td width='12.5%' scope="row">
                    {$k}:
                </td>
                <td width='37.5%'  >
                    <span class="sugar_field" id="amount_salary">{$v.amount}</span>
                </td>
                <td width='12.5%' scope="row">
                    Taxable:
                </td>

                <td width='37.5%'  >
                    {if $v.taxable == 1}
                        <i class="fa fa-check"></i>
                    {else}
                        <i class="fa fa-times"></i>
                    {/if}
                </td>
            </tr>
        {/foreach}


        <tr>
            <td width='12.5%' scope="row">
                Income Tax:
            </td>
            <td width='37.5%'  >
                <span class="sugar_field" id="last_name">{$PMTAX}</span>
            </td>
            <td width='12.5%' scope="row">
                Provident Fund:
            </td>
            <td width='37.5%'  >
                {$PROVIDENT}
            </td>
        </tr>
        <tr>
            <td width='12.5%' scope="row">
                Gross Pay:
            </td>
            <td width='37.5%'  >
                <span class="sugar_field" id="nic_number_c">{$GROSS_PAY}</span>
            </td>
            <td width='12.5%' scope="row">
                Net Pay Earned:
            </td>
            <td width='37.5%'  >
                <span class="sugar_field" id="ntn_number_c">{$NET_SALARY}</span>
            </td>
        </tr>

        {elseif $PAY_TYPE == 'hourly'}
        <tr>
            <td width='12.5%' scope="row">
                Total working hours:
            </td>
            <td width='37.5%'  >
                <span class="sugar_field" id="nic_number_c">{$EMP_HOURS}</span>
            </td>
            <td width='12.5%' scope="row">
                Salary/hour:
            </td>
            <td width='37.5%'  >
                <span class="sugar_field" id="ntn_number_c">{$PER_HOUR_RATE}</span>
            </td>
        </tr>
        <tr>
            <td width='12.5%' scope="row">
                Total Salary:
            </td>
            <td width='37.5%'  >
                <span class="sugar_field" id="nic_number_c">{$GROSS_PAY}</span>
            </td>
            <td width='12.5%' scope="row">
                Per Day Salary:
            </td>
            <td width='37.5%'  >
                <span class="sugar_field" id="ntn_number_c">{math equation="x/y" x=$GROSS_PAY y=30 format="%.2f"}</span>
            </td>
        </tr>
        <tr>
            <td width='12.5%' scope="row">
                Working Days:
            </td>
            <td width='37.5%'  >
                <span class="sugar_field" id="nic_number_c">22</span>
            </td>
            <td width='12.5%' scope="row">
            </td>
            <td width='37.5%'  >
            </td>
        </tr>

    {else}
        <tr>
            <td width='12.5%' scope="row">
                Total Salary:
            </td>
            <td width='37.5%'  >
                <span class="sugar_field" id="nic_number_c">{$EMP_STIPEND}</span>
            </td>
            <td width='12.5%' scope="row">
            </td>
            <td width='37.5%'  >
            </td>
        </tr>
        <tr>
            <td width='12.5%' scope="row">
                Working Days:
            </td>
            <td width='37.5%'  >
                <span class="sugar_field" id="nic_number_c">22</span>
            </td>
            <td width='12.5%' scope="row">
            </td>
            <td width='37.5%'  >
            </td>
        </tr>

    {/if}

</table>
</div>

{if $PAY_TYPE == 'regular' || $PAY_TYPE == 'fixed_monthly'}

    <div id='LBL_DETAILVIEW_PANEL2' class='detail view'>
        <h4>Working of Income Tax Deductions</h4>
        <table id='detailpanel_1' cellspacing='0'>
            <tr>
                <td width='12.5%' scope="row">
                    Per Month Salary:
                </td>
                <td width='37.5%'  >
                    <span class="sugar_field" id="date_of_birth_c">{$GROSS_PAY}</span>
                </td>
                <td width='12.5%' scope="row">
                    Per Day Salary:
                </td>
                <td width='37.5%'  >
                    <span class="sugar_field" id="date_of_birth_c">{math equation="x/y" x=$GROSS_PAY y=30 format="%.2f"}</span>
                </td>
            </tr>
            <tr>
                <td width='12.5%' scope="row">
                    Annual Salary:
                </td>
                <td width='37.5%'  >
                    <span class="sugar_field" id="bank_account_c">{$GROSS_PAY*12}</span>
                </td>
                <td width='12.5%' scope="row">
                    Annual I.Tax Deduction:
                </td>
                <td width='37.5%'  >
                    <span class="sugar_field" id="date_of_birth_c">{$TAX}</span>
                </td>
            </tr>
            <tr>
                <td width='12.5%' scope="row">
                    Working Days:
                </td>
                <td width='37.5%'  >
                    <span class="sugar_field" id="nic_number_c">22</span>
                </td>
                <td width='12.5%' scope="row">
                </td>
                <td width='37.5%'  >
                </td>
            </tr>
        </table>
    </div>

{/if}
</center>
<div style="margin-left: 222px" title="Print PaySlip" id="print-btn"><span class="fa fa-print fa-lg btn btn-default btn-large"></span></div>
