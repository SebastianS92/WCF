{include file='header' pageTitle="wcf.acp.language.$action"}

<header class="boxHeadline">
	<hgroup>
		<h1>{lang}wcf.acp.language.{@$action}{/lang}</h1>
	</hgroup>
</header>

{if $errorField}
	<p class="error">{lang}wcf.global.form.error{/lang}</p>
{/if}

{if $success|isset}
	<p class="success">{lang}wcf.global.success.{@$action}{/lang}</p>
{/if}

<div class="contentNavigation">
	<nav>
		<ul>
			<li><a href="{link controller='LanguageList'}{/link}" class="button"><span class="icon icon16 icon-list"></span> <span>{lang}wcf.acp.menu.link.language.list{/lang}</span></a></li>
				
			{event name='contentNavigationButtons'}
		</ul>
	</nav>
</div>

<form method="post" action="{if $action == 'edit'}{link controller='LanguageEdit' id=$languageID}{/link}{else}{link controller='LanguageAdd'}{/link}{/if}">
	<div class="container containerPadding marginTop">
		<fieldset>
			<legend>{lang}wcf.global.form.data{/lang}</legend>
			
			<dl{if $errorField == 'languageName'} class="formError"{/if}>
				<dt><label for="languageName">{lang}wcf.global.name{/lang}</label></dt>
				<dd>
					<input type="text" id="languageName" name="languageName" value="{$languageName}" class="long" required="required" />
					{if $errorField == 'languageName'}
						<small class="innerError">
							{if $errorType == 'empty'}
								{lang}wcf.global.form.error.empty{/lang}
							{else}
								{lang}wcf.acp.language.add.languageName.error.{@$errorType}{/lang}
							{/if}
						</small>
					{/if}
					<small>{lang}wcf.acp.language.name.description{/lang}</small>
				</dd>
			</dl>
			
			<dl{if $errorField == 'languageCode'} class="formError"{/if}>
				<dt><label for="languageCode">{lang}wcf.acp.language.code{/lang}</label></dt>
				<dd>
					<input type="text" id="languageCode" name="languageCode" value="{$languageCode}" class="medium" required="required" />
					{if $errorField == 'languageCode'}
						<small class="innerError">
							{if $errorType == 'empty'}
								{lang}wcf.global.form.error.empty{/lang}
							{else}
								{lang}wcf.acp.language.add.languageCode.error.{@$errorType}{/lang}
							{/if}
						</small>
					{/if}
					<small>{lang}wcf.acp.language.code.description{/lang}</small>
				</dd>
			</dl>
			
			{if $action == 'add'}
				<dl{if $errorField == 'sourceLanguageID'} class="formError"{/if}>
					<dt><label for="sourceLanguageID">{lang}wcf.acp.language.add.source{/lang}</label></dt>
					<dd>
						<select id="sourceLanguageID" name="sourceLanguageID">
							{foreach from=$languages item=language}
								<option value="{@$language->languageID}"{if $language->languageID == $sourceLanguageID} selected="selected"{/if}>{$language->languageName} ({$language->languageCode})</option>
							{/foreach}
						</select>
						{if $errorField == 'sourceLanguageID'}
							<small class="innerError">
								{if $errorType == 'empty'}
									{lang}wcf.global.form.error.empty{/lang}
								{else}
									{lang}wcf.acp.language.add.source.error.{@$errorType}{/lang}
								{/if}
							</small>
						{/if}
						<small>{lang}wcf.acp.language.add.source.description{/lang}</small>
					</dd>
				</dl>
			{/if}
			
			{event name='fields'}
		</fieldset>
		
		{event name='fieldsets'}
	</div>
	
	<div class="formSubmit">
		<input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
 	</div>
</form>

{include file='footer'}
