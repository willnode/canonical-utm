<?php

/**
 * @file CanonicalNurisThemePlugin.inc.php
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class CanonicalNurisThemePlugin
 * @ingroup plugins_themes_blueSteel
 *
 * @brief "CanonicalNuris" theme plugin
 */

import('classes.plugins.ThemePlugin');

class CanonicalNurisThemePlugin extends ThemePlugin {
	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'CanonicalNurisThemePlugin';
	}

	function getDisplayName() {
		return 'CanonicalNuris Theme';
	}

	function getDescription() {
		return 'Stylesheet for Nuris Journal Canonical Page';
	}

	function getStylesheetFilename() {
		return 'canonicalNuris.css';
	}

	function getLocaleFilename($locale) {
		return null; // No locale data
	}


	function activate(&$templateMgr) {
		$theme_template_id = "canonicalNuris";
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
