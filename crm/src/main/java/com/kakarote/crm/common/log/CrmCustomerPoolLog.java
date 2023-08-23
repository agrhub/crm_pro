package com.kakarote.crm.common.log;

import com.kakarote.core.common.log.BehaviorEnum;
import com.kakarote.core.common.log.Content;
import com.kakarote.core.servlet.ApplicationContextHolder;
import com.kakarote.crm.entity.PO.CrmCustomerPool;
import com.kakarote.crm.service.ICrmCustomerPoolService;

public class CrmCustomerPoolLog {

    private ICrmCustomerPoolService crmCustomerPoolService = ApplicationContextHolder.getBean(ICrmCustomerPoolService.class);

    public Content changeStatus(Integer poolId,Integer status) {
        CrmCustomerPool customerPool = crmCustomerPoolService.getById(poolId);
        String detail;
        if (status == 0){
            detail = "Disabled:";
        }else {
            detail = "Enabled:";
        }
        return new Content(customerPool.getPoolName(),detail+customerPool.getPoolName(), BehaviorEnum.UPDATE);
    }

    public Content transfer( Integer prePoolId,  Integer postPoolId) {
        CrmCustomerPool prePool = crmCustomerPoolService.getById(prePoolId);
        CrmCustomerPool postPool = crmCustomerPoolService.getById(postPoolId);
        return new Content("High seas transfer","From ["+prePool.getPoolName()+"] transfer to the high seas ["+postPool.getPoolName()+"]", BehaviorEnum.UPDATE);
    }

    public Content deleteCustomerPool(Integer poolId) {
        CrmCustomerPool customerPool = crmCustomerPoolService.getById(poolId);
        return new Content(customerPool.getPoolName(),"Deleted high seas "+customerPool.getPoolName(), BehaviorEnum.UPDATE);
    }
}
