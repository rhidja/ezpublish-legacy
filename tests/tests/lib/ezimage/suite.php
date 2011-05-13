<?php
/**
 * File containing the eZImageTestSuite class
 *
 * @copyright Copyright (C) 1999-2011 eZ Systems AS. All rights reserved.
 * @license http://ez.no/licenses/gnu_gpl GNU General Public License v2
 * @version //autogentag//
 * @package tests
 */

class eZImageTestSuite extends ezpDatabaseTestSuite
{
    public function __construct()
    {
        parent::__construct();
        $this->setName( "eZImage Test Suite" );

        $this->addTestSuite( 'eZImageManagerTest' );
        $this->addTestSuite( 'eZImageShellHandlerTest' );
    }

    public static function suite()
    {
        return new self();
    }
}

?>
