<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class UpdateDepartment
{
    function update_department($bean, $event, $arguments)
    {
        $sql = "select * from rt_departments where id ='" . $bean->id . "'";
        $res = $GLOBALS['db']->query($sql);
        $row = $GLOBALS['db']->fetchByAssoc($res);
        while ($row) {
            $headsList = $row['heads'];
            $heads = explode(",", $headsList);
            $headrecord = "";
            foreach ($heads as $head) {
                $sqls = "select * from rt_employees where id ='" . $head . "'";
                $ress = $GLOBALS['db']->query($sqls);
                $rows = $GLOBALS['db']->fetchByAssoc($ress);
                $name = "";
                $name = "<a href='index.php?module=RT_Employees&action=DetailView&record=" . $head . "'>" . $name . $rows['first_name'] . " " . $rows['last_name'] . "</a>";
                $headrecord = $headrecord . $name . ", ";
            }
            $row = $GLOBALS['db']->fetchByAssoc($res);
        }
        $headrecord = trim($headrecord, ", ");
        $bean->heads = $headrecord;
    }
}

?>
	
	