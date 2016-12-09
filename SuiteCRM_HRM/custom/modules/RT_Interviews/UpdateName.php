<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class UpdateName
{
    function name_update($bean, $event, $arguments)
    {
        $bean->name = 'Interview of '.$bean->rt_candidate_name;
    }
}
