package com.zhaopin.client.server;

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
