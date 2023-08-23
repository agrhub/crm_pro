package com.kakarote.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.kakarote.admin.entity.PO.AdminUserConfig;
import com.kakarote.admin.mapper.AdminUserConfigMapper;
import com.kakarote.admin.service.IAdminUserConfigService;
import com.kakarote.core.common.Const;
import com.kakarote.core.servlet.BaseServiceImpl;
import com.kakarote.core.utils.UserUtil;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 用户配置表 服务实现类
 * </p>
 *
 * @author zhangzhiwei
 * @since 2020-04-27
 */
@Service
public class AdminUserConfigServiceImpl extends BaseServiceImpl<AdminUserConfigMapper, AdminUserConfig> implements IAdminUserConfigService {

    /**
     * 根据名称查询用户配置信息
     *
     * @param name
     * @return data
     */
    @Override
    public AdminUserConfig queryUserConfigByName(String name) {
        QueryWrapper<AdminUserConfig> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name", name).eq("user_id", UserUtil.getUserId()).last(" limit 0,1");
        return query().getBaseMapper().selectOne(queryWrapper);
    }

    /**
     * 根据名称查询用户配置信息列表
     * userId获取当前登录人
     *
     * @param name 名称
     * @return data
     */
    @Override
    public List<AdminUserConfig> queryUserConfigListByName(String name) {
        QueryWrapper<AdminUserConfig> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name", name).eq("user_id", UserUtil.getUserId());
        return query().getBaseMapper().selectList(queryWrapper);
    }

    /**
     * 根据名称删除用户配置信息
     * userId获取当前登录人
     *
     * @param name 名称
     */
    @Override
    public void deleteUserConfigByName(String name) {
        QueryWrapper<AdminUserConfig> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name", name).eq("user_id", UserUtil.getUserId());
        remove(queryWrapper);
    }

    /**
     * 用户注册的时候初始化用户配置
     *
     * @param userId 新增的用户ID
     */
    @Override
    public void initUserConfig(Long userId) {
        //保存用户跟进记录常用语
        List<AdminUserConfig> adminUserConfigList = new ArrayList<>();
        adminUserConfigList.add(new AdminUserConfig(null, userId, 1, "ActivityPhrase", "No one answered the phone", "Common phrases for follow-up records"));
        adminUserConfigList.add(new AdminUserConfig(null, userId, 1, "ActivityPhrase", "Customer has no intention", "Common phrases for follow-up records"));
        adminUserConfigList.add(new AdminUserConfig(null, userId, 1, "ActivityPhrase", "Customer intention is moderate, follow up", "Common phrases for follow-up records"));
        adminUserConfigList.add(new AdminUserConfig(null, userId, 1, "ActivityPhrase", "Strong customer intent and high transaction probability", "Common phrases for follow-up records"));
        saveBatch(adminUserConfigList, Const.BATCH_SAVE_SIZE);
    }

    /**
     * 根据名称和内容查询配置用户
     */
    @Override
    public List<AdminUserConfig> queryUserConfigByNameAndValue(String name, String value) {
        QueryWrapper<AdminUserConfig> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("name", name).eq("value", value);
        return query().getBaseMapper().selectList(queryWrapper);
    }

}
