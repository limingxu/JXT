<<<<<<< HEAD
package com.jxt.dao;

import java.util.List;

import com.jxt.entity.City;
import com.jxt.entity.District;
public interface DistrictDao extends GenericDao<District,Long> {
	List<District> getAllDistricts(City city);
}
=======
package com.jxt.dao;

import com.jxt.entity.District;
public interface DistrictDao extends GenericDao<District,Long> {

}
>>>>>>> branch 'master' of https://github.com/limingxu/JXT.git
