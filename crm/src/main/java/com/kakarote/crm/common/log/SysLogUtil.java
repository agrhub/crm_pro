package com.kakarote.crm.common.log;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.kakarote.core.common.log.BehaviorEnum;
import com.kakarote.core.common.log.Content;
import com.kakarote.core.entity.UserInfo;
import com.kakarote.core.feign.admin.entity.SimpleUser;
import com.kakarote.core.feign.admin.service.AdminService;
import com.kakarote.core.servlet.ApplicationContextHolder;
import com.kakarote.core.utils.BaseUtil;
import com.kakarote.core.utils.TagUtil;
import com.kakarote.core.utils.UserCacheUtil;
import com.kakarote.core.utils.UserUtil;
import com.kakarote.crm.constant.CrmEnum;
import com.kakarote.crm.entity.PO.CrmActionRecord;
import com.kakarote.crm.entity.PO.CrmCustomer;
import com.kakarote.crm.entity.VO.CrmModelFiledVO;
import com.kakarote.crm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.Collectors;

@Component
public class SysLogUtil {

    private static final ExecutorService THREAD_POOL = new ThreadPoolExecutor(1, 20, 5L, TimeUnit.SECONDS, new LinkedBlockingDeque<>(2048), new ThreadPoolExecutor.AbortPolicy());

    @Autowired
    private AdminService adminService;


    public static class ActionRecordTask implements Runnable {
        private static final Integer BATCH_NUMBER = 1;
        private static volatile List<CrmActionRecord> SQL_LIST = new CopyOnWriteArrayList<>();
        private UserInfo userInfo;

        public ActionRecordTask(CrmActionRecord actionRecord) {
            if (actionRecord != null) {
                SQL_LIST.add(actionRecord);
            }
            userInfo = UserUtil.getUser();
        }

        @Override
        public void run() {
            if (SQL_LIST.size() >= BATCH_NUMBER) {
                List<CrmActionRecord> list = new ArrayList<>(SQL_LIST);
                //底层已经做过size为0的判断，此处不再限制
                try {
                    UserUtil.setUser(userInfo);
                    ApplicationContextHolder.getBean(ICrmActionRecordService.class).saveBatch(list, BATCH_NUMBER);
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    UserUtil.removeUser();
                    SQL_LIST.clear();
                }
            }
        }
    }

    /**
     * 属性kv
     */
    private static Map<Integer, Dict> propertiesMap = new HashMap<>();

    static {
        propertiesMap.put(CrmEnum.LEADS.getType(), Dict.create().set("leadsName", "leadsName").set("address", "address").set("mobile", "mobile").set("nextTime", "nextTime").set("remark", "remark").set("email", "email").set("telephone", "telephone"));
        propertiesMap.put(CrmEnum.CUSTOMER.getType(), Dict.create().set("customerName", "customerName").set("address", "address").set("location", "location").set("mobile", "mobile").set("nextTime", "nextTime").set("remark", "remark").set("telephone", "telephone").set("website", "website"));
        propertiesMap.put(CrmEnum.CONTACTS.getType(), Dict.create().set("name", "name").set("customerId", "customerId").set("mobile", "mobile").set("nextTime", "nextTime").set("remark", "remark").set("telephone", "telephone").set("email", "email").set("post", "post").set("address", "address"));
        propertiesMap.put(CrmEnum.BUSINESS.getType(), Dict.create().set("businessName", "businessName").set("customerId", "customerId").set("money", "money").set("dealDate", "dealDate").set("remark", "remark").set("typeId", "typeId").set("statusId", "statusId").set("totalPrice", "totalPrice").set("discountRate", "discountRate（%）"));
        propertiesMap.put(CrmEnum.CONTRACT.getType(), Dict.create().set("num", "num").set("name", "name").set("customerId", "customerId").set("contactsId", "contactsId").set("businessId", "businessId").set("orderDate", "orderDate").set("money", "money").set("startTime", "startTime").set("endTime", "endTime").set("companyUserId", "companyUserId").set("remark", "remark").set("totalPrice", "totalPrice").set("discountRate", "discountRate（%）"));
        propertiesMap.put(CrmEnum.RECEIVABLES.getType(), Dict.create().set("number", "number").set("customerId", "customerId").set("contractId", "contractId").set("returnTime", "returnTime").set("money", "money").set("planId", "planId").set("remark", "remark"));
        propertiesMap.put(CrmEnum.PRODUCT.getType(), Dict.create().set("name", "name").set("categoryId", "categoryId").set("num", "num").set("price", "price").set("description", "description"));
        propertiesMap.put(CrmEnum.MARKETING.getType(), Dict.create().set("marketingName", "marketingName").set("crmType", "crmType").set("relationUserId", "relationUserId").set("marketingType", "marketingType").set("startTime", "startTime").set("endTime", "endTime").set("browse", "browse").set("submitNum", "submitNum").set("marketingMoney", "marketingMoney").set("address", "address").set("synopsis", "synopsis"));
        propertiesMap.put(CrmEnum.RETURN_VISIT.getType(), Dict.create().set("visitNumber", "visitNumber").set("visitTime", "visitTime").set("ownerUserId", "ownerUserId").set("customerId", "customerId").set("contractId", "contractId").set("contactsId", "contactsId"));
        propertiesMap.put(CrmEnum.INVOICE.getType(), Dict.create().set("invoiceApplyNumber", "invoiceApplyNumber").set("customerId", "customerId").set("contractId", "contractId").set("invoiceMoney", "invoiceMoney").set("invoiceDate", "invoiceDate").set("invoiceType", "invoiceType").set("remark", "remark").set("titleType", "titleType").set("invoiceTitle", "invoiceTitle").set("taxNumber", "taxNumber").set("depositBank", "depositBank").set("depositAccount", "depositAccount").set("depositAddress", "depositAddress").set("contactsName", "contactsName").set("contactsTelephone", "contactsTelephone").set("contactsAddress", "contactsAddress"));
    }


    private List<String> textList = new ArrayList<>();

    /**
     * 更新记录
     *
     * @param oldObj  之前对象
     * @param newObj  新对象
     * @param crmEnum 类型
     */
    @SuppressWarnings("unchecked")
    public Content updateRecord(Map<String, Object> oldObj, Map<String, Object> newObj, CrmEnum crmEnum, String name) {
        try {
            searchChange(textList, oldObj, newObj, crmEnum.getType());
            return new Content(name,StrUtil.join("", textList),BehaviorEnum.UPDATE);
        } finally {
            textList.clear();
        }

    }

    public Content addRecord(CrmEnum crmEnum, String name) {
        return new Content(name,"Add new " + crmEnum.getRemarks() + "：" + name,BehaviorEnum.SAVE);
    }

    public void updateRecord(List<CrmModelFiledVO> newFieldList, Dict kv) {
        textList.clear();
        if (newFieldList == null) {
            return;
        }
        List<CrmModelFiledVO> oldFieldList = ApplicationContextHolder.getBean(ICrmActionRecordService.class).queryFieldValue(kv);
        newFieldList.forEach(newField -> {
            for (CrmModelFiledVO oldField : oldFieldList) {
                String oldFieldValue;
                String newFieldValue;
                if (ObjectUtil.isEmpty(oldField.getValue()) && ObjectUtil.isEmpty(newField.getValue())) {
                    continue;
                }
                if (ObjectUtil.isEmpty(oldField.getValue())) {
                    oldFieldValue = "No";
                } else {
                    oldFieldValue = oldField.getValue().toString();
                }
                if (ObjectUtil.isEmpty(newField.getValue())) {
                    newFieldValue = "No";
                } else {
                    newFieldValue = newField.getValue().toString();
                }
                if (oldField.getName().equals(newField.getName()) && !oldFieldValue.equals(newFieldValue)) {
                    textList.add("will update " + oldField.getName() + " from " + oldFieldValue + " to " + newFieldValue + "。");
                }
            }
        });
    }

    private void searchChange(List<String> textList, Map<String, Object> oldObj, Map<String, Object> newObj, Integer crmTypes) {
        for (String oldKey : oldObj.keySet()) {
            for (String newKey : newObj.keySet()) {
                if (propertiesMap.get(crmTypes).containsKey(oldKey)) {
                    Object oldValue = oldObj.get(oldKey);
                    Object newValue = newObj.get(newKey);
                    if (oldValue instanceof Date) {
                        oldValue = DateUtil.formatDateTime((Date) oldValue);
                    }
                    if (newValue instanceof Date) {
                        newValue = DateUtil.formatDateTime((Date) newValue);
                    }
                    if (ObjectUtil.isEmpty(oldValue) || ("address".equals(oldKey) && ",,".equals(oldValue))) {
                        oldValue = "No";
                    }
                    if (ObjectUtil.isEmpty(newValue) || ("address".equals(newKey) && ",,".equals(newValue))) {
                        newValue = "No";
                    }
                    if (oldValue instanceof BigDecimal || newValue instanceof BigDecimal) {
                        oldValue = Convert.toBigDecimal(oldValue, new BigDecimal(0)).setScale(2, BigDecimal.ROUND_UP).toString();
                        newValue = Convert.toBigDecimal(newValue, new BigDecimal(0)).setScale(2, BigDecimal.ROUND_UP).toString();
                    }
                    if (newKey.equals(oldKey) && !oldValue.equals(newValue)) {
                        switch (oldKey) {
                            case "companyUserId":
                                if (!"No".equals(newValue)) {
                                    newValue = UserCacheUtil.getUserName(Long.valueOf(newValue.toString()));
                                }
                                if (!"No".equals(oldValue)) {
                                    oldValue = UserCacheUtil.getUserName(Long.valueOf(oldValue.toString()));
                                }
                                break;
                            case "customerId":
                                if (!"No".equals(newValue)) {
                                    newValue = ApplicationContextHolder.getBean(ICrmCustomerService.class).getCustomerName(Integer.valueOf(newValue.toString()));
                                }
                                if (!"No".equals(oldValue)) {
                                    oldValue = ApplicationContextHolder.getBean(ICrmCustomerService.class).getCustomerName(Integer.valueOf(oldValue.toString()));
                                }
                                break;
                            case "businessId":
                                if (!"No".equals(newValue)) {
                                    newValue = ApplicationContextHolder.getBean(ICrmBusinessService.class).getBusinessName(Integer.parseInt(newValue.toString()));
                                }
                                if (!"No".equals(oldValue)) {
                                    oldValue = ApplicationContextHolder.getBean(ICrmBusinessService.class).getBusinessName(Integer.parseInt(oldValue.toString()));
                                }
                                break;
                            case "contractId":
                                if (!"No".equals(newValue)) {
                                    newValue = ApplicationContextHolder.getBean(ICrmContractService.class).getContractName(Integer.parseInt(newValue.toString()));
                                }
                                if (!"No".equals(oldValue)) {
                                    oldValue = ApplicationContextHolder.getBean(ICrmContractService.class).getContractName(Integer.parseInt(oldValue.toString()));
                                }
                                break;
                            case "contactsId":
                                if (!"No".equals(newValue)) {
                                    newValue = ApplicationContextHolder.getBean(ICrmContactsService.class).getContactsName(Integer.parseInt(newValue.toString()));
                                }
                                if (!"No".equals(oldValue)) {
                                    oldValue = ApplicationContextHolder.getBean(ICrmContactsService.class).getContactsName(Integer.parseInt(oldValue.toString()));
                                }
                                break;
                            case "typeId":
                                if (!"No".equals(newValue)) {
                                    newValue = ApplicationContextHolder.getBean(ICrmBusinessTypeService.class).getBusinessTypeName(Integer.parseInt(newValue.toString()));
                                }
                                if (!"No".equals(oldValue)) {
                                    oldValue = ApplicationContextHolder.getBean(ICrmBusinessTypeService.class).getBusinessTypeName(Integer.parseInt(oldValue.toString()));
                                }
                                break;
                            case "statusId":
                                if (!"No".equals(newValue)) {
                                    newValue = ApplicationContextHolder.getBean(ICrmBusinessStatusService.class).getBusinessStatusName(Integer.parseInt(newValue.toString()));
                                }
                                if (!"No".equals(oldValue)) {
                                    oldValue = ApplicationContextHolder.getBean(ICrmBusinessStatusService.class).getBusinessStatusName(Integer.parseInt(oldValue.toString()));
                                }
                                break;
                            case "planId":
                                if (!"No".equals(newValue)) {
                                    newValue = ApplicationContextHolder.getBean(ICrmReceivablesPlanService.class).getReceivablesPlanNum(Integer.parseInt(newValue.toString()));
                                }
                                if (!"No".equals(oldValue)) {
                                    oldValue = ApplicationContextHolder.getBean(ICrmReceivablesPlanService.class).getReceivablesPlanNum(Integer.parseInt(oldValue.toString()));
                                }
                                break;
                            case "categoryId":
                                if (!"No".equals(newValue)) {
                                    newValue = ApplicationContextHolder.getBean(ICrmProductCategoryService.class).getProductCategoryName(Integer.parseInt(newValue.toString()));
                                }
                                if (!"No".equals(oldValue)) {
                                    oldValue = ApplicationContextHolder.getBean(ICrmProductCategoryService.class).getProductCategoryName(Integer.parseInt(oldValue.toString()));
                                }
                                break;
                            case "crmType":
                                if (!"No".equals(newValue)) {
                                    newValue = newValue.equals(1) ? "leads" : "customer";
                                }
                                if (!"No".equals(oldValue)) {
                                    oldValue = oldValue.equals(1) ? "leads" : "customer";
                                }
                                break;
                            case "relationUserId":
                                if (!"No".equals(newValue)) {
                                    List<SimpleUser> newList = ApplicationContextHolder.getBean(AdminService.class).queryUserByIds(TagUtil.toLongSet((String) newValue)).getData();
                                    newValue = newList.stream().map(SimpleUser::getRealname).collect(Collectors.joining(","));
                                }
                                if (!"No".equals(oldValue)) {
                                    List<SimpleUser> oldList = ApplicationContextHolder.getBean(AdminService.class).queryUserByIds(TagUtil.toLongSet((String) oldValue)).getData();
                                    oldValue = oldList.stream().map(SimpleUser::getRealname).collect(Collectors.joining(","));
                                }
                                break;
                            default:
                                break;
                        }

                        if (ObjectUtil.isEmpty(oldValue)) {
                            oldValue = "No";
                        }
                        if (ObjectUtil.isEmpty(newValue)) {
                            newValue = "No";
                        }
                        textList.add("will " + propertiesMap.get(crmTypes).get(oldKey) + " from " + oldValue + " to " + newValue + "。");
                    }
                }
            }
        }
    }

    /**
     * 添加转移记录
     *
     */
    public Content addConversionRecord(CrmEnum crmEnum, Long userId, String name) {
        String userName = UserCacheUtil.getUserName(userId);
        return new Content(name,"will " + crmEnum.getRemarks() + "：" + name + " transfer to: " + userName,BehaviorEnum.CHANGE_OWNER);
    }

    @Autowired
    private ICrmCustomerService crmCustomerService;

    /**
     * 添加(锁定/解锁)记录
     */
    public List<Content> addIsLockRecord(List<String> ids, Integer isLock) {
        List<Content> contentList = new ArrayList<>();
        for (String actionId : ids) {
            String name = crmCustomerService.lambdaQuery().select(CrmCustomer::getCustomerName).eq(CrmCustomer::getCustomerId, actionId).one().getCustomerName();
            String detail;
            if (isLock == 2) {
                detail = "will lock customer： " + name;
                contentList.add(new Content(name,detail,BehaviorEnum.LOCK));
            } else {
                detail = "will unlock customer：" + name;
                contentList.add(new Content(name,detail,BehaviorEnum.UNLOCK));
            }
        }
        return contentList;
    }



    public Content addDeleteActionRecord(CrmEnum crmEnum, String name) {
        return new Content(name,"deleted " + crmEnum.getRemarks() + "：" + name,BehaviorEnum.DELETE);
    }

    public Content addMemberActionRecord(CrmEnum crmEnum, Integer actionId, Long userId, String name) {
        String userName = UserCacheUtil.getUserName(userId);
        return new Content(name,"will " + crmEnum.getRemarks() + "：" + name + " added team members: " + userName);
    }

    public Content addDeleteMemberActionRecord(CrmEnum crmEnum, Long userId, boolean isSelf, String name) {
        if (isSelf) {
            return new Content(name,"left " + crmEnum.getRemarks() + "：" + name + " team members",BehaviorEnum.EXIT_MEMBER);
        } else {
            String userName = UserCacheUtil.getUserName(userId);
            return new Content(name,"removed " + crmEnum.getRemarks() + "：" + name + " team members" + userName,BehaviorEnum.REMOVE_MEMBER);
        }
    }

    public void addOaLogSaveRecord(CrmEnum crmEnum, Integer actionId) {
        CrmActionRecord actionRecord = new CrmActionRecord();
        actionRecord.setCreateUserId(UserUtil.getUserId());
        actionRecord.setCreateTime(new Date());
        actionRecord.setIpAddress(BaseUtil.getIp());
        actionRecord.setTypes(crmEnum.getType());
        actionRecord.setBehavior(BehaviorEnum.SAVE.getType());
        actionRecord.setActionId(actionId);
        actionRecord.setDetail("Add new " + crmEnum.getRemarks() + "：" + DateUtil.formatDate(new Date()));
        actionRecord.setObject(DateUtil.formatDate(new Date()));
        ActionRecordTask actionRecordTask = new ActionRecordTask(actionRecord);
        THREAD_POOL.execute(actionRecordTask);
    }

    public void addOaLogUpdateRecord(CrmEnum crmEnum, Integer actionId, String date) {
        CrmActionRecord actionRecord = new CrmActionRecord();
        actionRecord.setCreateUserId(UserUtil.getUserId());
        actionRecord.setCreateTime(new Date());
        actionRecord.setIpAddress(BaseUtil.getIp());
        actionRecord.setTypes(crmEnum.getType());
        actionRecord.setBehavior(BehaviorEnum.UPDATE.getType());
        actionRecord.setActionId(actionId);
        actionRecord.setDetail("Edited " + crmEnum.getRemarks() + "：" + date);
        actionRecord.setObject(date);
        ActionRecordTask actionRecordTask = new ActionRecordTask(actionRecord);
        THREAD_POOL.execute(actionRecordTask);
    }

    public void addOaExamineActionRecord(CrmEnum crmEnum, Integer actionId, BehaviorEnum behaviorEnum, String content) {
        CrmActionRecord actionRecord = new CrmActionRecord();
        actionRecord.setCreateUserId(UserUtil.getUserId());
        actionRecord.setCreateTime(new Date());
        actionRecord.setIpAddress(BaseUtil.getIp());
        actionRecord.setTypes(crmEnum.getType());
        actionRecord.setBehavior(behaviorEnum.getType());
        actionRecord.setActionId(actionId);
//        String content = Db.queryStr("select content from " + crmEnum.getTableName() + " where " + crmEnum.getTableId() + " = ?", actionId);
        if (content.length() > 20) {
            content = content.substring(0, 20) + "...";
        }
        String prefix = "";
        switch (behaviorEnum) {
            case SAVE:
                prefix = "Add new";
                break;
            case UPDATE:
                prefix = "Update";
                break;
            case RECHECK_EXAMINE:
                prefix = "Withdrawn";
                break;
            case PASS_EXAMINE:
                prefix = "Approved";
                break;
            case REJECT_EXAMINE:
                prefix = "Rejected";
                break;
            case DELETE:
                prefix = "Delete";
                break;
            default:
                break;
        }
        actionRecord.setDetail(prefix + crmEnum.getRemarks() + "：" + content);
        actionRecord.setObject(content);
        ActionRecordTask actionRecordTask = new ActionRecordTask(actionRecord);
        THREAD_POOL.execute(actionRecordTask);
    }

    public void addCrmExamineActionRecord(CrmEnum crmEnum, Integer actionId, BehaviorEnum behaviorEnum, String number) {
        CrmActionRecord actionRecord = new CrmActionRecord();
        actionRecord.setCreateUserId(UserUtil.getUserId());
        actionRecord.setCreateTime(new Date());
        actionRecord.setIpAddress(BaseUtil.getIp());
        actionRecord.setTypes(crmEnum.getType());
        actionRecord.setBehavior(behaviorEnum.getType());
        actionRecord.setActionId(actionId);
        String prefix = "";
        switch (behaviorEnum) {
            case SUBMIT_EXAMINE:
                prefix = "Submit";
                break;
            case RECHECK_EXAMINE:
                prefix = "Withdrawn";
                break;
            case PASS_EXAMINE:
                prefix = "Approved";
                break;
            case REJECT_EXAMINE:
                prefix = "Rejected";
                break;
            default:
                break;
        }
        actionRecord.setDetail(prefix + crmEnum.getRemarks() + "：" + number);
        actionRecord.setObject(number);
        ActionRecordTask actionRecordTask = new ActionRecordTask(actionRecord);
        THREAD_POOL.execute(actionRecordTask);
    }

    /**
     * 通用模板，无需特殊处理的操作记录适用
     *
     * @param crmEnum
     * @param actionId
     * @param behaviorEnum
     */
    public void addObjectActionRecord(CrmEnum crmEnum, Integer actionId, BehaviorEnum behaviorEnum, String name) {
        CrmActionRecord actionRecord = new CrmActionRecord();
        actionRecord.setCreateUserId(UserUtil.getUserId());
        actionRecord.setCreateTime(new Date());
        actionRecord.setIpAddress(BaseUtil.getIp());
        actionRecord.setTypes(crmEnum.getType());
        actionRecord.setBehavior(behaviorEnum.getType());
        actionRecord.setActionId(actionId);
        String detail;
        switch (behaviorEnum) {
            case CANCEL_EXAMINE:
                detail = "will " + crmEnum.getRemarks() + "：" + name + " droped";
                break;
            case FOLLOW_UP:
                detail = "add " + crmEnum.getRemarks() + "：" + name + " new follow-up record";
                break;
            default:
                detail = behaviorEnum.getName() + " finish " + crmEnum.getRemarks() + "：" + name;
                break;
        }
        actionRecord.setDetail(detail);
        actionRecord.setObject(name);
        ActionRecordTask actionRecordTask = new ActionRecordTask(actionRecord);
        THREAD_POOL.execute(actionRecordTask);
    }
}
