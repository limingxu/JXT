package com.jxt.service;

import java.util.List;

import com.jxt.entity.SmsBatchHistory;



/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator by Xing,XiuDong
 * @date 2013-07-20 19:16:28
 */
public interface SmsBatchHistoryService {

	Long createSmsOperationHistory(SmsBatchHistory t);

	int modifySmsOperationHistory(SmsBatchHistory t);

	int removeSmsOperationHistory(SmsBatchHistory t);

	SmsBatchHistory getSmsOperationHistory(SmsBatchHistory t);

	List<SmsBatchHistory> getSmsOperationHistoryList(SmsBatchHistory t);

	Long getSmsOperationHistoryCount(SmsBatchHistory t);

	List<SmsBatchHistory> getSmsOperationHistoryPaginatedList(SmsBatchHistory t);

}