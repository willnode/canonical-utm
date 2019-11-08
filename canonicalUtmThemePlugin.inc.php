<?php

/**
 * @file CanonicalUtmThemePlugin.inc.php
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class CanonicalUtmThemePlugin
 * @ingroup plugins_themes_blueSteel
 *
 * @brief "CanonicalUtm" theme plugin
 */

import('classes.plugins.ThemePlugin');

class CanonicalUtmThemePlugin extends ThemePlugin {
	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'CanonicalUtmThemePlugin';
	}

	function getDisplayName() {
		return 'CanonicalUtm Theme';
	}

	function getDescription() {
		return 'Stylesheet for UTM Journal Canonical Page';
	}

	function getStylesheetFilename() {
		return 'canonicalUtm.css';
	}

	function getLocaleFilename($locale) {
		return null; // No locale data
	}


	function activate(&$templateMgr) {
		$theme_template_id = "canonicalUtm";
		$theme_template_dir = Core::getBaseDir() . DIRECTORY_SEPARATOR . 'plugins' . DIRECTORY_SEPARATOR . 'themes' . DIRECTORY_SEPARATOR . $theme_template_id . DIRECTORY_SEPARATOR . 'templates';

		$templateMgr->template_dir = array($theme_template_dir, $templateMgr->app_template_dir, $templateMgr->core_template_dir);
		$templateMgr->compile_id = $theme_template_id;

		if (($stylesheetFilename = $this->getStylesheetFilename()) != null) {
			$path = Request::getBaseUrl() . '/' . $this->getPluginPath() . '/' . $stylesheetFilename;
			$templateMgr->addStyleSheet($path);
		}
	}
}

?>
