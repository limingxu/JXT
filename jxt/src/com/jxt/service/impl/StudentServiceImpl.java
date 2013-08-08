package com.jxt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxt.common.Pager;
import com.jxt.dao.BusiOrderDao;
import com.jxt.dao.StudentDao;
import com.jxt.entity.Admin;
import com.jxt.entity.BaseEntity;
import com.jxt.entity.BusiOrder;
import com.jxt.entity.Student;
import com.jxt.service.StudentService;
import com.jxt.util.MobileUtil;
import com.jxt.util.StringUtil;
@Service("studentServiceImpl")
public class StudentServiceImpl extends BaseServiceImpl<Student, Long> implements StudentService {

	@Resource(name = "studentDaoImpl")
	private StudentDao studentDao;
	
	@Resource(name = "busiOrderDaoImpl")
	private BusiOrderDao busiOrderDao;
	
	@Resource(name = "studentDaoImpl")
	public void setBaseDao(StudentDao studentDao) {
		super.setBaseDao(studentDao);
	}
	
	/*
	 * 检验是否存在同一个班级是否有相同的学号存在
	 * 
	 * @see com.jxt.service.StudentService#checkStuIDNum(com.jxt.entity.Student)
	 */
	@Transactional(readOnly=true)
	public boolean checkStuIDNum(Student student) {
		return studentDao.checkStuIDNum(student)!=null;
	}

	@Transactional
	public void save(Student student, BusiOrder busiOrder) {
		if(MobileUtil.isUNICOMPhone(student.getParentPhoneNum())){
			student.setParentPhoneType(BaseEntity.UNICOM);
		}else{
			student.setParentPhoneType(BaseEntity.OTHERPHONETYPE);
		}
		
		if(!StringUtil.isEmpty(student.getStdPhoneNum())){
			Integer stdPhoneType = MobileUtil.isUNICOMPhone(student.getStdPhoneNum())?BaseEntity.UNICOM:BaseEntity.OTHERPHONETYPE;
			student.setStdPhoneType(stdPhoneType);
		}
		
		if(!StringUtil.isEmpty((student.getParentChargePhoneNum()))){
			Integer phoneType = MobileUtil.isUNICOMPhone(student.getParentChargePhoneNum())?BaseEntity.UNICOM:BaseEntity.OTHERPHONETYPE;
			student.setParentChargePhoneType(phoneType);
		}else{
			student.setParentChargePhoneNum(student.getParentPhoneNum());
			student.setParentChargePhoneType(student.getParentPhoneType());
		}
		
		studentDao.save(student);
		
		busiOrder.setStudent(student);
		busiOrderDao.save(busiOrder);
	}

	@Override
	public Pager getAllStudent(Admin admin, Pager pager) {
		
		return pager;
	}

}