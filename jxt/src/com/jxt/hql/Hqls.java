package com.jxt.hql;

public interface Hqls {
	public interface AdminHqls {
		String check_unique_username = "select a from Admin a where a.username = :username";
		String get_login_admin_by_username = "select a from Admin a left join fetch a.adminSchools b left join fetch b.school where a.username=:username";

	}
}
