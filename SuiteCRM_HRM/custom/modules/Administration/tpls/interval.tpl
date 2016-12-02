<h1>Employees Salary Increment Interval</h1>
{*<script type="text/javascript" src="custom/modules/Administration/funcs.js"></script>*}
<div id="main_container">
    <form id="increment_form" name="increment_form" action="index.php?module=Administration&action=submit_interval_form&return_module=Administration&return_action=index" method="post">
        <table width="50%" >
            <tr>
                <td>Increment Interval:</td>
                <td>
                    <select name = "increment_interval">
                        <option value="by_annual">By Annual</option>
                        <option value="annual">Annual</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    Provident Fund:
                </td>
                <td>
                    <input type="text" required name="provident_fund" id="provident_fund" value="{$provident_fund}" size="5">%
                </td>
            </tr>
            <tr>
                <td>
                    Notification Receiver's email address:
                </td>
                <td>
                    <input type="text" required name="noty_receiver_email" id="noty_receiver_email" value="{$noty_receiver_email}">
                </td>
            </tr>
            <tr>
                <td>
                    Email Subject Macro:
                </td>
                <td>
                    <input type="text" required name="email_subject" id="email_subject" value="{$email_subject}">
                </td>
            </tr>
        </table>
        <input type="submit" id="submit-btn" value="Submit">
    </form>
</div>