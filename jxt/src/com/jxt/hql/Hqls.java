package com.jxt.hql;

public interface Hqls {
	public interface AdminHqls {
		String check_unique_username = "select a from Admin a where a.username = :username";
		String get_login_admin_by_username = "select a from Admin a left join fetch a.adminSchools b left join fetch b.school school left join fetch a.agent agent where a.username=:username";

	}
	
	public interface ClassHqls {
		String get_login_class_by_admin = " select c from Classes c left join fetch a.grade g left join fetch a.school where  ";
	}
}
