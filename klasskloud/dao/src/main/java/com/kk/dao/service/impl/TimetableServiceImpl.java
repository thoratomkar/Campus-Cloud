package com.kk.dao.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.TimetableVO;
import com.kk.dao.factory.TimetableDao;
import com.kk.dao.model.Organization;
import com.kk.dao.model.Timetable;
import com.kk.dao.service.TimetableService;
import com.kk.dao.service.UserService;

@Service
@Transactional(rollbackOn = Exception.class)
public class TimetableServiceImpl extends GenericServiceImpl<Timetable,Long> implements TimetableService{


	@Autowired
	private TimetableDao timetableDao;

	@Autowired
	private UserService userService;
	
	@Override
	public Timetable exists(Long classid) throws Exception {
		return timetableDao.exists(classid);
	}
	
	@Override
	public Boolean save(TimetableVO vo,Organization organization) {
		Boolean result = Boolean.FALSE;
		Boolean creatett = Boolean.FALSE;
		try {
			Timetable timetable = exists(vo.getId());
			if(null != timetable   && !timetable.getIsDeleted()) return result;
			if(null == timetable) {
				timetable = new Timetable();
				creatett = Boolean.TRUE;
			}
			timetable.setOrganization(organization);
			timetable.setClassid(vo.getClassid());
			timetable.setDay(vo.getDay());
			timetable.setIsDeleted(Boolean.FALSE);
			if(null == timetable.getId()) timetable.setCreatedAt(new Date());
			timetable.setUpdatedAt(new Date());
			timetable.setSlot1(vo.getSlot1());
			timetable.setSlot2(vo.getSlot2());
			timetable.setSlot3(vo.getSlot3());
			timetable.setSlot4(vo.getSlot4());
			timetable.setSlot5(vo.getSlot5());
			timetable.setSlot6(vo.getSlot6());
			timetable.setSlot7(vo.getSlot7());
			timetable.setSlot8(vo.getSlot8());
			timetable.setSlot9(vo.getSlot9());
			saveOrUpdate(timetable);
			result = Boolean.TRUE;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public void update(TimetableVO vo) throws Exception {
		Timetable timetable = get(vo.getId());
		timetable.setClassid(vo.getClassid());
		timetable.setDay(vo.getDay());
		timetable.setUpdatedAt(new Date());
		timetable.setSlot1(vo.getSlot1());
		timetable.setSlot2(vo.getSlot2());
		timetable.setSlot3(vo.getSlot3());
		timetable.setSlot4(vo.getSlot4());
		timetable.setSlot5(vo.getSlot5());
		timetable.setSlot6(vo.getSlot6());
		timetable.setSlot7(vo.getSlot7());
		timetable.setSlot8(vo.getSlot8());
		timetable.setSlot9(vo.getSlot9());
		update(timetable);
	}
	
	@Override
	public Timetable getTimetableByClassAndDay(TimetableVO timetableVO) throws Exception{
		Timetable timetable = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("classid",timetableVO.getClassid().toString());
		vo.getWhereClause().put("day", timetableVO.getDay());
		
		List<Timetable> mList = timetableDao.findAllByQueryFilter(vo);
		if(null != mList && mList.size() > 0){
			timetable = mList.get(0);
		}
		return timetable;
	}




}
