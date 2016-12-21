<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
global $db;
require_once('include/tcpdf/config/lang/eng.php');
require_once('include/tcpdf/tcpdf.php');
require_once('modules/RT_Employees/RT_Employees.php');

$record = $_REQUEST['record'];
$sql = "select * from rt_payroll_cstm where id_c='" . $record . "'";
$result = $db->query($sql);
$row = $db->fetchByAssoc($result);
$ids = $row['abc_c'];
$pieces = explode("^,^", $ids);
$pieces[0] = trim($pieces[0], "^");
$size = sizeof($pieces);
$pieces[$size - 1] = trim($pieces[$size - 1], "^");
$ss = new Sugar_Smarty();
$name = "";
$i = 0;
while ($i < $size) {
    $id = $pieces[$i];
    $sql = "select * from rt_pay_track where employee_id='$id' AND payroll_id = '$record'";
    $result = $GLOBALS['db']->query($sql);
    $rows = $GLOBALS['db']->fetchByAssoc($result);
    $salary = unserialize(html_entity_decode($rows['salary']));
    foreach ($salary as $label => $detail) {
        $amount = $detail['amount'];
        $total_salary += $amount;
    }
    $emp = BeanFactory::getBean('RT_Employees', $id);

    $ss->assign("CASUAL", $rows['casual_leaves']);
    $ss->assign("ANNUAL", $rows['annual_leaves']);
    $ss->assign("NAME", $emp->name);
    $ss->assign("EMP_NO", $emp->rtemployee_id);
    $ss->assign("DESIGNATION", $emp->rt_employees_rt_jobs_name_c);
    $ss->assign("JOINING", $emp->joining_date_c);
    $ss->assign("GROSS_PAY", $total_salary);
    $ss->assign("SALARY", $salary);
    $new_tax = get_tax_calculation($id);
//		$tax = $rows['tax']*12;
    $tax = $new_tax * 12;

    $ss->assign("PROVIDENT", $rows['provident']);
    $ss->assign("TAX", $tax);

//		$pmtax = $rows['tax'];
    $pmtax = $new_tax;
    $net_salary = $rows['salary_paid'];
    $ss->assign("NET_SALARY", $net_salary);

    $ss->assign("PMTAX", $pmtax);

    $annual_balance = $rows['annual_balance'];
    $casual_balance = $rows['casual_balance'];

    $ss->assign("ANNUAL_BALANCE", $annual_balance);
    $ss->assign("CASUAL_BALANCE", $casual_balance);

    $month = $rows['month'];
    $year = $rows['year'];

    if ($month == 1) {
        $months = 'January';
    }
    if ($month == 2) {
        $months = 'February';
    }
    if ($month == 3) {
        $months = 'March';
    }
    if ($month == 4) {
        $months = 'April';
    }
    if ($month == 5) {
        $months = 'May';
    }
    if ($month == 6) {
        $months = 'June';
    }
    if ($month == 7) {
        $months = 'July';
    }
    if ($month == 8) {
        $months = 'August';
    }
    if ($month == 9) {
        $months = 'September';
    }
    if ($month == 10) {
        $months = 'October';
    }
    if ($month == 11) {
        $months = 'November';
    }
    if ($month == 12) {
        $months = 'December';
    }

    $ss->assign("MONTH", $months);
    $ss->assign("YEAR", $year);

    $ss->display("custom/modules/RT_Payroll/tpls/customDetailView.tpl");
    echo "<hr/><br/>";
    $i++;

}
?>

