<?php
/**
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2015 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_'))
	exit;

class Gapps extends Module
{
	protected $config_form = false;

	public function __construct()
	{
		$this->name = 'gapps';
		$this->tab = 'administration';
		$this->version = '1.0.0';
		$this->author = 'PrestaShop';

		$this->bootstrap = true;

		parent::__construct();

		$this->displayName = $this->l('Google Apps');
		$this->description = $this->l('Get email, cloud storage, collaboration tools and other business apps for your PrestaShop store with Google');

		if (_PS_VERSION_ < '1.5')
			require(_PS_MODULE_DIR_.$this->name.'/backward_compatibility/backward.php');
	}

	public function install()
	{
		return parent::install() && $this->registerHook('backOfficeHeader');
	}

	public function hookBackOfficeHeader()
	{
		if (strcmp(Tools::getValue('configure'), $this->name) === 0)
		{
			if (version_compare(_PS_VERSION_, '1.5', '>') == true)
			{
				$this->context->controller->addCSS($this->_path.'views/css/configure.css');

				if (version_compare(_PS_VERSION_, '1.6', '<') == true)
					$this->context->controller->addCSS($this->_path.'views/css/configure-nobootstrap.css');
			}
			else
			{
				$html = '<link rel="stylesheet" href="'.$this->_path.'views/css/configure.css" type="text/css" />';
				$html .= '<link rel="stylesheet" href="'.$this->_path.'views/css/configure-nobootstrap.css" type="text/css" />';

				return $html;
			}
		}
	}

	public function getContent()
	{
		switch (Tools::strtolower($this->context->language->iso_code))
		{
			case 'gb':
			case 'en':
				$landing_page = 'http://www.google.com/intl/en-GB_ALL/work/apps/business/landing/partners/referral/trial.html?utm_source=sign-up&utm_medium=referral&utm_campaign=apps-referral-program&utm_content=QM6U26H';
				break;
			case 'es':
				$landing_page = 'https://www.google.com/intl/es_ALL/work/apps/business/landing/partners/referral/trial.html?utm_source=sign-up&utm_medium=referral&utm_campaign=apps-referral-program&utm_content=8H5VXVU';
				break;
			default:
				$landing_page = 'https://www.google.com/work/apps/business/landing/partners/referral/trial.html?utm_source=sign-up&utm_medium=referral&utm_campaign=apps-referral-program&utm_content=SJRE6NU';
		}
		
		//Prepare data for voucher code
		$data = array(
			'campaign' => $this->name,
			'iso_country' => $this->context->country->iso_code,
			'iso_lang' => $this->context->language->iso_code,
			'ps_version' => _PS_VERSION_,
			'host' => Configuration::get('PS_SHOP_DOMAIN')
		);

		$code = '----';
		$is_local = preg_match('/^172\.16\.|^192\.168\.|^10\.|^127\.|^localhost|\.local$/', $data['host']);

		// Call to get voucher code
		if (!$is_local)
		{
			$content = Tools::jsonDecode(Tools::file_get_contents('https://gamification.prestashop.com/get_campaign.php?'.http_build_query($data)));
			if ($content)
			{
				if (isset($content->error) && isset($content->code))
				{
					if ($content->error === false)
						$code = $content->code;
					else
						Logger::addLog('Module Google Apps: Error returned by the Gamification ('.$content->code.').', 3);
				}
				else
					Logger::addLog('Module Google Apps: Missing required fields.', 3);
			}
			else
				Logger::addLog('Module Google Apps: Unexpected data returned from the Gamification.', 3);
		}
		else $this->adminDisplayWarning('Your shop seems to be unreachable from Internet. Please check your configuration before using Google Apps');
		
		$this->context->smarty->assign(array(
			'module_dir' => $this->_path,
			'code' => $code,
			'landing_page' => $landing_page,
			'is_local' => $is_local,
		));

		return $this->display(__FILE__, 'views/templates/admin/configure.tpl');
	}
}
