<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class UpdateName
{
    function update_name($bean, $event, $arguments)
    {
        $bean->name = $bean->parent_name.' '.$bean->qualification_type_c;
    }
}
