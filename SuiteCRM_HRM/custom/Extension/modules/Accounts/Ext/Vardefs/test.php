<?php

$dictionary["Account"]["fields"]["test"] =
    array(
        'name' => 'test',
        'vname' => 'test',
        'type' => 'varchar',
        // function to call that will return html that will be inserted
        'function' => array('name' => 'test', 'returns' => 'html', 'include' => 'custom/include/javascript/get_test_options.php'),
        'required' => false,
        'do_report' => false,
        'reportable' => false,
        'comment' => 'Currency in use for the campaign',
        'source' => 'non-db'
    );
?>