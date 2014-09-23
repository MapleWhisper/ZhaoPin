package com.zhaopin.client.server;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhaopin.base.BaseServerImpl;
import com.zhaopin.po.Resume;

/**
 * 
 * @author 武玉密
 *
 */
@Service
@Transactional
public class ResumeServiceImpl extends BaseServerImpl<Resume> implements ResumeService{

	 

	 
}
