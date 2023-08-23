package com.kakarote.admin.common.log;

import com.kakarote.admin.entity.BO.AdminUserStatusBO;
import com.kakarote.admin.entity.PO.AdminUser;
import com.kakarote.admin.service.IAdminUserService;
import com.kakarote.core.common.log.BehaviorEnum;
import com.kakarote.core.common.log.Content;
import com.kakarote.core.servlet.ApplicationContextHolder;
import com.kakarote.core.utils.UserCacheUtil;

import java.util.ArrayList;
import java.util.List;

public class AdminUserLog {

    private IAdminUserService adminUserService = ApplicationContextHolder.getBean(IAdminUserService.class);

    public Content usernameEdit(Integer id, String username, String password) {
        AdminUser adminUser = adminUserService.getById(id);
        return new Content(adminUser.getRealname(),"Reset account password:"+adminUser.getRealname());
    }

    public List<Content> setUserStatus(AdminUserStatusBO adminUserStatusBO) {
        List<Content> contentList = new ArrayList<>();
        String detail;
        if (adminUserStatusBO.getStatus() == 0){
            detail = "Disabled";
        }else {
            detail = "Enabled";
        }
        for (Long id : adminUserStatusBO.getIds()) {
            String userName = UserCacheUtil.getUserName(id);
            contentList.add(new Content(userName,detail+userName, BehaviorEnum.UPDATE));
        }
        return contentList;
    }

    public List<Content> resetPassword(AdminUserStatusBO adminUserStatusBO) {
        List<Content> contentList = new ArrayList<>();
        for (Long id : adminUserStatusBO.getIds()) {
            String userName = UserCacheUtil.getUserName(id);
            contentList.add(new Content(userName,"Password reset:"+userName, BehaviorEnum.UPDATE));
        }
        return contentList;
    }
}
