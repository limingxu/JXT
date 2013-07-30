package com.jxt.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


public class TrimInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 2365641900033439481L;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		Map<String, Object> parameters = actionInvocation.getInvocationContext().getParameters();
		for (String key : parameters.keySet()) {
			Object value = parameters.get(key);
			if (value instanceof String[]) {
				String[] values = (String[]) value;
				for (int i = 0; i < values.length; i++) {
					values[i] = values[i].trim();
				}
				parameters.put(key, values);
			}
		}
		return actionInvocation.invoke();
	}

}