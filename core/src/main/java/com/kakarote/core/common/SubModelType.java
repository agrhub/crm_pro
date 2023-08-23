package com.kakarote.core.common;

import lombok.Getter;

@Getter
public enum SubModelType {
    NULL(0,""),
    ADMIN_COMPANY_HOME(1,"admin_company_home"),
    ADMIN_APPLICATION_MANAGEMENT(2,"admin_appication_management"),
    ADMIN_STAFF_MANAGEMENT(3,"admin_staff_management"),
    ADMIN_DEPARTMENT_MANAGEMENT(4,"admin_department_management"),
    ADMIN_ROLE_PERMISSIONS(5,"admin_role_management"),
    ADMIN_PROJECT_MANAGEMENT(6,"admin_project_management"),
    ADMIN_CUSTOMER_MANAGEMENT(7,"admin_customer_management"),
    ADMIN_HUMAN_RESOURCE_MANAGEMENT(8,"admin_hr_management"),
    ADMIN_INVOICING_MANAGEMENT(9,"admin_invoicing_management"),
    ADMIN_OTHER_SETTINGS(10,"admin_other_settings"),
    //crm
    CRM_LEADS(21,"crm_lead"),
    CRM_CUSTOMER(22,"crm_customer"),
    CRM_CONTACTS(23,"crm_contact"),
    CRM_BUSINESS(24,"crm_business"),
    CRM_CONTRACT(25,"crm_contract"),
    CRM_RECEIVABLES(26,"crm_receivable"),
    CRM_INVOICE(27,"crm_invoice"),
    CRM_RETURN_VISIT(28,"crm_return_visit"),
    CRM_PRODUCT(29,"crm_product"),
    CRM_MARKETING(30,"crm_marketing"),
    //oa
    OA_CALENDAR(41,"oa_calendar"),
    OA_LOG(42,"oa_log"),
    //work
    WORK_PROJECT(51,"work_project"),
    WORK_TASK(52,"work_task"),
    //hrm
    HRM_DEPT(61,"hrm_dept"),
    HRM_RECRUITMENT(62,"hrm_recruitment"),
    HRM_CANDIDATE(63,"hrm_candidate"),
    HRM_EMPLOYEE(64,"hrm_employee"),
    HRM_SOCIAL_SECURITY(65,"hrm_social_security"),
    HRM_SALARY(66,"hrm_salary"),
    HRM_SALARY_FILE(67,"hrm_salary_file"),
    HRM_SALARY_SLIP(68,"hrm_salary_slip"),
    HRM_APPRAISAL(69,"arm_appraisal"),
    //jxc
    JXC_SUPPLIER(81,"jxc_supplier"),
    JXC_PURCHASE_ORDER(82,"jxc_purchase_order"),
    JXC_PURCHASE_RETURN(83,"jxc_purchase_return"),
    JXC_PRODUCT_MANAGEMENT(84,"jxc_product_management"),
    JXC_SALES_ORDER(85,"jxc_sales_order"),
    JXC_SALES_RETURN(86,"jxc_sales_return"),
    JXC_WAREHOUSE_MANAGEMENT(87,"jxc_warehouse_management"),
    JXC_PRODUCT_INVENTORY(88,"jxc_rpduct_inventory"),
    JXC_PRODUCT_IN_STOCK(89,"jxc_product_in_stock"),
    JXC_PRODUCT_OUT_STOCK(90,"jxc_product_out_stock"),
    JXC_STOCK_TRANSFER(91,"jxc_stock_transfer"),
    JXC_INVENTORY_CHECK(92,"jxc_inventory_check"),
    JXC_RECEIVABLES(93,"jxc_receivable"),
    JXC_PAYMENT(94,"jxc_payment"),
    ;


    SubModelType(Integer label, String name) {
        this.label = label;
        this.name = name;
    }

    private Integer label;

    private String name;

    public static String valueOfName(Integer label){
        for (SubModelType modelType : values()) {
            if (label.equals(modelType.getLabel())){
                return modelType.getName();
            }
        }
        return "";
    }
}
