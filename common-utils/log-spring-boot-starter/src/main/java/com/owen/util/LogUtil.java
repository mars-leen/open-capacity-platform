package com.owen.util;

import java.util.concurrent.ThreadLocalRandom;

import com.owen.common.constant.TraceConstant;

import lombok.extern.slf4j.Slf4j;

/**
 * 日志埋点工具类
 *
 * @author zlt
 */
@Slf4j
public class LogUtil {
	 
	public static TraceConstant traceConstant ;
   
    /**
	 * 生成日志随机数
	 * 
	 * @return
	 */
	public static String getTraceId() {
		int i = 0;
		StringBuilder st = new StringBuilder();
		while (i < 5) {
			i++;
			st.append(ThreadLocalRandom.current().nextInt(10));
		}
		return st.toString() + System.currentTimeMillis();
	}
	 
}
