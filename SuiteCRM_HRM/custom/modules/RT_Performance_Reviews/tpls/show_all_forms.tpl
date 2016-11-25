<h1>All Forms</h1>
<script type="text/javascript" src="custom/modules/RT_Performance_Reviews/funcs.js"></script>

<div id="main_container">
    <ul>
        {foreach from=$data key=k item=v}
            <li><a href="index.php?module=RT_Performance_Reviews&action=edit_form&form_id={$v.id}&form_name={$v.name}">{$v.name}</a></li>
        {/foreach}
    </ul>

</div>