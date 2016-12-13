<link rel="stylesheet" href="themes/font-awesome/css/font-awesome.min.css">
{if $converted == 1}
    <div style=" background-color: #BFCAD3; border-radius: 4px; padding: 10px; "><i class="fa fa-check fa-lg converted_account" style="color:green"></i>Converted Employee: <a href="index.php?module=RT_Employees&action=DetailView&record={$emp_id}" target="_blank">{$name}</a></div>
{/if}

{{sugar_include type="smarty" file='include/DetailView/header.tpl'}}