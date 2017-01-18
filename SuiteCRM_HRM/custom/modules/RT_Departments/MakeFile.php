	<?php 
	    if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');	 
	    class MakeFile{	 
	        function genfile($bean,$event, $arguments){
				$headsList = "";
				foreach($bean->heads as $head){
					$headsList = $headsList.$head.",";				
				}
				$headsList = trim($headsList, ",");
				$bean->heads = $headsList;
			}
	    }
	 
	?>
	
	