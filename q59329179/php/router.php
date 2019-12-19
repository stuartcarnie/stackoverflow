<?php

$postdata = file_get_contents("php://input");
$obj = json_decode($postdata, true);
error_log(print_r($obj, true));
echo "<p>Welcome to PHP</p>";

