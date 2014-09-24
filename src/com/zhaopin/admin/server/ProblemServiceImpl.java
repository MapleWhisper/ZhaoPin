package com.zhaopin.admin.server;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.zhaopin.base.BaseServerImpl;
import com.zhaopin.po.Problem;

@Transactional
@Service
public class ProblemServiceImpl extends BaseServerImpl<Problem> implements ProblemService {

}	
