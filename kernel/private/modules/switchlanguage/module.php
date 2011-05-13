<?php
/**
 * File containing the switchlanguage module definition
 *
 * @copyright Copyright (C) 1999-2011 eZ Systems AS. All rights reserved.
 * @license http://ez.no/licenses/gnu_gpl GNU General Public License v2
 * @version //autogentag//
 * @package kernel
 */

$Module = array( "name" => "SwitchLanguage",
                 "var_params" => false );

$ViewList = array();
$ViewList['to'] = array(
    "script" => "to.php",
    "params" => array( "SiteAccess" ),
    );

$FunctionList = array();

?>
