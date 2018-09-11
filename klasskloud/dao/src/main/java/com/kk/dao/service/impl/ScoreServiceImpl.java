package com.kk.dao.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.ScoreVO;
import com.kk.dao.factory.ScoreDao;
import com.kk.dao.model.Score;
import com.kk.dao.service.OrganizationService;
import com.kk.dao.service.ScoreService;
import com.kk.dao.service.StudentService;
import com.kk.dao.service.TestService;

@Service
@Transactional(rollbackOn = Exception.class)
public class ScoreServiceImpl extends GenericServiceImpl<Score,Long> implements ScoreService{
	@Autowired
	private ScoreDao scoreDao;

	@Autowired
	private TestService testService;
	
	@Autowired
	private StudentService studentService;
	
	
	@Autowired
	private OrganizationService organizationService;
	
	@Override
	public Score exists(Long studentId, Long testId) throws Exception {
		Score score = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("student.id",String.valueOf(studentId));
		vo.getWhereClause().put("test.id", String.valueOf(testId));
		List<Score> sList = scoreDao.findAllByQueryFilter(vo);
		if(null != sList && sList.size() > 0){
			score = sList.get(0);
		}
		return score;
	}
	
	@Override
	public Boolean save(ScoreVO vo) {
		Boolean result = Boolean.FALSE;
		try {
			Score score = exists(vo.getStudentId(), vo.getTestId());
			if(null != score   && !score.getIsDeleted()) return result;
			if(null == score) {
				score = new Score();
			}
			BeanUtils.copyProperties(vo, score);
			score.setIsDeleted(Boolean.FALSE);
			if(null == score.getId()) score.setCreatedAt(new Date());
			score.setUpdatedAt(new Date());
			score.setOrganization(organizationService.get(vo.getOrgId()));
			score.setStudent(studentService.get(vo.getStudentId()));
			score.setTest(testService.get(vo.getTestId()));
			score.setIsPassed(score.getScore() >= score.getTest().getPassingScore());
			score.setStatus(score.getIsPassed() ? "Passed":"Failed");
			saveOrUpdate(score);
			result = Boolean.TRUE;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public void update(ScoreVO vo) throws Exception {
	}
	


}
