package com.kakarote.crm.common.log;

import com.kakarote.core.common.log.BehaviorEnum;
import com.kakarote.core.common.log.Content;
import com.kakarote.core.servlet.ApplicationContextHolder;
import com.kakarote.crm.service.ICrmBusinessTypeService;
import org.springframework.web.bind.annotation.RequestParam;

public class CrmBusinessTypeLog {
    private ICrmBusinessTypeService crmBusinessTypeService = ApplicationContextHolder.getBean(ICrmBusinessTypeService.class);

    public Content deleteById(Integer typeId) {
        String businessTypeName = crmBusinessTypeService.getBusinessTypeName(typeId);
        crmBusinessTypeService.deleteById(typeId);
        return new Content(businessTypeName,"Business group deleted:"+businessTypeName, BehaviorEnum.DELETE);
    }

    public Content updateStatus(@RequestParam("typeId") Integer typeId, @RequestParam("status") Integer status) {
        String detail;
        if (status == 0){
            detail = "Business unit disabled:";
        }else {
            detail = "Business unit enabled:";
        }
        String businessTypeName = crmBusinessTypeService.getBusinessTypeName(typeId);
        return new Content(businessTypeName,detail+businessTypeName, BehaviorEnum.DELETE);
    }
}
