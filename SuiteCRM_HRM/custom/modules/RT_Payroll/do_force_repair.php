<?php

require("modules/Administration/QuickRepairAndRebuild.php");
$repair= new RepairAndClear();
$repair->repairAndClearAll(array('clearAll'),array(translate('LBL_ALL_MODULES')), true,false);
?>