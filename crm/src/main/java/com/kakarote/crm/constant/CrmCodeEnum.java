package com.kakarote.crm.constant;

import com.kakarote.core.common.Const;
import com.kakarote.core.common.ResultCode;

/**
 * @author zhangzhiwei
 * crm响应错误代码枚举类
 */

public enum CrmCodeEnum implements ResultCode {
    //客户模块管理
    ADMIN_MODULE_CLOSE_ERROR(2001, "Customer management module cannot be closed"),
    CRM_FIELD_NUM_ERROR(2002, "Each module exists at most "+ Const.QUERY_MAX_SIZE +" fields"),
    CRM_LEADS_TRANSFER_ERROR(2003, "Converted leads cannot be converted repeatedly"),
    CRM_DATE_REMOVE_ERROR(2004, "Data has been deleted"),
    CRM_PRODUCT_CATEGORY_ERROR(2005, "This product category has been associated with products and cannot be deleted!"),
    CRM_PRODUCT_CATEGORY_CHILD_ERROR(2006, "There are other product categories under this category!"),
    CRM_MEMBER_ADD_ERROR(2007, "The person in charge cannot be repeatedly selected as a team member!"),
    CRM_MEMBER_DELETE_ERROR(2008, "The person in charge cannot leave the team!"),
    CRM_CONTRACT_DATE_ERROR(2009, "The end time of the contract should be greater than the start time!"),
    CRM_CONTRACT_NUM_ERROR(2010, "The contract number already exists, please proofread it before adding it!"),
    CRM_CONTRACT_EXAMINE_STEP_ERROR(2011, "There is no audit step started, it cannot be added!"),
    CRM_CONTRACT_EXAMINE_USER_ERROR(2012, "Cannot add without approver!"),
    CRM_CONTRACT_CANCELLATION_ERROR(2013, "The contract has been deleted and cannot be edited"),
    CRM_CONTRACT_EXAMINE_PASS_ERROR(2014, "The passed contract cannot be edited"),
    CRM_CONTRACT_EDIT_ERROR(2015, "Cannot edit, please withdraw and then edit!"),
    CRM_CONTRACT_TRANSFER_ERROR(2016, "The deleted contract cannot be transferred!"),
    CRM_DATA_JOIN_ERROR(2017, "This piece of data must be associated with other data, please do not delete"),
    CRM_RECEIVABLES_ADD_ERROR(2018, "The current contract has not been approved and cannot be added"),
    CRM_RECEIVABLES_NUM_ERROR(2019, "The payment number already exists, please proofread it before adding it!"),
    CRM_RECEIVABLES_EDIT_ERROR(2020, "You can only edit the payment you created"),
    CRM_RECEIVABLES_PLAN_ERROR(2021, "The refund plan has been received, please do not edit"),
    CRM_CUSTOMER_SETTING_USER_ERROR(2022, "The customer has reached the upper limit and cannot be added"),
    NO_APPROVAL_STEP_CANNOT_BE_SAVED(2023, "Cannot save without approval step"),
    CRM_CUSTOMER_LOCK_ERROR(2024, "No need to lock out customers"),
    CRM_CUSTOMER_LOCK_MAX_ERROR(2025, "The number of employees that can be locked reaches the upper limit"),
    CRM_EXAMINE_RECHECK_ERROR(2026, "The approval has been withdrawn"),
    CRM_EXAMINE_AUTH_ERROR(2027, "The current user does not have approval authority"),
    CRM_EXAMINE_RECHECK_PASS_ERROR(2028, "The review has passed and cannot be withdrawn"),
    CRM_NEXT_TIME_ERROR(2029, "The last follow-up time must be greater than the current time"),
    CRM_CRMRETURNVISIT_NUM_ERROR(2030, "The return visit number already exists, please proofread it before adding it!"),
    CRM_ILLEGAL_CHARACTERS_ERROR(2031, "Contains illegal characters"),
    CRM_PHONE_FORMAT_ERROR(2032,"Invalid phone number"),
    CRM_PRICE_FORMAT_ERROR(2033,"Price should be in number format"),
    CRM_DATETIME_FORMAT_ERROR(2034,"Date format is wrong, for example: 2020-01-01 00:00:00"),
    CRM_DATE_FORMAT_ERROR(2035,"Date format is wrong, for example: 2020-01-01"),
    CRM_CUSTOMER_POOL_EXIST_USER_ERROR(2036,"There are customers on the high seas and cannot be deactivated"),
    CRM_CUSTOMER_POOL_LAST_ERROR(2037,"The last one activated on the high seas cannot be deactivated"),
    CRM_FIELD_EXISTED(2038,"%s existed"),
    THE_NUMBER_OF_CUSTOMERS_HAS_REACHED_THE_LIMIT(2039,"The employee has reached the maximum number of customers"),
    CRM_NO_AUTH(2040, "Permission denied"),
    CRM_CUSTOMER_POOL_USER_IS_NULL_ERROR(2041,"High seas administrator or high seas member cannot be empty"),
    CRM_CUSTOMER_POOL_EXIST_USER_DELETE_ERROR(2042,"There are customers on the high seas and cannot be deleted"),
    CRM_CUSTOMER_POOL_LAST_DELETE_ERROR(2043,"The last one to enable high seas cannot be deleted"),
    CRM_PRINT_TEMPLATE_NOT_EXIST_ERROR(2044,"The print template used cannot be empty"),
    CRM_PRINT_PRE_VIEW_ERROR(2045,"Only supports pdf and word format preview"),
    CRM_BUSINESS_TYPE_RATE_ERROR(2046,"Win rate cannot be greater than 100"),
    CRM_BUSINESS_TYPE_OCCUPY_ERROR(2047,"The business unit in use cannot be modified"),
    CRM_CONTRACT_CONFIG_ERROR(2048,"Please set the number of days in advance"),
    CRM_CUSTOMER_SETTING_USER_EXIST_ERROR(2049,"There are already employee or department information included in other rules"),
    CRM_NUMBER_SETTING_LENGTH_ERROR(2050, "No less than two levels"),
    CRM_NUMBER_SETTING_DATE_NOTNULL_ERROR(2051, "Date numbering rules are required to enable restart numbering"),
    CRM_CAN_ONLY_DELETE_FOLLOW_UP_RECORDS(2052, "Can only delete follow-up records"),
    CRM_RECEIVABLES_EXAMINE_PASS_ERROR(2053, "The approved payment cannot be edited"),
    CRM_CUSTOMER_POOL_NOT_EXIST_ERROR(2054, "There is no open sea"),
    CRM_MARKETING_UNSYNCHRONIZED_DATA(2055, "There is unsynchronized data and cannot be deleted!"),
    CRM_MARKETING_STOP(2056, "The promotion ceased"),
    CRM_MARKETING_QR_CODE_EXPIRED(2057, "QR code expired"),
    CRM_MARKETING_CAN_ONLY_BE_FILLED_ONCE(2058, "Can only be filled once"),
    CRM_MARKETING_DATA_SYNCED(2059, "Data synced"),
    CRM_CUSTOMER_POOL_DISTRIBUTE_ERROR(2060, "No right to allocate"),
    CRM_CUSTOMER_POOL_RECEIVE_ERROR(2061, "The number of receiving customers exceeds the limit"),
    CRM_CUSTOMER_POOL_RECEIVE_NUMBER_ERROR(2062, "The number of claims today exceeds the upper limit"),
    CRM_CUSTOMER_POOL_PRE_USER_RECEIVE_ERROR(2063, "The former person in charge cannot receive it within the time limit"),
    CRM_DATA_DELETED(2064, "%s deleted"),
    CRM_CUSTOMER_POOL_REMIND_ERROR(2065, "There is no high seas rule to remind you to enter the high sea"),
    CRM_CONTRACT_EXPIRATION_REMIND_ERROR(2066, "Contract expiration reminder is not turned on"),
    CRM_RETURN_VISIT_REMIND_ERROR(2067, "Return visit reminder is not turned on"),
    CRM_INVOICE_EXAMINE_PASS_ERROR(2068, "Passed invoices cannot be edited"),
    CRM_POOL_FIELD_HIDE_ERROR(2069, "Show at least 2 columns"),
    CRM_POOL_TRANSFER_ERROR(2070, "Can't transfer customers to the high seas"),
    CRM_CALL_DATA_UPDATE_ERROR(2071, "Does not support editing operations temporarily!"),
    CRM_CALL_DATA_QUERY_ERROR(2072, "%s incorrect!"),
    CRM_CALL_UPLOAD_ERROR(2073, "File upload failed!"),
    CRM_CALL_DOWNLOAD_ERROR(2075, "No recording files!"),
    CAN_ONLY_DELETE_WITHDRAWN_AND_SUBMITTED_EXAMINE(2076, "Only withdrawn and unsubmitted approvals can be deleted!"),
    CRM_SYNC_FAILED(2077, "Sync failed: %s！"),
    CRM_ONLY_SYNC_DATA_FOR_WHICH_YOU_ARE_RESPONSIBLE(2078, "You can only synchronize the data that you are responsible for!"),
    CRM_FIELD_ALREADY_EXISTS(2079, "%s existed！"),
    SYSTEM_RELATED_FIELDS_CANNOT_BE_HIDDEN(2080, "System related fields cannot be hidden!"),
    REQUIRED_OPTIONS_CANNOT_BE_HIDDEN(2081, "Required options cannot be hidden!"),
    INDEX_CREATE_FAILED(2082, "%s index creation failed, data initialization exception！"),
    CRM_CONTACTS_DATA_ERROR(2083, "No binding client is detected, please confirm!"),
    CRM_CONTRACT_EXAMINE_PASS_HINT_ERROR(2085, "The passed contract can only be edited after it is cancelled!"),
    CRM_ACTIVITY_FORM_NONENTITY_ERROR(2086, "The activity form no longer exists!"),
    THE_FIELD_NAME_OF_THE_FORM_CANNOT_BE_REPEATED(2087,"Custom form field names cannot be repeated"),

    ;


    CrmCodeEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private int code;
    private String msg;

    @Override
    public int getCode() {
        return code;
    }

    @Override
    public String getMsg() {
        return msg;
    }
}
