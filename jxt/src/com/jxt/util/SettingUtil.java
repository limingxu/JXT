package com.jxt.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URISyntaxException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.springframework.core.io.ClassPathResource;

import com.jxt.common.Setting;
import com.jxt.common.Setting.CurrencyType;
import com.jxt.common.Setting.RoundType;
import com.jxt.entity.BusiStatus;
import com.jxt.entity.City;
import com.jxt.entity.District;
import com.jxt.entity.SmsStatus;
import com.opensymphony.oscache.base.NeedsRefreshException;
import com.opensymphony.oscache.general.GeneralCacheAdministrator;

public class SettingUtil {

	public static final String CACHE_MANAGER_BEAN_NAME = "cacheManager";// cacheManager
																			// Bean名称
	private static final String MALL_XML_FILE_NAME = "mall.xml";// mall.xml配置文件名称
	private static final String SETTING_CACHE_KEY = "MALL_SETTING";// Setting缓存Key
	

	/**
	 * 读取系统配置信息
	 * 
	 * @return Setting
	 * 
	 * @throws URISyntaxException
	 * 
	 * @throws DocumentException
	 * 
	 * @throws IOException
	 */
	public static Setting readSetting() throws URISyntaxException, DocumentException, IOException {
		File mallXmlFile = new ClassPathResource(MALL_XML_FILE_NAME).getFile();
		SAXReader saxReader = new SAXReader();
		Document document = saxReader.read(mallXmlFile);
		Node systemNameNode = document.selectSingleNode("/mall/setting/systemName");
		Node systemVersionNode = document.selectSingleNode("/mall/setting/systemVersion");
		Node systemDescriptionNode = document.selectSingleNode("/mall/setting/systemDescription");
		Node contextPathNode = document.selectSingleNode("/mall/setting/contextPath");
		Node imageUploadPathNode = document.selectSingleNode("/mall/setting/imageUploadPath");
		Node imageBrowsePathNode = document.selectSingleNode("/mall/setting/imageBrowsePath");
		Node adminLoginUrlNode = document.selectSingleNode("/mall/setting/adminLoginUrl");
		Node adminLoginProcessingUrlNode = document.selectSingleNode("/mall/setting/adminLoginProcessingUrl");
		Node currencyTypeNode = document.selectSingleNode("/mall/setting/currencyType");
		Node currencySignNode = document.selectSingleNode("/mall/setting/currencySign");
		Node currencyUnitNode = document.selectSingleNode("/mall/setting/currencyUnit");
		Node priceScaleNode = document.selectSingleNode("/mall/setting/priceScale");
		Node priceRoundTypeNode = document.selectSingleNode("/mall/setting/priceRoundType");
		Node isLoginFailureLockNode = document.selectSingleNode("/mall/setting/isLoginFailureLock");
		Node loginFailureLockCountNode = document.selectSingleNode("/mall/setting/loginFailureLockCount");
		Node loginFailureLockTimeNode = document.selectSingleNode("/mall/setting/loginFailureLockTime");
		Node isGzipEnabledNode = document.selectSingleNode("/mall/setting/isGzipEnabled");

		Setting setting = new Setting();
		setting.setSystemName(systemNameNode.getText());
		setting.setSystemVersion(systemVersionNode.getText());
		setting.setSystemDescription(systemDescriptionNode.getText());
		setting.setContextPath(contextPathNode.getText());
		setting.setImageUploadPath(imageUploadPathNode.getText());
		setting.setImageBrowsePath(imageBrowsePathNode.getText());
		setting.setAdminLoginUrl(adminLoginUrlNode.getText());
		setting.setAdminLoginProcessingUrl(adminLoginProcessingUrlNode.getText());
		setting.setCurrencyType(CurrencyType.valueOf(currencyTypeNode.getText()));
		setting.setCurrencySign(currencySignNode.getText());
		setting.setCurrencyUnit(currencyUnitNode.getText());
		setting.setPriceScale(Integer.valueOf(priceScaleNode.getText()));
		setting.setPriceRoundType(RoundType.valueOf(priceRoundTypeNode.getText()));
		setting.setIsLoginFailureLock(Boolean.valueOf(isLoginFailureLockNode.getText()));
		setting.setLoginFailureLockCount(Integer.valueOf(loginFailureLockCountNode.getText()));
		setting.setLoginFailureLockTime(Integer.valueOf(loginFailureLockTimeNode.getText()));
		setting.setIsGzipEnabled(Boolean.valueOf(isGzipEnabledNode.getText()));

		return setting;
	}

	/**
	 * 获取系统配置信息
	 * 
	 * @return Setting
	 */
	public static Setting getSetting() {
		Setting setting = null;
		GeneralCacheAdministrator generalCacheAdministrator = (GeneralCacheAdministrator) SpringUtil
				.getBean(CACHE_MANAGER_BEAN_NAME);
		try {
			setting = (Setting) generalCacheAdministrator.getFromCache(SETTING_CACHE_KEY);
		} catch (NeedsRefreshException needsRefreshException) {
			boolean updateSucceeded = false;
			try {
				setting = readSetting();
				generalCacheAdministrator.putInCache(SETTING_CACHE_KEY, setting);
				updateSucceeded = true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (!updateSucceeded) {
					generalCacheAdministrator.cancelUpdate(SETTING_CACHE_KEY);
				}
			}
		}
		return setting;
	}

	/**
	 * 写入系统配置信息
	 * 
	 * @return Setting
	 */
	public static void writeSetting(Setting setting) {
		File mallXmlFile = null;
		Document document = null;
		try {
			mallXmlFile = new ClassPathResource(MALL_XML_FILE_NAME).getFile();
			SAXReader saxReader = new SAXReader();
			document = saxReader.read(mallXmlFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Element rootElement = document.getRootElement();
		Element settingElement = rootElement.element("setting");
		Node shopNameNode = document.selectSingleNode("/mall/setting/shopName");
		Node shopUrlNode = document.selectSingleNode("/mall/setting/shopUrl");
		Node hotSearchNode = document.selectSingleNode("/mall/setting/hotSearch");
		Node metaKeywordsNode = document.selectSingleNode("/mall/setting/metaKeywords");
		Node metaDescriptionNode = document.selectSingleNode("/mall/setting/metaDescription");
		Node addressNode = document.selectSingleNode("/mall/setting/address");
		Node phoneNode = document.selectSingleNode("/mall/setting/phone");
		Node zipCodeNode = document.selectSingleNode("/mall/setting/zipCode");
		Node emailNode = document.selectSingleNode("/mall/setting/email");
		Node certtextNode = document.selectSingleNode("/mall/setting/certtext");
		Node currencyTypeNode = document.selectSingleNode("/mall/setting/currencyType");
		Node currencySignNode = document.selectSingleNode("/mall/setting/currencySign");
		Node currencyUnitNode = document.selectSingleNode("/mall/setting/currencyUnit");
		Node priceScaleNode = document.selectSingleNode("/mall/setting/priceScale");
		Node priceRoundTypeNode = document.selectSingleNode("/mall/setting/priceRoundType");
		Node storeAlertCountNode = document.selectSingleNode("/mall/setting/storeAlertCount");
		Node storeFreezeTimeNode = document.selectSingleNode("/mall/setting/storeFreezeTime");
		Node isLoginFailureLockNode = document.selectSingleNode("/mall/setting/isLoginFailureLock");
		Node loginFailureLockCountNode = document.selectSingleNode("/mall/setting/loginFailureLockCount");
		Node loginFailureLockTimeNode = document.selectSingleNode("/mall/setting/loginFailureLockTime");
		Node isRegisterEnabledNode = document.selectSingleNode("/mall/setting/isRegisterEnabled");
		Node watermarkPositionNode = document.selectSingleNode("/mall/setting/watermarkPosition");
		Node watermarkAlphaNode = document.selectSingleNode("/mall/setting/watermarkAlpha");
		Node bigGoodsImageWidthNode = document.selectSingleNode("/mall/setting/bigGoodsImageWidth");
		Node bigGoodsImageHeightNode = document.selectSingleNode("/mall/setting/bigGoodsImageHeight");
		Node smallGoodsImageWidthNode = document.selectSingleNode("/mall/setting/smallGoodsImageWidth");
		Node smallGoodsImageHeightNode = document.selectSingleNode("/mall/setting/smallGoodsImageHeight");
		Node thumbnailGoodsImageWidthNode = document.selectSingleNode("/mall/setting/thumbnailGoodsImageWidth");
		Node thumbnailGoodsImageHeightNode = document.selectSingleNode("/mall/setting/thumbnailGoodsImageHeight");
		Node isShowMarketPriceNode = document.selectSingleNode("/mall/setting/isShowMarketPrice");
		Node defaultMarketPriceOperatorNode = document.selectSingleNode("/mall/setting/defaultMarketPriceOperator");
		Node defaultMarketPriceNumberNode = document.selectSingleNode("/mall/setting/defaultMarketPriceNumber");
		Node smtpFromMailNode = document.selectSingleNode("/mall/setting/smtpFromMail");
		Node smtpHostNode = document.selectSingleNode("/mall/setting/smtpHost");
		Node smtpPortNode = document.selectSingleNode("/mall/setting/smtpPort");
		Node smtpUsernameNode = document.selectSingleNode("/mall/setting/smtpUsername");
		Node smtpPasswordNode = document.selectSingleNode("/mall/setting/smtpPassword");
		Node scoreTypeNode = document.selectSingleNode("/mall/setting/scoreType");
		Node scoreScaleNode = document.selectSingleNode("/mall/setting/scoreScale");
		Node buildHtmlDelayTimeNode = document.selectSingleNode("/mall/setting/buildHtmlDelayTime");
		Node isGzipEnabledNode = document.selectSingleNode("/mall/setting/isGzipEnabled");
		Node isInstantMessagingEnabledNode = document.selectSingleNode("/mall/setting/isInstantMessagingEnabled");
		Node instantMessagingPositionNode = document.selectSingleNode("/mall/setting/instantMessagingPosition");
		Node instantMessagingTitleNode = document.selectSingleNode("/mall/setting/instantMessagingTitle");
		Node isLeaveMessageEnabledNode = document.selectSingleNode("/mall/setting/isLeaveMessageEnabled");
		Node isLeaveMessageCaptchaEnabledNode = document.selectSingleNode("/mall/setting/isLeaveMessageCaptchaEnabled");
		Node leaveMessageDisplayTypeNode = document.selectSingleNode("/mall/setting/leaveMessageDisplayType");
		Node isCommentEnabledNode = document.selectSingleNode("/mall/setting/isCommentEnabled");
		Node isCommentCaptchaEnabledNode = document.selectSingleNode("/mall/setting/isCommentCaptchaEnabled");
		Node commentAuthorityNode = document.selectSingleNode("/mall/setting/commentAuthority");
		Node commentDisplayTypeNode = document.selectSingleNode("/mall/setting/commentDisplayType");

		if (shopNameNode == null) {
			shopNameNode = settingElement.addElement("shopName");
		}
		if (shopUrlNode == null) {
			shopUrlNode = settingElement.addElement("shopUrl");
		}
		if (hotSearchNode == null) {
			hotSearchNode = settingElement.addElement("hotSearch");
		}
		if (metaKeywordsNode == null) {
			metaKeywordsNode = settingElement.addElement("metaKeywords");
		}
		if (metaDescriptionNode == null) {
			metaDescriptionNode = settingElement.addElement("metaDescription");
		}
		if (addressNode == null) {
			addressNode = settingElement.addElement("address");
		}
		if (phoneNode == null) {
			phoneNode = settingElement.addElement("phone");
		}
		if (zipCodeNode == null) {
			zipCodeNode = settingElement.addElement("zipCode");
		}
		if (emailNode == null) {
			emailNode = settingElement.addElement("email");
		}
		if (certtextNode == null) {
			certtextNode = settingElement.addElement("certtext");
		}
		if (currencyTypeNode == null) {
			currencyTypeNode = settingElement.addElement("currencyType");
		}
		if (currencySignNode == null) {
			currencySignNode = settingElement.addElement("currencySign");
		}
		if (currencyUnitNode == null) {
			currencyUnitNode = settingElement.addElement("currencyUnit");
		}
		if (priceScaleNode == null) {
			priceScaleNode = settingElement.addElement("priceScale");
		}
		if (priceRoundTypeNode == null) {
			priceRoundTypeNode = settingElement.addElement("priceRoundType");
		}
		if (storeAlertCountNode == null) {
			storeAlertCountNode = settingElement.addElement("storeAlertCount");
		}
		if (storeFreezeTimeNode == null) {
			storeFreezeTimeNode = settingElement.addElement("storeFreezeTime");
		}
		if (isLoginFailureLockNode == null) {
			isLoginFailureLockNode = settingElement.addElement("isLoginFailureLock");
		}
		if (loginFailureLockCountNode == null) {
			loginFailureLockCountNode = settingElement.addElement("loginFailureLockCount");
		}
		if (loginFailureLockTimeNode == null) {
			loginFailureLockTimeNode = settingElement.addElement("loginFailureLockTime");
		}
		if (isRegisterEnabledNode == null) {
			isRegisterEnabledNode = settingElement.addElement("isRegisterEnabled");
		}
		if (watermarkPositionNode == null) {
			watermarkPositionNode = settingElement.addElement("watermarkPosition");
		}
		if (watermarkAlphaNode == null) {
			watermarkAlphaNode = settingElement.addElement("watermarkAlpha");
		}
		if (bigGoodsImageWidthNode == null) {
			bigGoodsImageWidthNode = settingElement.addElement("bigGoodsImageWidth");
		}
		if (bigGoodsImageHeightNode == null) {
			bigGoodsImageHeightNode = settingElement.addElement("bigGoodsImageHeight");
		}
		if (smallGoodsImageWidthNode == null) {
			smallGoodsImageWidthNode = settingElement.addElement("smallGoodsImageWidth");
		}
		if (smallGoodsImageHeightNode == null) {
			smallGoodsImageHeightNode = settingElement.addElement("smallGoodsImageHeight");
		}
		if (thumbnailGoodsImageWidthNode == null) {
			thumbnailGoodsImageWidthNode = settingElement.addElement("thumbnailGoodsImageWidth");
		}
		if (thumbnailGoodsImageHeightNode == null) {
			thumbnailGoodsImageHeightNode = settingElement.addElement("thumbnailGoodsImageHeight");
		}
		if (isShowMarketPriceNode == null) {
			isShowMarketPriceNode = settingElement.addElement("isShowMarketPrice");
		}
		if (defaultMarketPriceOperatorNode == null) {
			defaultMarketPriceOperatorNode = settingElement.addElement("defaultMarketPriceOperator");
		}
		if (defaultMarketPriceNumberNode == null) {
			defaultMarketPriceNumberNode = settingElement.addElement("defaultMarketPriceNumber");
		}
		if (smtpFromMailNode == null) {
			smtpFromMailNode = settingElement.addElement("smtpFromMail");
		}
		if (smtpHostNode == null) {
			smtpHostNode = settingElement.addElement("smtpHost");
		}
		if (smtpPortNode == null) {
			smtpPortNode = settingElement.addElement("smtpPort");
		}
		if (smtpUsernameNode == null) {
			smtpUsernameNode = settingElement.addElement("smtpUsername");
		}
		if (smtpPasswordNode == null) {
			smtpPasswordNode = settingElement.addElement("smtpPassword");
		}
		if (scoreTypeNode == null) {
			scoreTypeNode = settingElement.addElement("scoreType");
		}
		if (scoreScaleNode == null) {
			scoreScaleNode = settingElement.addElement("scoreScale");
		}
		if (buildHtmlDelayTimeNode == null) {
			buildHtmlDelayTimeNode = settingElement.addElement("buildHtmlDelayTime");
		}
		if (isGzipEnabledNode == null) {
			isGzipEnabledNode = settingElement.addElement("isGzipEnabled");
		}
		if (isInstantMessagingEnabledNode == null) {
			isInstantMessagingEnabledNode = settingElement.addElement("isInstantMessagingEnabled");
		}
		if (instantMessagingPositionNode == null) {
			instantMessagingPositionNode = settingElement.addElement("instantMessagingPosition");
		}
		if (instantMessagingTitleNode == null) {
			instantMessagingTitleNode = settingElement.addElement("instantMessagingTitle");
		}
		if (isLeaveMessageEnabledNode == null) {
			isLeaveMessageEnabledNode = settingElement.addElement("isLeaveMessageEnabled");
		}
		if (isLeaveMessageCaptchaEnabledNode == null) {
			isLeaveMessageCaptchaEnabledNode = settingElement.addElement("isLeaveMessageCaptchaEnabled");
		}
		if (leaveMessageDisplayTypeNode == null) {
			leaveMessageDisplayTypeNode = settingElement.addElement("leaveMessageDisplayType");
		}
		if (isCommentEnabledNode == null) {
			isCommentEnabledNode = settingElement.addElement("isCommentEnabled");
		}
		if (isCommentCaptchaEnabledNode == null) {
			isCommentCaptchaEnabledNode = settingElement.addElement("isCommentCaptchaEnabled");
		}
		if (commentAuthorityNode == null) {
			commentAuthorityNode = settingElement.addElement("commentAuthority");
		}
		if (commentDisplayTypeNode == null) {
			commentDisplayTypeNode = settingElement.addElement("commentDisplayType");
		}

		currencyTypeNode.setText(String.valueOf(setting.getCurrencyType()));
		currencySignNode.setText(setting.getCurrencySign());
		currencyUnitNode.setText(setting.getCurrencyUnit());
		priceScaleNode.setText(String.valueOf(setting.getPriceScale()));
		priceRoundTypeNode.setText(String.valueOf(setting.getPriceRoundType()));
		isLoginFailureLockNode.setText(String.valueOf(setting.getIsLoginFailureLock()));
		loginFailureLockCountNode.setText(String.valueOf(setting.getLoginFailureLockCount()));
		loginFailureLockTimeNode.setText(String.valueOf(setting.getLoginFailureLockTime()));
		isGzipEnabledNode.setText(setting.getIsGzipEnabled().toString());

		try {
			OutputFormat outputFormat = OutputFormat.createPrettyPrint();// 设置XML文档输出格式
			outputFormat.setEncoding("UTF-8");// 设置XML文档的编码类型
			outputFormat.setIndent(true);// 设置是否缩进
			outputFormat.setIndent("	");// 以TAB方式实现缩进
			outputFormat.setNewlines(true);// 设置是否换行
			XMLWriter xmlWriter = new XMLWriter(new FileOutputStream(mallXmlFile), outputFormat);
			xmlWriter.write(document);
			xmlWriter.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 更新系统配置信息
	 * 
	 * @param setting
	 */
	public static void updateSetting(Setting setting) {
		writeSetting(setting);
		GeneralCacheAdministrator generalCacheAdministrator = (GeneralCacheAdministrator) SpringUtil
				.getBean(CACHE_MANAGER_BEAN_NAME);
		generalCacheAdministrator.flushEntry(SETTING_CACHE_KEY);
	}

	/**
	 * 刷新系统配置信息
	 * 
	 */
	public void flush() {
		GeneralCacheAdministrator generalCacheAdministrator = (GeneralCacheAdministrator) SpringUtil
				.getBean(CACHE_MANAGER_BEAN_NAME);
		generalCacheAdministrator.flushEntry(SETTING_CACHE_KEY);
	}

	/**
	 * 获取货币格式字符串
	 * 
	 */
	public static String getCurrencyFormat() {
		Integer priceScale = getSetting().getPriceScale();
		String currencySign = getSetting().getCurrencySign();
		String currencyUnit = getSetting().getCurrencyUnit();
		if (priceScale == 0) {
			return "'" + currencySign + "'#0'" + currencyUnit + "'";
		} else if (priceScale == 1) {
			return "'" + currencySign + "'#0.0'" + currencyUnit + "'";
		} else if (priceScale == 2) {
			return "'" + currencySign + "'#0.00'" + currencyUnit + "'";
		} else if (priceScale == 3) {
			return "'" + currencySign + "'#0.000'" + currencyUnit + "'";
		} else if (priceScale == 4) {
			return "'" + currencySign + "'#0.0000'" + currencyUnit + "'";
		} else {
			return "'" + currencySign + "'#0.00000'" + currencyUnit + "'";
		}
	}

	/**
	 * 获取货币格式化
	 * 
	 */
	public static String currencyFormat(BigDecimal price) {
		String currencyFormat = getCurrencyFormat();
		NumberFormat numberFormat = new DecimalFormat(currencyFormat);
		return numberFormat.format(price);
	}
}