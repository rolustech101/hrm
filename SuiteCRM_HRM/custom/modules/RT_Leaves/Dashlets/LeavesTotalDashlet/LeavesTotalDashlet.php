<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2011 SugarCRM Inc.
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 * 
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 * 
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 * 
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo. If the display of the logo is not reasonably feasible for
 * technical reasons, the Appropriate Legal Notices must display the words
 * "Powered by SugarCRM".
 ********************************************************************************/





if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('include/Dashlets/DashletGenericChart.php');
class LeavesTotalDashlet extends DashletGenericChart

{

    public $obm_ids = array();
    public $obm_date_start;
    public $obm_date_end;

    /**
     * @see DashletGenericChart::$_seedName
     */
    protected $_seedName = 'RT_Leaves';

    /**
     * @see DashletGenericChart::__construct()
     */
    public function __construct(
        $id,
        array $options = null
    )
    {
        global $timedate;

        if(empty($options['obm_date_start']))
            $options['obm_date_start'] = $timedate->nowDbDate();

        if(empty($options['obm_date_end']))
            $options['obm_date_end'] = $timedate->asDbDate($timedate->getNow()->modify("+6 months"));

        parent::__construct($id,$options);
        require_once('custom/modules/RT_Leaves/Dashlets/LeavesTotalDashlet/LeavesTotalDashlet.data.php');
        $this->_searchFields = $dashletData['LeavesTotalDashlet']['searchFields'];

    }

    /**
     * @see DashletGenericChart::displayOptions()
     */
    public function displayOptions()
    {
        if (!isset($this->obm_ids) || count($this->obm_ids) == 0)
            $this->_searchFields['obm_ids']['input_name0'] = array_keys(get_user_array(false));

        $this->_configureTpl = 'custom/include/Dashlets/DashletGenericChartConfigure.tpl';
        return parent::displayOptions();
    }

    /**
     * @see DashletGenericChart::display()
     */
    public function display()
    {
        $currency_symbol = $GLOBALS['sugar_config']['default_currency_symbol'];
        if ($GLOBALS['current_user']->getPreference('currency')){

            $currency = new Currency();
            $currency->retrieve($GLOBALS['current_user']->getPreference('currency'));
            $currency_symbol = $currency->symbol;
        }
        $thousands_symbol = translate('LBL_OPP_THOUSANDS', 'Charts');
        $module = 'RT_Leaves';
        $action = 'index';
        $query = 'true';
        $searchFormTab = 'advanced_search';
        $groupBy = array( 'm', 'sales_stage');


        $data = $this->getChartData($this->constructQuery());

        //I have taken out the sort as this will throw off the labels we have calculated
        $data = $this->sortData($data,'m', false, 'sales_stage', false, true);

        $chartReadyData = $this->prepareChartData($data,'','');
        $canvasId = 'rGraphOutcomeByMonth'.uniqid();
        $chartWidth     = 900;
        $chartHeight    = 500;
        $autoRefresh = $this->processAutoRefresh();

        //$chartReadyData['data'] = [[1.1,2.2],[3.3,4.4]];
        $jsonData = json_encode($chartReadyData['data']);
        $jsonLabels = json_encode($chartReadyData['labels']);
        $jsonLabelsAndValues = json_encode($chartReadyData['labelsAndValues']);


        $jsonKey = json_encode($chartReadyData['key']);
        $jsonTooltips = json_encode($chartReadyData['tooltips']);

        $colours = "['#a6cee3','#1f78b4','#b2df8a','#33a02c','#fb9a99','#e31a1c','#fdbf6f','#ff7f00','#cab2d6','#6a3d9a','#ffff99','#b15928']";


        if(!is_array($chartReadyData['data'])||count($chartReadyData['data']) < 1)
        {
            return "<h3 class='noGraphDataPoints'>$this->noDataMessage</h3>";
        }

        $chart = <<<EOD
        <canvas id='$canvasId' class='resizableCanvas'  width='$chartWidth' height='$chartHeight'>[No canvas support]</canvas>
             $autoRefresh
         <script>
           var bar = new RGraph.Bar({
            id: '$canvasId',
            data:$jsonData,
            options: {
                grouping: 'stacked',
                labels: $jsonLabels,
                xlabels:true,
                textSize:10,
                labelsAbove: true,
                //labelsAboveSize:10,
                labelsAboveUnitsPre:'',
                labelsAboveUnitsPost:'',
                labelsAbovedecimals: 2,
                //linewidth: 2,
                eventsClick:outcomeByMonthClick,
                //textSize:10,
                strokestyle: 'white',
                //colors: ['Gradient(#4572A7:#66f)','Gradient(#AA4643:white)','Gradient(#89A54E:white)'],
                //shadowOffsetx: 1,
                //shadowOffsety: 1,
                //shadowBlur: 10,
                //hmargin: 25,
               // colors:$colours,
                gutterLeft: 60,
                gutterTop:50,
                //gutterRight:160,
                //gutterBottom: 155,
                //textAngle: 45,
                backgroundGridVlines: false,
                backgroundGridBorder: false,
                tooltips:$jsonTooltips,
                tooltipsEvent:'mousemove',
                colors:$colours,
                key: $jsonKey,
                keyColors: $colours,
                keyBackground:'rgba(255,255,255,0.7)',
                //keyPosition: 'gutter',
                //keyPositionX: $canvasId.width - 150,
                //keyPositionY: 18,
                //keyPositionGutterBoxed: true,
                axisColor: '#ccc',
                unitsPre:'',
                unitsPost:'',
                keyHalign:'right',
                tooltipsCssClass: 'rgraph_chart_tooltips_css',
                noyaxis: true
            }
        }).draw();
        /*.on('draw', function (obj)
        {
            for (var i=0; i<obj.coords.length; ++i) {
                obj.context.fillStyle = 'black';
                if(obj.data_arr[i] > 0)
                {
                RGraph.Text2(obj.context, {
                    font:'Arial',
                    'size':10,
                    'x':obj.coords[i][0] + (obj.coords[i][2] / 2),
                    'y':obj.coords[i][1] + (obj.coords[i][3] / 2),
                    'text':obj.data_arr[i].toString(),
                    'valign':'center',
                    'halign':'center'
                });
                }
            }
        }).draw();
        */

        bar.canvas.onmouseout = function (e)
        {
            // Hide the tooltip
            RGraph.hideTooltip();

            // Redraw the canvas so that any highlighting is gone
            RGraph.redraw();
        }
/*
         var sizeIncrement = new RGraph.Drawing.Text({
            id: '$canvasId',
            x: 10,
            y: 20,
            text: 'Opportunity size in 1',
            options: {
                font: 'Arial',
                bold: true,
                //halign: 'left',
                //valign: 'bottom',
                colors: ['black'],
                size: 10
            }
        }).draw();
*/
</script>
EOD;
        return $chart;

    }

    /**
     * @see DashletGenericChart::constructQuery()
     */
    protected function constructQuery()
    {
        $emp_id = $this->rt_employees_rt_leaves_name[0];
        $query = "select
    sum(count_days_c) as total,date_format(from_date_c ,'%Y') as m, date_format(from_date_c, '%Y') as sales_stage
from
    rt_leaves_cstm as lcs
        inner join
    rt_leaves as lea ON lcs.id_c = lea.id
where
    id_c in (select
            rt_employees_rt_leavesrt_leaves_idb
        from
            rt_employees_rt_leaves_c
        where
            rt_employees_rt_leavesrt_employees_ida = '$emp_id ')
        and status_c = 'Taken'
        and deleted = '0'
group by m
";
        if(count($this->emp_year) > 0){
            $query .= " having m in ('" . implode("','",$this->emp_year) . "')";
        }
        return $query;
    }

    protected function prepareChartData($data,$currency_symbol, $thousands_symbol)
    {
        //Use the  lead_source to categorise the data for the charts
        $chart['labels'] = array();
        $chart['data'] = array();
        //Need to add all elements into the key, as they are stacked (even though the category is not present, the value could be)
        $chart['key'] = array();
        $chart['tooltips']= array();

        foreach($data as $i)
        {
            $key = $i["m"];
            $stage = $i["sales_stage"];
            $stage_dom_option = $i["sales_stage_dom_option"];
            if(!in_array($key,$chart['labels']))
            {
                $chart['labels'][] = $key;
                $chart['data'][] = array();
            }
            if(!in_array($stage,$chart['key']))
                $chart['key'][] = $stage;

            $formattedFloat = (float)number_format((float)$i["total"], 2, '.', '');
            $chart['data'][count($chart['data'])-1][] = $formattedFloat;
            $chart['tooltips'][]="<div><input type='hidden' class='stage' value='$stage_dom_option'><input type='hidden' class='date' value='$key'></div>".$stage.'('.$currency_symbol.$formattedFloat.$thousands_symbol.') '.$key;
        }
        return $chart;
    }



//
//    public $obm_ids = array();
//    public $obm_date_start;
//    public $obm_date_end;
//
//
//    /**
//     * @see DashletGenericChart::$_seedName
//     */
//
//    protected $_seedName = 'RT_Leaves';
//
//    /**
//     * @see DashletGenericChart::__construct()
//     */
//
//    public function __construct(
//        $id,
//        array $options = null
//
//    )
//
//    {
//        require('custom/modules/RT_Leaves/Dashlets/LeavesTotalDashlet/LeavesTotalDashlet.data.php');
//        global $timedate;
//
//        if(empty($options['obm_date_start']))
//        $options['obm_date_start'] = $timedate->nowDbDate();
//
//        if(empty($options['obm_date_end']))
//
//        $options['obm_date_end'] = $timedate->asDbDate($timedate->getNow()->modify("+6 months"));
//
//        parent::__construct($id,$options);
//
//        $this->_searchFields = $dashletData['LeavesTotalDashlet']['searchFields'];
//
//    }
//
//    /**
//     * @see DashletGenericChart::displayOptions()
//     */
//
//    public function displayOptions()
//
//    {
//
//        if (!isset($this->obm_ids) || count($this->obm_ids) == 0)
//            $this->_searchFields['obm_ids']['input_name0'] = array_keys(get_user_array(false));
//        return parent::displayOptions();
//
//    }
//
//    /**
//     * @see DashletGenericChart::display()
//     */
//
//    public function display()
//    {
//
//        $currency_symbol = $GLOBALS['sugar_config']['default_currency_symbol'];
//        if ($GLOBALS['current_user']->getPreference('currency')){
//            $currency = new Currency();
//            $currency->retrieve($GLOBALS['current_user']->getPreference('currency'));
//            $currency_symbol = $currency->symbol;
//        }
//
//        require("modules/Charts/chartdefs.php");
//        $chartsStrings = return_module_language($GLOBALS['current_language'], 'Charts');
//        $mychartDefs = 	array(
//            'outcome_by_month'=>
//            array(	'type' => 'code',
//                'id' => 'Chart_outcome_by_month',
//                'label' => $chartsStrings['LBL_CHART_OUTCOME_BY_MONTH'],
////                'chartUnits' => $chartsStrings['LBL_OPP_SIZE'] . ' $1' . $chartsStrings['LBL_OPP_THOUSANDS'] ,
//                'chartType' => 'stacked group by chart',
//                'groupBy' => array('m'),
//                'base_url'=>
//                    array( 'module' => 'RT_Leaves',
//                        'action' => 'index',
//                        'query' => 'true',
//                        'searchFormTab' => 'advanced_search',
//                    ),
//                'url_params' => array('rt_employees_rt_leaves_name'),//array( 'sales_stage', 'date_closed' ),
//            ),);
//        $chartDef = $mychartDefs['outcome_by_month'];
//
//        require_once('include/SugarCharts/SugarChartFactory.php');
//        $sugarChart = SugarChartFactory::getInstance();
////        $sugarChart->setProperties('',
////            translate('LBL_OPP_SIZE', 'Charts') . ' ' . $currency_symbol . '1' .translate('LBL_OPP_THOUSANDS', 'Charts'),
// $sugarChart->setProperties("$this->name",'subtitle', $chartDef['chartType']);
//        $sugarChart->base_url = $chartDef['base_url'];
//        $sugarChart->group_by = $chartDef['groupBy'];
//        $sugarChart->url_params = array();
//        $sugarChart->getData($this->constructQuery());
//        $sugarChart->is_currency = false;
////        $sugarChart->data_set = $sugarChart->sortData($sugarChart->data_set, 'm', false);
//        $sugarChart->data_set = $sugarChart->sortData($sugarChart->data_set);
//        $GLOBALS['log']->fatal('data set!!!!!!!!!!!!!');
//        $GLOBALS['log']->fatal($sugarChart->data_set);
//        $GLOBALS['log']->fatal('rt_employees_rt_leaves_name');
//        $GLOBALS['log']->fatal($this->rt_employees_rt_leaves_name);
//        $xmlFile = $sugarChart->getXMLFileName($this->id);
//        $GLOBALS['log']->fatal('XML FILE!!!!!!');
//        $GLOBALS['log']->fatal(print_r($xmlFile,1));
//        $GLOBALS['log']->fatal('This id !!!!!!');
//        $GLOBALS['log']->fatal($this->id);
//        $sugarChart->saveXMLFile($xmlFile, $sugarChart->generateXML());
//
//        return $this->getTitle('<div align="center"></div>') .
//        '<div align="center">' . $sugarChart->display($this->id, $xmlFile, '100%', '480', false) . '</div>'. $this->processAutoRefresh();
//
//    }
//
//    /**
//     * @see DashletGenericChart::constructQuery()
//     */
//
//    protected function constructQuery()
//    {
//        $query = "select
//    sum(count_days_c) as total,date_format(from_date_c ,'%Y') as m
//from
//    rt_leaves_cstm as lcs
//        inner join
//    rt_leaves as lea ON lcs.id_c = lea.id
//where
//    id_c in (select
//            rt_employees_rt_leavesrt_leaves_idb
//        from
//            rt_employees_rt_leaves_c
//        where
//            rt_employees_rt_leavesrt_employees_ida = '3d81a36b-d82b-6e8a-357e-585a6b67c379')
//        and status_c = 'Taken'
//        and deleted = '0'
//group by m
//";
////        $this->getSeedBean()->add_team_security_where_clause($query);
////        $this->getSeedBean()->add_team_security_where_clause($query);
////        if(!empty($this->name)){
////            $query .= "Where name = '$this->name'";
////        }
//
//        return $query;
//
//    }

}