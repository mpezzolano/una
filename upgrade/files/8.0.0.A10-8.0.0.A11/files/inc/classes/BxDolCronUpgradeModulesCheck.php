<?php defined('BX_DOL') or die('hack attempt');
/**
 * Copyright (c) BoonEx Pty Limited - http://www.boonex.com/
 * CC-BY License - http://creativecommons.org/licenses/by/3.0/
 *
 * @defgroup    TridentCore Trident Core
 * @{
 */

class BxDolCronUpgradeModulesCheck extends BxDolCron
{
    public function processing()
    {
        if('on' != getParam('sys_autoupdate_modules'))
            return;

		BxDolStudioInstallerUtils::getInstance()->performModulesUpgrade();
    }
}

/** @} */
