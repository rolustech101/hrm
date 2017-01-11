<?php
$dictionary["RT_Leaves"]["fields"]["from_date_c"]['validation'] = array(
    'type' => 'isbefore',
    'compareto' => 'to_date_c',
    'blank' => false,
);

?>