package com.jxt.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This class handles HTML escaping of text. It was written and optimized to be
 * as fast as possible.
 * 
 */
public class HtmlUtil {
	protected static final int MAX_LENGTH = 300;

	/**
	 * We use arrays of char in the lookup table because it is faster appending
	 * this to a StringBuffer than appending a String
	 */
	protected static final char[][] _stringChars = new char[MAX_LENGTH][];

	static {
		// Initialize the mapping table
		initMapping();
	}

	/**
	 * Turn special characters into escaped characters conforming to JavaScript.
	 * Handles complete character set defined in HTML 4.01 recommendation.
	 * 
	 * @param input the input string
	 * @return the escaped string
	 * @deprecated please use escapeHtml method instead.
	 */
	public static String escapeJavaScript(String input) {
		if (input == null) {
			return input;
		}

		StringBuffer filtered = new StringBuffer(input.length());
		char prevChar = '\u0000';
		char c;
		for (int i = 0; i < input.length(); i++) {
			c = input.charAt(i);
			if (c == '"') {
				filtered.append("\\\"");
			} else if (c == '\'') {
				filtered.append("\\'");
			} else if (c == '\\') {
				filtered.append("\\\\");
			} else if (c == '/') {
				filtered.append("\\/");
			} else if (c == '\t') {
				filtered.append("\\t");
			} else if (c == '\n') {
				if (prevChar != '\r') {
					filtered.append("\\n");
				}
			} else if (c == '\r') {
				filtered.append("\\n");
			} else if (c == '\f') {
				filtered.append("\\f");
			} else {
				filtered.append(c);
			}
			prevChar = c;

		}
		return filtered.toString();
	}

	/**
	 * Call escapeHTML(s, false)
	 */
	public static final String escapeHTML(String s) {
		return escapeHTML(s, false);
	}

	/**
	 * Escape HTML.
	 * 
	 * @param s string to be escaped
	 * @param escapeEmpty if true, then empty string will be escaped.
	 */
	public static final String escapeHTML(String s, boolean escapeEmpty) {
		int len = s.length();

		if (len == 0) {
			return s;
		}

		if (!escapeEmpty) {
			String trimmed = s.trim();

			if ((trimmed.length() == 0) || ("\"\"").equals(trimmed)) {
				return s;
			}
		}

		int i = 0;

		// First loop through String and check if escaping is needed at all
		// No buffers are copied at this time
		do {
			int index = s.charAt(i);

			if (index >= MAX_LENGTH) {
				if (index != 0x20AC) { // If not euro symbol

					continue;
				}

				break;
			} else if (_stringChars[index] != null) {
				break;
			}
		} while (++i < len);

		// If the check went to the end with no escaping then i should be ==
		// len now
		// otherwise we must continue escaping for real
		if (i == len) {
			return s;
		}

		// We found a character to escape and broke out at position i
		// Now copy all characters before that to StringBuffer sb
		// Since a char[] will be used for copying we might as well get
		// a complete copy of it so that we can use array indexing instead
		// of charAt
		StringBuffer sb = new StringBuffer(len + 40);
		char[] chars = new char[len];

		// Copy all chars from the String s to the chars buffer
		s.getChars(0, len, chars, 0);

		// Append the first i characters that we have checked to the
		// resulting StringBuffer
		sb.append(chars, 0, i);

		int last = i;
		char[] subst;

		for (; i < len; i++) {
			char c = chars[i];
			int index = c;

			if (index < MAX_LENGTH) {
				subst = _stringChars[index];

				// It is faster to append a char[] than a String which is
				// why we use this
				if (subst != null) {
					if (i > last) {
						sb.append(chars, last, i - last);
					}

					sb.append(subst);
					last = i + 1;
				}
			}
			// Check if it is the euro symbol. This could be changed to
			// check in a second lookup
			// table in case one wants to convert more characters in that
			// area
			else if (index == 0x20AC) {
				if (i > last) {
					sb.append(chars, last, i - last);
				}

				sb.append("&euro;");
				last = i + 1;
			}
		}

		if (i > last) {
			sb.append(chars, last, i - last);
		}

		return sb.toString();
	}

	protected static void addMapping(int c, String txt, String[] strings) {
		strings[c] = txt;
	}

	protected static void initMapping() {
		String[] strings = new String[MAX_LENGTH];
		addMapping(0x20, "&nbsp;", strings);// ' '
		addMapping(0x22, "&quot;", strings); // "
		addMapping(0x26, "&amp;", strings); // &
		addMapping(0x3c, "&lt;", strings); // <
		addMapping(0x3e, "&gt;", strings); // >

		addMapping(0xa1, "&iexcl;", strings); //
		addMapping(0xa2, "&cent;", strings); //
		addMapping(0xa3, "&pound;", strings); //
		addMapping(0xa9, "&copy;", strings); //
		addMapping(0xae, "&reg;", strings); //
		addMapping(0xbf, "&iquest;", strings); //

		addMapping(0xc0, "&Agrave;", strings); //
		addMapping(0xc1, "&Aacute;", strings); //
		addMapping(0xc2, "&Acirc;", strings); //
		addMapping(0xc3, "&Atilde;", strings); //
		addMapping(0xc4, "&Auml;", strings); //
		addMapping(0xc5, "&Aring;", strings); //
		addMapping(0xc6, "&AElig;", strings); //
		addMapping(0xc7, "&Ccedil;", strings); //
		addMapping(0xc8, "&Egrave;", strings); //
		addMapping(0xc9, "&Eacute;", strings); //
		addMapping(0xca, "&Ecirc;", strings); //
		addMapping(0xcb, "&Euml;", strings); //
		addMapping(0xcc, "&Igrave;", strings); //
		addMapping(0xcd, "&Iacute;", strings); //
		addMapping(0xce, "&Icirc;", strings); //
		addMapping(0xcf, "&Iuml;", strings); //

		addMapping(0xd0, "&ETH;", strings); //
		addMapping(0xd1, "&Ntilde;", strings); //
		addMapping(0xd2, "&Ograve;", strings); //
		addMapping(0xd3, "&Oacute;", strings); //
		addMapping(0xd4, "&Ocirc;", strings); //
		addMapping(0xd5, "&Otilde;", strings); //
		addMapping(0xd6, "&Ouml;", strings); //
		addMapping(0xd7, "&times;", strings); //
		addMapping(0xd8, "&Oslash;", strings); //
		addMapping(0xd9, "&Ugrave;", strings); //
		addMapping(0xda, "&Uacute;", strings); //
		addMapping(0xdb, "&Ucirc;", strings); //
		addMapping(0xdc, "&Uuml;", strings); //
		addMapping(0xdd, "&Yacute;", strings); //
		addMapping(0xde, "&THORN;", strings); //
		addMapping(0xdf, "&szlig;", strings); //

		addMapping(0xe0, "&agrave;", strings); //
		addMapping(0xe1, "&aacute;", strings); //
		addMapping(0xe2, "&acirc;", strings); //
		addMapping(0xe3, "&atilde;", strings); //
		addMapping(0xe4, "&auml;", strings); //
		addMapping(0xe5, "&aring;", strings); //
		addMapping(0xe6, "&aelig;", strings); //
		addMapping(0xe7, "&ccedil;", strings); //
		addMapping(0xe8, "&egrave;", strings); //
		addMapping(0xe9, "&eacute;", strings); //
		addMapping(0xea, "&ecirc;", strings); //
		addMapping(0xeb, "&euml;", strings); //
		addMapping(0xec, "&igrave;", strings); //
		addMapping(0xed, "&iacute;", strings); //
		addMapping(0xee, "&icirc;", strings); //
		addMapping(0xef, "&iuml;", strings); //

		addMapping(0xf0, "&eth;", strings); //
		addMapping(0xf1, "&ntilde;", strings); //
		addMapping(0xf2, "&ograve;", strings); //
		addMapping(0xf3, "&oacute;", strings); //
		addMapping(0xf4, "&ocirc;", strings); //
		addMapping(0xf5, "&otilde;", strings); //
		addMapping(0xf6, "&ouml;", strings); //
		addMapping(0xf7, "&divide;", strings); //
		addMapping(0xf8, "&oslash;", strings); //
		addMapping(0xf9, "&ugrave;", strings); //
		addMapping(0xfa, "&uacute;", strings); //
		addMapping(0xfb, "&ucirc;", strings); //
		addMapping(0xfc, "&uuml;", strings); //
		addMapping(0xfd, "&yacute;", strings); //
		addMapping(0xfe, "&thorn;", strings); //
		addMapping(0xff, "&yuml;", strings); //

		for (int i = 0; i < strings.length; i++) {
			String str = strings[i];

			if (str != null) {
				_stringChars[i] = str.toCharArray();
			}
		}
	}

	/**
	 * 不删除input字符串中的html格式
	 * 
	 * @param input
	 * @param length
	 * @return
	 */
	public static String subStr(String input, int length, String end) {
		if (input == null || input.trim().equals("")) {
			return "";
		}
		String str = input.trim();
		int len = str.length();
		if (len <= length) {
			return str;
		} else {
			str = str.substring(0, length);
			str += end;
		}
		return str;
	}

	/**
	 * 删除input字符串中的html格式
	 * 
	 * @param input
	 * @param length
	 * @return
	 */
	public static String subString(String input, int length, String end) {
		if (input == null || input.trim().equals("")) {
			return "";
		}
		// 去掉所有html元素,
		String str = input.replaceAll("\\&[a-zA-Z]{1,10};", "").replaceAll("<[^>]*>", "").replace("\r", "")
		        .replace("\n", "").trim();
		// str = str.replaceAll("[(/>)<]", "");
		str = str.replaceAll("<script.*>.*</script\\s*>", "");
		int len = str.length();
		if (length == 0 || len <= length) {			
			return str;
		} else {
			str = str.substring(0, length);
			str += end;
		}

		return str;
	}

	/**
	 * 替换'<'和'>'
	 * 
	 * @param input 输入的字符串
	 * @param length 截取长度
	 * @param end 结尾
	 * @return 截取和替换后的字符串
	 */
	public static String subStrByReplace(String input, int length, String end) {
		if (input == null || input.trim().equals("")) {
			return "";
		}
		// 去掉所有html元素,
		int len = input.length();
		if (len > length) {
			input = input.substring(0, length);
			input += end;
		}

		return input.replaceAll("&amp;", "&").replaceAll("<", "&lt;").replaceAll(">", "&gt;");
	}

	/**
	 * 替换'&lt;'和'&gt;'
	 * 
	 * @param input 输入的字符串
	 * @param length 截取长度
	 * @param end 结尾
	 * @return 截取和替换后的字符串
	 */
	public static String subStrRemove(String input, int length, String end) {
		if (input == null || input.trim().equals("")) {
			return "";
		}
		input = input.replaceAll("&lt;", "<").replaceAll("&gt;", ">");
		return subString(input, length, end);
	}

	/**
	 * 按字节长度截取字符串(支持截取带HTML代码样式的字符串)
	 * 
	 * @param param 将要截取的字符串参数
	 * @param length 截取的字节长度
	 * @param end 字符串末尾补上的字符串
	 * @return 返回截取后的字符串
	 */
	public static String subStringHTML(String param, int length, String end) {
		if (param == null || param.trim().equals("")) {
			return "";
		}
		StringBuffer result = new StringBuffer();
		int n = 0;
		char temp;
		boolean isCode = false;
		boolean isHTML = false;
		param = param.replace("\r", "").replace("\n", "").trim();
		for (int i = 0; i < param.length(); i++) {
			temp = param.charAt(i);
			if (temp == '<') {
				isCode = true;
			} else if (temp == '&') {
				isHTML = true;
			} else if (temp == '>' && isCode) {
				n = n - 1;
				isCode = false;
			} else if (temp == ';' && isHTML) {
				isHTML = false;
			}
			if (!isCode && !isHTML) {
				n = n + 1;
				// UNICODE码字符占两个字节
				if ((temp + "").getBytes().length > 1) {
					n = n + 1;
				}
			}
			result.append(temp);
			if (n >= length) {
				break;
			}
		}
		result.append(end);
		String temp_result = result.toString().replaceAll("(>)[^<>]*(<?)", "$1$2");
		temp_result = temp_result
		        .replaceAll(
		                "</?(FONT|AREA|BASE|BASEFONT|BODY|BR|COL|COLGROUP|DD|DT|FRAME|HEAD|HR|HTML|IMG|INPUT|ISINDEX|LI|LINK|META|OPTION|P|PARAM|TBODY|TD|TFOOT|TH|THEAD|TR|area|base|basefont|body|br|col|colgroup|dd|dt|frame|head|hr|html|img|input|isindex|li|link|meta|option|p|param|tbody|td|tfoot|th|thead|font|tr)[^<>]*/?>",
		                "");
		temp_result = temp_result.replaceAll("<([a-zA-Z]+)[^<>]*>(.*?)</\\1>", "$2");
		Pattern p = Pattern.compile("<([a-zA-Z]+)[^<>]*>");
		Matcher m = p.matcher(temp_result);
		List<Object> endHTML = new ArrayList<Object>();
		while (m.find()) {
			endHTML.add(m.group(1));
		}
		// 补全不成对的HTML标记
		for (int i = endHTML.size() - 1; i >= 0; i--) {
			result.append("</");
			result.append(endHTML.get(i));
			result.append(">");
		}
		return result.toString();
	}
	
    public static String removeHTMLTag(String htmlStr){
    	if(ValidateUtil.isTrimEmpty(htmlStr))
    		return htmlStr;
        String regEx_script="<script[^>]*?>[\\s\\S]*?<\\/script>"; //定义script的正则表达式
        String regEx_style="<style[^>]*?>[\\s\\S]*?<\\/style>"; //定义style的正则表达式
        String regEx_html="<[^>]+>"; //定义HTML标签的正则表达式
       
        Pattern p_script=Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE);
        Matcher m_script=p_script.matcher(htmlStr);
        htmlStr=m_script.replaceAll(""); //过滤script标签
       
        Pattern p_style=Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE);
        Matcher m_style=p_style.matcher(htmlStr);
        htmlStr=m_style.replaceAll(""); //过滤style标签
       
        Pattern p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE);
        Matcher m_html=p_html.matcher(htmlStr);
        htmlStr=m_html.replaceAll(""); //过滤html标签

       return htmlStr.trim(); //返回文本字符串
    } 
}
