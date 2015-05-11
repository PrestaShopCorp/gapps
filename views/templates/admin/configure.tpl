{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @version  Release: $Revision: 14985 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="panel">
	<div class="row moduleconfig-header">
		<div class="col-xs-12 text-center">
			<div>
				<img width="234" id="adwords_logo" src="{$module_dir|escape:'html':'UTF-8'}views/img/gapps_image.jpg" alt="{l s='Google AdWords' mod='gapps'}" />
			</div>
			<div>
				<img src="{$module_dir|escape:'html':'UTF-8'}views/img/thumbnail-1.png" />
				<img src="{$module_dir|escape:'html':'UTF-8'}views/img/thumbnail-2.png" />
				<img src="{$module_dir|escape:'html':'UTF-8'}views/img/thumbnail-3.png" />
				<img src="{$module_dir|escape:'html':'UTF-8'}views/img/thumbnail-4.png" />
				<img src="{$module_dir|escape:'html':'UTF-8'}views/img/thumbnail-5.png" />
			</div>
			<p>
				{l s='Professional email, file storage, shared calendars, and more...' mod='gapps'}<br/>
				{l s='Successfully manage your online store with Google Apps\' integrated tools.' mod='gapps'}
			</p>
			<h4>Make work easier anytime... anywhere</h4>
		</div>
		<div class="col-xs-6 text-center">
			
		</div>
	</div>

	<hr />
	<div class="moduleconfig-content">
		<div class="row">
			<div class="col-xs-12">
				<ul>
					<li><strong>{l s='SAVE TIME AND MONEY FOR WHAT MATTERS:' mod='gapps'} </strong>{l s='Companies that switch to Google Apps save a whole week per employee per year. Reinvest that time to do what really matters for your business.' mod='gapps'}</li>
					<li><strong>{l s='HONE YOUR FOCUS:' mod='gapps'} </strong>{l s='We believe in doing one thing at a time. That’s why we built Google Apps as an integrated suite that allows you to easily move between your work --whether you’re writing an email, collaborating on a document, or video chatting with a colleague.' mod='gapps'}</li>
					<li><strong>{l s='STAY IN THE LOOP:' mod='gapps'} </strong>{l s='These days, work happens around the clock. With browser-based tools, you’ll always be able to work from any device, connect quickly with your team, respond real-time to your customers, and access what’s critical to your business.' mod='gapps'}</li>
					<li><strong>{l s='WORK IN THE OFFICE OR OUT:' mod='gapps'} </strong>{l s='Full function mobile versions are available for Gmail, Drive, Calendar, Hangouts, Google+ and the Admin Console for both Android and iOS.' mod='gapps'}</li>
					<li><strong>{l s='NEVER LOSE YOUR WORK.' mod='gapps'} </strong>{l s='Don’t worry about IT. ' mod='gapps'}</li>
					<li><strong>{l s='EASILY MANAGE YOUR COMPANY’S IT.' mod='gapps'} </strong>{l s='Makes Apps easy to buy. A customizable admin console with a variety of features makes Apps easy to implement and use.' mod='gapps'}</li>
				</ul>
				
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-xs-6 text-center">
				{if $is_local == false}
					<h4>{l s='Your Google Apps promotional code for your shop is' mod='gapps'}:</h4>
					<pre id="adwords_voucher">{$code|escape:htmlall}</pre>
					<p><a href="{$landing_page|escape:htmlall}" class="btn btn-lg btn-success" target="_blank" title="Google Apps">{l s='Get started with your promotional code' mod='gapps'}</a></p>
					<p>
						<strong>Take 20% off annual subscriptions</strong><br/>
						through PrestaShop.
					</p>
				{else}
					<p><a href="{$landing_page|escape:htmlall}" class="btn btn-lg btn-success" target="_blank" title="Google Apps">{l s='Get started →' mod='gapps'}</a></p>
				{/if}
			</div>
			<div class="col-xs-6 text-center">
				<span class="items-video-promotion"><object type="text/html" data="{l s='//www.youtube.com/embed/Ay897zqh1-c?rel=0&amp;controls=0&amp;showinfo=0' mod='gapps'}" width="400" height="225"></object></span>
			</div>
		</div>
	</div>
</div>
