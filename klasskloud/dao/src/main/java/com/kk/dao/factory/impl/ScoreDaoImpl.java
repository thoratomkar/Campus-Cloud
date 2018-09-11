package com.kk.dao.factory.impl;

import org.springframework.stereotype.Repository;

import com.kk.dao.factory.ScoreDao;
import com.kk.dao.model.Score;

@Repository("scoreDao")
public class ScoreDaoImpl extends GenericDaoImpl<Score, Long> implements ScoreDao{

}
