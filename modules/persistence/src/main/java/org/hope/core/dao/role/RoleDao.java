package org.hope.core.dao.role;

import org.hope.core.entity.role.Role;
import org.hope.core.entity.user.User;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Role Dao
 * User: Gongle
 * Date: 13-9-9
 * Time: 下午9:14
 */
public interface RoleDao extends PagingAndSortingRepository<Role, String>, JpaSpecificationExecutor<Role> {
    public Role findByCode(String code);
}
