package org.lework.core.service.menu;

import org.lework.core.common.enumeration.Status;
import org.lework.core.entity.menu.Menu;
import org.lework.core.entity.organization.Organization;
import org.lework.core.entity.role.Role;
import org.lework.core.entity.user.User;
import org.lework.runner.orm.support.SearchFilter;
import org.lework.runner.web.easyui.KVResult;
import org.lework.runner.web.easyui.TreeResult;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 菜单Service层
 * User: Gongle
 * Date: 13-10-22
 */
public interface MenuService {
    public  boolean validateMenuCode(String id ,String code ) ;

    public Menu getMenu(String id);

    public List<Menu> getAllMenus();

    public List<Menu> getMenusByIds(List<String> ids );
    /**
     * 获取当前节点所有子节点,包含自身
     * @param id 菜单ID
     * @return
     */
    public List<Menu> getSelfAndChildMenus(String id );

    public Menu getMenuByCode(String code);

    public List<Menu> getAllMenuByStatus(Status status);

    public List<Menu> getRootMenus() ;

    public List<Menu> getChildMenusByParentId(String parentId) ;
    /**
     * 获取角色拥有的菜单
     * @param role
     * @param status
     * @return
     */
    public List<Menu> getRoleMenusByStatus(Role role , Status status) ;

    /**
     * 获取角色拥有的菜单
     * @param role
     * @return
     */
    public List<Menu> getRoleMenus(Role role) ;

    /**
     * 新增操作时,默认序号为{同级节点最大值}+1
     * @param entity
     */
    public void saveMenu(Menu entity);

    public void deleteMenu(String id);

    public void deleteMenu(Menu entity);

    public void deleteMenus(List<String> ids );

    public void deleteMenus(String[] ids );

    public Page<Menu> getPageMenu(Pageable pageable);

    /**
     * 获取一个分页
     *
     * @param pageable 分页信息
     * @param filters  属性过滤器
     * @return Page<Menu>
     * @see Page
     * @see Pageable
     * @see org.lework.runner.orm.support.SearchFilter
     */
    public Page<Menu> searchPageMenu(Pageable pageable, List<SearchFilter> filters);


    /**
     * get easyui tree grid json data
     * @param ignore 忽略的节点
     * @return
     */
    public  List<MenuTreeGridDTO>  getMenuTreeGrid(List<Menu> ignore);
    /**
     * get easyui tree json data
     * @param ignore 忽略的节点
     * @return
     */
    public  List<TreeResult>  getMenuTree(List<Menu> ignore);

    /**
     * 同级兄弟节点 上移排序
     * @param entity
     */
    public void upSortNum(Menu entity);

    /**
     * 同级兄弟节点,下移序号
     * @param entity
     */
    public void downSortNum(Menu entity);
}
