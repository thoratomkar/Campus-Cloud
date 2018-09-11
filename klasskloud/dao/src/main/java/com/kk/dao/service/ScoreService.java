package com.kk.dao.service;

import com.kk.core.vo.ScoreVO;
import com.kk.dao.model.Score;

public interface ScoreService extends GenericService<Score,Long>{
	
	Boolean save(ScoreVO vo);

	void update(ScoreVO vo) throws Exception;

	Score exists(Long studentId, Long testId) throws Exception;
	

}
