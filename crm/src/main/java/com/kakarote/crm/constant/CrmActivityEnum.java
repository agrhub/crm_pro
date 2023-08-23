package com.kakarote.crm.constant;

/**
 * @author hmb
 */

public enum CrmActivityEnum {
    /**
     * crm活动枚举
     */
    LEADS(1,"leads"),
    CUSTOMER(2,"customer"),
    CONTACTS(3,"contact"),
    PRODUCT( 4,"product"),
    BUSINESS(5,"business"),
    CONTRACT(6,"contract"),
    RECEIVABLES(7,"receivable"),
    LOG(8,"log"),
    EXAMINE(9,"examine"),
    EVENT( 10,"event" ),
    TASK( 11,"task" ),
    MAIL( 12,"mail");

    CrmActivityEnum(int type, String remarks){
        this.type = type;
        this.remarks = remarks;
    }

    private final int  type;
    private final String remarks;

    public static CrmActivityEnum  parse(int type){
        for(CrmActivityEnum value : CrmActivityEnum.values()){
            if(value.type == type){
                return value;
            }
        }
        return null;
    }


    public int getType(){
        return type;
    }

    public String getRemarks(){
        return remarks;
    }
}
