package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.SCORE_CREATED;
import static com.kk.core.constant.MessageConstants.SCORE_DELETED;
import static com.kk.core.constant.MessageConstants.SCORE_EDITED;
import static com.kk.core.constant.MessageConstants.SCORE_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.ScoreVO;
import com.kk.dao.model.Score;
import com.kk.dao.service.ScoreService;
import com.kk.web.common.KKContext;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest/score")
public class ScoreController {

	@Autowired
	private ScoreService scoreService;
	
	@Autowired
	private KKContext context;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "", method = RequestMethod.GET)
	public RestResponse list() {
		RestResponse respone = new RestResponse();
		try {
			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
			List<Score> scoreList = scoreService.findAllByQueryFilter(vo);
			respone.setData(scoreList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "", method = RequestMethod.POST)
	public RestResponse create(ScoreVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.TRUE;
		try {
			
			if(null != vo.getId()){
				scoreService.update(vo);
				response.setStatusText(SCORE_EDITED);
			}else{
				scoreService.save(vo);
				response.setStatusText(SCORE_CREATED);
			}
			response.setObject(vo);
			response.setStatus(status);
			
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(SCORE_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Score score = scoreService.get(id);
			score.setIsDeleted(Boolean.TRUE);
			score.setUpdatedAt(new Date());
			scoreService.update(score);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(SCORE_DELETED);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Score score = scoreService.get(id);
			response.setObject(score);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/student/{studentId}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("studentId") String studentId) {
		RestResponse response = new RestResponse();
		try {
			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("student.id", studentId);
			List<Score> scoreList = scoreService.findAllByQueryFilter(vo);
			response.setList(scoreList);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}


}
