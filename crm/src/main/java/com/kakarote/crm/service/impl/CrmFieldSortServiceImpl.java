package com.kakarote.crm.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.kakarote.core.common.Const;
import com.kakarote.core.entity.UserInfo;
import com.kakarote.core.servlet.BaseServiceImpl;
import com.kakarote.core.utils.UserUtil;
import com.kakarote.crm.constant.CrmEnum;
import com.kakarote.crm.constant.FieldEnum;
import com.kakarote.crm.entity.PO.CrmField;
import com.kakarote.crm.entity.PO.CrmFieldSort;
import com.kakarote.crm.entity.VO.CrmFieldSortVO;
import com.kakarote.crm.mapper.CrmFieldSortMapper;
import com.kakarote.crm.service.ICrmFieldService;
import com.kakarote.crm.service.ICrmFieldSortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 字段排序表 服务实现类
 * </p>
 *
 * @author zhangzhiwei
 * @since 2020-05-19
 */
@Service
public class CrmFieldSortServiceImpl extends BaseServiceImpl<CrmFieldSortMapper, CrmFieldSort> implements ICrmFieldSortService {

    @Autowired
    private ICrmFieldService crmFieldService;

    /**
     * 查询模块字段列表
     *
     * @param label label
     * @return data
     */
    @Override
    public List<CrmFieldSortVO> queryListHead(Integer label) {
        Long userId = UserUtil.getUserId();
        QueryWrapper<CrmFieldSort> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id", userId).eq("label", label);
        int number = count(wrapper);
        if (number == 0) {
            saveUserFieldSort(label, userId);
        }
        return getBaseMapper().queryListHead(label, userId);
    }

    /**
     * 保存用户排序
     *
     * @param label  label
     * @param userId 用户ID
     */
    private void saveUserFieldSort(Integer label, Long userId) {
        UserInfo user = UserUtil.getUser();
        List<CrmField> crmFieldList = crmFieldService.list(label, false);
        CrmEnum crmEnum = CrmEnum.parse(label);
        switch (crmEnum) {
            case CUSTOMER:
                crmFieldList.add(new CrmField("status", "status", FieldEnum.NUMBER));
                crmFieldList.add(new CrmField("dealStatus", "dealStatus", FieldEnum.SELECT));
                crmFieldList.add(new CrmField("lastTime", "lastTime", FieldEnum.DATETIME));
                crmFieldList.add(new CrmField("lastContent", "lastContent", FieldEnum.TEXTAREA));
                crmFieldList.add(new CrmField("detailAddress", "detailAddress", FieldEnum.TEXT));
                crmFieldList.add(new CrmField("address", "address", FieldEnum.MAP_ADDRESS));
                crmFieldList.add(new CrmField("poolDay", "poolDay", FieldEnum.NUMBER));
                crmFieldList.add(new CrmField("ownerUserName", "ownerUserName", FieldEnum.TEXT));
                break;
            case BUSINESS:
                crmFieldList.add(new CrmField("typeName", "typeName", FieldEnum.SELECT));
                crmFieldList.add(new CrmField("statusName", "statusName", FieldEnum.SELECT));
                crmFieldList.add(new CrmField("lastTime", "lastTime", FieldEnum.DATETIME));
                crmFieldList.add(new CrmField("ownerUserName", "ownerUserName", FieldEnum.TEXT));
                break;
            case CONTRACT:
                crmFieldList.add(new CrmField("checkStatus", "checkStatus", FieldEnum.NUMBER));
                crmFieldList.add(new CrmField("receivedMoney", "receivedMoney", FieldEnum.FLOATNUMBER));
                crmFieldList.add(new CrmField("unreceivedMoney", "unreceivedMoney", FieldEnum.FLOATNUMBER));
                crmFieldList.add(new CrmField("lastTime", "lastTime", FieldEnum.DATETIME));
                crmFieldList.add(new CrmField("ownerUserName", "ownerUserName", FieldEnum.TEXT));
                break;
            case RECEIVABLES:
                crmFieldList.add(new CrmField("checkStatus", "checkStatus", FieldEnum.NUMBER));
                crmFieldList.add(new CrmField("contractMoney", "contractMoney", FieldEnum.FLOATNUMBER));
                crmFieldList.add(new CrmField("ownerUserName", "ownerUserName", FieldEnum.TEXT));
                break;
            case LEADS:
                crmFieldList.add(new CrmField("lastTime", "lastTime", FieldEnum.DATE));
                crmFieldList.add(new CrmField("lastContent", "lastContent", FieldEnum.TEXTAREA));
                crmFieldList.add(new CrmField("ownerUserName", "ownerUserName", FieldEnum.TEXT));
                break;
            case PRODUCT:
                crmFieldList.add(new CrmField("status", "status", FieldEnum.NUMBER));
                crmFieldList.add(new CrmField("ownerUserName", "ownerUserName", FieldEnum.TEXT));
                break;
            case CONTACTS:
                crmFieldList.add(new CrmField("lastTime", "lastTime", FieldEnum.DATETIME));
                crmFieldList.add(new CrmField("ownerUserName", "ownerUserName", FieldEnum.TEXT));
                break;
            case CUSTOMER_POOL:
                crmFieldList.add(new CrmField("lastContent", "lastContent", FieldEnum.TEXTAREA));
                crmFieldList.add(new CrmField("ownerUserName", "ownerUserName", FieldEnum.TEXT));
                break;
            case RETURN_VISIT:
            default:
                break;
        }
        crmFieldList.add(new CrmField("updateTime", "updateTime", FieldEnum.DATETIME));
        crmFieldList.add(new CrmField("createTime", "createTime", FieldEnum.DATETIME));
        crmFieldList.add(new CrmField("createUserName", "createUserName", FieldEnum.TEXT));

        List<CrmFieldSort> fieldSortList = new ArrayList<>();
        for (int i = 0; i < crmFieldList.size(); i++) {
            CrmFieldSort fieldSort = new CrmFieldSort();
            fieldSort.setFieldId(crmFieldList.get(i).getFieldId());
            fieldSort.setFieldName(parseFieldName(crmFieldList.get(i).getFieldName()));
            fieldSort.setName(crmFieldList.get(i).getName());
            fieldSort.setSort(i);
            fieldSort.setUserId(userId);
            fieldSort.setStyle(100);
            fieldSort.setIsHide(0);
            fieldSort.setLabel(label);
            fieldSort.setType(crmFieldList.get(i).getType());
            fieldSortList.add(fieldSort);
        }
        saveBatch(fieldSortList, Const.BATCH_SAVE_SIZE);
    }

    private String parseFieldName(String fieldName) {
        if ("contract_id".equals(fieldName) || "plan_id".equals(fieldName)) {
            fieldName = fieldName.substring(0, fieldName.lastIndexOf("_id")).concat("_num");
        }
        if (fieldName.endsWith("_id")) {
            fieldName = fieldName.substring(0, fieldName.lastIndexOf("_id")).concat("_name");
        }
        return StrUtil.toCamelCase(fieldName);
    }
}
