<h1>Performance Review Form</h1>
<script type="text/javascript" src="custom/modules/RT_Performance_Reviews/funcs.js"></script>

<div id="main_container">
    <form id="create_pr_form" name="create_pr_form" action="index.php?module=RT_Performance_Reviews&action=submit_form&return_module=Administration&return_action=index" method="post">
        <table width="100%" border="0" cellspacing="1" cellpadding="0" class="edit view">
            <tr>
                <th align="left" colspan="8">
                    <h4>Information</h4>
                </th>
            </tr>
            <tr>
                <td>Form Name:</td>
                <td>
                    <input type="text" name="form_name" id="form_name" required>
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
                    </table>
                </td>
            </tr>
        </table>
        <input type="submit" value="Submit">
    </form>

</div>