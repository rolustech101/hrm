<?php

class RT_SalarySettingController extends SugarController
{
    function action_salary_settings()
    {
        $country = $_REQUEST['tax_country'];
        if(!isset($country) && empty($country)){
            $country = 'pak';
        }
            $sql="select * from rt_salarysetting WHERE country = '$country' order by sal_from ASC";
        $res = $GLOBALS['db']->query($sql);
        $list = array();
        while($row = $GLOBALS['db']->fetchByAssoc($res)){
           $list[] = $row;
        }
//        $row = $GLOBALS['db']->fetchByAssoc($res);
        $this->view_object_map['row'] = $list;
        $this->view = 'sal_settings';
//		echo "Create form page";
    }
    function action_get_country_data()
    {
        $country = $_REQUEST['tax_country'];
        $non_filling_countries = get_non_filling_countries();
        if(in_array($country,$non_filling_countries)){
            $sql="select * from rt_salarysetting WHERE country = '$country' order by sal_from ASC";

            $res = $GLOBALS['db']->query($sql);
            $list = array();
            while($row = $GLOBALS['db']->fetchByAssoc($res)){
                $list[] = $row;
            }
            $this->view_object_map['row'] = $list;
        }

        $this->view_object_map['country'] = $country;
        $this->view = 'dynamic_layout';
    }
    function action_get_filling_data()
    {
        $country = $_REQUEST['tax_country'];
        $filling_status = $_REQUEST['file_status'];

        $sql="select * from rt_salarysetting WHERE country = '$country' AND filling_status = '$filling_status' order by sal_from ASC";
        $res = $GLOBALS['db']->query($sql);
        if($res->num_rows == 0){
        }
        $list = array();
        while($row = $GLOBALS['db']->fetchByAssoc($res)){
            $list[] = $row;
        }
        $GLOBALS['log']->fatal($list);
        $this->view_object_map['row'] = $list;
        $this->view = 'rows_layout';
    }
    function action_delete_range()
    {
        $country = $_REQUEST['tax_country'];
        $status = $_REQUEST['file_status'];
        $tax_rate = $_REQUEST['tax_rate'];
        $range_from = $_REQUEST['rangefrom'];
        $range_to = $_REQUEST['rangeto'];
        $non_filling_countries = get_non_filling_countries();
        if(in_array($country,$non_filling_countries)){
            if(empty($range_to)){
                $sql="delete from rt_salarysetting where sal_from=$range_from AND tax_rate= $tax_rate AND country = '$country'";
            }else{
                $sql="delete from rt_salarysetting where sal_from=$range_from AND sal_to=$range_to AND country = '$country'";
            }
        }else{
            if(empty($range_to)){
                $sql="delete from rt_salarysetting where sal_from=$range_from AND tax_rate= $tax_rate AND country = '$country' AND filling_status = '$status'";
            }else{
                $sql="delete from rt_salarysetting where sal_from=$range_from AND sal_to=$range_to AND country = '$country' AND filling_status = '$status'";
            }
        }
        $GLOBALS['db']->query($sql);
        SugarApplication::redirect("index.php?action=index&module=Administration");
    }
    function action_submit_salary_settings()
    {
        die('end');
       /* $country = $_REQUEST['tax_country'];
        $sql="delete from rt_salarysetting WHERE country = '$country'";
        $GLOBALS['db']->query($sql);
        if(isset($_REQUEST['action']) && $_REQUEST['action']=="save")
        {
            $provident_fund=$_REQUEST['provident_fund'];
            $tax_rate=$_REQUEST['tax_rate'];
            $sal_from=$_REQUEST['sal_from'];
            print_r($tax_rate);
            die;
            $sal_to=$_REQUEST['sal_to'];
            $fix_amount=$_REQUEST['fix_amount'];
            $i=0;
            foreach($tax_rate as $tax){
                $id = create_guid();
                $date = date("d-m-Y");
                $sfrom = $sal_from[$i];
                $sto = $sal_to[$i];
                $famount = $fix_amount[$i];
                $sql="insert into rt_salarysetting (id, date_entered, date_modified, deleted, tax_rate, provident_fund, sal_from, sal_to, fix_amount) 
				VALUES ('$id', '$date', '$date', 0, $tax, $provident_fund, $sfrom, $sto, $famount)";
                $GLOBALS['db']->query($sql);
                $i++;
            }
        }*/
    }
    function action_save()
    {
        $country = $_REQUEST['tax_country'];
        $filling_status = $_REQUEST['filling_status'];
        $non_filling_countries = get_non_filling_countries();
        if(in_array($country,$non_filling_countries)){
            $sql="delete from rt_salarysetting WHERE country = '$country'";
        }else{
            $sql="delete from rt_salarysetting WHERE country = '$country' AND filling_status = '$filling_status'";
        }
        $GLOBALS['db']->query($sql);
        if(isset($_REQUEST['action']) && $_REQUEST['action']=="save")
        {
//            $provident_fund=$_REQUEST['provident_fund'];
            $tax_rate=$_REQUEST['tax_rate'];
            $sal_from=$_REQUEST['sal_from'];
            $sal_to=$_REQUEST['sal_to'];
            $filling_status = $_REQUEST['filling_status'];
            $fix_amount=$_REQUEST['fix_amount'];
            $i=0;
            $len = count($tax_rate);
            $GLOBALS['log']->fatal('lenght is: '.$len);
            foreach($tax_rate as $tax){
                $len = count($tax_rate);
                $id = create_guid();
                $date = date("Y-m-d H:i:s");
                $sfrom = $sal_from[$i];
                $sto = $sal_to[$i];
                $famount = $fix_amount[$i];
                if($i == $len-1 AND empty($sal_to[$len-1])){
                    $GLOBALS['log']->fatal('NUllll at '.$len);
                    $sql="insert into rt_salarysetting (id, date_entered, date_modified, deleted, tax_rate, sal_from, fix_amount,country,filling_status) 
				VALUES ('$id', '$date', '$date', 0, $tax, $sfrom, $famount,'$country', '$filling_status')";
                    $GLOBALS['db']->query($sql);
                }else{
                    $sql="insert into rt_salarysetting (id, date_entered, date_modified, deleted, tax_rate, sal_from, sal_to, fix_amount,country,filling_status) 
				VALUES ('$id', '$date', '$date', 0, $tax, $sfrom, $sto, $famount,'$country', '$filling_status')";
                    $GLOBALS['db']->query($sql);
                }
                $i++;
            }
        }
        SugarApplication::redirect("index.php?action=index&module=Administration");
    }


}
	