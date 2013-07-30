package com.jxt.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.jxt.util.Assert;
import com.jxt.util.ResourceUtil;


public class Configuration {
	private static final Map<String, Configuration> configs = new HashMap<String, Configuration>();
	private static final String regex = "\\$\\{([^}]+)\\}";
	
	private Properties prop;
	
	private Configuration(String configurefile) {
		Assert.hasLength(configurefile,
				"Configuration files can't be null or empty.");
		InputStream is = null;
		try {
			is = ResourceUtil.getURL(configurefile).openStream();
			prop = new Properties();
			prop.load(is);
		} catch (Exception e) {
			throw new ExceptionInInitializerError(e);
		} finally {
			if (null != is) {
				try {
					is.close();
				} catch (IOException e) {
					// ignore this.
				}
			}
		}
	}
	
	/**
	 * Initializes the configure.
	 * 
	 * @param confFile
	 *            the configuration file path it will search for the file in the
	 *            class path if the path doesn't exist
	 * @exception InstantiationException
	 */
	public static Configuration getConfig(String configfile) {
		Configuration config = configs.get(configfile);
		if(config==null) {
			config = new Configuration(configfile);
			configs.put(configfile, config);
		}
		return config;
	}
	
	/**
	 * Read a string value
	 * 
	 * @param key
	 *            key from config file
	 * @return String value if exists
	 */
	public String getString(String key) {
		if (prop == null) {
			throw new RuntimeException("Config hasn't been initialized yet.");
		}
		if (prop.containsKey(key)){
			String result = prop.getProperty(key);
			Matcher m = Pattern.compile(regex).matcher(result);
			while(m.find()){
				result = result.replace(m.group(0), prop.getProperty(m.group(1)));
			}
			return result;
		}
		else
			throw new RuntimeException("No config key found for [" + key + "]."
					+ " from prop:" + prop);
	}

	/**
	 * Read a int value
	 * 
	 * @param key
	 *            key from config file
	 * @return int value if exists
	 */
	public int getInt(String key) {
		if (prop == null) {
			throw new RuntimeException("Config hasn't been initialized yet.");
		}
		if (prop.containsKey(key))
			return Integer.parseInt(prop.getProperty(key));
		else
			throw new RuntimeException("No config key found for [" + key + "].");
	}

	/**
	 * Read a long value
	 * 
	 * @param key
	 *            key from config file
	 * @return long value if exists
	 */
	public long getLong(String key) {
		if (prop == null) {
			throw new RuntimeException("Config hasn't been initialized yet.");
		}
		if (prop.containsKey(key))
			return Long.parseLong(prop.getProperty(key));
		else
			throw new RuntimeException("No config key found for [" + key + "].");
	}

	/**
	 * Read a boolean value
	 * 
	 * @param key
	 *            key from config file
	 * @return boolean true if value is 1 or true
	 */
	public boolean getBoolean(String key) {
		if (prop == null) {
			throw new RuntimeException("Config hasn't been initialized yet.");
		}
		if (prop.containsKey(key))
			return (prop.getProperty(key).equals("true") || prop.getProperty(
					key).equals("1"));
		else
			throw new RuntimeException("No config key found for [" + key + "].");
	}
	
	/**
	 * Read a boolean value
	 * 
	 * @param key
	 *            key from config file
	 * @return boolean true if value is 1 or true
	 */
	public double getDouble(String key) {
		if (prop == null) {
			throw new RuntimeException("Config hasn't been initialized yet.");
		}
		if (prop.containsKey(key))
			return (Double.parseDouble(prop.getProperty(key)));
		else
			throw new RuntimeException("No config key found for [" + key + "].");
	}
	
	/**
	 * Read a boolean value
	 * 
	 * @param key
	 *            key from config file
	 * @return boolean true if value is 1 or true
	 */
	public float getFloat(String key) {
		if (prop == null) {
			throw new RuntimeException("Config hasn't been initialized yet.");
		}
		if (prop.containsKey(key))
			return (Float.parseFloat(prop.getProperty(key)));
		else
			throw new RuntimeException("No config key found for [" + key + "].");
	}

	/**
	 * Read a byte value
	 * 
	 * @param key
	 *            key from config file
	 * @return byte value if exists
	 */
	public byte getByte(String key) {
		if (prop == null) {
			throw new RuntimeException("Config hasn't been initialized yet.");
		}
		if (prop.containsKey(key))
			return Byte.parseByte(prop.getProperty(key));
		else
			throw new RuntimeException("No config key found for [" + key + "].");
	}
}