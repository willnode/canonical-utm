{**
 * templates/index/site.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
{strip}
{if $siteTitle}
	{assign var="pageTitleTranslated" value=$siteTitle}
{/if}
{include file="common/header.tpl"}
{/strip}

<br />

{if $intro}<div id="intro">{$intro|nl2br}</div>{/if}

<a name="journals"></a>

{if $useAlphalist}
	<p>{foreach from=$alphaList item=letter}<a href="{url searchInitial=$letter sort="title"}">{if $letter == $searchInitial}<strong>{$letter|escape}</strong>{else}{$letter|escape}{/if}</a> {/foreach}<a href="{url}">{if $searchInitial==''}<strong>{translate key="common.all"}</strong>{else}{translate key="common.all"}{/if}</a></p>
{/if}
<div class="journals">
{iterate from=journals item=journal}
	<div class="journal-item">
		<div class="journal-thumb">
			<div class="homepageImage"><a href="#journal-{$journal->getId()}">
			{assign var="displayJournalThumbnail" value=$journal->getLocalizedSetting('homepageImage')}
			{if $displayJournalThumbnail && is_array($displayJournalThumbnail)}
				{assign var="altText" value=$journal->getLocalizedSetting('journalThumbnailAltText')}
				<img src="{$journalFilesPath}{$journal->getId()}/{$displayJournalThumbnail.uploadName|escape:"url"}" {if $altText != ''}alt="{$altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
			{/if}
		</a></div>
		</div>
		<div class="journal-content">
				<a href="{url journal=$journal->getPath()}">
				{if $site->getSetting('showTitle')}
					<h3>{$journal->getLocalizedTitle()|escape}</h3>
				{/if}
				</a>
				<div class="journal-action">
					<a href="{url journal=$journal->getPath()}" class="action">{translate key="site.journalView"}</a>
					<a href="{url journal=$journal->getPath() page="issue" op="current"}" class="action">{translate key="site.journalCurrent"}</a>
					<a href="{url journal=$journal->getPath() page="user" op="register"}" class="action">{translate key="site.journalRegister"}</a>
				</div>
			</div>
		</div>


		<div id="journal-{$journal->getId()}" class="modalDialog">
			<div class="modalBox">
				<a href="#close" title="Close" class="close">&times;</a>
				<div class="modalInner">
					<div class="modalThumb">
						{if $displayJournalThumbnail && is_array($displayJournalThumbnail)}
						{assign var="altText" value=$journal->getLocalizedSetting('journalThumbnailAltText')}
							<img src="{$journalFilesPath}{$journal->getId()}/{$displayJournalThumbnail.uploadName|escape:"url"}" {if $altText != ''}alt="{$altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
						{else}
							<span>Sampul kosong</span>
						{/if}
					</div>
					<div class="modalContent">
						<h3>{$journal->getLocalizedTitle()|escape}</h3>

						{if $journal->getLocalizedDescription()}
							<p>{$journal->getLocalizedDescription()|nl2br}</p>
						{else}
							<p><i>Deskripsi Kosong</i></p>
						{/if}
						<br>
						<div class="modalAction">
							<a href="{url journal=$journal->getPath()}" class="action">{translate key="site.journalView"}</a>
							<a href="{url journal=$journal->getPath() page="issue" op="current"}" class="action">{translate key="site.journalCurrent"}</a>
							<a href="{url journal=$journal->getPath() page="user" op="register"}" class="action">{translate key="site.journalRegister"}</a>
						</div>
					</div>
				</div>
			</div>
		</div>
{/iterate}
</div>
{if $journals->wasEmpty()}
	{translate key="site.noJournals"}
{/if}

<div id="journalListPageInfo">{page_info iterator=$journals}</div>
<div id="journalListPageLinks">{page_links anchor="journals" name="journals" iterator=$journals}</div>
{include file="common/footer.tpl"}

