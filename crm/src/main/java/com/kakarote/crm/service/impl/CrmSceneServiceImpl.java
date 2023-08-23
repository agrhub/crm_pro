package com.kakarote.crm.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.date.DateUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.kakarote.core.common.Const;
import com.kakarote.core.common.SystemCodeEnum;
import com.kakarote.core.exception.CrmException;
import com.kakarote.core.servlet.ApplicationContextHolder;
import com.kakarote.core.servlet.BaseServiceImpl;
import com.kakarote.core.utils.UserUtil;
import com.kakarote.crm.constant.CrmEnum;
import com.kakarote.crm.constant.CrmSceneEnum;
import com.kakarote.crm.constant.FieldEnum;
import com.kakarote.crm.entity.BO.CrmSceneConfigBO;
import com.kakarote.crm.entity.PO.*;
import com.kakarote.crm.entity.VO.CrmModelFiledVO;
import com.kakarote.crm.mapper.CrmSceneMapper;
import com.kakarote.crm.service.ICrmBusinessTypeService;
import com.kakarote.crm.service.ICrmFieldService;
import com.kakarote.crm.service.ICrmSceneDefaultService;
import com.kakarote.crm.service.ICrmSceneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 场景 服务实现类
 * </p>
 *
 * @author zhangzhiwei
 * @since 2020-06-06
 */
@Service
public class CrmSceneServiceImpl extends BaseServiceImpl<CrmSceneMapper, CrmScene> implements ICrmSceneService {

    @Autowired
    private ICrmSceneDefaultService crmSceneDefaultService;

    @Autowired
    private ICrmFieldService crmFieldService;

    /**
     * 查询场景
     *
     * @param crmEnum 类型
     * @return data
     */
    @Override
    public List<CrmScene> queryScene(CrmEnum crmEnum) {
        Long userId = UserUtil.getUserId();
        List<CrmScene> sceneList = new ArrayList<>();
        //查询userId下是否有系统场景，没有则插入
        Integer number = lambdaQuery().eq(CrmScene::getIsSystem, 1).eq(CrmScene::getType, crmEnum.getType()).eq(CrmScene::getUserId, UserUtil.getUserId()).count();
        if (number.equals(0)) {
            if (CrmEnum.LEADS == crmEnum) {
                sceneList.add(new CrmScene(crmEnum.getType(), "All leads", userId, 0, "", 0, 1, CrmSceneEnum.ALL.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "I am responsible", userId, 0, "", 0, 1, CrmSceneEnum.SELF.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "Subordinates are responsible", userId, 0, "", 0, 1, CrmSceneEnum.CHILD.getName()));
                JSONArray array = new JSONArray();
                array.add(new JSONObject().fluentPut("name", "isTransform").fluentPut("type", 1).fluentPut("values", Collections.singletonList("1")));
                sceneList.add(new CrmScene(crmEnum.getType(), "Converted leads", userId, 0, array.toJSONString(), 0, 1, "transform"));
                sceneList.add(new CrmScene(crmEnum.getType(), "I follow", userId, 0, array.toJSONString(), 0, 1, CrmSceneEnum.STAR.getName()));
            } else if (CrmEnum.CUSTOMER == crmEnum) {
                sceneList.add(new CrmScene(crmEnum.getType(), "All customers", userId, 0, "", 0, 1, CrmSceneEnum.ALL.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "I am responsible", userId, 0, "", 0, 1, CrmSceneEnum.SELF.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "Subordinates are responsible", userId, 0, "", 0, 1, CrmSceneEnum.CHILD.getName()));
                JSONArray array = new JSONArray();
                array.add(new JSONObject().fluentPut("name", "roUserId").fluentPut("type", 3).fluentPut("values", Collections.singletonList(userId)));
                sceneList.add(new CrmScene(crmEnum.getType(), "My customers", userId, 0, array.toJSONString(), 0, 1, ""));
                sceneList.add(new CrmScene(crmEnum.getType(), "I follow", userId, 0, "", 0, 1, CrmSceneEnum.STAR.getName()));
            } else if (CrmEnum.CONTACTS == crmEnum) {
                sceneList.add(new CrmScene(crmEnum.getType(), "All contacts", userId, 0, "", 0, 1, CrmSceneEnum.ALL.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "My contact", userId, 0, "", 0, 1, CrmSceneEnum.SELF.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "Subordinates contacts", userId, 0, "", 0, 1, CrmSceneEnum.CHILD.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "My following contacts", userId, 0, "", 0, 1, CrmSceneEnum.STAR.getName()));
            } else if (CrmEnum.PRODUCT == crmEnum) {
                sceneList.add(new CrmScene(crmEnum.getType(), "All products", userId, 0, "", 0, 1, CrmSceneEnum.ALL.getName()));
                JSONArray array = new JSONArray();
                array.add(new JSONObject().fluentPut("name", "status").fluentPut("type", 1).fluentPut("values", Collections.singletonList(1)));
                sceneList.add(new CrmScene(crmEnum.getType(), "On shelve", userId, 0, array.toJSONString(), 0, 1, ""));
                array.clear();
                array.add(new JSONObject().fluentPut("name", "status").fluentPut("type", 1).fluentPut("values", Collections.singletonList(0)));
                sceneList.add(new CrmScene(crmEnum.getType(), "Off shelve", userId, 0, array.toJSONString(), 0, 1, ""));
            } else if (CrmEnum.BUSINESS == crmEnum) {
                sceneList.add(new CrmScene(crmEnum.getType(), "All business", userId, 0, "", 0, 1, CrmSceneEnum.ALL.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "I am responsible", userId, 0, "", 0, 1, CrmSceneEnum.SELF.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "Subordinates are responsible", userId, 0, "", 0, 1, CrmSceneEnum.CHILD.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "I follow", userId, 0, "", 0, 1, CrmSceneEnum.STAR.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "I am involved in", userId, 0, new JSONArray().fluentAdd(new JSONObject().fluentPut("name", "roUserId").fluentPut("type", 3).fluentPut("values", Collections.singletonList(userId))).toJSONString(), 0, 1, ""));
                sceneList.add(new CrmScene(crmEnum.getType(), "Winning business", userId, 0, new JSONArray().fluentAdd(new JSONObject().fluentPut("name", "isEnd").fluentPut("type", 1).fluentPut("values", Collections.singletonList(1))).toJSONString(), 0, 1, ""));
                sceneList.add(new CrmScene(crmEnum.getType(), "Loss business", userId, 0, new JSONArray().fluentAdd(new JSONObject().fluentPut("name", "isEnd").fluentPut("type", 1).fluentPut("values", Collections.singletonList(2))).toJSONString(), 0, 1, ""));
                sceneList.add(new CrmScene(crmEnum.getType(), "Invalid business", userId, 0, new JSONArray().fluentAdd(new JSONObject().fluentPut("name", "isEnd").fluentPut("type", 1).fluentPut("values", Collections.singletonList(3))).toJSONString(), 0, 1, ""));
            } else if (CrmEnum.CONTRACT == crmEnum) {
                sceneList.add(new CrmScene(crmEnum.getType(), "All contracts", userId, 0, "", 0, 1, CrmSceneEnum.ALL.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "I am responsible", userId, 0, "", 0, 1, CrmSceneEnum.SELF.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "Subordinates are responsible", userId, 0, "", 0, 1, CrmSceneEnum.CHILD.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "My contract", userId, 0, new JSONArray().fluentAdd(new JSONObject().fluentPut("name", "roUserId").fluentPut("type", 3).fluentPut("values", Collections.singletonList(userId))).toJSONString(), 0, 1, ""));
            } else if (CrmEnum.RECEIVABLES == crmEnum) {
                sceneList.add(new CrmScene(crmEnum.getType(), "Full payment", userId, 0, "", 0, 1, CrmSceneEnum.ALL.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "I am responsible", userId, 0, "", 0, 1, CrmSceneEnum.SELF.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "Subordinates are responsible", userId, 0, "", 0, 1, CrmSceneEnum.CHILD.getName()));
            } else if (CrmEnum.RETURN_VISIT == crmEnum) {
                sceneList.add(new CrmScene(crmEnum.getType(), "All return visits", userId, 0, "", 0, 1, CrmSceneEnum.ALL.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "I am responsible", userId, 0, "", 0, 1, CrmSceneEnum.SELF.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "Subordinates are responsible", userId, 0, "", 0, 1, CrmSceneEnum.CHILD.getName()));
            } else if (CrmEnum.INVOICE == crmEnum) {
                sceneList.add(new CrmScene(crmEnum.getType(), "All invoices", userId, 0, "", 0, 1, CrmSceneEnum.ALL.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "I am responsible", userId, 0, "", 0, 1, CrmSceneEnum.SELF.getName()));
                sceneList.add(new CrmScene(crmEnum.getType(), "Subordinates are responsible", userId, 0, "", 0, 1, CrmSceneEnum.CHILD.getName()));
            }
            saveBatch(sceneList, Const.BATCH_SAVE_SIZE);
        }else {
            sceneList.addAll(lambdaQuery().eq(CrmScene::getType, crmEnum.getType()).eq(CrmScene::getUserId, UserUtil.getUserId()).eq(CrmScene::getIsHide,0).list());
        }
        List<CrmSceneDefault> defaults = crmSceneDefaultService.lambdaQuery().eq(CrmSceneDefault::getType, crmEnum.getType()).eq(CrmSceneDefault::getUserId, userId).list();
        for (CrmSceneDefault sceneDefault : defaults) {
            Integer sceneId = sceneDefault.getSceneId();
            for (CrmScene crmScene : sceneList) {
                if (Objects.equals(sceneId, crmScene.getSceneId())) {
                    crmScene.setIsDefault(1);
                }
            }
        }
        return sceneList;
    }
    @Override
    public List<CrmModelFiledVO> queryField(Integer label) {
        LambdaQueryWrapper<CrmField> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(CrmField::getLabel, label);
        wrapper.eq(CrmField::getFieldType, 1);
        wrapper.eq(CrmField::getIsHidden, 0);
        wrapper.select(CrmField::getOptions, CrmField::getType, CrmField::getName, CrmField::getFieldName);
        List<CrmModelFiledVO> fieldList = crmFieldService.list(wrapper).stream()
                .map(field -> {
                    CrmModelFiledVO filedVO = BeanUtil.copyProperties(field, CrmModelFiledVO.class);
                    if (ListUtil.toList(14,15,16,17,20).contains(filedVO.getType())){
                        filedVO.setType(1);
                    }
                    crmFieldService.recordToFormType(filedVO, FieldEnum.parse(filedVO.getType()));
                    return filedVO;
                }).collect(Collectors.toList());
        if (CrmEnum.LEADS.getType().equals(label)) {
            fieldList.add(new CrmModelFiledVO("last_time", FieldEnum.DATETIME, "last time", 1));
            fieldList.add(new CrmModelFiledVO("owner_user_id", FieldEnum.USER, "owner userid", 1));
            fieldList.add(new CrmModelFiledVO("create_user_id", FieldEnum.USER, "create userid", 1));
            fieldList.add(new CrmModelFiledVO("update_time", FieldEnum.DATETIME, "update time", 1));
            fieldList.add(new CrmModelFiledVO("create_time", FieldEnum.DATETIME, "create time", 1));
        } else if (CrmEnum.CUSTOMER.getType().equals(label)) {
            List<Object> dealStatusList = new ArrayList<>();
            dealStatusList.add(new JSONObject().fluentPut("name", "unsold").fluentPut("value", 0));
            dealStatusList.add(new JSONObject().fluentPut("name", "sold").fluentPut("value", 1));
            fieldList.add(new CrmModelFiledVO("deal_status", FieldEnum.BUSINESS, "deal status", 1).setSetting(dealStatusList).setFormType("dealStatus").setType(null));
            fieldList.add(new CrmModelFiledVO("last_time", FieldEnum.DATETIME, "last time", 1));
            fieldList.add(new CrmModelFiledVO("owner_user_id", FieldEnum.USER, "owner userid", 1));
            fieldList.add(new CrmModelFiledVO("create_user_id", FieldEnum.USER, "create userid", 1));
            fieldList.add(new CrmModelFiledVO("update_time", FieldEnum.DATETIME, "update time", 1));
            fieldList.add(new CrmModelFiledVO("create_time", FieldEnum.DATETIME, "create time", 1));
            fieldList.add(new CrmModelFiledVO("detail_address", FieldEnum.TEXT, "detail address", 1));
            fieldList.add(new CrmModelFiledVO("address", FieldEnum.MAP_ADDRESS, "address", 1));
        } else if (CrmEnum.CONTACTS.getType().equals(label)) {

            fieldList.add(new CrmModelFiledVO("last_time", FieldEnum.DATETIME, "last time", 1));
            fieldList.add(new CrmModelFiledVO("owner_user_id", FieldEnum.USER, "owner userid", 1));
            fieldList.add(new CrmModelFiledVO("create_user_id", FieldEnum.USER, "create userid", 1));
            fieldList.add(new CrmModelFiledVO("update_time", FieldEnum.DATETIME, "update time", 1));
            fieldList.add(new CrmModelFiledVO("create_time", FieldEnum.DATETIME, "create time", 1));
        } else if (CrmEnum.PRODUCT.getType().equals(label)) {
            fieldList.add(new CrmModelFiledVO("owner_user_id", FieldEnum.USER, "owner userid", 1));
            fieldList.add(new CrmModelFiledVO("create_user_id", FieldEnum.USER, "create userid", 1));
            fieldList.add(new CrmModelFiledVO("update_time", FieldEnum.DATETIME, "update time", 1));
            fieldList.add(new CrmModelFiledVO("create_time", FieldEnum.DATETIME, "create time", 1));
            List<Object> statusList = new ArrayList<>();
            statusList.add(new JSONObject().fluentPut("name", "on").fluentPut("value", 1));
            statusList.add(new JSONObject().fluentPut("name", "off").fluentPut("value", 0));
            fieldList.add(new CrmModelFiledVO("status", FieldEnum.SELECT, "productStatus", 1).setSetting(statusList));
        } else if (CrmEnum.BUSINESS.getType().equals(label)) {
            List<CrmBusinessType> crmBusinessTypes = ApplicationContextHolder.getBean(ICrmBusinessTypeService.class).queryBusinessStatusOptions();
            crmBusinessTypes.forEach(record -> {
                record.getStatusList().add(new CrmBusinessStatus().setName("win").setTypeId(record.getTypeId()).setStatusId(-1));
                record.getStatusList().add(new CrmBusinessStatus().setName("lose").setTypeId(record.getTypeId()).setStatusId(-2));
                record.getStatusList().add(new CrmBusinessStatus().setName("invalid").setTypeId(record.getTypeId()).setStatusId(-3));
            });
            fieldList.add(new CrmModelFiledVO("type_id", FieldEnum.BUSINESS, "type id", 1).setFormType("business_type").setSetting(new ArrayList<>(crmBusinessTypes)));
            fieldList.add(new CrmModelFiledVO("last_time", FieldEnum.DATETIME, "last time", 1));
            fieldList.add(new CrmModelFiledVO("owner_user_id", FieldEnum.USER, "owner userid", 1));
            fieldList.add(new CrmModelFiledVO("create_user_id", FieldEnum.USER, "create userid", 1));
            fieldList.add(new CrmModelFiledVO("update_time", FieldEnum.DATETIME, "update time", 1));
            fieldList.add(new CrmModelFiledVO("create_time", FieldEnum.DATETIME, "create time", 1));
        } else if (CrmEnum.CONTRACT.getType().equals(label)) {
            List<Object> checkList = new ArrayList<>();
            checkList.add(new JSONObject().fluentPut("name", "pending").fluentPut("value", 0));
            checkList.add(new JSONObject().fluentPut("name", "pass").fluentPut("value", 1));
            checkList.add(new JSONObject().fluentPut("name", "reject").fluentPut("value", 2));
            checkList.add(new JSONObject().fluentPut("name", "under review").fluentPut("value", 3));
            checkList.add(new JSONObject().fluentPut("name", "withdraw").fluentPut("value", 4));
            checkList.add(new JSONObject().fluentPut("name", "unsubmitted").fluentPut("value", 5));
            checkList.add(new JSONObject().fluentPut("name", "deleted").fluentPut("value", 8));
            fieldList.add(new CrmModelFiledVO("check_status", FieldEnum.CHECKBOX, "check status", 1).setFormType("checkStatus").setType(null).setSetting(checkList));
            fieldList.add(new CrmModelFiledVO("last_time", FieldEnum.DATETIME, "last time", 1));
            fieldList.add(new CrmModelFiledVO("owner_user_id", FieldEnum.USER, "owner userid", 1));
            fieldList.add(new CrmModelFiledVO("create_user_id", FieldEnum.USER, "create userid", 1));
            fieldList.add(new CrmModelFiledVO("update_time", FieldEnum.DATETIME, "update time", 1));
            fieldList.add(new CrmModelFiledVO("create_time", FieldEnum.DATETIME, "create time", 1));
        } else if (CrmEnum.RECEIVABLES.getType().equals(label)) {
            List<Object> checkList = new ArrayList<>();
            checkList.add(new JSONObject().fluentPut("name", "pending").fluentPut("value", 0));
            checkList.add(new JSONObject().fluentPut("name", "pass").fluentPut("value", 1));
            checkList.add(new JSONObject().fluentPut("name", "reject").fluentPut("value", 2));
            checkList.add(new JSONObject().fluentPut("name", "under review").fluentPut("value", 3));
            checkList.add(new JSONObject().fluentPut("name", "unsubmitted").fluentPut("value", 5));
            fieldList.add(new CrmModelFiledVO("check_status", FieldEnum.CHECKBOX, "check status", 1).setFormType("checkStatus").setType(null).setSetting(checkList));
            fieldList.add(new CrmModelFiledVO("owner_user_id", FieldEnum.USER, "owner userid", 1));
            fieldList.add(new CrmModelFiledVO("create_user_id", FieldEnum.USER, "create userid", 1));
            fieldList.add(new CrmModelFiledVO("update_time", FieldEnum.DATETIME, "update time", 1));
            fieldList.add(new CrmModelFiledVO("create_time", FieldEnum.DATETIME, "create time", 1));
        } else if (CrmEnum.RETURN_VISIT.getType().equals(label)) {
            fieldList.add(new CrmModelFiledVO("create_user_id", FieldEnum.USER, "create userid", 1));
            fieldList.add(new CrmModelFiledVO("update_time", FieldEnum.DATETIME, "update time", 1));
            fieldList.add(new CrmModelFiledVO("create_time", FieldEnum.DATETIME, "create time", 1));
        } else {
            throw new CrmException(SystemCodeEnum.SYSTEM_NO_VALID);
        }
        LambdaQueryWrapper<CrmField> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(CrmField::getLabel, label);
        queryWrapper.ne(CrmField::getFieldType, 1);
        queryWrapper.eq(CrmField::getIsHidden, 0);
        queryWrapper.select(CrmField::getFieldName, CrmField::getName, CrmField::getType, CrmField::getOptions);
        List<CrmModelFiledVO> records = crmFieldService.list(queryWrapper).stream()
                .map(field -> {
                    CrmModelFiledVO filedVO = BeanUtil.copyProperties(field, CrmModelFiledVO.class);
                    crmFieldService.recordToFormType(filedVO, FieldEnum.parse(filedVO.getType()));
                    return filedVO;
                }).collect(Collectors.toList());
        records.removeIf(record -> record.getFormType().equals("file"));
        fieldList.addAll(records);
        return fieldList;
    }

    /**
     * 新增场景
     *
     * @param crmScene data
     */
    @Override
    public void addScene(CrmScene crmScene) {
        Long userId = UserUtil.getUserId();
        try {
            JSON.parse(crmScene.getData());
        } catch (Exception e) {
            return;
        }
        crmScene.setIsHide(0).setSort(99999).setIsSystem(0).setCreateTime(DateUtil.date()).setUserId(userId);
        save(crmScene);
        if (Objects.equals(1, crmScene.getIsDefault())) {
            crmSceneDefaultService.lambdaUpdate().eq(CrmSceneDefault::getType,crmScene.getType()).eq(CrmSceneDefault::getUserId,userId).remove();
            CrmSceneDefault adminSceneDefault = new CrmSceneDefault();
            adminSceneDefault.setSceneId(crmScene.getSceneId()).setType(crmScene.getType()).setUserId(userId);
            crmSceneDefaultService.save(adminSceneDefault);
        }
    }

    /**
     * 修改场景
     *
     * @param crmScene data
     */
    @Override
    public void updateScene(CrmScene crmScene) {
        Long userId = UserUtil.getUserId();
        CrmScene oldAdminScene = getById(crmScene.getSceneId());
        if (oldAdminScene == null) {
            return;
        }
        try {
            JSON.parse(crmScene.getData());
        } catch (Exception e) {
            return;
        }
        if (Objects.equals(1, crmScene.getIsDefault())) {
            LambdaUpdateWrapper<CrmSceneDefault> wrapper = new LambdaUpdateWrapper<>();
            wrapper.set(CrmSceneDefault::getSceneId, crmScene.getSceneId());
            wrapper.eq(CrmSceneDefault::getUserId, userId);
            wrapper.eq(CrmSceneDefault::getType, oldAdminScene.getType());
            crmSceneDefaultService.update(wrapper);
        }
        crmScene.setUserId(userId).setType(oldAdminScene.getType()).setSort(oldAdminScene.getSort()).setIsSystem(oldAdminScene.getIsSystem()).setUpdateTime(DateUtil.date());
        updateById(crmScene);
    }

    /**
     * 保存默认场景
     *
     * @param sceneId
     */
    @Override
    public void setDefaultScene(Integer sceneId) {
        Long userId = UserUtil.getUserId();
        CrmScene oldAdminScene = getById(sceneId);
        if (oldAdminScene != null) {
            crmSceneDefaultService.removeByMap(new JSONObject().fluentPut("user_id", userId).fluentPut("type", oldAdminScene.getType()));
            CrmSceneDefault adminSceneDefault = new CrmSceneDefault();
            adminSceneDefault.setSceneId(sceneId).setType(oldAdminScene.getType()).setUserId(userId);
            crmSceneDefaultService.save(adminSceneDefault);
        }
    }

    /**
     * 删除场景
     *
     * @param sceneId sceneId
     */
    @Override
    public void deleteScene(Integer sceneId) {
        CrmScene crmScene = getById(sceneId);
        if (crmScene != null && !Objects.equals(1, crmScene.getIsSystem())) {
            removeById(sceneId);
        }
    }

    /**
     * 查询场景设置
     *
     * @param type type
     * @return data
     */
    @Override
    public JSONObject querySceneConfig(Integer type) {
        Long userId = UserUtil.getUserId();
        List<CrmScene> crmSceneList = lambdaQuery().eq(CrmScene::getUserId, userId).eq(CrmScene::getType, type).list();
        Map<Integer, List<CrmScene>> collect = crmSceneList.stream().collect(Collectors.groupingBy(CrmScene::getIsHide));
        List<CrmSceneDefault> defaults = crmSceneDefaultService.lambdaQuery().eq(CrmSceneDefault::getType, type).eq(CrmSceneDefault::getUserId, userId).list();

        if (!collect.containsKey(1)) {
            collect.put(1, new ArrayList<>());
        }
        if (!collect.containsKey(0)) {
            collect.put(0, new ArrayList<>());
        }
        for (CrmSceneDefault sceneDefault : defaults) {
            Integer sceneId = sceneDefault.getSceneId();
            for (CrmScene crmScene : collect.get(0)) {
                if (Objects.equals(sceneId, crmScene.getSceneId())) {
                    crmScene.setIsDefault(1);
                }
            }
        }
        return new JSONObject().fluentPut("value", collect.get(0)).fluentPut("hide_value", collect.get(1));
    }

    /**
     * 设置场景
     */
    @Override
    public void sceneConfig(CrmSceneConfigBO config) {
        Long userId = UserUtil.getUserId();
        List<CrmScene> crmSceneList = lambdaQuery().eq(CrmScene::getUserId, userId).eq(CrmScene::getType, config.getType()).list();
        Map<Integer, CrmScene> crmSceneMap = new HashMap<>(crmSceneList.size());
        for (CrmScene crmScene : crmSceneList) {
            crmSceneMap.put(crmScene.getSceneId(), crmScene);
        }
        for (int i = 0; i < config.getNoHideIds().size(); i++) {
            Integer id = config.getNoHideIds().get(i);
            if (crmSceneMap.containsKey(id)) {
                crmSceneMap.get(id).setSort(i).setIsHide(0);
            }
        }
        for (int i = 0; i < config.getHideIds().size(); i++) {
            Integer id = config.getHideIds().get(i);
            if (crmSceneMap.containsKey(id)) {
                CrmScene scene = crmSceneMap.get(id);
                scene.setSort(0);
                if (scene.getIsSystem() == 1) {
                    scene.setIsHide(0);
                } else {
                    scene.setIsHide(1);
                }

            }
        }
        updateBatchById(crmSceneMap.values());
    }


}
