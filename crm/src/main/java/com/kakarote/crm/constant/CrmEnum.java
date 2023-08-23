package com.kakarote.crm.constant;

/**
 * @author zhangzhiwei
 * crm模块枚举
 */

public enum CrmEnum {
    /**
     * 线索
     */
    LEADS(1, "leads"),
    /**
     * 客户
     */
    CUSTOMER(2, "customer"),
    /**
     * 联系人
     */
    CONTACTS(3, "contact"),
    /**
     * 产品
     */
    PRODUCT(4, "product"),
    /**
     * 商机
     */
    BUSINESS(5, "business"),
    /**
     * 合同
     */
    CONTRACT(6, "contract"),
    /**
     * 回款
     */
    RECEIVABLES(7, "receivable"),
    /**
     * 回款计划
     */
    RECEIVABLES_PLAN(8, "receivable_plan"),
    /**
     * 公海
     */
    CUSTOMER_POOL(9, "customer_pool"),
    /**
     * 市场活动
     */
    MARKETING(10, "marketing"),
    /**
     * 回访
     */
    RETURN_VISIT(17, "return_visit"),
    /**
     * 发票
     */
    INVOICE(18, "invoice");

    CrmEnum(Integer type, String remarks) {
        this.type = type;
        this.remarks = remarks;
    }

    private Integer type;
    private String remarks;

    public String getRemarks() {
        return remarks;
    }

    public Integer getType() {
        return type;
    }

    public static CrmEnum parse(Integer type) {
        for (CrmEnum crmEnum : CrmEnum.values()) {
            if (crmEnum.getType().equals(type)) {
                return crmEnum;
            }
        }
        return null;
    }

    public static CrmEnum parse(String name) {
        for (CrmEnum crmEnum : CrmEnum.values()) {
            if (crmEnum.name().equals(name)) {
                return crmEnum;
            }
        }
        return null;
    }

    public String getIndex() {
        return "wk_single_" + name().toLowerCase();
    }

    public String getTable() {
        return name().toLowerCase();
    }

    @Override
    public String toString() {
        return this.type.toString();
    }
}
