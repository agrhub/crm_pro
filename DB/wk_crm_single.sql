-- create database wk_crm_single character set utf8mb4 collate utf8mb4_general_ci;
-- use wk_crm_single;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime(0) NOT NULL,
  `log_modified` datetime(0) NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for wk_admin_attention
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_attention`;
CREATE TABLE `wk_admin_attention`  (
  `attention_id` int(11) NOT NULL AUTO_INCREMENT,
  `be_user_id` bigint(20) NOT NULL COMMENT 'Followed person',
  `attention_user_id` bigint(20) NOT NULL COMMENT 'Follow people',
  PRIMARY KEY (`attention_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Address Book User Follow Form' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_attention
-- ----------------------------
INSERT INTO `wk_admin_attention` VALUES (1, 14773, 14773);

-- ----------------------------
-- Table structure for wk_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_config`;
CREATE TABLE `wk_admin_config` (
   `setting_id` int(9) NOT NULL AUTO_INCREMENT,
   `status` int(1) NOT NULL DEFAULT 0 COMMENT'status, 0: not enabled 1: enabled',
   `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Set name',
   `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'value',
   `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Description',
   PRIMARY KEY (`setting_id`) USING BTREE,
   INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 262462 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Customer Rules' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_config
-- ----------------------------
INSERT INTO `wk_admin_config` VALUES (262433, 1,'expiringContractDays', '3','Contract expiration reminder');
INSERT INTO `wk_admin_config` VALUES (262434, 1,'putInPoolRemindDays', '2', NULL);
INSERT INTO `wk_admin_config` VALUES (262435, 1,'taskExamine', '1','task approval');
INSERT INTO `wk_admin_config` VALUES (262436, 1,'log', '1','log');
INSERT INTO `wk_admin_config` VALUES (262437, 1,'book', '1','Address Book');
INSERT INTO `wk_admin_config` VALUES (262438, 1,'crm', '1','Customer Management');
INSERT INTO `wk_admin_config` VALUES (262439, 1,'project', '1','project management');
INSERT INTO `wk_admin_config` VALUES (262440, 1,'calendar', '1','calendar');
INSERT INTO `wk_admin_config` VALUES (262441, 0,'email', '2','mailbox');
INSERT INTO `wk_admin_config` VALUES (262442, 0,'knowledge', '2','knowledge base');
INSERT INTO `wk_admin_config` VALUES (262443, 0,'hrm', '2','human resource management');
INSERT INTO `wk_admin_config` VALUES (262444, 0,'jxc', '2','Invoicing management');
INSERT INTO `wk_admin_config` VALUES (262445, 0,'call', '3','Call Center');
INSERT INTO `wk_admin_config` VALUES (262446, 0,'followRecordOption','Call','Follow up record option');
INSERT INTO `wk_admin_config` VALUES (262447, 0,'followRecordOption','send email','follow up record option');
INSERT INTO `wk_admin_config` VALUES (262448, 0,'followRecordOption','Send SMS','Follow up record option');
INSERT INTO `wk_admin_config` VALUES (262449, 0,'followRecordOption','Meet to visit','Follow up record option');
INSERT INTO `wk_admin_config` VALUES (262450, 0,'followRecordOption','activity','follow-up record option');
INSERT INTO `wk_admin_config` VALUES (262451, 0,'logWelcomeSpeech','The blue sky is quiet, the air is fresh, and the sun is bright','default log welcome message');
INSERT INTO `wk_admin_config` VALUES (262452, 0,'logWelcomeSpeech','Life, the happiest thing is to struggle','Default log welcome message');
INSERT INTO `wk_admin_config` VALUES (262453, 0,'logWelcomeSpeech','A hard day at work, life, the happiest thing is to struggle','default log welcome message');
INSERT INTO `wk_admin_config` VALUES (262454, 0,'pictureSetting', NULL,'Outdoor sign-in photo upload settings');
INSERT INTO `wk_admin_config` VALUES (262455, 0,'returnVisitRemindConfig', '7','Customer return visit reminder settings');
INSERT INTO `wk_admin_config` VALUES (262456, 0,'numberSetting', '6','Automatic number setting');
INSERT INTO `wk_admin_config` VALUES (262457, 0,'numberSetting', '7','Automatic number setting');
INSERT INTO `wk_admin_config` VALUES (262458, 0,'numberSetting', '17','Automatic number setting');
INSERT INTO `wk_admin_config` VALUES (262459, 0,'numberSetting', '18','Automatic number setting');
INSERT INTO `wk_admin_config` VALUES (262460, 1,'companyInfo','{\"companyLogo\":\"\",\"companyName\":\"Conscience Enterprise\"}','Enterprise LOGO Configuration');
INSERT INTO `wk_admin_config` VALUES (262461, 1,'marketing', NULL,'Whether to open marketing activities');

-- ----------------------------
-- Table structure for wk_admin_dept
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_dept`;
CREATE TABLE `wk_admin_dept` (
   `dept_id` int(11) NOT NULL AUTO_INCREMENT,
   `pid` int(11) NULL DEFAULT 0 COMMENT'Parent ID top-level department is 0',
   `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'department name',
   `num` int(4) NULL DEFAULT NULL COMMENT'The bigger the order, the lower the order',
   `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'Department Remarks',
   PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14853 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Department Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_dept
-- ----------------------------
INSERT INTO `wk_admin_dept` VALUES (14852, 0, 'Company', 1, '');

-- ----------------------------
-- Table structure for wk_admin_file
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_file`;
CREATE TABLE `wk_admin_file` (
  `file_id` bigint(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Attachment name',
  `size` bigint(20) NOT NULL COMMENT'Attachment size (bytes)',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'The real path of the file',
  `file_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'file' COMMENT'file type,file,img',
  `type` int(1) NULL DEFAULT NULL COMMENT '1 local 2 Alibaba Cloud oss',
  `source` int(1) NULL DEFAULT NULL COMMENT'Source 0 Default 1 admin 2 crm 3 work 4 oa 5 Invoicing 6 hrm',
  `is_public` int(1) NULL DEFAULT 0 COMMENT '1 public access 0 private access',
  `batch_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'batch id',
  PRIMARY KEY (`file_id`) USING BTREE,
  INDEX `batch_id`(`batch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Attachment table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_file
-- ----------------------------

-- ----------------------------
-- Table structure for wk_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_login_log`;
CREATE TABLE `wk_admin_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_user_id` bigint(20) NOT NULL COMMENT'operator id',
  `login_time` datetime(0) NOT NULL COMMENT'login time',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'login ip address',
  `login_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'login location',
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'device type',
  `core` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'terminal core',
  `platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'platform',
  `imei` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'IEMI device number',
  `auth_result` int(2) NULL DEFAULT NULL COMMENT'Authentication result 1 success 2 failure',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='System login log table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for wk_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_menu`;
CREATE TABLE `wk_admin_menu` (
  `menu_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT'menu ID',
  `parent_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT'Parent menu ID',
  `menu_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT'' COMMENT'Menu name',
  `realm` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT'' COMMENT'Authority ID',
  `realm_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Authority URL',
  `realm_module` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'belonging to the module',
  `menu_type` int(1) NULL DEFAULT NULL COMMENT'Menu type 1 directory 2 menu 3 button 4 special',
  `sort` int(4) UNSIGNED NULL DEFAULT 0 COMMENT'sort (valid at the same level)',
  `status` int(4) NULL DEFAULT 1 COMMENT'Status 1 enabled 0 disabled',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Menu Description',
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `menu_id`(`menu_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `realm`(`realm`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 932 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Background menu table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_menu
-- ----------------------------
INSERT INTO `wk_admin_menu` VALUES (1, 0, 'All', 'crm', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (2, 0, 'All', 'bi', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (3, 0, 'All', 'manage', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (5, 0, 'All', 'hrm', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (6, 0, 'All', 'jxc', '', NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (9, 1, 'Leads', 'leads', NULL, NULL, 1, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (10, 1, 'Customers', 'customer', NULL, NULL, 1, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (11, 1, 'Contacts', 'contacts', NULL, NULL, 1, 3, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (12, 1, 'Business', 'business', NULL, NULL, 1, 4, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (13, 1, 'Contract', 'contract', NULL, NULL, 1, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (14, 1, 'Receivables', 'receivables', NULL, NULL, 1, 6, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (15, 1, 'Products', 'product', NULL, NULL, 1, 7, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (17, 9, 'Add New', 'save', '/crmLeads/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (18, 9, 'Update', 'update', '/crmLeads/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (19, 9, 'Read & Update', 'index', '/crmLeads/queryPageList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (20, 9, 'Read-only', 'read', '/crmLeads/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (21, 9, 'Import', 'excelimport', '/crmLead/downloadExcel', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (22, 9, 'Export', 'excelexport', '/crmLead/allExportExcel,/crmLead/batchExportExcel', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (23, 9, 'Delete', 'delete', '/crmLead/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (24, 9, 'Change owner', 'transfer', '/crmLeads/changeOwnerUser', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (25, 9, 'Transfer', 'transform', '/crmLead/transfer', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (26, 10, 'Add New', 'save', '/crmCustomer/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (27, 10, 'Update', 'update', '/crmCustomer/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (28, 10, 'Read & Update', 'index', '/crmCustomer/queryPageList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (29, 10, 'Read-only', 'read', '/crmCustomer/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (30, 10, 'Import', 'excelimport', '/crmCustomer/uploadExcel', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (31, 10, 'Export', 'excelexport', '/crmCustomer/batchExportExcel,/crmCustomer/allExportExcel', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (32, 10, 'Delete', 'delete', '/crmCustomer/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (33, 10, 'Change owner', 'transfer', '/crmCustomer/changeOwnerUser', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (34, 10, 'Put in pool', 'putinpool', '/crmCustomer/updateCustomerByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (35, 10, 'Enable/Disable', 'lock', '/crmCustomer/lock', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (36, 10, 'Update Members', 'teamsave', '/crmCustomer/addMembers,/crmCustomer/updateMembers,/crmCustomer/exitTeam', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (40, 11, 'Add New', 'save', '/crmContacts/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (41, 11, 'Update', 'update', '/crmContacts/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (42, 11, 'Read & Update', 'index', '/crmContacts/queryPageList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (43, 11, 'Read-only', 'read', '/crmContacts/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (44, 11, 'Delete', 'delete', '/crmContacts/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (45, 11, 'Change owner', 'transfer', '/crmContacts/changeOwnerUser', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (46, 12, 'Add New', 'save', '/crmBusiness/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (47, 12, 'Update', 'update', '/crmBusiness/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (48, 12, 'Read & Update', 'index', '/crmBusiness/queryPageList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (49, 12, 'Read-only', 'read', '/crmBusiness/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (50, 12, 'Delete', 'delete', '/crmBusiness/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (51, 12, 'Change owner', 'transfer', '/crmBusiness/changeOwnerUser', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (52, 12, 'Update Members', 'teamsave', '/crmBusiness/addMembers,/crmBusiness/updateMembers,/crmBusiness/deleteMembers', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (53, 13, 'Add New', 'save', '/crmContract/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (54, 13, 'Update', 'update', '/crmContract/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (55, 13, 'Read & Update', 'index', '/crmContract/queryPageList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (56, 13, 'Read-only', 'read', '/crmContract/queryById', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (57, 13, 'Delete', 'delete', '/crmContract/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (58, 13, 'Change owner', 'transfer', '/crmContract/changeOwnerUser', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (59, 13, 'Update Members', 'teamsave', '/crmContract/addMembers,/crmContract/updateMembers,/crmContract/deleteMembers', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (60, 14, 'Add New', 'save', '/crmReceivables/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (61, 14, 'Update', 'update', '/crmReceivables/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (62, 14, 'Read & Update', 'index', '/crmReceivables/queryPageList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (63, 14, 'Read-only', 'read', '/crmReceivables/queryById', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (64, 14, 'Delete', 'delete', '/crmReceivables/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (65, 15, 'Add New', 'save', '/crmProduct/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (66, 15, 'Update', 'update', '/crmProduct/udpate', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (67, 15, 'Read & Update', 'index', '/crmProduct/queryPageList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (68, 15, 'Read-only', 'read', '/crmProduct/queryById', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (69, 15, 'On-shelve/Off-shelve', 'status', '/crmProduct/updateStatus', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (70, 15, 'Change owner', 'transfer', '/crmProduct/changeOwnerUser', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (71, 14, 'Change owner', 'transfer', '/crmReceivables/changeOwnerUser', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (97, 2, 'Achievements', 'achievement', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (98, 2, 'Sales funnel', 'business', '/biFunnel/addBusinessAnalyze,/biFunnel/win', NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (99, 2, 'Employee customer analysis', 'customer', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (101, 2, 'Employee performance analysis', 'contract', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (102, 97, 'Read-only', 'read', '/bi/taskCompleteStatistics', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (103, 98, 'Read-only', 'read', '', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (104, 99, 'Read-only', 'read', '/biCustomer/totalCustomerStats,/biCustomer/totalCustomerTable,/biCustomer/customerRecordStats,/biCustomer/customerRecordStats,/biCustomer/customerRecodCategoryStats,/biCustomer/customerConversionStats,/biCustomer/poolStats,/biCustomer/poolTable,/biCustomer/employeeCycle,/biCustomer/employeeCycleInfo,/biCustomer/customerSatisfactionTable,/biCustomer/productSatisfactionTable', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (106, 101, 'Read-only', 'read', '/biEmployee/contractNumStats,/biEmployee/contractMoneyStats,/biEmployee/receivablesMoneyStats,/biEmployee/totalContract,/biEmployee/invoiceStats', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (107, 11, 'Export', 'excelexport', '/crmContacts/batchExportExcel,/crmContacts/allExportExcel', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (108, 11, 'Import', 'excelimport', '/crmContacts/uploadExcel', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (109, 15, 'Import', 'excelimport', '/crmProduct/uploadExcel', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (110, 15, 'Export', 'excelexport', '/crmProduct/batchExportExcel,/crmProduct/allExportExcel', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (117, 2, 'Product analysis', 'product', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (118, 117, 'Read-only', 'read', '/bi/productStatistics,/biRanking/contractProductRanKing', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (123, 2, 'Customer profile analysis', 'portrait', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (124, 123, 'Read-only', 'read', '/biRanking/addressAnalyse,/biRanking/portrait,/biRanking/portraitLevel,/biRanking/portraitSource', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (125, 2, 'Leaderboard', 'ranking', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (126, 125, 'Read-only', 'read', '/biRanking/contractRanKing,/biRanking/receivablesRanKing,/biRanking/contractCountRanKing,/biRanking/productCountRanKing,/biRanking/productCountRanKing,/biRanking/contactsCountRanKing,/biRanking/customerCountRanKing,/biRanking/recordCountRanKing,/biRanking/customerGenjinCountRanKing,/biRanking/customerGenjinCountRanKing', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (146, 2, 'Office analysis', 'oa', NULL, NULL, 1, 10, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (147, 146, 'Read-only', 'read', '/biWork/logStatistics,/biWork/examineStatistics', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (148, 0, 'All', 'oa', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (149, 0, 'All', 'project', NULL, NULL, 1, 0, 1, '项目管理角色权限');
INSERT INTO `wk_admin_menu` VALUES (150, 148, 'Address book', 'book', NULL, NULL, 1, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (151, 150, 'Read-only', 'read', '/adminUser/queryListName', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (152, 149, 'Project management', 'projectManage', NULL, NULL, 1, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (153, 152, 'Add new', 'save', '/work/addWork', NULL, 3, 2, 1, 'projectSave');
INSERT INTO `wk_admin_menu` VALUES (160, 3, 'Enterprise profile', 'system', NULL, NULL, 1, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (161, 160, 'Read-only', 'read', '', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (162, 160, 'Update', 'update', '/adminConfig/setAdminConfig', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (163, 3, 'Apps management', 'configSet', NULL, NULL, 1, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (164, 163, 'Read-only', 'read', '/adminConfig/queryModuleSetting', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (165, 163, 'Enable/Disable', 'update', '/adminConfig/setModuleSetting', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (166, 3, 'Staff and department management', 'users', NULL, NULL, 1, 3, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (167, 166, 'Read-only', 'read', '', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (168, 166, 'Add new user', 'userSave', '/adminUser/addUser', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (169, 166, 'Enable/Disable user', 'userEnables', '/adminUser/setUserStatus', NULL, 3, 3, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (170, 166, 'Update user', 'userUpdate', '/adminUser/setUser', NULL, 3, 4, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (171, 166, 'Add new department', 'deptSave', '/adminDept/addDept', NULL, 3, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (172, 166, 'Update department', 'deptUpdate', '/adminDept/setDept', NULL, 3, 6, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (173, 166, 'Delete department', 'deptDelete', '/adminDept/deleteDept', NULL, 3, 7, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (174, 3, 'Role authority management', 'permission', NULL, NULL, 1, 4, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (175, 174, 'Role permission settings', 'update', '/adminRole/getRoleByType/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (176, 3, 'Office approval flow', 'oa', NULL, NULL, 1, 6, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (177, 176, 'Office approval flow management', 'examine', '/oaExamineCategory/queryExamineCategoryList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (178, 3, 'Business approval flow', 'examineFlow', NULL, NULL, 1, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (179, 178, 'Business approval flow management', 'update', '/crmExamine/queryAllExamine', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (180, 3, 'Customer management settings', 'crm', NULL, NULL, 1, 7, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (181, 180, 'Custom field settings', 'field', '/crmField/queryFields', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (182, 180, 'Customer high seas rules', 'pool', '/crmCustomerPool/queryPoolSettingList', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (183, 180, 'Business parameter settings', 'setting', '', NULL, 3, 4, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (184, 180, 'Performance goal setting', 'achievement', '/biAchievement/queryAchievementList', NULL, 3, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (185, 3, 'Project management settings', 'work', NULL, NULL, 1, 8, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (186, 185, 'Project management', 'update', '', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (187, 148, 'Announcement', 'announcement', NULL, NULL, 1, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (188, 187, 'Add New', 'save', '/oaAnnouncement/addAnnouncement', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (189, 187, 'Update', 'update', '/oaAnnouncement/setAnnouncement', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (190, 187, 'Delete', 'delete', '/oaAnnouncement/delete', NULL, 3, 3, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (191, 10, 'Set transaction status', 'dealStatus', '/crmCustomer/setDealStatus', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (192, 13, 'Discard contract', 'discard', '/crmContract/contractDiscard', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (193, 2, 'Call Center', 'call', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (194, 193, 'Query call history', 'index', NULL, NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (195, 193, 'Call analysis', 'analysis', NULL, NULL, 3, 3, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (200, 1, 'Marketing', 'marketing', NULL, NULL, 1, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (201, 200, 'Add New', 'save', '/crmMarketing/add', NULL, 3, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (202, 200, 'Read & Update', 'index', '/crmMarketing/queryPageList', NULL, 3, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (204, 200, 'Update', 'update', '/crmMarketing/update', NULL, 3, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (205, 200, 'Delete', 'delete', '/crmMarketing/deleteByIds', NULL, 3, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (206, 200, 'Enable/Disable', 'updateStatus', '/crmMarketing/updateStatus', NULL, 3, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (207, 200, 'Read-only', 'read', '/crmMarketing/queryById', NULL, 3, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (208, 13, 'Export', 'excelexport', '/crmContract/batchExportExcel,/crmContract/allExportExcel', NULL, 3, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (209, 12, 'Export', 'excelexport', '/crmBusiness/batchExportExcel,/crmBusiness/allExportExcel', NULL, 3, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (211, 15, 'Delete', 'delete', '/crmProduct/deleteByIds', NULL, 3, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (212, 14, 'Export', 'excelexport', '/crmReceivables/batchExportExcel,/crmReceivables/allExportExcel', NULL, 3, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (213, 1, 'Outwork', 'outwork', NULL, NULL, 1, 9, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (214, 213, 'Add New', 'save', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (215, 213, 'Read-only', 'read', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (216, 213, 'Delete', 'delete', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (217, 213, 'Update', 'setting', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (218, 10, 'Nearby customers', 'nearbyCustomer', '/crmCustomer/nearbyCustomer', NULL, 3, 1, 1, '');
INSERT INTO `wk_admin_menu` VALUES (230, 3, 'System log', 'adminLog', NULL, NULL, 1, 9, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (231, 230, 'Login log view', 'loginLog', '/system/log/queryLoginLogList', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (232, 230, 'Action log view', 'actionRecord', '/system/log/queryActionRecordList', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (233, 230, 'System log view', 'systemLog', '/system/log/querySystemLogList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (300, 0, 'Project management', 'work', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (301, 300, 'Read-only', 'project', NULL, NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (310, 301, 'Update', 'setWork', '', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (311, 301, 'Export', 'excelExport', '', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (312, 301, 'Add new task class', 'saveTaskClass', '', NULL, 3, 3, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (313, 301, 'Update task class', 'updateTaskClass', '', NULL, 3, 4, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (314, 301, 'Order task class', 'updateClassOrder', '', NULL, 3, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (315, 301, 'Delete task class', 'deleteTaskClass', '', NULL, 3, 6, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (316, 301, 'Add new task', 'saveTask', '', NULL, 3, 7, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (317, 301, 'Update task status', 'setTaskStatus', '', NULL, 3, 8, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (318, 301, 'Update task tile', 'setTaskTitle', '', NULL, 3, 9, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (319, 301, 'Update task description', 'setTaskDescription', '', NULL, 3, 10, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (320, 301, 'Task assigment', 'setTaskMainUser', '', NULL, 3, 11, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (321, 301, 'Set task time', 'setTaskTime', '', NULL, 3, 12, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (322, 301, 'Set task label', 'setTaskLabel', '', NULL, 3, 13, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (323, 301, 'Set task owner', 'setTaskOwnerUser', '', NULL, 3, 14, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (324, 301, 'Set task priority', 'setTaskPriority', '', NULL, 3, 15, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (325, 301, 'Set task order', 'setTaskOrder', '', NULL, 3, 16, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (326, 301, 'Archive task', 'archiveTask', '', NULL, 3, 17, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (327, 301, 'Delete task', 'deleteTask', '', NULL, 3, 18, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (328, 301, 'Full delete task', 'cleanTask', '', NULL, 3, 19, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (329, 301, 'Upload attachment', 'uploadTaskFile', '', NULL, 3, 20, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (330, 301, 'Delete attachment', 'deleteTaskFile', '', NULL, 3, 21, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (331, 301, 'Import', 'excelImport', '', NULL, 3, 22, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (332, 301, 'Add new subtask', 'addChildTask', '', NULL, 3, 23, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (333, 301, 'Update subtask', 'updateChildTask', '', NULL, 3, 24, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (334, 301, 'Delete subtask', 'deleteChildTask', '', NULL, 3, 25, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (335, 301, 'Restore task', 'restoreTask', '', NULL, 3, 26, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (336, 301, 'Add task relevant', 'saveTaskRelation', '', NULL, 3, 27, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (337, 301, 'Update subtask status', 'setChildTaskStatus', '', NULL, 3, 28, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (400, 1, 'Return customer management', 'visit', NULL, NULL, 1, 8, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (401, 400, 'Add New', 'save', '/crmReturnVisit/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (402, 400, 'Update', 'update', '/crmReturnVisit/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (403, 400, 'Read & Update', 'index', '/crmReturnVisit/queryPageList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (404, 400, 'Read-only', 'read', '/crmReturnVisit/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (405, 400, 'Delete', 'delete', '/crmReturnVisit/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (420, 1, 'Invoice management', 'invoice', NULL, NULL, 1, 9, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (421, 420, 'Add New', 'save', '/crmInvoice/save', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (422, 420, 'Update', 'update', '/crmInvoice/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (423, 420, 'Read & Update', 'index', '/crmInvoice/queryPageList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (424, 420, 'Read-only', 'read', '/crmInvoice/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (425, 420, 'Delete', 'delete', '/crmInvoice/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (426, 420, 'Change owner', 'transfer', '/crmInvoice/changeOwnerUser', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (427, 420, 'Update invoice status', 'updateInvoiceStatus', '/crmInvoice/updateInvoiceStatus', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (428, 420, 'Reset invoice status', 'resetInvoiceStatus', '/crmInvoice/resetInvoiceStatus', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (440, 1, 'Follow up records management', 'followRecord', NULL, NULL, 1, 10, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (441, 440, 'Read-only', 'read', '', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (442, 440, 'Add New', 'save', '/crmActivity/addCrmActivityRecord', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (443, 440, 'Update', 'update', '/crmActivity/updateActivityRecord', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (444, 440, 'Delete', 'delete', '/crmActivity/deleteCrmActivityRecord/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (500, 180, 'Print template settings', 'print', '', NULL, 3, 3, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (501, 12, 'Print', 'print', '', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (502, 13, 'Print', 'print', '', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (503, 14, 'Print', 'print', '', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (601, 6, 'Supplier management', 'supplier', '', NULL, 1, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (602, 601, 'Add New', 'save', '/jxcSupplier/addOrUpdate/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (603, 601, 'Update', 'update', '/jxcSupplier/addOrUpdate/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (604, 601, 'Read & Update', 'index', '/jxcField/queryPageList/2', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (605, 601, 'Read-only', 'read', '/jxcField/information/2,/jxcSupplier/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (606, 601, 'Delete', 'delete', '/jxcSupplier/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (607, 601, 'Change owner', 'transfer', '/jxcField/transfer/2', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (608, 601, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (610, 6, 'Purchasing management', 'purchase', '', NULL, 1, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (611, 610, 'Add New', 'save', '/jxcPurchase/addOrUpdate/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (612, 610, 'Update', 'update', '/jxcPurchase/addOrUpdate/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (613, 610, 'Read & Update', 'index', '/jxcField/queryPageList/3', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (614, 610, 'Read-only', 'read', '/jxcField/information/3,/jxcPurchase/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (615, 610, 'Delete', 'delete', '/jxcPurchase/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (616, 610, 'Change owner', 'transfer', '/jxcField/transfer/3', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (617, 610, 'Update status', 'setState', '/jxcPurchase/setStateByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (618, 610, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (620, 6, 'Purchasing return management', 'retreat', '', NULL, 1, 3, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (621, 620, 'Add New', 'save', '/jxcRetreat/addOrUpdate/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (622, 620, 'Update', 'update', '/jxcRetreat/addOrUpdate/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (623, 620, 'Read & Update', 'index', '/jxcField/queryPageList/4', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (624, 620, 'Read-only', 'read', '/jxcField/information/4,/jxcRetreat/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (625, 620, 'Delete', 'delete', '/jxcRetreat/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (626, 620, 'Change owner', 'transfer', '/jxcField/transfer/4', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (627, 620, 'Update status', 'setState', '/jxcRetreat/setStateByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (628, 620, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (630, 6, 'Product management', 'product', '', NULL, 1, 4, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (631, 630, 'Add New', 'save', '/jxcProduct/addOrUpdate/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (632, 630, 'Update', 'update', '/jxcProduct/addOrUpdate/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (633, 630, 'Read & Update', 'index', '/jxcField/queryList/1,/jxcField/queryPageList/1,/jxcWarehouseProduct/queryPageList,/jxcWarehouseProduct/queryList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (634, 630, 'Read-only', 'read', '/jxcField/information/1,/jxcProduct/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (636, 630, 'Update on/off shelve', 'self', '/jxcProduct/addorUpdateShelf', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (637, 630, 'Delete', 'delete', '/jxcProduct/deleteByIds', NULL, NULL, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (638, 630, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (640, 6, 'Sales management', 'sale', '', NULL, 1, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (641, 640, 'Add New', 'save', '/jxcSale/addOrUpdate/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (642, 640, 'Update', 'update', '/jxcSale/addOrUpdate/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (643, 640, 'Read & Update', 'index', '/jxcField/queryPageList/5', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (644, 640, 'Read-only', 'read', '/jxcField/information/5,/jxcSale/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (645, 640, 'Delete', 'delete', '/jxcSale/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (646, 640, 'Change owner', 'transfer', '/jxcField/transfer/5', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (647, 640, 'Update status', 'setState', '/jxcSale/setStateByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (648, 640, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (650, 6, 'Sales return management', 'salereturn', '', NULL, 1, 6, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (651, 650, 'Add New', 'save', '/jxcSalereturn/addOrUpdate/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (652, 650, 'Update', 'update', '/jxcSalereturn/addOrUpdate/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (653, 650, 'Read & Update', 'index', '/jxcField/queryPageList/6', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (654, 650, 'Read-only', 'read', '/jxcField/information/6,/jxcSalereturn/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (655, 650, 'Delete', 'delete', '/jxcSalereturn/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (656, 650, 'Change owner', 'transfer', '/jxcField/transfer/6', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (657, 650, 'Update status', 'setState', '/jxcSalereturn/setStateByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (658, 650, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (670, 6, 'Warehouse management', 'warehouse', '', NULL, 1, 7, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (671, 670, 'Add New', 'save', '/jxcWarehouse/addOrUpdate/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (672, 670, 'Update', 'update', '/jxcWarehouse/addOrUpdate/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (673, 670, 'Read & Update', 'index', '/jxcWarehouse/queryPageList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (675, 670, 'Delete', 'delete', '/jxcWarehouse/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (676, 670, 'Enable/Disable', 'spst', '/jxcWarehouse/setTrunByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (677, 670, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (680, 6, 'Product inventory management', 'warehouseProduct', '', NULL, 1, 8, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (681, 680, 'Read & Update', 'index', '/jxcWarehouseProduct/queryPageList', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (682, 680, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (690, 6, 'Product stock management', 'receipt', '', NULL, 1, 9, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (691, 690, 'Add New', 'save', '/jxcReceipt/addOrUpdate', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (693, 690, 'Read & Update', 'index', '/jxcField/queryPageList/7', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (694, 690, 'Read-only', 'read', '/jxcField/information/7,/jxcReceipt/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (695, 690, 'Update status', 'setState', '/jxcReceipt/setStateByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (696, 690, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (700, 6, 'Product delivery management', 'outbound', '', NULL, 1, 10, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (701, 700, 'Add New', 'save', '/jxcOutbound/addOrUpdate', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (703, 700, 'Read & Update', 'index', '/jxcField/queryPageList/8', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (704, 700, 'Read-only', 'read', '/jxcField/information/8,/jxcOutbound/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (705, 700, 'Update status', 'setState', '/jxcOutbound/setStateByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (706, 700, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (710, 6, 'Stock transfer management', 'allocation', '', NULL, 1, 11, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (711, 710, 'Add New', 'save', '/jxcAllocation/addOrUpdate/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (712, 710, 'Update', 'update', '/jxcAllocation/addOrUpdate/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (713, 710, 'Read & Update', 'index', '/jxcField/queryPageList/12', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (714, 710, 'Read-only', 'read', '/jxcField/information/12,/jxcAllocation/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (715, 710, 'Delete', 'delete', '/jxcAllocation/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (716, 710, 'Update status', 'setState', '/jxcAllocation/setStateByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (717, 710, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (720, 6, 'Inventory management', 'inventory', '', NULL, 1, 12, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (721, 720, 'Add New', 'save', '/jxcInventory/addOrUpdate/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (722, 720, 'Update', 'update', '/jxcInventory/addOrUpdate/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (723, 720, 'Read & Update', 'index', '/jxcField/queryPageList/11', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (724, 720, 'Read-only', 'read', '/jxcField/information/11,/jxcInventory/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (725, 720, 'Delete', 'delete', '/jxcInventory/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (726, 720, 'Update status', 'setState', '/jxcInventory/setStateByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (727, 720, 'Inventory and storage', 'storage', NULL, NULL, NULL, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (728, 720, 'Check status', 'invalid', '', NULL, NULL, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (729, 720, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (730, 6, 'Inbound and outbound details', 'detailed', '', NULL, 1, 13, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (731, 730, 'Read & Update', 'index', '/jxcField/queryPageList/13', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (732, 730, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (740, 6, 'Pay back management', 'collection', '', NULL, 1, 14, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (741, 740, 'Add New', 'save', '/jxcCollection/addOrUpdate/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (742, 740, 'Update', 'update', '/jxcCollection/addOrUpdate/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (743, 740, 'Read & Update', 'index', '/jxcField/queryPageList/10', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (744, 740, 'Read-only', 'read', '/jxcField/information/10,/jxcCollection/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (745, 740, 'Delete', 'delete', '/jxcCollection/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (746, 740, 'Change owner', 'transfer', '/jxcField/transfer/10', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (747, 740, 'Update status', 'setState', '/jxcCollection/setStateByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (748, 740, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (750, 6, 'Payment management', 'payment', '', NULL, 1, 15, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (751, 750, 'Add New', 'save', '/jxcPayment/addOrUpdate/add', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (752, 750, 'Update', 'update', '/jxcPayment/addOrUpdate/update', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (753, 750, 'Read & Update', 'index', '/jxcField/queryPageList/9', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (754, 750, 'Read-only', 'read', '/jxcField/information/9,/jxcPayment/queryById/*', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (755, 750, 'Delete', 'delete', '/jxcPayment/deleteByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (756, 750, 'Change owner', 'transfer', '/jxcField/transfer/9', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (757, 750, 'Update status', 'setState', '/jxcPayment/setStateByIds', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (758, 750, 'Export', 'excelexport', NULL, NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (760, 2, 'All', 'jxc', '', NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (761, 760, 'Invoicing purchase analysis', 'purchasingStatistics', '', NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (762, 761, 'Read-only', 'read', '/jxcPurchaseStatistics/purchasingStatistics,/jxcProductPurchaseStatistics/productPurchaseStatistics,/jxcProductPurchaseStatistics/purchaseHeadStatistics,/jxcSupplierPurchaseStatistics/supplierPurchaseStatistics', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (763, 760, 'Invoicing sales analysis', 'saleStatistics', '', NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (764, 763, 'Read-only', 'read', '/jxcSaleStatistics/saleStatistics,/jxcProductSaleStatistics/productSaleStatistics,/jxcProductSaleStatistics/saleHeadStatistics,/jxcCustomerSaleStatistics/customerSaleStatistics,/jxcCustomerSaleStatistics/customerSaleStatistics', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (765, 760, 'Invoicing product analysis', 'productStatistics', '', NULL, 1, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (766, 765, 'Read-only', 'read', '/jxcProductStatistics/productStatistics,/jxcProductStatistics/productHeadStatistics', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (800, 5, 'Staff management', 'employee', '', NULL, 1, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (801, 800, 'Add New', 'save', '/hrmEmployee/addEmployee', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (802, 800, 'Update', 'update', '/hrmEmployeePost/updatePostInformation,/hrmEmployee/setEduExperience,/hrmEmployee/addExperience,/hrmEmployee/deleteEduExperience,/hrmEmployee/addWorkExperience,/hrmEmployee/setWorkExperience,/hrmEmployee/deleteWorkExperience,/hrmEmployee/addCertificate,/hrmEmployee/setCertificate,/hrmEmployee/deleteCertificate,/hrmEmployee/addTrainingExperience,/hrmEmployee/setTrainingExperience,/hrmEmployee/deleteTrainingExperience,/hrmEmployee/addContacts,/hrmEmployee/setContacts,/hrmEmployee/deleteContacts,/hrmEmployeeContract/addContract,/hrmEmployeeContract/setContract,/hrmEmployeeContract/deleteContract,/SocialSecurity/setSalaryCard,/SocialSecurity/setSocialSecurity,/hrmEmployeeFile/addFile,/hrmEmployeeFile/deleteFile', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (803, 800, 'Read & Update', 'index', '/hrmEmployee/queryPageList', NULL, 3, 3, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (804, 800, 'Read-only', 'read', '/hrmEmployee/queryById,/hrmEmployeePost/postInformation,/hrmEmployee/personalInformation,/hrmEmployeeContract/contractInformation,/hrmEmployee/SocialSecurity/salarySocialSecurityInformation,/hrmEmployeeFile/queryFileNum', NULL, 3, 4, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (805, 800, 'Import', 'excelimport', '/hrmEmployee/uploadExcel', NULL, 3, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (806, 800, 'Export', 'excelexport', '/hrmEmployee/export', NULL, 3, 6, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (807, 800, 'Delete', 'delete', '/hrmEmployee/deleteByIds', NULL, 3, 7, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (808, 800, 'Formalize', 'become', '/hrmEmployee/become', NULL, 3, 8, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (809, 800, 'Change dept and position', 'changePost', '/hrmEmployee/changePost', NULL, 3, 9, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (810, 800, 'Promotion/demotion', 'promotion', '/hrmEmployee/promotion', NULL, 3, 10, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (811, 800, 'Resignation', 'leave', '/hrmEmployeePost/addLeaveInformation', NULL, 3, 11, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (812, 800, 'Set up an insurance plan', 'setInsured', '/hrmEmployee/updateInsuranceScheme', NULL, 3, 12, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (813, 800, 'Re-entry', 'againOnboarding', '/hrmEmployee/againOnboarding', NULL, 3, 13, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (814, 800, 'Confirm entry', 'confirmEntry', '/hrmEmployee/confirmEntry', NULL, 3, 13, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (815, 800, 'Delete leaving', 'cancelLevel', '/hrmEmployeePost/deleteLeaveInformation', NULL, 3, 14, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (830, 5, 'Organization Management', 'dept', '', NULL, 1, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (831, 830, 'Add New', 'save', '/hrmDept/addDept', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (832, 830, 'Update', 'update', '/hrmDept/setDept', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (833, 830, 'Read & Update', 'index', '', NULL, 3, 3, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (834, 830, 'Read-only', 'read', '/hrmDept/queryById', NULL, 3, 4, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (835, 830, 'Delete', 'delete', '/hrmDept/deleteDeptById', NULL, 3, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (840, 5, 'Payroll management', 'salary', '', NULL, 1, 3, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (841, 840, 'Read & Update', 'manage', '/hrmSalaryMonthRecord/computeSalaryData,/hrmSalaryMonthRecord/updateSalary,/hrmSalaryMonthRecord/submitExamine,/hrmSalaryMonthRecord/addNextMonthSalary', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (842, 840, 'Read-only current salary', 'index', '/hrmSalaryOption/querySalaryOptionDetail', NULL, 3, 2, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (843, 840, 'Read-only history salary', 'history', '/hrmSalaryHistoryRecord/queryHistorySalaryList', NULL, 3, 3, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (844, 840, 'Send pay stubs', 'sendSlip', '/hrmSalarySlipRecord/sendSalarySlip', NULL, 3, 4, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (845, 840, 'Read-only issuance record', 'queryRecord', '', NULL, 3, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (846, 840, 'Read-only archived salary', 'queryArchives', '/hrmSalaryArchives/querySalaryArchivesList', NULL, 3, 6, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (847, 840, 'Update archived salary', 'updateArchives', '/hrmSalaryArchives/setFixSalaryRecord,/hrmSalaryArchives/setChangeSalaryRecord,/deleteChangeSalary/setChangeSalaryRecord,/deleteChangeSalary/batchChangeSalaryRecord,/deleteChangeSalary/exportFixSalaryRecord', NULL, 3, 7, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (850, 5, 'Insurance management', 'insurance', '', NULL, 1, 4, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (851, 850, 'Read & Update', 'manage', '/hrmInsuranceMonthRecord/computeInsuranceData,/hrmInsuranceMonthEmpRecord/stop,/hrmInsuranceMonthEmpRecord/updateInsuranceProject', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (852, 850, 'Read-only', 'read', '/hrmInsuranceMonthRecord/queryInsuranceRecordList', NULL, 3, 2, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (860, 5, 'Recruitment management', 'recruit', '', NULL, 1, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (861, 860, 'Add new candidate', 'save', '/hrmRecruitCandidate/addCandidate', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (862, 860, 'Read-only candidate', 'read', '/hrmRecruitCandidate/queryPageList,/hrmRecruitCandidate/queryById', NULL, 3, 2, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (863, 860, 'Read & Update candidate', 'manage', '/hrmRecruitCandidate/setCandidate,/hrmRecruitCandidate/updateCandidateStatus,/hrmRecruitCandidate/updateCandidatePost,/hrmRecruitCandidate/updateCandidateRecruitChannel,/hrmRecruitCandidate/eliminateCandidate', NULL, 3, 3, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (864, 860, 'Delete candidate', 'delete', '/hrmRecruitCandidate/deleteByIds,/hrmRecruitCandidate/deleteById', NULL, 3, 4, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (865, 860, 'Add new recruitment', 'savePost', '/hrmRecruitPost/addRecruitPost', NULL, 3, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (866, 860, 'Update recruitment', 'updatePost', '/hrmRecruitPost/setRecruitPost', NULL, 3, 6, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (867, 860, 'Read-only recruitment', 'readPost', '/hrmRecruitPost/queryRecruitPostPageList,/hrmRecruitPost/queryById', NULL, 3, 7, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (868, 860, 'Enable/Disable recruitment', 'updatePostStatus', '/hrmRecruitPost/updateRecruitPostStatus', NULL, 3, 8, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (880, 5, 'Performance management', 'appraisal', '', NULL, 1, 6, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (881, 880, 'Add new performance', 'save', '/hrmRecruitPost/addAppraisal', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (882, 880, 'Update performance', 'update', '/hrmRecruitPost/setAppraisal', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (883, 880, 'Read-only performance', 'read', '', NULL, 3, 3, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (884, 880, 'Delete performance', 'delete', '/hrmRecruitPost/delete', NULL, 3, 4, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (885, 880, 'End performance', 'stop', '/hrmRecruitPoststopAppraisal', NULL, 3, 5, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (886, 880, 'Read-only staff performance', 'readEmp', '', NULL, 3, 3, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (890, 5, 'Attendance management', 'attendance', '', NULL, 1, 6, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (891, 890, 'Read-only check-in record', 'readClock', '/hrmRecruitPost/addAppraisal', NULL, 3, 1, 1, 'label-92');
INSERT INTO `wk_admin_menu` VALUES (892, 890, 'Export check-in record', 'excelexport', '/hrmAttendanceClock/excelExport', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (900, 3, 'HRM', 'hrm', NULL, NULL, 1, 10, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (901, 900, 'Custom field settings', 'field', '/hrmConfig/queryFields', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (902, 900, 'Salary settings', 'salary', '/hrmSalaryGroup/querySalaryGroupPageList', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (903, 900, 'Insurance settings', 'insurance', '', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (904, 900, 'Appraisal settings', 'appraisal', '', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (905, 900, 'Business parameter settings', 'params', '/hrmConfig/queryRecruitChannelList', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (906, 900, 'Staff profile settings', 'archives', '', NULL, 3, 2, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (920, 3, 'Invoicing management', 'jxc', NULL, NULL, 1, 11, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (921, 920, 'Custom field settings', 'field', '/jxcField/queryFields', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (922, 920, 'Business parameter settings', 'params', '/jxcProductType/queryJxcProductTyp,/jxcNumberSetting/queryNumberSetting', NULL, 3, 1, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (923, 3, 'Initialization system', 'init', NULL, NULL, 1, 12, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (924, 923, 'Initialization data', 'initData', '/adminConfig/moduleInitData', NULL, 3, 0, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (926, 180, 'Activity form settings', 'activityForm', '/crmMarketingForm/page', NULL, 3, 6, 1, NULL);
INSERT INTO `wk_admin_menu` VALUES (927, 301, 'Manage participant permissions', 'manageTaskOwnerUser', '', NULL, 3, 29, 1, NULL);

-- ----------------------------
-- Table structure for wk_admin_message
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_message`;
CREATE TABLE `wk_admin_message` (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT'message ID',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'message title',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'content',
  `label` int(2) NULL DEFAULT NULL COMMENT'message category 1 task 2 log 3 oa approval 4 announcement 5 schedule 6 crm message 7 knowledge base 8 human resources',
  `type` int(2) NULL DEFAULT NULL COMMENT'Message type, see AdminMessageEnum',
  `type_id` int(11) NULL DEFAULT NULL COMMENT'association ID',
  `create_user` bigint(20) NOT NULL COMMENT'Message creator 0 is the system',
  `recipient_user` bigint(20) NOT NULL COMMENT'recipient',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `is_read` int(1) NULL DEFAULT 0 COMMENT'Whether it has been read 0 unread 1 read',
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT'Read time',
  PRIMARY KEY (`message_id`) USING BTREE,
  INDEX `recipient_user`(`recipient_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='System Message Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_message
-- ----------------------------

-- ----------------------------
-- Table structure for wk_admin_model_sort
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_model_sort`;
CREATE TABLE `wk_admin_model_sort` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `type` int(4) NOT NULL COMMENT'Navigation type 1 head navigation 2 customer management left navigation',
   `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'Module 1 Dashboard 2 To-do list 3 Clue 4 Customer 5 Contact 6 Business opportunity 7 Contract 8 Repayment 9 Invoice 10 Return visit 11 Product 12 Marketing activity',
   `sort` int(4) NOT NULL COMMENT'sort',
   `is_hidden` int(2) NULL DEFAULT 0 COMMENT'whether to hide 0 not to hide 1 to hide',
   `user_id` bigint(20) NOT NULL COMMENT'user id',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Customer Management Navigation Bar Sort Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_model_sort
-- ----------------------------

-- ----------------------------
-- Table structure for wk_admin_official_img
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_official_img`;
CREATE TABLE `wk_admin_official_img` (
   `official_img_id` int(11) NOT NULL AUTO_INCREMENT,
   `size` bigint(20) NULL DEFAULT NULL COMMENT'Attachment size (bytes)',
   `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'The real path of the file',
   `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'file path',
   `type` int(1) NULL DEFAULT NULL COMMENT '1. Official website settings 2. Business card poster',
   `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
   `tactic` int(6) NULL DEFAULT NULL COMMENT '0',
   PRIMARY KEY (`official_img_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Official website picture' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_official_img
-- ----------------------------

-- ----------------------------
-- Table structure for wk_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_role`;
CREATE TABLE `wk_admin_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'name',
  `role_type` int(1) NULL DEFAULT NULL COMMENT '0, custom role 1, management role 2, customer management role 3, personnel role 4, financial role 5, project role 8, project custom role',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Remarks',
  `status` int(3) NULL DEFAULT 1 COMMENT '1 enable 0 disable',
  `data_type` int(1) NOT NULL DEFAULT 5 COMMENT'Data permission 1. I, 2. I and subordinates, 3. This department, 4. This department and subordinate departments, 5, All',
  `is_hidden` int(1) NOT NULL DEFAULT 1 COMMENT '0 hidden 1 not hidden',
  `label` int(2) NULL DEFAULT NULL COMMENT '1 System project administrator role 2 Project management role 3 Project Update role 4 Project read-only role',
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `role_type`(`role_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180177 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Role Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_role
-- ----------------------------
INSERT INTO `wk_admin_role` VALUES (180162, 'Super admin', 1,'admin', 1, 5, 1, 5);
INSERT INTO `wk_admin_role` VALUES (180163, 'System settings administrator', 1, NULL, 1, 2, 1, 6);
INSERT INTO `wk_admin_role` VALUES (180164, 'Department and employee administrators', 1, NULL, 1, 5, 1, 7);
INSERT INTO `wk_admin_role` VALUES (180165, 'Approval flow administrator', 1, NULL, 1, 5, 1, 8);
INSERT INTO `wk_admin_role` VALUES (180166, 'Workbench administrator', 1, NULL, 1, 5, 1, 9);
INSERT INTO `wk_admin_role` VALUES (180167, 'Customer administrator', 1, NULL, 1, 5, 1, 10);
INSERT INTO `wk_admin_role` VALUES (180168, 'Announcement administrator', 7, NULL, 1, 5, 1, 11);
INSERT INTO `wk_admin_role` VALUES (180169, 'Sales manager role', 2, NULL, 1, 5, 1, NULL);
INSERT INTO `wk_admin_role` VALUES (180170, 'Salesperson role', 2, NULL, 1, 1, 1, NULL);
INSERT INTO `wk_admin_role` VALUES (180171, 'Project administrator', 8,'project', 1, 5, 1, 1);
INSERT INTO `wk_admin_role` VALUES (180172, 'Administration', 5,'System default permissions, including all permissions of the project', 1, 5, 0, 2);
INSERT INTO `wk_admin_role` VALUES (180173, 'Update', 5,'Privileges that members enjoy by default when they initially join', 1, 5, 1, 3);
INSERT INTO `wk_admin_role` VALUES (180174, 'Read-only', 5,'project read-only role', 1, 1, 1, 4);
INSERT INTO `wk_admin_role` VALUES (180175, 'Superior role', 9, NULL, 1, 2, 1, 91);

-- ----------------------------
-- Table structure for wk_admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_role_menu`;
CREATE TABLE `wk_admin_role_menu` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `role_id` int(11) NOT NULL COMMENT'role ID',
   `menu_id` int(11) NOT NULL COMMENT'Menu ID',
   PRIMARY KEY (`id`) USING BTREE,
   INDEX `role_id`(`role_id`) USING BTREE,
   INDEX `menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2300834 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Role menu correspondence table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_role_menu
-- ----------------------------
INSERT INTO `wk_admin_role_menu` VALUES (2300572, 180163, 3);
INSERT INTO `wk_admin_role_menu` VALUES (2300573, 180163, 160);
INSERT INTO `wk_admin_role_menu` VALUES (2300574, 180163, 161);
INSERT INTO `wk_admin_role_menu` VALUES (2300575, 180163, 162);
INSERT INTO `wk_admin_role_menu` VALUES (2300576, 180163, 163);
INSERT INTO `wk_admin_role_menu` VALUES (2300577, 180163, 164);
INSERT INTO `wk_admin_role_menu` VALUES (2300578, 180163, 165);
INSERT INTO `wk_admin_role_menu` VALUES (2300579, 180163, 166);
INSERT INTO `wk_admin_role_menu` VALUES (2300580, 180163, 167);
INSERT INTO `wk_admin_role_menu` VALUES (2300581, 180163, 168);
INSERT INTO `wk_admin_role_menu` VALUES (2300582, 180163, 169);
INSERT INTO `wk_admin_role_menu` VALUES (2300583, 180163, 170);
INSERT INTO `wk_admin_role_menu` VALUES (2300584, 180163, 171);
INSERT INTO `wk_admin_role_menu` VALUES (2300585, 180163, 172);
INSERT INTO `wk_admin_role_menu` VALUES (2300586, 180163, 173);
INSERT INTO `wk_admin_role_menu` VALUES (2300587, 180163, 174);
INSERT INTO `wk_admin_role_menu` VALUES (2300588, 180163, 175);
INSERT INTO `wk_admin_role_menu` VALUES (2300589, 180163, 176);
INSERT INTO `wk_admin_role_menu` VALUES (2300590, 180163, 177);
INSERT INTO `wk_admin_role_menu` VALUES (2300591, 180163, 178);
INSERT INTO `wk_admin_role_menu` VALUES (2300592, 180163, 179);
INSERT INTO `wk_admin_role_menu` VALUES (2300593, 180163, 180);
INSERT INTO `wk_admin_role_menu` VALUES (2300594, 180163, 181);
INSERT INTO `wk_admin_role_menu` VALUES (2300595, 180163, 182);
INSERT INTO `wk_admin_role_menu` VALUES (2300596, 180163, 183);
INSERT INTO `wk_admin_role_menu` VALUES (2300597, 180163, 184);
INSERT INTO `wk_admin_role_menu` VALUES (2300598, 180163, 185);
INSERT INTO `wk_admin_role_menu` VALUES (2300599, 180163, 186);
INSERT INTO `wk_admin_role_menu` VALUES (2300600, 180164, 166);
INSERT INTO `wk_admin_role_menu` VALUES (2300601, 180164, 167);
INSERT INTO `wk_admin_role_menu` VALUES (2300602, 180164, 168);
INSERT INTO `wk_admin_role_menu` VALUES (2300603, 180164, 169);
INSERT INTO `wk_admin_role_menu` VALUES (2300604, 180164, 170);
INSERT INTO `wk_admin_role_menu` VALUES (2300605, 180164, 171);
INSERT INTO `wk_admin_role_menu` VALUES (2300606, 180164, 172);
INSERT INTO `wk_admin_role_menu` VALUES (2300607, 180164, 173);
INSERT INTO `wk_admin_role_menu` VALUES (2300608, 180165, 178);
INSERT INTO `wk_admin_role_menu` VALUES (2300609, 180165, 179);
INSERT INTO `wk_admin_role_menu` VALUES (2300610, 180166, 176);
INSERT INTO `wk_admin_role_menu` VALUES (2300611, 180166, 177);
INSERT INTO `wk_admin_role_menu` VALUES (2300612, 180167, 180);
INSERT INTO `wk_admin_role_menu` VALUES (2300613, 180167, 181);
INSERT INTO `wk_admin_role_menu` VALUES (2300614, 180167, 182);
INSERT INTO `wk_admin_role_menu` VALUES (2300615, 180167, 183);
INSERT INTO `wk_admin_role_menu` VALUES (2300616, 180167, 184);
INSERT INTO `wk_admin_role_menu` VALUES (2300617, 180168, 187);
INSERT INTO `wk_admin_role_menu` VALUES (2300618, 180168, 188);
INSERT INTO `wk_admin_role_menu` VALUES (2300619, 180168, 189);
INSERT INTO `wk_admin_role_menu` VALUES (2300620, 180168, 190);
INSERT INTO `wk_admin_role_menu` VALUES (2300621, 180169, 9);
INSERT INTO `wk_admin_role_menu` VALUES (2300622, 180169, 10);
INSERT INTO `wk_admin_role_menu` VALUES (2300623, 180169, 11);
INSERT INTO `wk_admin_role_menu` VALUES (2300624, 180169, 12);
INSERT INTO `wk_admin_role_menu` VALUES (2300625, 180169, 13);
INSERT INTO `wk_admin_role_menu` VALUES (2300626, 180169, 14);
INSERT INTO `wk_admin_role_menu` VALUES (2300627, 180169, 17);
INSERT INTO `wk_admin_role_menu` VALUES (2300628, 180169, 18);
INSERT INTO `wk_admin_role_menu` VALUES (2300629, 180169, 19);
INSERT INTO `wk_admin_role_menu` VALUES (2300630, 180169, 20);
INSERT INTO `wk_admin_role_menu` VALUES (2300631, 180169, 21);
INSERT INTO `wk_admin_role_menu` VALUES (2300632, 180169, 22);
INSERT INTO `wk_admin_role_menu` VALUES (2300633, 180169, 23);
INSERT INTO `wk_admin_role_menu` VALUES (2300634, 180169, 24);
INSERT INTO `wk_admin_role_menu` VALUES (2300635, 180169, 25);
INSERT INTO `wk_admin_role_menu` VALUES (2300636, 180169, 26);
INSERT INTO `wk_admin_role_menu` VALUES (2300637, 180169, 27);
INSERT INTO `wk_admin_role_menu` VALUES (2300638, 180169, 28);
INSERT INTO `wk_admin_role_menu` VALUES (2300639, 180169, 29);
INSERT INTO `wk_admin_role_menu` VALUES (2300640, 180169, 30);
INSERT INTO `wk_admin_role_menu` VALUES (2300641, 180169, 31);
INSERT INTO `wk_admin_role_menu` VALUES (2300642, 180169, 32);
INSERT INTO `wk_admin_role_menu` VALUES (2300643, 180169, 33);
INSERT INTO `wk_admin_role_menu` VALUES (2300644, 180169, 34);
INSERT INTO `wk_admin_role_menu` VALUES (2300645, 180169, 35);
INSERT INTO `wk_admin_role_menu` VALUES (2300646, 180169, 36);
INSERT INTO `wk_admin_role_menu` VALUES (2300647, 180169, 40);
INSERT INTO `wk_admin_role_menu` VALUES (2300648, 180169, 41);
INSERT INTO `wk_admin_role_menu` VALUES (2300649, 180169, 42);
INSERT INTO `wk_admin_role_menu` VALUES (2300650, 180169, 43);
INSERT INTO `wk_admin_role_menu` VALUES (2300651, 180169, 44);
INSERT INTO `wk_admin_role_menu` VALUES (2300652, 180169, 45);
INSERT INTO `wk_admin_role_menu` VALUES (2300653, 180169, 46);
INSERT INTO `wk_admin_role_menu` VALUES (2300654, 180169, 47);
INSERT INTO `wk_admin_role_menu` VALUES (2300655, 180169, 48);
INSERT INTO `wk_admin_role_menu` VALUES (2300656, 180169, 49);
INSERT INTO `wk_admin_role_menu` VALUES (2300657, 180169, 50);
INSERT INTO `wk_admin_role_menu` VALUES (2300658, 180169, 51);
INSERT INTO `wk_admin_role_menu` VALUES (2300659, 180169, 52);
INSERT INTO `wk_admin_role_menu` VALUES (2300660, 180169, 53);
INSERT INTO `wk_admin_role_menu` VALUES (2300661, 180169, 54);
INSERT INTO `wk_admin_role_menu` VALUES (2300662, 180169, 55);
INSERT INTO `wk_admin_role_menu` VALUES (2300663, 180169, 56);
INSERT INTO `wk_admin_role_menu` VALUES (2300664, 180169, 57);
INSERT INTO `wk_admin_role_menu` VALUES (2300665, 180169, 58);
INSERT INTO `wk_admin_role_menu` VALUES (2300666, 180169, 59);
INSERT INTO `wk_admin_role_menu` VALUES (2300667, 180169, 60);
INSERT INTO `wk_admin_role_menu` VALUES (2300668, 180169, 61);
INSERT INTO `wk_admin_role_menu` VALUES (2300669, 180169, 62);
INSERT INTO `wk_admin_role_menu` VALUES (2300670, 180169, 63);
INSERT INTO `wk_admin_role_menu` VALUES (2300671, 180169, 64);
INSERT INTO `wk_admin_role_menu` VALUES (2300672, 180169, 67);
INSERT INTO `wk_admin_role_menu` VALUES (2300673, 180169, 68);
INSERT INTO `wk_admin_role_menu` VALUES (2300674, 180169, 97);
INSERT INTO `wk_admin_role_menu` VALUES (2300675, 180169, 98);
INSERT INTO `wk_admin_role_menu` VALUES (2300676, 180169, 99);
INSERT INTO `wk_admin_role_menu` VALUES (2300677, 180169, 101);
INSERT INTO `wk_admin_role_menu` VALUES (2300678, 180169, 102);
INSERT INTO `wk_admin_role_menu` VALUES (2300679, 180169, 103);
INSERT INTO `wk_admin_role_menu` VALUES (2300680, 180169, 104);
INSERT INTO `wk_admin_role_menu` VALUES (2300681, 180169, 106);
INSERT INTO `wk_admin_role_menu` VALUES (2300682, 180169, 107);
INSERT INTO `wk_admin_role_menu` VALUES (2300683, 180169, 108);
INSERT INTO `wk_admin_role_menu` VALUES (2300684, 180169, 117);
INSERT INTO `wk_admin_role_menu` VALUES (2300685, 180169, 118);
INSERT INTO `wk_admin_role_menu` VALUES (2300686, 180169, 123);
INSERT INTO `wk_admin_role_menu` VALUES (2300687, 180169, 124);
INSERT INTO `wk_admin_role_menu` VALUES (2300688, 180169, 125);
INSERT INTO `wk_admin_role_menu` VALUES (2300689, 180169, 126);
INSERT INTO `wk_admin_role_menu` VALUES (2300690, 180169, 191);
INSERT INTO `wk_admin_role_menu` VALUES (2300691, 180169, 192);
INSERT INTO `wk_admin_role_menu` VALUES (2300692, 180170, 14);
INSERT INTO `wk_admin_role_menu` VALUES (2300693, 180170, 17);
INSERT INTO `wk_admin_role_menu` VALUES (2300694, 180170, 18);
INSERT INTO `wk_admin_role_menu` VALUES (2300695, 180170, 19);
INSERT INTO `wk_admin_role_menu` VALUES (2300696, 180170, 20);
INSERT INTO `wk_admin_role_menu` VALUES (2300697, 180170, 21);
INSERT INTO `wk_admin_role_menu` VALUES (2300698, 180170, 25);
INSERT INTO `wk_admin_role_menu` VALUES (2300699, 180170, 26);
INSERT INTO `wk_admin_role_menu` VALUES (2300700, 180170, 27);
INSERT INTO `wk_admin_role_menu` VALUES (2300701, 180170, 28);
INSERT INTO `wk_admin_role_menu` VALUES (2300702, 180170, 29);
INSERT INTO `wk_admin_role_menu` VALUES (2300703, 180170, 30);
INSERT INTO `wk_admin_role_menu` VALUES (2300704, 180170, 34);
INSERT INTO `wk_admin_role_menu` VALUES (2300705, 180170, 35);
INSERT INTO `wk_admin_role_menu` VALUES (2300706, 180170, 36);
INSERT INTO `wk_admin_role_menu` VALUES (2300707, 180170, 40);
INSERT INTO `wk_admin_role_menu` VALUES (2300708, 180170, 41);
INSERT INTO `wk_admin_role_menu` VALUES (2300709, 180170, 42);
INSERT INTO `wk_admin_role_menu` VALUES (2300710, 180170, 43);
INSERT INTO `wk_admin_role_menu` VALUES (2300711, 180170, 44);
INSERT INTO `wk_admin_role_menu` VALUES (2300712, 180170, 45);
INSERT INTO `wk_admin_role_menu` VALUES (2300713, 180170, 46);
INSERT INTO `wk_admin_role_menu` VALUES (2300714, 180170, 47);
INSERT INTO `wk_admin_role_menu` VALUES (2300715, 180170, 48);
INSERT INTO `wk_admin_role_menu` VALUES (2300716, 180170, 49);
INSERT INTO `wk_admin_role_menu` VALUES (2300717, 180170, 50);
INSERT INTO `wk_admin_role_menu` VALUES (2300718, 180170, 52);
INSERT INTO `wk_admin_role_menu` VALUES (2300719, 180170, 53);
INSERT INTO `wk_admin_role_menu` VALUES (2300720, 180170, 54);
INSERT INTO `wk_admin_role_menu` VALUES (2300721, 180170, 55);
INSERT INTO `wk_admin_role_menu` VALUES (2300722, 180170, 56);
INSERT INTO `wk_admin_role_menu` VALUES (2300723, 180170, 57);
INSERT INTO `wk_admin_role_menu` VALUES (2300724, 180170, 59);
INSERT INTO `wk_admin_role_menu` VALUES (2300725, 180170, 60);
INSERT INTO `wk_admin_role_menu` VALUES (2300726, 180170, 61);
INSERT INTO `wk_admin_role_menu` VALUES (2300727, 180170, 62);
INSERT INTO `wk_admin_role_menu` VALUES (2300728, 180170, 63);
INSERT INTO `wk_admin_role_menu` VALUES (2300729, 180170, 64);
INSERT INTO `wk_admin_role_menu` VALUES (2300730, 180170, 67);
INSERT INTO `wk_admin_role_menu` VALUES (2300731, 180170, 68);
INSERT INTO `wk_admin_role_menu` VALUES (2300732, 180170, 97);
INSERT INTO `wk_admin_role_menu` VALUES (2300733, 180170, 98);
INSERT INTO `wk_admin_role_menu` VALUES (2300734, 180170, 99);
INSERT INTO `wk_admin_role_menu` VALUES (2300735, 180170, 101);
INSERT INTO `wk_admin_role_menu` VALUES (2300736, 180170, 102);
INSERT INTO `wk_admin_role_menu` VALUES (2300737, 180170, 103);
INSERT INTO `wk_admin_role_menu` VALUES (2300738, 180170, 104);
INSERT INTO `wk_admin_role_menu` VALUES (2300739, 180170, 106);
INSERT INTO `wk_admin_role_menu` VALUES (2300740, 180170, 108);
INSERT INTO `wk_admin_role_menu` VALUES (2300741, 180170, 117);
INSERT INTO `wk_admin_role_menu` VALUES (2300742, 180170, 118);
INSERT INTO `wk_admin_role_menu` VALUES (2300743, 180170, 123);
INSERT INTO `wk_admin_role_menu` VALUES (2300744, 180170, 124);
INSERT INTO `wk_admin_role_menu` VALUES (2300745, 180170, 125);
INSERT INTO `wk_admin_role_menu` VALUES (2300746, 180170, 126);
INSERT INTO `wk_admin_role_menu` VALUES (2300747, 180173, 316);
INSERT INTO `wk_admin_role_menu` VALUES (2300748, 180173, 317);
INSERT INTO `wk_admin_role_menu` VALUES (2300749, 180173, 318);
INSERT INTO `wk_admin_role_menu` VALUES (2300750, 180173, 319);
INSERT INTO `wk_admin_role_menu` VALUES (2300751, 180173, 320);
INSERT INTO `wk_admin_role_menu` VALUES (2300752, 180173, 321);
INSERT INTO `wk_admin_role_menu` VALUES (2300753, 180173, 322);
INSERT INTO `wk_admin_role_menu` VALUES (2300754, 180173, 323);
INSERT INTO `wk_admin_role_menu` VALUES (2300755, 180173, 324);
INSERT INTO `wk_admin_role_menu` VALUES (2300756, 180173, 325);
INSERT INTO `wk_admin_role_menu` VALUES (2300757, 180173, 326);
INSERT INTO `wk_admin_role_menu` VALUES (2300758, 180173, 327);
INSERT INTO `wk_admin_role_menu` VALUES (2300759, 180173, 329);
INSERT INTO `wk_admin_role_menu` VALUES (2300760, 180173, 330);
INSERT INTO `wk_admin_role_menu` VALUES (2300761, 180173, 331);
INSERT INTO `wk_admin_role_menu` VALUES (2300762, 180173, 332);
INSERT INTO `wk_admin_role_menu` VALUES (2300763, 180173, 333);
INSERT INTO `wk_admin_role_menu` VALUES (2300764, 180173, 334);
INSERT INTO `wk_admin_role_menu` VALUES (2300765, 180173, 335);
INSERT INTO `wk_admin_role_menu` VALUES (2300766, 180173, 337);
INSERT INTO `wk_admin_role_menu` VALUES (2300767, 180171, 149);
INSERT INTO `wk_admin_role_menu` VALUES (2300768, 180171, 152);
INSERT INTO `wk_admin_role_menu` VALUES (2300769, 180171, 153);
INSERT INTO `wk_admin_role_menu` VALUES (2300770, 180169, 2);
INSERT INTO `wk_admin_role_menu` VALUES (2300771, 180169, 15);
INSERT INTO `wk_admin_role_menu` VALUES (2300772, 180169, 65);
INSERT INTO `wk_admin_role_menu` VALUES (2300773, 180169, 66);
INSERT INTO `wk_admin_role_menu` VALUES (2300774, 180169, 69);
INSERT INTO `wk_admin_role_menu` VALUES (2300775, 180169, 70);
INSERT INTO `wk_admin_role_menu` VALUES (2300776, 180169, 109);
INSERT INTO `wk_admin_role_menu` VALUES (2300777, 180169, 110);
INSERT INTO `wk_admin_role_menu` VALUES (2300778, 180169, 193);
INSERT INTO `wk_admin_role_menu` VALUES (2300779, 180169, 194);
INSERT INTO `wk_admin_role_menu` VALUES (2300780, 180169, 195);
INSERT INTO `wk_admin_role_menu` VALUES (2300781, 180169, 211);
INSERT INTO `wk_admin_role_menu` VALUES (2300782, 180169, 400);
INSERT INTO `wk_admin_role_menu` VALUES (2300783, 180169, 401);
INSERT INTO `wk_admin_role_menu` VALUES (2300784, 180169, 402);
INSERT INTO `wk_admin_role_menu` VALUES (2300785, 180169, 403);
INSERT INTO `wk_admin_role_menu` VALUES (2300786, 180169, 404);
INSERT INTO `wk_admin_role_menu` VALUES (2300787, 180169, 405);
INSERT INTO `wk_admin_role_menu` VALUES (2300788, 180169, 420);
INSERT INTO `wk_admin_role_menu` VALUES (2300789, 180169, 421);
INSERT INTO `wk_admin_role_menu` VALUES (2300790, 180169, 422);
INSERT INTO `wk_admin_role_menu` VALUES (2300791, 180169, 423);
INSERT INTO `wk_admin_role_menu` VALUES (2300792, 180169, 424);
INSERT INTO `wk_admin_role_menu` VALUES (2300793, 180169, 425);
INSERT INTO `wk_admin_role_menu` VALUES (2300794, 180169, 426);
INSERT INTO `wk_admin_role_menu` VALUES (2300795, 180169, 427);
INSERT INTO `wk_admin_role_menu` VALUES (2300796, 180169, 428);
INSERT INTO `wk_admin_role_menu` VALUES (2300797, 180169, 440);
INSERT INTO `wk_admin_role_menu` VALUES (2300798, 180169, 441);
INSERT INTO `wk_admin_role_menu` VALUES (2300799, 180169, 442);
INSERT INTO `wk_admin_role_menu` VALUES (2300800, 180169, 443);
INSERT INTO `wk_admin_role_menu` VALUES (2300801, 180169, 444);
INSERT INTO `wk_admin_role_menu` VALUES (2300802, 180170, 400);
INSERT INTO `wk_admin_role_menu` VALUES (2300803, 180170, 401);
INSERT INTO `wk_admin_role_menu` VALUES (2300804, 180170, 402);
INSERT INTO `wk_admin_role_menu` VALUES (2300805, 180170, 403);
INSERT INTO `wk_admin_role_menu` VALUES (2300806, 180170, 404);
INSERT INTO `wk_admin_role_menu` VALUES (2300807, 180170, 405);
INSERT INTO `wk_admin_role_menu` VALUES (2300808, 180170, 420);
INSERT INTO `wk_admin_role_menu` VALUES (2300809, 180170, 421);
INSERT INTO `wk_admin_role_menu` VALUES (2300810, 180170, 422);
INSERT INTO `wk_admin_role_menu` VALUES (2300811, 180170, 423);
INSERT INTO `wk_admin_role_menu` VALUES (2300812, 180170, 424);
INSERT INTO `wk_admin_role_menu` VALUES (2300813, 180170, 425);
INSERT INTO `wk_admin_role_menu` VALUES (2300814, 180170, 426);
INSERT INTO `wk_admin_role_menu` VALUES (2300815, 180170, 427);
INSERT INTO `wk_admin_role_menu` VALUES (2300816, 180170, 428);
INSERT INTO `wk_admin_role_menu` VALUES (2300817, 180170, 440);
INSERT INTO `wk_admin_role_menu` VALUES (2300818, 180170, 441);
INSERT INTO `wk_admin_role_menu` VALUES (2300819, 180170, 442);
INSERT INTO `wk_admin_role_menu` VALUES (2300820, 180170, 443);
INSERT INTO `wk_admin_role_menu` VALUES (2300821, 180170, 444);
INSERT INTO `wk_admin_role_menu` VALUES (2300822, 180176, 803);
INSERT INTO `wk_admin_role_menu` VALUES (2300823, 180176, 804);
INSERT INTO `wk_admin_role_menu` VALUES (2300824, 180176, 833);
INSERT INTO `wk_admin_role_menu` VALUES (2300825, 180176, 834);
INSERT INTO `wk_admin_role_menu` VALUES (2300826, 180176, 842);
INSERT INTO `wk_admin_role_menu` VALUES (2300827, 180176, 843);
INSERT INTO `wk_admin_role_menu` VALUES (2300828, 180176, 846);
INSERT INTO `wk_admin_role_menu` VALUES (2300829, 180176, 852);
INSERT INTO `wk_admin_role_menu` VALUES (2300830, 180176, 862);
INSERT INTO `wk_admin_role_menu` VALUES (2300831, 180176, 867);
INSERT INTO `wk_admin_role_menu` VALUES (2300832, 180176, 886);
INSERT INTO `wk_admin_role_menu` VALUES (2300833, 180176, 891);

-- ----------------------------
-- Table structure for wk_admin_system_log
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_system_log`;
CREATE TABLE `wk_admin_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_user_id` int(20) NOT NULL COMMENT'operator id',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'IP address',
  `types` int(4) NULL DEFAULT NULL COMMENT'Module 1 Enterprise Home Page 2 Application Management 3 Staff and Department Management 4 Business Card Mini Program Management 5 Role Authority Management 6 Approval Flow (Contract/Receipt) 7 Approval Flow (Office) 8 Projects Management 9 customer management 10 system log management 11 other settings',
  `behavior` int(4) NULL DEFAULT NULL COMMENT'behavior',
  `object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Operation object',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Operation details',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='System log table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_system_log
-- ----------------------------

-- ----------------------------
-- Table structure for wk_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_user`;
CREATE TABLE `wk_admin_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT'primary key',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'username',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'password',
  `salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'safety character',
  `img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'avatar',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'real name',
  `num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Employee Number',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'mobile phone number',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'mailbox',
  `sex` int(1) NULL DEFAULT NULL COMMENT '0 not selected 1 male 2 female',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT'Department',
  `post` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'post',
  `status` int(3) NULL DEFAULT 2 COMMENT'Status, 0 disabled, 1 normal, 2 not activated',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT'Direct parent ID',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT'Last login time',
  `last_login_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Last login IP Note that it is compatible with IPV6',
  `old_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `dept_id`(`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='User Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_user
-- ----------------------------
INSERT INTO `wk_admin_user` (`user_id`, `username`, `password`, `salt`, `img`, `create_time`, `realname`, `num`, `mobile`, `email`, `sex`, `dept_id`, `post`, `status`, `parent_id`, `last_login_time`, `last_login_ip`, `old_user_id`) VALUES
(14773, '18411632871', 'c47b992d3cf3094ca764fe8ab89f15f9', '0040c1616e5f430ba5b559e2c8362abf', NULL, '2021-01-09 21:43:17', 'admin', NULL, '18411632871', NULL, NULL, 14852, 'Standard position', 1, 0, '2021-01-11 13:44:12', '45.14.71.9', NULL),
(14774, 'longbinh01', 'ef53d29ded98cbd2859d3f722414916a', '8af939e3c6ff4b5b93be64077ff07157', NULL, '2021-01-11 12:32:07', 'Long Bình', '985356185224951', 'longbinh01', '', 1, 14852, NULL, 1, 14773, '2021-01-11 13:45:23', '46.166.182.71', NULL);

-- ----------------------------
-- Table structure for wk_admin_user_config
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_user_config`;
CREATE TABLE `wk_admin_user_config` (
   `setting_id` int(9) NOT NULL AUTO_INCREMENT,
   `user_id` bigint(20) NOT NULL,
   `status` int(1) NOT NULL DEFAULT 0 COMMENT'status, 0: not enabled 1: enabled',
   `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Set name',
   `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'value',
   `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Description',
   PRIMARY KEY (`setting_id`) USING BTREE,
   INDEX `name`(`name`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114574 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='User Configuration Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_user_config
-- ----------------------------
INSERT INTO `wk_admin_user_config` VALUES (114563, 14773, 1, 'ActivityPhrase', 'No one answered the phone', 'Follow-up record common phrases');
INSERT INTO `wk_admin_user_config` VALUES (114564, 14773, 1, 'ActivityPhrase', 'Customer has no intention', 'Follow-up record common phrases');
INSERT INTO `wk_admin_user_config` VALUES (114565, 14773, 1, 'ActivityPhrase', 'Customer intention is moderate, follow up in the future', 'Follow up and record common phrases');
INSERT INTO `wk_admin_user_config` VALUES (114566, 14773, 1, 'ActivityPhrase', 'Customer intention is strong, the probability of a deal is greater', 'Follow-up record common phrases');
INSERT INTO `wk_admin_user_config` VALUES (114567, 14773, 1, 'readNotice','', 'Upgrade log reading status');
INSERT INTO `wk_admin_user_config` VALUES (114568, 14773, 1, 'readNotice','', 'Upgrade log reading status');
INSERT INTO `wk_admin_user_config` VALUES (114569, 14774, 1, 'ActivityPhrase', 'The phone is unanswered', 'Follow-up record common phrases');
INSERT INTO `wk_admin_user_config` VALUES (114570, 14774, 1, 'ActivityPhrase', 'Customer has no intention', 'Follow-up record common phrases');
INSERT INTO `wk_admin_user_config` VALUES (114571, 14774, 1, 'ActivityPhrase', 'Customer intention is moderate, follow up in the future', 'Follow up and record common phrases');
INSERT INTO `wk_admin_user_config` VALUES (114572, 14774, 1, 'ActivityPhrase', 'Customer intention is strong, the probability of transaction is greater', 'Follow-up record common phrases');
INSERT INTO `wk_admin_user_config` VALUES (114573, 14774, 1, 'readNotice', '', 'Upgrade log reading status');

-- ----------------------------
-- Table structure for wk_admin_user_his_table
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_user_his_table`;
CREATE TABLE `wk_admin_user_his_table` (
   `his_table_id` int(11) NOT NULL AUTO_INCREMENT,
   `user_id` bigint(20) NULL DEFAULT NULL,
   `his_table` int(1) NULL DEFAULT NULL COMMENT '0 no 1 yes',
   `type` int(1) NULL DEFAULT 1 COMMENT '1. Agent authorization 2. Set default business card 3. Associate employees',
   PRIMARY KEY (`his_table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Authorized seats' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_user_his_table
-- ----------------------------

-- ----------------------------
-- Table structure for wk_admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_user_role`;
CREATE TABLE `wk_admin_user_role` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `user_id` bigint(20) NOT NULL COMMENT'User ID',
   `role_id` int(11) NOT NULL COMMENT'role ID',
   PRIMARY KEY (`id`) USING BTREE,
   INDEX `user_id`(`user_id`) USING BTREE,
   INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19221 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='User role correspondence table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_user_role
-- ----------------------------
INSERT INTO `wk_admin_user_role` VALUES (19219, 14773, 180162);
INSERT INTO `wk_admin_user_role` VALUES (19220, 14774, 180162);


-- ----------------------------
-- Table structure for wk_admin_visiting_card
-- ----------------------------
DROP TABLE IF EXISTS `wk_admin_visiting_card`;
CREATE TABLE `wk_admin_visiting_card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Business card name',
  `create_user_id` bigint(11) NULL DEFAULT NULL COMMENT'creator',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `user_id` bigint(11) NULL DEFAULT NULL COMMENT'Associated employee id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Remarks',
  `openid` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wechat_number` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Wechat',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'URL',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'address',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Introduction',
  `weixin_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'WeChat Mini Program Code',
  `official_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'poster business card',
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Business card table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_admin_visiting_card
-- ----------------------------

-- ----------------------------
-- Table structure for wk_call_record
-- ----------------------------
DROP TABLE IF EXISTS `wk_call_record`;
CREATE TABLE `wk_call_record` (
  `call_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'primary key record id',
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'phone number',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT'Start ringing time',
  `answer_time` datetime(0) NULL DEFAULT NULL COMMENT'on time',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT'End time',
  `talk_time` int(10) NULL DEFAULT 0 COMMENT'Talk time (seconds)',
  `dial_time` int(10) NULL DEFAULT 0 COMMENT'Off hook time',
  `state` int(2) NULL DEFAULT NULL COMMENT'Call status (0 not ringing, 1 not connected, 2 connected, 3 incoming call not connected)',
  `type` int(2) NULL DEFAULT NULL COMMENT'Call type (0 call out, 1 call in)',
  `model` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Association module leads, customer, contacts',
  `model_id` int(11) NULL DEFAULT NULL COMMENT'Associated module ID',
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Recording file path',
  `size` int(10) NULL DEFAULT 0 COMMENT'Recording file size',
  `file_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'File name',
  `call_upload` tinyint(1) NULL DEFAULT 0 COMMENT '0: CRM server; 1: upload to Alibaba Cloud',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'modification time',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Person in charge ID',
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'batch',
  PRIMARY KEY (`call_record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Call history' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_call_record
-- ----------------------------

-- ----------------------------
-- Table structure for wk_card_weixin_browse
-- ----------------------------
DROP TABLE IF EXISTS `wk_card_weixin_browse`;
CREATE TABLE `wk_card_weixin_browse` (
   `browse_id` bigint(20) NOT NULL AUTO_INCREMENT,
   `user_id` bigint(20) NULL DEFAULT NULL COMMENT'Business card table',
   `weixin_leads_id` bigint(20) NULL DEFAULT NULL COMMENT'WeChat leads table',
   `create_time` datetime(0) NULL DEFAULT NULL,
   `num` int(11) NULL DEFAULT 0 COMMENT'Number of views',
   `update_time` datetime(0) NULL DEFAULT NULL,
   PRIMARY KEY (`browse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='WeChat browsing business card table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_card_weixin_browse
-- ----------------------------

-- ----------------------------
-- Table structure for wk_card_weixin_leads
-- ----------------------------
DROP TABLE IF EXISTS `wk_card_weixin_leads`;
CREATE TABLE `wk_card_weixin_leads` (
  `weixin_leads_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_transform` int(1) NULL DEFAULT 0 COMMENT '1 has been Transfer 0 is not Transfer',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  `owner_user_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `weixin_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'WeChat avatar',
  `weixin_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'WeChat name',
  `weixin_number` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'WeChat ID',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'mobile number',
  `openid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'WeChat unique identifier',
  `sex` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`weixin_leads_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='WeChat clues' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_card_weixin_leads
-- ----------------------------

-- ----------------------------
-- Table structure for wk_card_weixin_leads_user
-- ----------------------------
DROP TABLE IF EXISTS `wk_card_weixin_leads_user`;
CREATE TABLE `wk_card_weixin_leads_user` (
   `weixin_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
   `user_id` bigint(20) NULL DEFAULT NULL COMMENT'The id of the employee being followed',
   `weixin_leads_id` bigint(20) NULL DEFAULT NULL COMMENT'WeChat lead id',
   `create_time` datetime(0) NULL DEFAULT NULL,
   `relevance_user_id` bigint(20) NULL DEFAULT NULL COMMENT'employee id',
   PRIMARY KEY (`weixin_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Business card holder' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_card_weixin_leads_user
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_achievement
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_achievement`;
CREATE TABLE `wk_crm_achievement` (
  `achievement_id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) NULL DEFAULT NULL COMMENT'Object ID',
  `type` int(2) NULL DEFAULT 0 COMMENT '1 company 2 department 3 employees',
  `year` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'year',
  `january` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'January',
  `february` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'February',
  `march` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'March',
  `april` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'April',
  `may` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'May',
  `june` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'June',
  `july` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'July',
  `august` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'August',
  `september` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'September',
  `october` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'October',
  `november` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'November',
  `december` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'December',
  `status` int(2) NULL DEFAULT NULL COMMENT '1 sales (target) 2 payment (target)',
  `yeartarget` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'year target',
  PRIMARY KEY (`achievement_id`) USING BTREE,
  INDEX `obj_id`(`obj_id`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='performance target' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_achievement
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_action_record
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_action_record`;
CREATE TABLE `wk_crm_action_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_user_id` bigint(20) NOT NULL COMMENT'Operator ID',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'ip address',
  `types` int(4) NOT NULL COMMENT'module type',
  `action_id` int(11) NULL DEFAULT NULL COMMENT'ID of the operated object',
  `object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'object',
  `behavior` int(4) NULL DEFAULT NULL COMMENT'behavior',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT'content',
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT'details',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `types`(`types`, `action_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Field operation record table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_action_record
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_activity
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_activity`;
CREATE TABLE `wk_crm_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'activity id',
  `type` int(1) NULL DEFAULT NULL COMMENT'Activity type 1 follow-up record 2 create record 3 business opportunity phase change 4 field work sign-in',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'follow-up type',
  `activity_type` int(1) NOT NULL COMMENT'Activity type 1 lead 2 customer 3 contact 4 product 5 business opportunity 6 contract 7 payment collection 8 log 9 approval 10 schedule 11 task 12 send email',
  `activity_type_id` int(11) NOT NULL COMMENT'activity type Id',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Activity content',
  `business_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'associated business opportunity',
  `contacts_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Associated contacts',
  `next_time` datetime(0) NULL DEFAULT NULL COMMENT'Next contact time',
  `status` int(2) NULL DEFAULT 1 COMMENT '0 Delete 1 Not Delete',
  `lng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'longitude',
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'latitude',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'check-in address',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator id',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'batch id',
  PRIMARY KEY (`activity_id`) USING BTREE,
  INDEX `wk_crm_activity_type_activity_type_index`(`type`, `activity_type`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='crm activity table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_activity
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_activity_relation`;
CREATE TABLE `wk_crm_activity_relation` (
   `r_id` int(11) NOT NULL AUTO_INCREMENT,
   `activity_id` int(11) NOT NULL,
   `type` int(1) NOT NULL COMMENT '3 contacts 5 business opportunities',
   `type_id` int(11) NOT NULL,
   PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Activity related business opportunity contact table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_activity_relation
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_area
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_area`;
CREATE TABLE `wk_crm_area`  (
  `code_id` int(11) NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Place name table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_area
-- ----------------------------
INSERT INTO `wk_crm_area` VALUES (513222, 513200, 'Lixian');
INSERT INTO `wk_crm_area` VALUES (513233, 513200, 'Hongyuan County');
INSERT INTO `wk_crm_area` VALUES (513221, 513200, 'Wenchuan County');
INSERT INTO `wk_crm_area` VALUES (513232, 513200, 'Zuoergai County');
INSERT INTO `wk_crm_area` VALUES (513231, 513200, 'Aba County');
INSERT INTO `wk_crm_area` VALUES (513230, 513200, 'Rangtang County');
INSERT INTO `wk_crm_area` VALUES (513226, 513200, 'Jinchuan County');
INSERT INTO `wk_crm_area` VALUES (513225, 513200, 'Jiuzhaigou County');
INSERT INTO `wk_crm_area` VALUES (513224, 513200, 'Songpan County');
INSERT INTO `wk_crm_area` VALUES (513201, 513200, 'Marcan City');
INSERT INTO `wk_crm_area` VALUES (513223, 513200, 'Mao County');

-- ----------------------------
-- Table structure for wk_crm_back_log_deal
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_back_log_deal`;
CREATE TABLE `wk_crm_back_log_deal` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `model` int(2) NOT NULL COMMENT'To-do item module 1 Need to contact the customer today 2 Lead assigned to me 3 Assigned to my customer 4 Customers waiting to enter the high seas 5 Contract pending review 6 Receipt pending review 7 Receipt pending review Reminder 8 The contract is about to expire 9 The contract to be visited back 10 The invoice to be reviewed',
   `crm_type` int(2) NOT NULL COMMENT'data module',
   `type_id` int(11) NOT NULL COMMENT'data id',
   `pool_id` int(11) NULL DEFAULT NULL COMMENT'High seas id',
   `create_time` datetime(0) NOT NULL COMMENT'create time',
   `create_user_id` bigint(20) NOT NULL COMMENT'creator',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='To-do tag processing table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_back_log_deal
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_business
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_business`;
CREATE TABLE `wk_crm_business` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NULL DEFAULT NULL COMMENT'Business Opportunity Status Group',
  `status_id` int(11) NULL DEFAULT NULL COMMENT'Sales stage',
  `next_time` datetime(0) NULL DEFAULT NULL COMMENT'Next contact time',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT'Customer ID',
  `contacts_id` int(11) NULL DEFAULT NULL COMMENT'Primary contact ID',
  `deal_date` datetime(0) NULL DEFAULT NULL COMMENT'Estimated transaction date',
  `business_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Business opportunity name',
  `money` decimal(18, 2) NULL DEFAULT NULL COMMENT'opportunity amount',
  `discount_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT'full order discount',
  `total_price` decimal(17, 2) NULL DEFAULT NULL COMMENT'Total product amount',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT'' COMMENT'Remark',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Person in charge ID',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `batch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Batch such as attachment batch',
  `ro_user_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'read-only permission',
  `rw_user_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Read and write permissions',
  `is_end` int(4) NOT NULL DEFAULT 0 COMMENT '1 win order 2 lose order 3 invalid',
  `status_remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'',
  `status` int(1) NULL DEFAULT 1 COMMENT '1 normal 3 Delete',
  `last_time` datetime(0) NULL DEFAULT NULL COMMENT'Last follow-up time',
  `followup` int(1) NULL DEFAULT NULL COMMENT '0 not followed up 1 followed up',
  PRIMARY KEY (`business_id`) USING BTREE,
  INDEX `owner_user_id`(`owner_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Business Opportunity Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_business
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_business_change
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_business_change`;
CREATE TABLE `wk_crm_business_change` (
   `change_id` int(10) NOT NULL AUTO_INCREMENT,
   `business_id` int(10) NOT NULL COMMENT'Business Opportunity ID',
   `status_id` int(10) NOT NULL COMMENT'Phase ID',
   `create_time` datetime(0) NOT NULL COMMENT'create time',
   `create_user_id` bigint(20) NOT NULL COMMENT'creator',
   PRIMARY KEY (`change_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Business Opportunity Phase Change Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_business_change
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_business_data
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_business_data`;
CREATE TABLE `wk_crm_business_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Field Name',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NOT NULL,
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `batch_id`(`batch_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Business Opportunity Extension Field Data Sheet' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_business_data
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_business_product
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_business_product`;
CREATE TABLE `wk_crm_business_product` (
   `r_id` int(11) NOT NULL AUTO_INCREMENT,
   `business_id` int(11) NOT NULL COMMENT'Business Opportunity ID',
   `product_id` int(11) NOT NULL COMMENT'Product ID',
   `price` decimal(18, 2) NOT NULL COMMENT'Product unit price',
   `sales_price` decimal(18, 2) NOT NULL COMMENT'sales price',
   `num` decimal(10, 2) NOT NULL COMMENT'number',
   `discount` int(10) NOT NULL COMMENT'discount',
   `subtotal` decimal(18, 2) NOT NULL COMMENT'Subtotal (price after discount)',
   `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'unit',
   PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Business Opportunity Product Relationship Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_business_product
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_business_status
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_business_status`;
CREATE TABLE `wk_crm_business_status` (
   `status_id` int(11) NOT NULL AUTO_INCREMENT,
   `type_id` int(11) NOT NULL COMMENT'Business opportunity status category ID',
   `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Identification',
   `rate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'winning rate',
   `order_num` int(4) NULL DEFAULT NULL COMMENT'Order',
   PRIMARY KEY (`status_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47646 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Business Opportunity Status' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_business_status
-- ----------------------------
INSERT INTO `wk_crm_business_status` VALUES (47643, 12366, 'Verify customer', '20', 1);
INSERT INTO `wk_crm_business_status` VALUES (47644, 12366, 'Demand analysis', '30', 2);
INSERT INTO `wk_crm_business_status` VALUES (47645, 12366, 'Proposal/Quote', '80', 3);

-- ----------------------------
-- Table structure for wk_crm_business_type
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_business_type`;
CREATE TABLE `wk_crm_business_type` (
   `type_id` int(11) NOT NULL AUTO_INCREMENT,
   `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Identification',
   `dept_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Department ID',
   `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
   `create_time` datetime(0) NOT NULL COMMENT'create time',
   `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
   `status` int(1) NOT NULL DEFAULT 1 COMMENT '0 disable 1 enable 2Delete',
   PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12367 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Business opportunity status group category' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_business_type
-- ----------------------------
INSERT INTO `wk_crm_business_type` VALUES (12366, 'Sales Process Business Unit', '', 3, '2019-05-11 16:25:09', NULL, 1);

-- ----------------------------
-- Table structure for wk_crm_business_user_star
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_business_user_star`;
CREATE TABLE `wk_crm_business_user_star` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `user_id` bigint(20) NOT NULL COMMENT'user id',
   `business_id` int(11) NOT NULL COMMENT'customer id',
   PRIMARY KEY (`id`) USING BTREE,
   UNIQUE INDEX `user_id`(`user_id`, `business_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='User business opportunity index star relationship table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_business_user_star
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_contacts
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_contacts`;
CREATE TABLE `wk_crm_contacts` (
  `contacts_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Contact name',
  `next_time` datetime(0) NULL DEFAULT NULL COMMENT'Next contact time',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'mobile phone',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'telephone',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'email',
  `post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Title',
  `customer_id` int(11) NOT NULL COMMENT'Customer ID',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'address',
  `remark` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT'' COMMENT'Remark',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Person in charge ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `batch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'batch',
  `last_time` datetime(0) NULL DEFAULT NULL COMMENT'Last follow-up time',
  PRIMARY KEY (`contacts_id`) USING BTREE,
  INDEX `owner_user_id`(`owner_user_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Contact table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_contacts_business
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_contacts_business`;
CREATE TABLE `wk_crm_contacts_business`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `contacts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Opportunity Contact Association Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_contacts_business
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_contacts_data
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_contacts_data`;
CREATE TABLE `wk_crm_contacts_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Field Name',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NOT NULL,
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `batch_id`(`batch_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Contact extension field data table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_contacts_data
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_contacts_user_star
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_contacts_user_star`;
CREATE TABLE `wk_crm_contacts_user_star` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `user_id` bigint(20) NOT NULL COMMENT'user id',
   `contacts_id` int(11) NOT NULL COMMENT'Customer id',
   PRIMARY KEY (`id`) USING BTREE,
   UNIQUE INDEX `user_id`(`user_id`, `contacts_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='User contact star relationship table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_contacts_user_star
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_contract
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_contract`;
CREATE TABLE `wk_crm_contract` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'contract name',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT'Customer ID',
  `business_id` int(11) NULL DEFAULT NULL COMMENT'Business Opportunity ID',
  `check_status` int(4) NOT NULL DEFAULT 0 COMMENT '0 pending review, 1 passed, 2 rejected, 3 under review 4: withdrawn 5 not submitted 6 created 7 deleted 8 Update status',
  `examine_record_id` int(11) NULL DEFAULT NULL COMMENT'audit record ID',
  `order_date` datetime(0) NULL DEFAULT NULL COMMENT'Order date',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Person in charge ID',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'contract number',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT'start time',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT'End time',
  `money` decimal(18, 2) NULL DEFAULT NULL COMMENT'contract amount',
  `discount_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT'full order discount',
  `total_price` decimal(17, 2) NULL DEFAULT NULL COMMENT'Total product amount',
  `types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'contract type',
  `payment_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'payment method',
  `batch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Batch such as attachment batch',
  `ro_user_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT'read-only permission',
  `rw_user_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT'Read and write permissions',
  `contacts_id` int(11) NULL DEFAULT NULL COMMENT'Customer contractor (contact id)',
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Remarks',
  `company_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'company contractor',
  `last_time` datetime(0) NULL DEFAULT NULL COMMENT'Last follow-up time',
  `received_money` decimal(17, 2) NULL DEFAULT 0.00,
  `unreceived_money` decimal(17, 2) NULL DEFAULT NULL,
  `old_contract_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`contract_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Contract Form' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_contract
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_contract_data
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_contract_data`;
CREATE TABLE `wk_crm_contract_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Field Name',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NOT NULL,
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `batch_id`(`batch_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Contract extension field data table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_contract_data
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_contract_product
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_contract_product`;
CREATE TABLE `wk_crm_contract_product` (
   `r_id` int(11) NOT NULL AUTO_INCREMENT,
   `contract_id` int(11) NOT NULL COMMENT'Contract ID',
   `product_id` int(11) NOT NULL COMMENT'Product ID',
   `price` decimal(18, 2) NOT NULL COMMENT'Product unit price',
   `sales_price` decimal(18, 2) NOT NULL COMMENT'sales price',
   `num` decimal(10, 2) NOT NULL COMMENT'number',
   `discount` decimal(18, 4) NOT NULL COMMENT'Discount',
   `subtotal` decimal(18, 2) NOT NULL COMMENT'Subtotal (price after discount)',
   `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'unit',
   PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Contract product relationship table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_contract_product
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_customer
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer`;
CREATE TABLE `wk_crm_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT'Customer name',
  `followup` int(11) NULL DEFAULT NULL COMMENT'followup status 0 not followed up 1 followed up',
  `is_lock` int(1) NOT NULL DEFAULT 0 COMMENT '1lock',
  `next_time` datetime(0) NULL DEFAULT NULL COMMENT'Next contact time',
  `deal_status` int(4) NULL DEFAULT 0 COMMENT'Deal status 0 uncompleted 1 completed',
  `deal_time` datetime(0) NULL DEFAULT NULL COMMENT'Deal time',
  `contacts_id` int(11) NULL DEFAULT NULL COMMENT'Primary contact ID',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'mobile phone',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'telephone',
  `website` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'URL',
  `email` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'mailbox',
  `remark` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'Remarks',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Person in charge ID',
  `ro_user_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT'read-only permission',
  `rw_user_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT'Read and write permissions',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'province and city',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'location information',
  `detail_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'detailed address',
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'Geographical location longitude',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'Geographical location dimension',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `batch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Batch such as attachment batch',
  `status` int(1) NULL DEFAULT 1 COMMENT'Customer status 1 normal 2 locked 3Delete',
  `last_time` datetime(0) NULL DEFAULT NULL COMMENT'Last follow-up time',
  `pool_time` datetime(0) NULL DEFAULT NULL COMMENT'Put in pool time',
  `is_receive` int(1) NULL DEFAULT NULL COMMENT '1 allocate 2 receive',
  `last_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'last follow-up record',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT'Customer time received',
  `pre_owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'ID of the person in charge before entering the high seas',
  PRIMARY KEY (`customer_id`) USING BTREE,
  INDEX `update_time`(`update_time`) USING BTREE,
  INDEX `owner_user_id`(`owner_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Customer table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_customer_data
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_data`;
CREATE TABLE `wk_crm_customer_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Field name',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NOT NULL,
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `batch_id`(`batch_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Customer Extended Field Data Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_data
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_customer_pool
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_pool`;
CREATE TABLE `wk_crm_customer_pool` (
  `pool_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'high seas id',
  `pool_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'High seas name',
  `admin_user_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'Administrator ","divide',
  `member_user_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT'High seas rule employee member “,”divide',
  `member_dept_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT'member of the high seas regulations department “,”divide',
  `status` int(2) NOT NULL DEFAULT 1 COMMENT'Status 0 disabled 1 enabled',
  `pre_owner_setting` int(2) NOT NULL COMMENT'Former person in charge receives rules 0 no restriction 1 restriction',
  `pre_owner_setting_day` int(4) NULL DEFAULT NULL COMMENT'Previous person in charge receives rule limit days',
  `receive_setting` int(2) NOT NULL COMMENT'Whether to limit the receiving frequency 0 no limit 1 limit',
  `receive_num` int(4) NULL DEFAULT NULL COMMENT'Receive frequency rule',
  `remind_setting` int(2) NOT NULL COMMENT'Whether to set advance reminder 0 not open 1 open',
  `remind_day` int(11) NULL DEFAULT NULL COMMENT'Remind rule days',
  `put_in_rule` int(2) NOT NULL COMMENT'Withdrawal rule 0 does not automatically withdraw 1 automatically withdraw',
  `create_user_id` bigint(20) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`pool_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34553 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='High Seas Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_pool
-- ----------------------------
INSERT INTO `wk_crm_customer_pool` VALUES (34552, 'The system defaults to the open sea', '14773', '14773', '', 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, '2019-06-30 18:13:08');

-- ----------------------------
-- Table structure for wk_crm_customer_pool_field_setting
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_pool_field_setting`;
CREATE TABLE `wk_crm_customer_pool_field_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) NOT NULL COMMENT'High seas id',
  `field_id` int(11) NULL DEFAULT NULL COMMENT'field id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'Field Chinese name',
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'field name',
  `type` int(2) NOT NULL COMMENT'Field type 1 Single line of text 2 Multiple lines of text 3 Single selection 4 Date 5 Number 6 Decimal 7 Mobile phone 8 File 9 Multiple selection 10 Personnel 11 Attachment 12 Department 13 Date and time 14 Email 15 Customer 16 Business Opportunities 17 Contacts 18 Map 19 Product Type 20 Contract 21 Repayment Plan',
  `is_hidden` int(2) NOT NULL DEFAULT 0 COMMENT'whether to hide 0 not to hide 1 to hide',
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 439856 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='High seas list page field setting table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_pool_field_setting
-- ----------------------------
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439842, 34552, 1101827, 'Customer Name', 'customerName', 1, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439843, 34552, 1101829, 'Mobile', 'mobile', 7, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439844, 34552, 1101830, 'Telephone', 'telephone', 1, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439845, 34552, 1101831, 'URL','website', 1, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439846, 34552, 1101834, 'Next Contact Time', 'nextTime', 13, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439847, 34552, 1101835, 'Remarks', 'remark', 1, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439848, 34552, 1101833, 'Customer level', 'level', 3, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439849, 34552, 1101828, 'Customer source', 'source', 3, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439850, 34552, 1101832, 'Customer Industry', 'industry', 3, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439851, 34552, NULL, 'Deal Status', 'dealStatus', 3, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439852, 34552, NULL, 'last follow-up time', 'lastTime', 4, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439853, 34552, NULL, 'update time', 'updateTime', 4, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439854, 34552, NULL, 'create time', 'createTime', 4, 0);
INSERT INTO `wk_crm_customer_pool_field_setting` VALUES (439855, 34552, NULL, 'creator', 'createUserName', 1, 0);

-- ----------------------------
-- Table structure for wk_crm_customer_pool_field_sort
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_pool_field_sort`;
CREATE TABLE `wk_crm_customer_pool_field_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pool_id` int(11) NOT NULL COMMENT'High seas id',
  `user_id` bigint(20) NOT NULL COMMENT'user id',
  `field_id` int(11) NULL DEFAULT NULL COMMENT'field id',
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'field name',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'Field Chinese name',
  `type` int(2) NOT NULL COMMENT'Field type 1 Single line of text 2 Multiple lines of text 3 Single selection 4 Date 5 Number 6 Decimal 7 Mobile phone 8 File 9 Multiple selection 10 Personnel 11 Attachment 12 Department 13 Date and time 14 Email 15 Customer 16 Business Opportunities 17 Contacts 18 Map 19 Product Type 20 Contract 21 Repayment Plan',
  `sort` int(5) NOT NULL COMMENT'Field sorting',
  `is_hidden` int(1) NOT NULL COMMENT'Whether to hide 0, not hide 1, hide',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='High seas list page field sorting table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_pool_field_sort
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_customer_pool_field_style
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_pool_field_style`;
CREATE TABLE `wk_crm_customer_pool_field_style` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `pool_id` int(11) NOT NULL COMMENT'High seas id',
   `style` int(5) NOT NULL COMMENT'Field width',
   `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'field name',
   `user_id` bigint(20) NOT NULL COMMENT'user id',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT'update time',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='High seas list page field style sheet' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_pool_field_style
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_customer_pool_relation
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_pool_relation`;
CREATE TABLE `wk_crm_customer_pool_relation` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `customer_id` int(11) NOT NULL COMMENT'Customer id',
   `pool_id` int(11) NOT NULL COMMENT'High seas id',
   PRIMARY KEY (`id`) USING BTREE,
   INDEX `pool_id`(`pool_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Customer High Seas Association Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_pool_relation
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_customer_pool_rule
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_pool_rule`;
CREATE TABLE `wk_crm_customer_pool_rule` (
   `rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Recall rule id',
   `pool_id` int(11) NOT NULL COMMENT'High seas id',
   `type` int(2) NOT NULL COMMENT'Recall rule judgment type 1 follow-up record 2 business opportunity 3 transaction status',
   `deal_handle` int(2) NULL DEFAULT NULL COMMENT'Whether the customer has entered the high seas 0 do not enter 1 enter',
   `business_handle` int(2) NULL DEFAULT NULL COMMENT'Whether customers with business opportunities enter the high seas 0 do not enter 1 enter',
   `customer_level_setting` int(2) NOT NULL COMMENT'Customer level setting 1 All 2 Set according to level',
   `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Customer level 1All',
   `limit_day` int(4) NOT NULL COMMENT'The high seas rules limit the number of days',
   PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='High seas recovery rule table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_pool_rule
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_customer_setting
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_setting`;
CREATE TABLE `wk_crm_customer_setting` (
   `setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'primary key ID',
   `setting_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Rule name',
   `customer_num` int(11) NULL DEFAULT NULL COMMENT'The number of customers that can be owned',
   `customer_deal` int(1) NULL DEFAULT 0 COMMENT'Does the transaction customer occupy the quantity 0 not occupied 1 occupied',
   `type` int(1) NULL DEFAULT NULL COMMENT'Type 1 has a limit on the number of customers 2 has a limit on the number of locked customers',
   `create_time` datetime(0) NULL DEFAULT NULL,
   PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Restrictions on the number of customers owned and locked by employees' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_setting
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_customer_setting_user
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_setting_user`;
CREATE TABLE `wk_crm_customer_setting_user` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Primary key ID',
   `setting_id` int(11) NOT NULL COMMENT'Customer rule restriction ID',
   `user_id` bigint(20) NULL DEFAULT NULL COMMENT'user id',
   `dept_id` int(11) NULL DEFAULT NULL COMMENT'Department ID',
   `type` int(1) NULL DEFAULT NULL COMMENT '1 employee 2 department',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Employee owns and locks the customer employee association table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_setting_user
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_customer_stats_2021
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_stats_2021`;
CREATE TABLE `wk_crm_customer_stats_2021` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT'primary key',
   `customer_num` bigint(20) NULL DEFAULT NULL COMMENT'Number of customers',
   `deal_status` int(2) NULL DEFAULT NULL COMMENT'Deal status 0 Unexecuted 1 Completed',
   `owner_user_id` int(11) NULL DEFAULT NULL COMMENT'person in charge ID',
   `create_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Creation time year month day',
   `deal_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Creation time year month day',
   PRIMARY KEY (`id`) USING BTREE,
   UNIQUE INDEX `id`(`customer_num`, `deal_status`, `owner_user_id`, `create_date`, `deal_date`) USING BTREE,
   INDEX `create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_stats_2021
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_customer_stats_info
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_stats_info`;
CREATE TABLE `wk_crm_customer_stats_info` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Primary key ID',
   `last_customer_id` int(11) NOT NULL COMMENT'Last synchronization customer ID',
   `create_time` datetime(0) NOT NULL COMMENT'synchronization time',
   `sync_num` int(11) NULL DEFAULT NULL COMMENT'synchronization number',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Customer Number Statistics Summary Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_stats_info
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_customer_user_star
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_customer_user_star`;
CREATE TABLE `wk_crm_customer_user_star` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `user_id` bigint(20) NOT NULL COMMENT'user id',
   `customer_id` int(11) NOT NULL COMMENT'Customer id',
   PRIMARY KEY (`id`) USING BTREE,
   UNIQUE INDEX `user_id`(`user_id`, `customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='User customer star relationship table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_customer_user_star
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_examine
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_examine`;
CREATE TABLE `wk_crm_examine` (
  `examine_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_type` int(1) NOT NULL DEFAULT 1 COMMENT '1 Contract 2 Receipt 3 Invoice 4 Salary 5 Purchasing review 6 Purchase return review 7 Sales review 8 Sales return review 9 Payment slip review 10 Receipt review 11 Inventory review 12 Allocation Audit',
  `examine_type` int(1) NULL DEFAULT NULL COMMENT'Audit type 1 Fixed approval 2 Authorized approval',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Approval flow name',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'icon',
  `dept_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT'Department ID (0 is All)',
  `user_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT'Employee ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT'modification time',
  `update_user_id` bigint(20) NULL DEFAULT NULL COMMENT'modify person',
  `status` int(1) NULL DEFAULT NULL COMMENT'Status 1 Enable 0 Disable 2 Delete',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Process description',
  PRIMARY KEY (`examine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25378 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Approval Process Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_examine
-- ----------------------------
INSERT INTO `wk_crm_examine` VALUES (25375, 2, 2,'Payment approval process', NULL, NULL, NULL, NULL, 3, NULL, 3, 1,'');
INSERT INTO `wk_crm_examine` VALUES (25376, 1, 2,'Contract approval process', NULL, NULL, NULL, NULL, 3, NULL, 3, 1,'Explanation');
INSERT INTO `wk_crm_examine` VALUES (25377, 3, 2,'Invoice approval process', NULL, NULL, NULL, NULL, 0, NULL, 0, 1,'');

-- ----------------------------
-- Table structure for wk_crm_examine_log
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_examine_log`;
CREATE TABLE `wk_crm_examine_log` (
  `log_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT'ID',
  `record_id` int(11) NULL DEFAULT NULL COMMENT'Approval record ID',
  `examine_step_id` bigint(20) NULL DEFAULT NULL COMMENT'review step ID',
  `examine_status` int(1) NULL DEFAULT NULL COMMENT'audit status 0 unaudited 1 audit passed 2 audit rejected 3 review withdrawn',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT'creator',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `examine_user` bigint(20) NULL DEFAULT NULL COMMENT'reviewer',
  `examine_time` datetime(0) NULL DEFAULT NULL COMMENT'examine time',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Remarks for review',
  `is_recheck` int(1) NULL DEFAULT 0 COMMENT'Whether it is to withdraw the previous log 0 or null as the new data 1: Withdraw the previous data',
  `order_id` int(30) NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Audit log table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_examine_log
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_examine_record
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_examine_record`;
CREATE TABLE `wk_crm_examine_record` (
   `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'audit record ID',
   `examine_id` int(11) NULL DEFAULT NULL COMMENT'Approval ID',
   `examine_step_id` bigint(20) NULL DEFAULT NULL COMMENT'ID of the current approval step',
   `examine_status` int(1) NULL DEFAULT NULL COMMENT'Audit status 0 Unaudited 1 Audit passed 2 Audit rejected 3 Under review 4 Withdrawn',
   `create_user` bigint(20) NULL DEFAULT NULL COMMENT'creator',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Remarks for review',
   PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Audit record table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_examine_record
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_examine_step
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_examine_step`;
CREATE TABLE `wk_crm_examine_step` (
   `step_id` bigint(20) NOT NULL AUTO_INCREMENT,
   `step_type` int(1) NULL DEFAULT NULL COMMENT'Step type 1, the person in charge, 2, the designated user (any one), 3, the designated user (multi-person countersign), 4, the supervisor of the superior approver',
   `examine_id` int(11) NOT NULL COMMENT'Approval ID',
   `check_user_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Approver ID (separated by commas) ,1,2,',
   `step_num` int(2) NULL DEFAULT 1 COMMENT'sort',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Remarks',
   PRIMARY KEY (`step_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Approval step table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_examine_step
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_field
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_field`;
CREATE TABLE `wk_crm_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'primary key ID',
  `field_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'Custom field English ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT'' COMMENT'Field name',
  `type` int(2) NOT NULL DEFAULT 1 COMMENT'Field type 1 Single line of text 2 Multiple lines of text 3 Single selection 4 Date 5 Number 6 Decimal 7 Mobile phone 8 File 9 Multiple selection 10 Personnel 11 Attachment 12 Department 13 Date and time 14 Email 15 Customer 16 Business Opportunity 17 Contact Person 18 Map 19 Product Type 20 Contract 21 Repayment Plan',
  `label` int(2) NOT NULL COMMENT'Label 1 Lead 2 Customer 3 Contact 4 Product 5 Business Opportunity 6 Contract 7 Repayment 8. Repayment plan',
  `remark` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Field description',
  `input_tips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'input tips',
  `max_length` int(12) NULL DEFAULT NULL COMMENT'maximum length',
  `default_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT'' COMMENT'default value',
  `is_unique` int(1) NULL DEFAULT 0 COMMENT'is it unique 1 is 0 no',
  `is_null` int(1) NULL DEFAULT 0 COMMENT'Is it mandatory 1 Yes 0 No',
  `sorting` int(5) NULL DEFAULT 1 COMMENT'Sorting from small to large',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT'If the type is an option, this cannot be empty. Multiple options are separated by',
  `operating` int(1) NULL DEFAULT 0 COMMENT'Is it possible to delete to modify 0 to modify 1 to modify 2 to delete 3 none 4 cannot modify required',
  `is_hidden` int(1) NOT NULL DEFAULT 0 COMMENT'whether to hide 0 not to hide 1 to hide',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT'last modified time',
  `field_type` int(2) NOT NULL DEFAULT 0 COMMENT'Field source 0. Custom 1. Original fixed 2 Original field but the value exists in the extended table',
  `relevant` int(11) NULL DEFAULT NULL COMMENT'Only for clues, convert customer\'s custom field ID',
  PRIMARY KEY (`field_id`) USING BTREE,
  INDEX `label`(`label`) USING BTREE,
  INDEX `update_time`(`update_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1101904 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Custom field table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_field
-- ----------------------------
INSERT INTO `wk_crm_field` VALUES (1101827,'customer_name','customer name', 1, 2, NULL, NULL, 255,'', 1, 1, 0, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101828,'source','customer source', 3, 2, NULL, NULL, NULL,'', 0, 0, 1,'promotion, search engine, advertising, referral, online Registration, online inquiry, appointment appointment, Mobai, telephone consultation, email consultation', 1, 0, NULL, 2, NULL);
INSERT INTO `wk_crm_field` VALUES (1101829,'mobile','mobile', 7, 2, NULL, NULL, 255,'', 0, 0, 2, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101830,'telephone','telephone', 1, 2, NULL, NULL, 255,'', 0, 0, 3, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101831,'website','URL', 1, 2, NULL, NULL, 255,'', 0, 0, 4, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101832,'industry','customer industry', 3, 2, NULL, NULL, NULL,'', 0, 0, 5,'IT, financial industry, real estate, business services, transportation/ Logistics, production, government, cultural media', 1, 0, NULL, 2, NULL);
INSERT INTO `wk_crm_field` VALUES (1101833,'level','customer level', 3, 2, NULL, NULL, NULL,'', 0, 0, 6,'A (key customer), B (general customer), C (non-priority customers)', 1, 0, NULL, 2, NULL);
INSERT INTO `wk_crm_field` VALUES (1101834,'next_time','next contact time', 13, 2, NULL, NULL, NULL,'', 0, 0, 7, NULL, 1, 0, NULL, 1, NULL );
INSERT INTO `wk_crm_field` VALUES (1101835,'remark','remark', 2, 2, NULL, NULL, 255,'', 0, 0, 8, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101836,'email','mailbox', 14, 2, NULL, NULL, 255,'', 0, 0, 4, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101837,'leads_name','lead name', 1, 1, NULL, NULL, 255,'', 0, 1, 0, NULL, 1, 0, '2020-08-22 15 :33:40', 1, 1101827);
INSERT INTO `wk_crm_field` VALUES (1101838,'email','Mailbox', 14, 1, NULL, NULL, 255,'', 0, 0, 1, NULL, 1, 0, '2020-08-22 15: 33:40', 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101839,'source','lead source', 3, 1, NULL, NULL, NULL,'', 0, 0, 2,'promotion, search engine, advertising, referral, online Registration, online inquiry, appointment appointment, Mobai, telephone consultation, email consultation', 1, 0, '2020-08-22 15:33:40', 2, 1101828);
INSERT INTO `wk_crm_field` VALUES (1101840,'mobile','mobile', 7, 1, NULL, NULL, 255,'', 0, 0, 3, NULL, 1, 0, '2020-08-22 15: 33:40', 1, 1101829);
INSERT INTO `wk_crm_field` VALUES (1101841,'telephone','Phone', 1, 1, NULL, NULL, 255,'', 0, 0, 4, NULL, 1, 0, '2020-08-22 15: 33:40', 1, 1101830);
INSERT INTO `wk_crm_field` VALUES (1101842,'address','address', 1, 1, NULL, NULL, 255,'', 0, 0, 5, NULL, 1, 0, '2020-08-22 15: 33:40', 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101843,'industry','customer industry', 3, 1, NULL, NULL, NULL,'', 0, 0, 6,'IT, financial industry, real estate, business services, transportation/ Logistics, production, government, cultural media', 1, 0, '2020-08-22 15:33:40', 2, 1101832);
INSERT INTO `wk_crm_field` VALUES (1101844,'level','customer level', 3, 1, NULL, NULL, NULL,'', 0, 0, 7,'A (key customer), B (general customer), C (non-priority customers)', 1, 0, '2020-08-22 15:33:40', 2, 1101833);
INSERT INTO `wk_crm_field` VALUES (1101845,'next_time','next contact time', 13, 1, NULL, NULL, NULL,'', 0, 0, 8, NULL, 1, 0, '2020-08- 22 15:33:40', 1, 1101834);
INSERT INTO `wk_crm_field` VALUES (1101846,'remark','Remarks', 2, 1, NULL, NULL, 255,'', 0, 0, 9, NULL, 1, 0, '2020-08-22 15: 33:40', 1, 1101835);
INSERT INTO `wk_crm_field` VALUES (1101847,'name','name', 1, 3, NULL, NULL, 255,'', 0, 1, 0, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101848,'customer_id','customer name', 15, 3, NULL, NULL, NULL,'', 0, 1, 1, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101849,'mobile','mobile', 7, 3, NULL, NULL, 255,'', 0, 0, 2, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101850,'telephone','telephone', 1, 3, NULL, NULL, 255,'', 0, 0, 3, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101851,'email','mailbox', 14, 3, NULL, NULL, 255,'', 0, 0, 4, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101852,'post','post', 1, 3, NULL, NULL, 255,'', 0, 0, 5, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101853,'policymakers','Is the key decision maker', 3, 3, NULL, NULL, NULL,'', 0, 0, 6,'Yes, No', 1, 0, NULL , 2, NULL);
INSERT INTO `wk_crm_field` VALUES (1101854,'address','address', 1, 3, NULL, NULL, 255,'', 0, 0, 7, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101855,'next_time','next contact time', 13, 3, NULL, NULL, NULL,'', 0, 0, 8, NULL, 1, 0, NULL, 1, NULL );
INSERT INTO `wk_crm_field` VALUES (1101856,'remark','Remarks', 2, 3, NULL, NULL, 255,'', 0, 0, 9, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101857,'sex','sex', 3, 3, NULL, NULL, NULL,'', 0, 0, 10,'male, female', 1, 0, NULL, 2, NULL);
INSERT INTO `wk_crm_field` VALUES (1101858,'name','product name', 1, 4, NULL, NULL, 255,'', 0, 1, 0, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101859,'category_id','product type', 19, 4, NULL, NULL, NULL,'', 0, 1, 1, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101860,'unit','product unit', 3, 4, NULL, NULL, NULL,'', 0, 0, 2,'piece, block, only, handle, piece, bottle, Box, table, ton, kilogram, meter, box, sleeve', 1, 0, NULL, 2, NULL);
INSERT INTO `wk_crm_field` VALUES (1101861,'num','product code', 1, 4, NULL, NULL, 255,'', 1, 1, 3, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101862,'price','price', 6, 4, NULL, NULL, 255,'', 0, 1, 4, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101863,'description','Product description', 1, 4, NULL, NULL, 255,'', 0, 0, 6, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101864,'business_name','business name', 1, 5, NULL, NULL, 255,'', 0, 1, 0, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101865,'customer_id','customer name', 15, 5, NULL, NULL, NULL,'', 0, 1, 1, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101866,'money','opportunity amount', 6, 5, NULL, NULL, 255,'', 0, 0, 2, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101867,'deal_date','expected transaction date', 13, 5, NULL, NULL, NULL,'', 0, 0, 3, NULL, 1, 0, NULL, 1, NULL) ;
INSERT INTO `wk_crm_field` VALUES (1101868,'remark','Remarks', 2, 5, NULL, NULL, 255,'', 0, 0, 4, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101869,'name','contract name', 1, 6, NULL, NULL, 255,'', 0, 1, 1, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101870,'num','contract number', 1, 6, NULL, NULL, 255,'', 1, 1, 0, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101871,'customer_id','customer name', 15, 6, NULL, NULL, NULL,'', 0, 1, 2, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101872,'business_id','Business Opportunity Name', 16, 6, NULL, NULL, NULL,'', 0, 0, 3, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101873,'money','contract amount', 6, 6, NULL, NULL, 255,'', 0, 1, 4, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101874,'order_date','order time', 4, 6, NULL, NULL, NULL,'', 0, 1, 5, NULL, 1, 0, NULL, 1, NULL) ;
INSERT INTO `wk_crm_field` VALUES (1101875,'start_time','contract start time', 4, 6, NULL, NULL, NULL,'', 0, 0, 6, NULL, 1, 0, NULL, 1, NULL) ;
INSERT INTO `wk_crm_field` VALUES (1101876,'end_time','contract end time', 4, 6, NULL, NULL, NULL,'', 0, 0, 7, NULL, 1, 0, NULL, 1, NULL) ;
INSERT INTO `wk_crm_field` VALUES (1101877,'contacts_id','Customer Contractor', 17, 6, NULL, NULL, NULL,'', 0, 0, 8, NULL, 1, 0, NULL, 1, NULL) ;
INSERT INTO `wk_crm_field` VALUES (1101878,'company_user_id','company contractor', 10, 6, NULL, NULL, NULL,'', 0, 0, 9, NULL, 1, 0, NULL, 1, NULL) ;
INSERT INTO `wk_crm_field` VALUES (1101879,'remark','remark', 2, 6, NULL, NULL, 255,'', 0, 0, 10, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101880,'flied_xucqai','Contract Type', 3, 6, NULL, NULL, 255,'', 0, 0, 11,'Direct sales contract, agency contract, service contract, fast sales contract ', 0, 0, NULL, 0, NULL);
INSERT INTO `wk_crm_field` VALUES (1101881,'number','payment number', 1, 7, NULL, NULL, 255,'', 1, 1, 0, NULL, 1, 0, NULL, 1, NULL) ;
INSERT INTO `wk_crm_field` VALUES (1101882,'customer_id','customer name', 15, 7, NULL, NULL, NULL,'', 0, 1, 1, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101883,'contract_id','contract number', 20, 7, NULL, NULL, NULL,'', 0, 1, 2, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101884,'plan_id','number of periods', 21, 7, NULL, NULL, NULL,'', 0, 0, 3, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101885,'return_time','Return date', 4, 7, NULL, NULL, NULL,'', 0, 1, 4, NULL, 1, 0, NULL, 1, NULL) ;
INSERT INTO `wk_crm_field` VALUES (1101886,'money','Receipt amount', 6, 7, NULL, NULL, 255,'', 0, 1, 5, NULL, 1, 0, NULL, 1, NULL) ;
INSERT INTO `wk_crm_field` VALUES (1101887,'return_type','Return method', 3, 7, NULL, NULL, NULL,'', 0, 0, 6,'Check, cash, postal remittance, wire transfer, online transfer , Alipay, WeChat Pay, other', 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101888,'remark','remark', 2, 7, NULL, NULL, 255,'', 0, 0, 7, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101889,'customer_id','customer name', 15, 8, NULL, NULL, NULL,'', 0, 0, 1, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101890,'contract_id','contract number', 20, 8, NULL, NULL, 11,'', 0, 0, 2, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101891,'money','Planned collection amount', 6, 8, NULL, NULL, NULL,'', 0, 0, 3, NULL, 1, 0, NULL, 1, NULL );
INSERT INTO `wk_crm_field` VALUES (1101892,'return_date','Planned payment date', 4, 8, NULL, NULL, NULL,'', 0, 0, 4, NULL, 1, 0, NULL, 1, NULL );
INSERT INTO `wk_crm_field` VALUES (1101893,'remind','Remind a few days in advance', 5, 8, NULL, NULL, 11,'', 0, 0, 5, NULL, 1, 0, NULL, 1, NULL );
INSERT INTO `wk_crm_field` VALUES (1101894,'remark','Remarks', 2, 8, NULL, NULL, 1000,'', 0, 0, 6, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101895,'visit_number','visit_number', 1, 17, NULL, NULL, NULL,'', 1, 1, 0, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101896,'visit_time','Revisit time', 13, 17, NULL, NULL, NULL,'', 0, 1, 1, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101897,'owner_user_id','return visitor', 28, 17, NULL, NULL, NULL,'', 0, 1, 2, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101898,'return_visit_type','Return visit form', 3, 17, NULL, NULL, NULL,'', 0, 0, 3,'Meet and visit, call, SMS, email, WeChat', 1, 0, NULL, 2, NULL);
INSERT INTO `wk_crm_field` VALUES (1101899,'customer_id','customer name', 15, 17, NULL, NULL, NULL,'', 0, 1, 4, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101900,'contacts_id','contacts', 17, 17, NULL, NULL, NULL,'', 0, 0, 5, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101901,'contract_id','contract number', 20, 17, NULL, NULL, NULL,'', 0, 1, 6, NULL, 1, 0, NULL, 1, NULL);
INSERT INTO `wk_crm_field` VALUES (1101902,'satisficing','Customer satisfaction', 3, 17, NULL, NULL, NULL,'', 0, 0, 7,'Very satisfied, satisfied, average, dissatisfied, very Not satisfied', 1, 0, NULL, 2, NULL);
INSERT INTO `wk_crm_field` VALUES (1101903,'flied_itvzix','Customer Feedback', 2, 17, NULL, NULL, 1000,'', 0, 0, 8, NULL, 0, 0, NULL, 0, NULL);

-- ----------------------------
-- Table structure for wk_crm_field_config
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_field_config`;
CREATE TABLE `wk_crm_field_config` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT'id',
   `field_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT'field name',
   `field_type` int(2) NOT NULL DEFAULT 1 COMMENT'Field type 1 keyword 2 date 3 number 4 nested 5 datetime',
   `create_time` datetime(0) NOT NULL COMMENT'create time',
   `label` int(2) NOT NULL COMMENT'label',
   PRIMARY KEY (`id`) USING BTREE,
   UNIQUE INDEX `field_name`(`field_name`, `label`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100294 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Field Configuration Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_field_config
-- ----------------------------
INSERT INTO `wk_crm_field_config` VALUES (100257, 'flied_dzmbcn', 4, '2020-08-03 18:46:43', 6);
INSERT INTO `wk_crm_field_config` VALUES (100258, 'flied_ivcdhc', 4, '2020-08-03 18:47:30', 3);
INSERT INTO `wk_crm_field_config` VALUES (100259, 'flied_pyrnyn', 1, '2020-08-03 19:12:42', 1);
INSERT INTO `wk_crm_field_config` VALUES (100260, 'flied_dknbbe', 4, '2020-08-03 19:12:42', 1);
INSERT INTO `wk_crm_field_config` VALUES (100261, 'flied_jhsivt', 1, '2020-08-03 19:15:51', 2);
INSERT INTO `wk_crm_field_config` VALUES (100262, 'flied_bcethz', 3, '2020-08-04 17:17:04', 2);
INSERT INTO `wk_crm_field_config` VALUES (100263, 'flied_jeqgso', 1, '2020-08-04 17:17:04', 2);
INSERT INTO `wk_crm_field_config` VALUES (100264, 'flied_mjrdbe', 1, '2020-08-05 11:17:16', 2);
INSERT INTO `wk_crm_field_config` VALUES (100265, 'flied_mtfnrf', 1, '2020-08-05 11:17:17', 2);
INSERT INTO `wk_crm_field_config` VALUES (100266, 'flied_dlyjjb', 2, '2020-08-06 15:27:17', 1);
INSERT INTO `wk_crm_field_config` VALUES (100267, 'flied_wxpcbx', 3, '2020-08-06 15:27:18', 1);
INSERT INTO `wk_crm_field_config` VALUES (100268, 'flied_kjhmgc', 4, '2020-08-06 15:27:18', 2);
INSERT INTO `wk_crm_field_config` VALUES (100269, 'flied_gdcrxx', 2, '2020-08-06 15:27:18', 2);
INSERT INTO `wk_crm_field_config` VALUES (100270, 'flied_xfhonw', 1, '2020-08-06 15:27:18', 3);
INSERT INTO `wk_crm_field_config` VALUES (100271, 'flied_fdncyr', 2, '2020-08-06 15:27:18', 3);
INSERT INTO `wk_crm_field_config` VALUES (100272, 'flied_ijtnfc', 3, '2020-08-06 15:27:18', 3);
INSERT INTO `wk_crm_field_config` VALUES (100273, 'flied_wuggiv', 1, '2020-08-06 15:27:18', 4);
INSERT INTO `wk_crm_field_config` VALUES (100274, 'flied_mswlgq', 4, '2020-08-06 15:27:18', 4);
INSERT INTO `wk_crm_field_config` VALUES (100275, 'flied_nmkltw', 2, '2020-08-06 15:27:18', 4);
INSERT INTO `wk_crm_field_config` VALUES (100276, 'flied_jokwgt', 3, '2020-08-06 15:27:19', 4);
INSERT INTO `wk_crm_field_config` VALUES (100277, 'flied_drfhhl', 1, '2020-08-06 15:27:19', 5);
INSERT INTO `wk_crm_field_config` VALUES (100278, 'flied_uvqlpy', 4, '2020-08-06 15:27:19', 5);
INSERT INTO `wk_crm_field_config` VALUES (100279, 'flied_temgvq', 2, '2020-08-06 15:27:19', 5);
INSERT INTO `wk_crm_field_config` VALUES (100280, 'flied_lxujya', 3, '2020-08-06 15:27:19', 5);
INSERT INTO `wk_crm_field_config` VALUES (100281, 'flied_kixhfg', 1, '2020-08-06 15:27:19', 6);
INSERT INTO `wk_crm_field_config` VALUES (100282, 'flied_lzwnik', 2, '2020-08-06 15:27:19', 6);
INSERT INTO `wk_crm_field_config` VALUES (100283, 'flied_dununn', 3, '2020-08-06 15:27:19', 6);
INSERT INTO `wk_crm_field_config` VALUES (100284, 'flied_cqlfka', 1, '2020-08-06 15:27:19', 7);
INSERT INTO `wk_crm_field_config` VALUES (100285, 'flied_ylgnov', 4, '2020-08-06 15:27:19', 7);
INSERT INTO `wk_crm_field_config` VALUES (100286, 'flied_umnxvp', 2, '2020-08-06 15:27:19', 7);
INSERT INTO `wk_crm_field_config` VALUES (100287, 'flied_mhbkno', 3, '2020-08-06 15:27:19', 7);
INSERT INTO `wk_crm_field_config` VALUES (100288, 'flied_bthxmi', 1, '2020-08-06 15:27:20', 17);
INSERT INTO `wk_crm_field_config` VALUES (100289, 'flied_xqimlp', 4, '2020-08-06 15:27:20', 17);
INSERT INTO `wk_crm_field_config` VALUES (100290, 'flied_oojrlh', 2, '2020-08-06 15:27:20', 17);
INSERT INTO `wk_crm_field_config` VALUES (100291, 'flied_tmboyd', 3, '2020-08-06 15:27:20', 17);
INSERT INTO `wk_crm_field_config` VALUES (100292, 'flied_grasid', 1, '2020-08-12 18:14:51', 2);
INSERT INTO `wk_crm_field_config` VALUES (100293, 'flied_ilvojx', 1, '2020-08-19 17:17:04', 1);

-- ----------------------------
-- Table structure for wk_crm_field_sort
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_field_sort`;
CREATE TABLE `wk_crm_field_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT'id',
  `field_id` int(11) NULL DEFAULT NULL COMMENT'field ID',
  `field_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'field name',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'name',
  `label` int(2) NOT NULL COMMENT'Label 1 Lead 2 Customer 3 Contact 4 Product 5 Business Opportunity 6 Contract 7 Repayment 8. Repayment plan',
  `type` int(2) NULL DEFAULT NULL COMMENT'Field Type',
  `style` int(8) NULL DEFAULT NULL COMMENT'Field width',
  `sort` int(5) NOT NULL DEFAULT 0 COMMENT'Field sort',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT'user id',
  `is_hide` int(1) NOT NULL DEFAULT 1 COMMENT'Whether to hide 0, not hide 1, hide',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `label`(`user_id`, `field_name`, `label`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1961 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Field sorting table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_field_sort
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_instrument_sort
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_instrument_sort`;
CREATE TABLE `wk_crm_instrument_sort` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `user_id` bigint(20) NOT NULL COMMENT'user id',
   `model_id` int(11) NOT NULL COMMENT'Module id 1. Contract amount target and completion situation 2. Data summary 3. Return amount target and completion situation 4. Performance indicator completion rate 5. Sales funnel 6. Forgotten reminder 7. Leaderboard',
   `list` int(4) NOT NULL COMMENT'Column 1 left side 2 right side',
   `sort` int(4) NOT NULL COMMENT'sort',
   `is_hidden` int(4) NOT NULL DEFAULT 0 COMMENT'whether to hide 0 show 1 hide',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Dashboard sorting table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_instrument_sort
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_invoice
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_invoice`;
CREATE TABLE `wk_crm_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'invoice id',
  `invoice_apply_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'invoice application number',
  `customer_id` int(11) NOT NULL COMMENT'Customer id',
  `contract_id` int(11) NULL DEFAULT NULL COMMENT'contract id',
  `invoice_money` decimal(10, 2) NOT NULL COMMENT'invoice amount',
  `invoice_date` date NULL DEFAULT NULL COMMENT'Invoice date',
  `invoice_type` int(2) NOT NULL COMMENT'Invoice type',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Remarks',
  `title_type` int(2) NULL DEFAULT NULL COMMENT'Header type 1 unit 2 people',
  `invoice_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Invoice payable',
  `tax_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'tax identification number',
  `deposit_bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Account opening bank',
  `deposit_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Account opening',
  `deposit_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Billing address',
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'telephone',
  `contacts_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'contact name',
  `contacts_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'contact information',
  `contacts_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'mailing address',
  `examine_record_id` int(11) NULL DEFAULT NULL COMMENT'Approval record id',
  `check_status` int(2) NULL DEFAULT NULL COMMENT'review status 0 pending review, 1 passed, 2 rejected, 3 under review, 4 withdrawn',
  `owner_user_id` bigint(20) NOT NULL COMMENT'person in charge id',
  `invoice_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'invoice number',
  `real_invoice_date` date NULL DEFAULT NULL COMMENT'Actual invoice date',
  `logistics_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'logistics order number',
  `invoice_status` int(2) NOT NULL DEFAULT 0 COMMENT'Invoice status 0 is not invoiced, 1 is invoiced',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator id',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'batch id',
  PRIMARY KEY (`invoice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Invoice table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_invoice
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_invoice_info
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_invoice_info`;
CREATE TABLE `wk_crm_invoice_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'invoice information id',
  `customer_id` int(11) NOT NULL COMMENT'Customer id',
  `title_type` int(2) NULL DEFAULT NULL COMMENT'Header type 1 unit 2 people',
  `invoice_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Invoice payable',
  `tax_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'tax identification number',
  `deposit_bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Account opening bank',
  `deposit_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Account opening',
  `deposit_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Billing address',
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'telephone',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Remarks',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator id',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Invoice details table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_invoice_info
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_leads
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_leads`;
CREATE TABLE `wk_crm_leads` (
  `leads_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_transform` int(1) NULL DEFAULT 0 COMMENT '1 has been Transfer 0 is not Transfer',
  `followup` int(11) NULL DEFAULT NULL COMMENT'followup status 0 not followed up 1 followed up',
  `leads_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT'lead name',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT'Customer id',
  `next_time` datetime(0) NULL DEFAULT NULL COMMENT'Next contact time',
  `telephone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'telephone',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'mobile phone number',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'mailbox',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'address',
  `remark` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT'' COMMENT'Remark',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Person in charge ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `batch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Batch such as attachment batch',
  `is_receive` int(1) NULL DEFAULT NULL COMMENT '1 allocation',
  `last_time` datetime(0) NULL DEFAULT NULL COMMENT'Last follow-up time',
  `last_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'last follow-up record',
  PRIMARY KEY (`leads_id`) USING BTREE,
  INDEX `owner_user_id`(`owner_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='clue table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_leads
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_leads_data
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_leads_data`;
CREATE TABLE `wk_crm_leads_data` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `field_id` int(11) NOT NULL,
   `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'field name',
   `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
   `create_time` datetime(0) NOT NULL,
   `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
   PRIMARY KEY (`id`) USING BTREE,
   INDEX `batch_id`(`batch_id`) USING BTREE,
   INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Cue custom field value table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_leads_data
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_leads_user_star
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_leads_user_star`;
CREATE TABLE `wk_crm_leads_user_star` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `user_id` bigint(20) NOT NULL COMMENT'user id',
   `leads_id` int(11) NOT NULL COMMENT'customer id',
   PRIMARY KEY (`id`) USING BTREE,
   UNIQUE INDEX `user_id`(`user_id`, `leads_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='User clue index star relationship table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_leads_user_star
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_marketing
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_marketing`;
CREATE TABLE `wk_crm_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'marketing id',
  `marketing_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'marketing name',
  `crm_type` int(1) NOT NULL DEFAULT 1 COMMENT '1 lead 2 customer',
  `end_time` datetime(0) NOT NULL COMMENT'End time',
  `relation_user_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Relationship person ID',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '1 enable 0 disable',
  `second` int(1) NOT NULL DEFAULT 0 COMMENT'Each customer can only fill in the number of 0 1',
  `field_data_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Marketing content fill in the field',
  `browse` int(10) NULL DEFAULT 0 COMMENT'Number of views',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` datetime(0) NOT NULL COMMENT'modification time',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT'start time',
  `share_num` int(11) NULL DEFAULT 0 COMMENT'share number',
  `submit_num` int(11) NULL DEFAULT 0 COMMENT'Submit number',
  `synopsis` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT'Introduction',
  `main_file_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'first image id',
  `detail_file_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'active address',
  `marketing_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'activity type',
  `marketing_money` decimal(11, 2) NULL DEFAULT NULL COMMENT'Activity amount',
  PRIMARY KEY (`marketing_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Marketing Form' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_marketing
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_marketing_field
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_marketing_field`;
CREATE TABLE `wk_crm_marketing_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'primary key ID',
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Custom field English ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT'' COMMENT'Field name',
  `type` int(2) NOT NULL DEFAULT 1 COMMENT'Field type 1 Single line of text 2 Multiple lines of text 3 Single selection 4 Date 5 Number 6 Decimal 7 Mobile phone 8 File 9 Multiple selection 10 Personnel 11 Attachment 12 Department 13 Date and time 14 Email 15 Customer 16 Business Opportunity 17 Contact Person 18 Map 19 Product Type 20 Contract 21 Repayment Plan',
  `remark` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Field description',
  `input_tips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'input tips',
  `max_length` int(12) NULL DEFAULT NULL COMMENT'maximum length',
  `default_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT'' COMMENT'default value',
  `is_unique` int(1) NULL DEFAULT 0 COMMENT'is it unique 1 is 0 no',
  `is_null` int(1) NULL DEFAULT 0 COMMENT'Is it mandatory 1 Yes 0 No',
  `sorting` int(5) NULL DEFAULT 1 COMMENT'Sorting from small to large',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT'If the type is an option, this cannot be empty. Multiple options are separated by',
  `operating` int(1) NULL DEFAULT 0 COMMENT'Is it possible to delete to modify 0 to modify 1 to modify 2 to delete 3 none',
  `is_hidden` int(1) NOT NULL DEFAULT 0 COMMENT'whether to hide 0 not to hide 1 to hide',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT'last modified time',
  `form_id` int(11) NULL DEFAULT NULL COMMENT'Form Id',
  `field_type` int(2) NOT NULL DEFAULT 0 COMMENT'Field source 0. Custom 1. Original fixed 2 Original field but the value exists in the extended table',
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Market Activity Field Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_marketing_field
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_marketing_form
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_marketing_form`;
CREATE TABLE `wk_crm_marketing_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'name',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Description',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  `status` int(1) NULL DEFAULT 1 COMMENT '1 is enabled, 0 is disabled',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `is_deleted` int(1) NULL DEFAULT 0 COMMENT '1 has been deleted',
  `delete_time` datetime(0) NULL DEFAULT NULL COMMENT'Delete time',
  `delete_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Delete person ID',
  `update_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Marketing activity form information' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_marketing_form
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_marketing_info
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_marketing_info`;
CREATE TABLE `wk_crm_marketing_info` (
   `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'id',
   `marketing_id` int(11) NOT NULL COMMENT'Association ID',
   `status` int(1) NOT NULL DEFAULT 0 COMMENT '0 not synchronized 1 synchronization success 2 synchronization failure',
   `field_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'Marketing content fill in the field content',
   `device` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'device number',
   `owner_user_id` bigint(20) NOT NULL COMMENT'association ID',
   `create_time` datetime(0) NOT NULL COMMENT'create time',
   PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Marketing Data Sheet' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_marketing_info
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_number_setting
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_number_setting`;
CREATE TABLE `wk_crm_number_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'setting id',
  `pid` int(11) NOT NULL COMMENT'Parent setting id',
  `sort` int(2) NOT NULL COMMENT'Numbering order',
  `type` int(2) NOT NULL COMMENT'Number type 1 text 2 date 3 numbers',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Text content or date format or starting number',
  `increase_number` int(11) NULL DEFAULT NULL COMMENT'increment number',
  `reset_type` int(2) NULL DEFAULT NULL COMMENT'Renumbering period 1 every day 2 every month 3 every year 4 never',
  `last_number` int(10) NULL DEFAULT NULL COMMENT'Last number generated',
  `last_date` date NULL DEFAULT NULL COMMENT'Last generated time',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator id',
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='System automatically generates number setting table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_number_setting
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_owner_record
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_owner_record`;
CREATE TABLE `wk_crm_owner_record` (
   `record_id` int(11) NOT NULL AUTO_INCREMENT,
   `type_id` int(11) NOT NULL COMMENT'object id',
   `type` int(4) NOT NULL COMMENT'object type',
   `pre_owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Previous person in charge',
   `post_owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'take over the person in charge',
   `create_time` datetime(0) NOT NULL COMMENT'create time',
   PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Person in charge change record table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_owner_record
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_print_record
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_print_record`;
CREATE TABLE `wk_crm_print_record` (
   `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'record id',
   `crm_type` int(4) NOT NULL,
   `type_id` int(11) NOT NULL,
   `template_id` int(11) NOT NULL COMMENT'template id',
   `record_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT'Print record',
   `create_user_id` bigint(20) NOT NULL COMMENT'creator id',
   `create_time` datetime(0) NOT NULL COMMENT'create time',
   PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Print record table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_print_record
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_print_template
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_print_template`;
CREATE TABLE `wk_crm_print_template` (
   `template_id` int(11) NOT NULL AUTO_INCREMENT,
   `template_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'template name',
   `type` int(2) NOT NULL COMMENT'associated object',
   `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT'template',
   `create_user_id` bigint(20) NOT NULL COMMENT'creator id',
   `create_time` datetime(0) NOT NULL COMMENT'create time',
   `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
   PRIMARY KEY (`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Print template table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_print_template
-- ----------------------------
INSERT INTO `wk_crm_print_template` VALUES (20, 'Contract terms print template', 6, '<p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">***有限公司</span></p><p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">销售合同</span></p><p style=\"text-align: right;\"><span style=\"font-size: 14px; font-family: simsun, serif; color: #525151;\">合同编号：<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.num\">{合同编号}</span></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">甲方：<span class=\"wk-print-tag-wukong wk-tiny-color--customer\" contenteditable=\"true\" data-wk-tag=\"customer.customer_name\">{客户名称}</span><u></u></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">乙方：郑州卡卡罗特软件科技有限公司</span></p><p style=\"line-height: 1.75;\">&nbsp;</p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">甲乙双方本着相互信任，真诚合作的原则，经双方友好协商，就乙方为甲方提供特定服务达成一致意见，特签订本合同。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\"><strong>一、服务内容</strong></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">1、乙方同意向甲方提供的特定服务。服务的内容的标准见附件A。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">2、如果乙方在工作中因自身过错而发生任何错误或遗漏，乙方应无条件更正，而不另外收费，并对因此而对甲方造成的损失承担赔偿责任，赔偿以附件A所载明的该项服务内容对应之服务费为限。若因甲方原因造成工作的延误，将由甲方承担相应的损失。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">3、乙方的服务承诺：</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">&nbsp; &nbsp; 1）乙方接到甲方通过电话、信函传真、电子邮件、网上提交等方式提出关于附件A所列服务的请求后，在两个有效工作日内给予响应并提供服务。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">&nbsp; &nbsp; 2）乙方提供给甲方的服务，必须按照合同附件A规定的标准进行。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">4、产品明细：</span></p><table style=\"border-collapse: collapse; width: 100%; float: right;\" border=\"1\" data-wk-table-tag=\"table\"><tbody><tr data-wk-table-tr-tag=\"header\"><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">产品名称</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">产品类别</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">单位</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">价格</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">售价</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">数量</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">折扣</span></strong></td><td style=\"background-color: #ffffff;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">合计</span></strong></td></tr><tr data-wk-table-tr-tag=\"value\"><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品名称}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.category_name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品类别}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.单位\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{单位}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{价格}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{售价}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_num\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{数量}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.discount\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{折扣}</span></span></td><td data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.subtotal\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合计}</span></span></td></tr></tbody></table><p style=\"line-height: 1.75;\"><span style=\"font-family: simsun, serif;\"><span style=\"font-size: 14px;\">整单折扣：<span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-tag=\"contract.discount_rate\">{整单折扣}</span></span><span style=\"font-size: 14px;\">&nbsp; &nbsp;产品总金额（元）：<span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-tag=\"contract.total_price\">{产品总金额}</span></span></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\"><strong>二、服务费的支付</strong></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">1、服务费总金额为<u>&nbsp; &nbsp;&nbsp;<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.money\">{合同金额}</span>&nbsp; &nbsp;</u>元人民币(人民币大写：<u>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</u>元整)。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">2、本费用结构仅限於附件A中列明的工作。如果甲方要求扩大项目范围，或因甲方改变已经议定的项目内容导致乙方需重复进行项目步骤，乙方将需要重新评估上述费用结构。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">3、甲乙双方一致同意项目服务费按一次性以人民币形式支付。服务完成后，甲方将在验收确认服务完成合格，并且乙方发出该阶段工作的费用账单及正式有效的税务发票后3个工作日内，向乙方支付约定的费用。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">4、有关发票方面的任何问题，甲方应在收到发票后及时书面通知乙方，便乙方及时作出解释或解决问题，以使甲方能按时付款。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">5、乙方将自行承担项目实施范围内合理的差旅费用。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">6、乙方同意免除项目杂费。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">7、本协议有效期为：&nbsp; <u>&nbsp; &nbsp;<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.start_time\">{合同开始时间}</span></u><u>&nbsp; &nbsp; </u>&nbsp; 起&nbsp; <u>&nbsp; &nbsp;&nbsp;<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.end_time\">{合同结束时间}</span></u><u>&nbsp; &nbsp; </u>&nbsp;止</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\"><strong>三、服务的变更</strong></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">甲方可以提前个工作日以书面形式要求变更或增加所提供的服务。该等变更最终应由双方互相商定认可，其中包括与该等变更有关的任何费用调整。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\"><strong>四、争议处理</strong></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">甲乙双方如对协议条款规定的理解有异议，或者对与协议有关的事项发生争议，双方应本着友好合作的精神进行协商。协商不能解决的，任何一方可向仲裁委员会提起仲裁。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\"><strong>五、其他</strong></span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">1、本合同中所用的标题仅为方便而设，而不影响对本合同的解释。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">2、附件A是本合同不可分割的组成部分，与本合同具有同等法律效力。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">3、本合同未尽事宜，由甲乙双方协商后产生书面文件，作为本合同的补充条款，具备与本合同同等法律效力。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">4、对本合同内容的任何修改和变更需要，用书面形式，并经双方确认后生效。</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">(以下无正文)</span></p><p style=\"line-height: 1.75;\">&nbsp;</p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">甲方（签章）&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;乙方（签章）</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">代表签字：&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;代表签字：</span></p><p style=\"line-height: 1.75;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">日期：&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;日期：</span></p>', 0, '2020-08-22 11:40:42', NULL);
INSERT INTO `wk_crm_print_template` VALUES (21, 'Contract order print template', 6, '<p style=\"text-align: center; line-height: 2;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">合同订单</span></p><p style=\"line-height: 2; text-align: right;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">合同编号：<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.num\">{合同编号}</span></span></p><table style=\"border-collapse: collapse; width: 102.185%; height: 147px;\" border=\"1\"><tbody><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">合同名称：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合同名称}</span></span><span style=\"font-size: 14px; font-family: simsun, serif;\">&nbsp;</span></td><td style=\"width: 52.3571%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">客户名称：</span><span class=\"wk-print-tag-wukong wk-tiny-color--customer\" contenteditable=\"true\" data-wk-tag=\"customer.customer_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{客户名称}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">合同总金额：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.money\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合同金额}</span></span></td><td style=\"width: 52.3571%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">负责人：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.owner_user_name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{负责人}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">相关商机：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.business_name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{商机名称}</span></span><span style=\"font-size: 14px; font-family: simsun, serif;\">&nbsp;</span></td><td style=\"width: 52.3571%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">签订时间：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.order_date\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{下单时间}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">开始时间：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.start_time\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合同开始时间}</span></span></td><td style=\"width: 52.3571%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">结束时间：</span><span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"true\" data-wk-tag=\"contract.end_time\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{合同结束时间}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">备注：<span class=\"wk-print-tag-wukong wk-tiny-color--contract\" contenteditable=\"false\" data-wk-tag=\"contract.remark\">{备注}</span></span></td><td style=\"width: 52.3571%; height: 21px;\">&nbsp;</td></tr></tbody></table><p style=\"line-height: 2;\">&nbsp;</p><p style=\"line-height: 2;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">产品明细：</span></p><table style=\"border-collapse: collapse; width: 102.185%; height: 60px; line-height: 2;\" border=\"1\" data-wk-table-tag=\"table\"><tbody><tr data-wk-table-tr-tag=\"header\"><td style=\"width: 16.2207%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">产品名称</span></strong></td><td style=\"width: 16.2207%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">产品类别</span></strong></td><td style=\"width: 9.53177%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">单位</span></strong></td><td style=\"width: 13.8796%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">标准价格</span></strong></td><td style=\"width: 13.8796%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">销售单价</span></strong></td><td style=\"width: 9.699%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">数量</span></strong></td><td style=\"width: 9.699%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">折扣</span></strong></td><td style=\"width: 9.69447%;\" data-wk-table-td-tag=\"name\"><strong><span style=\"font-size: 14px; font-family: simsun, serif;\">合计</span></strong></td></tr><tr data-wk-table-tr-tag=\"value\"><td style=\"width: 16.2207%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品名称}</span></span></td><td style=\"width: 16.2207%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.category_name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品类别}</span></span></td><td style=\"width: 9.53177%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.单位\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{单位}</span></span></td><td style=\"width: 13.8796%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{价格}</span></span></td><td style=\"width: 13.8796%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{售价}</span></span></td><td style=\"width: 9.699%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_num\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{数量}</span></span></td><td style=\"width: 9.699%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.discount\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{折扣}</span></span></td><td style=\"width: 9.69447%;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.subtotal\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合计}</span></span></td></tr></tbody></table><p style=\"text-align: right; line-height: 2;\"><span style=\"font-family: simsun, serif;\">产品总金额：</span><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-tag=\"contract.total_price\"><span style=\"font-family: simsun, serif;\">{产品总金额}</span></span></p><p>&nbsp;</p><p>&nbsp;</p>', 0, '2020-08-22 11:40:42', NULL);
INSERT INTO `wk_crm_print_template` VALUES (22, 'Business opportunity print Template', 5, '<p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">***有限公司</span></p><p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">商机</span></p><table style=\"border-collapse: collapse; width: 100.337%; height: 138px;\" border=\"1\"><tbody><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">商机名称：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.business_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{商机名称}</span></span></td><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">客户名称：</span><span class=\"wk-print-tag-wukong wk-tiny-color--customer\" contenteditable=\"true\" data-wk-tag=\"customer.customer_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{客户名称}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">商机状态组：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.type_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{商机状态组}</span></span></td><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">商机阶段：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.status_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{商机阶段}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">预计成交时间：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.deal_date\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{预计成交日期}</span></span></td><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">商机金额（元）：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.money\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{商机金额}</span></span></td></tr><tr style=\"height: 21px;\"><td style=\"width: 50%; height: 21px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">负责人：</span><span class=\"wk-print-tag-wukong wk-tiny-color--business\" contenteditable=\"true\" data-wk-tag=\"business.owner_user_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{负责人}</span></span></td><td style=\"width: 50%; height: 21px;\">&nbsp;</td></tr></tbody></table><p style=\"text-align: left; line-height: 2;\">&nbsp;</p><p style=\"text-align: left; line-height: 2;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">产品明细：</span></p><table style=\"border-collapse: collapse; width: 100%; height: 65px; line-height: 2;\" border=\"1\" data-wk-table-tag=\"table\"><tbody><tr style=\"height: 31px;\" data-wk-table-tr-tag=\"header\"><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">产品名称</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">产品类型</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">单位</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">价格</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">售价</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">数量</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">折扣</span></strong></span></td><td style=\"height: 31px;\" data-wk-table-td-tag=\"name\"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: simsun, serif;\">合计</span></strong></span></td></tr><tr style=\"height: 38px;\" data-wk-table-tr-tag=\"value\"><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.name\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品名称}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.category_id\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品类型}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.单位\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{单位}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{价格}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{售价}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.sales_num\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{数量}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.discount\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{折扣}</span></span></td><td style=\"height: 34px;\" data-wk-table-td-tag=\"value\"><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-table-value-tag=\"product.subtotal\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{合计}</span></span></td></tr></tbody></table><p style=\"text-align: left; line-height: 2;\"><span style=\"font-size: 14px; font-family: simsun, serif;\">整单折扣：</span><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-tag=\"business.discount_rate\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{整单折扣}</span></span><span style=\"font-size: 14px; font-family: simsun, serif;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;产品总金额（元）：</span><span class=\"wk-print-tag-wukong wk-tiny-color--product\" contenteditable=\"true\" data-wk-tag=\"business.total_price\"><span style=\"font-size: 14px; font-family: simsun, serif;\">{产品总金额}</span></span></p>', 0, '2020-08-22 11:40:42', NULL);
INSERT INTO `wk_crm_print_template` VALUES (23, 'Receipt print template', 7, '<p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">***有限公司</span></p><p style=\"text-align: center; line-height: 1; margin-bottom: 15px;\"><span style=\"font-size: 36px; font-family: simsun, serif;\">回款单</span></p><table style=\"border-collapse: collapse; width: 100.842%; height: 146px;\" border=\"1\"><tbody><tr style=\"height: 18px;\"><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">客户名称：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.customer_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{客户名称}</span></span></td><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">回款编号：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.number\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{回款编号}</span></span></td></tr><tr style=\"height: 18px;\"><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">回款日期：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.return_time\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{回款日期}</span></span></td><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">回款方式：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.return_type\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{回款方式}</span></span></td></tr><tr style=\"height: 18px;\"><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">回款期数：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.plan_num\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{期数}</span></span></td><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">回款金额（元）：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.money\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{回款金额}</span></span></td></tr><tr style=\"height: 18px;\"><td style=\"width: 50%; height: 18px;\"><span style=\"font-family: simsun, serif; font-size: 14px;\">负责人：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.owner_user_name\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{负责人}</span></span></td><td style=\"width: 50%; height: 18px;\">&nbsp;</td></tr><tr style=\"height: 18px;\"><td style=\"width: 50%; height: 18px;\" colspan=\"2\"><span style=\"font-family: simsun, serif; font-size: 14px;\">备注：</span><span class=\"wk-print-tag-wukong wk-tiny-color--receivables\" contenteditable=\"true\" data-wk-tag=\"receivables.remark\"><span style=\"font-family: simsun, serif; font-size: 14px;\">{备注}</span></span></td></tr></tbody></table>', 0, '2020-08-22 11:40:42', NULL);

-- ----------------------------
-- Table structure for wk_crm_product
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_product`;
CREATE TABLE `wk_crm_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'product name',
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'product code',
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'unit',
  `price` decimal(18, 2) NULL DEFAULT 0.00 COMMENT'price',
  `status` int(1) NULL DEFAULT NULL COMMENT'Status 1 On shelf 0 Off shelf 3 Delete',
  `category_id` int(11) NULL DEFAULT NULL COMMENT'Product category ID',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT'Product description',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Person in charge ID',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `batch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'batch',
  `old_product_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Product table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_product
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_product_category
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_product_category`;
CREATE TABLE `wk_crm_product_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pid` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14768 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Product Classification Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_product_category
-- ----------------------------
INSERT INTO `wk_crm_product_category` VALUES (14767, 'Default', 0);

-- ----------------------------
-- Table structure for wk_crm_product_data
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_product_data`;
CREATE TABLE `wk_crm_product_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Field Nam',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NOT NULL,
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `batch_id`(`batch_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Product custom field stored value table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_product_data
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_product_detail_img
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_product_detail_img`;
CREATE TABLE `wk_crm_product_detail_img` (
   `img_id` int(11) NOT NULL AUTO_INCREMENT,
   `product_id` int(11) NULL DEFAULT NULL COMMENT'product id',
   `remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
   `main_file_ids` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Main image',
   `detail_file_ids` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
   PRIMARY KEY (`img_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Product Details Picture' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_product_detail_img
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_product_user
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_product_user`;
CREATE TABLE `wk_crm_product_user`  (
  `product_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`product_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'The product employee applet displays the association table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_product_user
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_receivables
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_receivables`;
CREATE TABLE `wk_crm_receivables` (
  `receivables_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Receipt ID',
  `number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'payment number',
  `plan_id` int(11) NULL DEFAULT NULL COMMENT'Payment plan ID',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT'Customer ID',
  `contract_id` int(11) NULL DEFAULT NULL COMMENT'Contract ID',
  `check_status` int(4) NULL DEFAULT NULL COMMENT '0 pending review, 1 passed, 2 rejected, 3 under review 4: withdrawn 5 not submitted',
  `examine_record_id` int(11) NULL DEFAULT NULL COMMENT'audit record ID',
  `return_time` date NULL DEFAULT NULL COMMENT'Return date',
  `return_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'return method',
  `money` decimal(17, 2) NULL DEFAULT NULL COMMENT'Receipt amount',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Remarks',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Person in charge ID',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Remarks',
  `batch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'batch',
  PRIMARY KEY (`receivables_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Return Form' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_receivables
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_receivables_data
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_receivables_data`;
CREATE TABLE `wk_crm_receivables_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Field Name',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NOT NULL,
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `batch_id`(`batch_id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Receipt custom field deposit value table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_receivables_data
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_receivables_plan
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_receivables_plan`;
CREATE TABLE `wk_crm_receivables_plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'number of periods',
  `receivables_id` int(11) NULL DEFAULT NULL COMMENT'Receipt ID',
  `status` int(4) NULL DEFAULT NULL COMMENT '1 completed 0 not completed',
  `money` decimal(18, 2) NULL DEFAULT NULL COMMENT'Planned payment amount',
  `return_date` datetime(0) NULL DEFAULT NULL COMMENT'Planned payment date',
  `return_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Planned payment method',
  `remind` int(4) NULL DEFAULT NULL COMMENT'Remind a few days in advance',
  `remind_date` datetime(0) NULL DEFAULT NULL COMMENT'remind date',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Remarks',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Person in charge ID',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `file_batch` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Attachment batch ID',
  `contract_id` int(11) NOT NULL COMMENT'Contract ID',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT'Customer ID',
  `old_plan_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`plan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Payment plan table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_receivables_plan
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_return_visit
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_return_visit`;
CREATE TABLE `wk_crm_return_visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Revisit id',
  `visit_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'Revisit number',
  `visit_time` datetime(0) NULL DEFAULT NULL COMMENT'Revisit time',
  `owner_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Revisitor id',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT'Customer id',
  `contract_id` int(11) NULL DEFAULT NULL COMMENT'contract id',
  `contacts_id` int(11) NULL DEFAULT NULL COMMENT'Contact id',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator id',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` datetime(0) NOT NULL COMMENT'Update time',
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'batch id',
  PRIMARY KEY (`visit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Revisit table\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_return_visit
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_return_visit_data
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_return_visit_data`;
CREATE TABLE `wk_crm_return_visit_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Field Name',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NOT NULL,
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Revisit the extended data table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_return_visit_data
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_role_field
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_role_field`;
CREATE TABLE `wk_crm_role_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT'role id',
  `label` int(4) NOT NULL COMMENT'crm module',
  `field_id` int(11) NULL DEFAULT NULL COMMENT'field id',
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'field identification',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'field name',
  `auth_level` int(2) NOT NULL COMMENT'Authority 1 Cannot Update Cannot Read-only 2 Can Read-only Cannot Update 3 Can Update Can Read-only',
  `operate_type` int(2) NOT NULL COMMENT'Operation permissions 1 can be set 2 Only Read-only permissions can be set 3 Only Update permissions can be set 4 Cannot be set',
  `field_type` int(4) NULL DEFAULT NULL COMMENT '0 custom field 1 original field 2 original field but the value is in the data table 3 related table field 4 system field',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Role field authorization table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_role_field
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_scene
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_scene`;
CREATE TABLE `wk_crm_scene` (
   `scene_id` int(10) NOT NULL AUTO_INCREMENT,
   `type` int(5) NOT NULL COMMENT'Classification',
   `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'scene name',
   `user_id` bigint(20) NOT NULL COMMENT'User ID',
   `sort` int(5) NOT NULL COMMENT'sort ID',
   `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'attribute value',
   `is_hide` int(1) NOT NULL COMMENT '1 hide',
   `is_system` int(1) NOT NULL COMMENT '1 system 0 custom',
   `bydata` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'system parameter',
   `create_time` datetime(0) NOT NULL COMMENT'create time',
   `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
   PRIMARY KEY (`scene_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 621 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='scene' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_scene
-- ----------------------------

-- ----------------------------
-- Table structure for wk_crm_scene_default
-- ----------------------------
DROP TABLE IF EXISTS `wk_crm_scene_default`;
CREATE TABLE `wk_crm_scene_default` (
   `default_id` int(11) NOT NULL AUTO_INCREMENT,
   `type` int(5) NOT NULL COMMENT'type',
   `user_id` bigint(20) NOT NULL COMMENT'Personnel ID',
   `scene_id` int(11) NOT NULL COMMENT'Scene ID',
   PRIMARY KEY (`default_id`) USING BTREE,
   UNIQUE INDEX `default_id`(`default_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Scene default relationship table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_crm_scene_default
-- ----------------------------

-- ----------------------------
-- Table structure for wk_email_account
-- ----------------------------
DROP TABLE IF EXISTS `wk_email_account`;
CREATE TABLE `wk_email_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'email account',
  `email_password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'email password',
  `send_nick` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Send nickname',
  `configuration_mode` int(2) NULL DEFAULT 1 COMMENT'Configuration method 1: automatic configuration 2: manual configuration',
  `service_type` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Receiving service type: POP3, IMAP',
  `receiving_server` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'receiving server address',
  `is_receiving` int(2) NULL DEFAULT 1 COMMENT'Whether the receiving server is enabled with ssl proxy 0: not enabled 1: enabled',
  `receiving_ssl` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Receiving server SSL port',
  `smtp_server` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'SMTP server',
  `is_smtp` int(2) NULL DEFAULT 1 COMMENT'Whether the smtp server is enabled with ssl proxy 0: not enabled 1: enabled',
  `smtp_ssl` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'smtp port number',
  `signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT'personal signature',
  `email_count` int(11) NULL DEFAULT NULL COMMENT'Total number of emails',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Email account' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_email_account
-- ----------------------------

-- ----------------------------
-- Table structure for wk_email_file
-- ----------------------------
DROP TABLE IF EXISTS `wk_email_file`;
CREATE TABLE `wk_email_file` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'File name',
   `file_size` bigint(20) NULL DEFAULT NULL COMMENT'File size',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator',
   `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'File batch ID',
   PRIMARY KEY (`id`) USING BTREE,
   INDEX `batch_id`(`batch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Mailbox attachment name table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_email_file
-- ----------------------------

-- ----------------------------
-- Table structure for wk_email_lately
-- ----------------------------
DROP TABLE IF EXISTS `wk_email_lately`;
CREATE TABLE `wk_email_lately` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `customer_id` int(11) NULL DEFAULT NULL COMMENT'When the customer id is empty, it means it is not a list customer. If it is not empty, it means a customer.',
   `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
   `email` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'mailbox',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `update_time` datetime(0) NULL DEFAULT NULL COMMENT'modification time',
   `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Mailbox recent contact' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_email_lately
-- ----------------------------

-- ----------------------------
-- Table structure for wk_email_record
-- ----------------------------
DROP TABLE IF EXISTS `wk_email_record`;
CREATE TABLE `wk_email_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_account_id` int(11) NULL DEFAULT NULL COMMENT'sending account id',
  `sender` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Sender\'s nickname',
  `sender_email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT'sender\'s mailbox',
  `receipt_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `receipt_emails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT'Receiver mailbox collection comma separated',
  `cc_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `cc_emails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT'Cc mailbox separated by comma',
  `theme` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'theme',
  `attachment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Attachment',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT'content',
  `email_type` int(2) NULL DEFAULT NULL COMMENT'Mailbox type 1: Inbox 2: Outbox 3: Draft box 4: Delete box 5: Trash can',
  `is_read` int(2) NULL DEFAULT 0 COMMENT'Whether it has been read 0: Unread 1: Read',
  `is_start` int(2) NULL DEFAULT 0 COMMENT'Whether to mark a star 0: not marked with a star 1: marked with a star',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `record_type` int(2) NULL DEFAULT NULL COMMENT'Record type 1: Send 2: Save draft 3: Delete email 4: Star email 5: Spam email',
  `message_id` int(2) NULL DEFAULT NULL COMMENT'message id',
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `is_del` int(2) NULL DEFAULT 0 COMMENT '0: not deleted 1: already deleted',
  `email_uid` bigint(32) NULL DEFAULT NULL COMMENT'mail uid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Mail record' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_email_record
-- ----------------------------

-- ----------------------------
-- Table structure for wk_examine
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine`;
CREATE TABLE `wk_examine` (
  `examine_id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT'Approval ID',
  `label` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '0 OA 1 Contract 2 Receipt 3 Invoice 4 Salary 5 Procurement review 6 Purchase return review 7 Sales review 8 Sales return review 9 Payment order review 10 Receipt review 11 inventory review 12 Allocation Review',
  `examine_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'icon',
  `examine_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Approval name',
  `recheck_type` int(1) NULL DEFAULT NULL COMMENT'Re-review operation after withdrawal 1 from the first level 2 from the rejected level',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator',
  `status` int(1) NULL DEFAULT NULL COMMENT '1 Normal 2 Disabled 3 Delete',
  `batch_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Batch ID',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Remarks',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT'modification time',
  `update_user_id` bigint(20) NULL DEFAULT NULL COMMENT'modify person',
  `user_ids` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Visible range (employees)',
  `dept_ids` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Visible range (department)',
  `oa_type` int(1) NULL DEFAULT 0 COMMENT '1 Ordinary approval 2 Leave approval 3 Business trip approval 4 Overtime approval 5 Travel reimbursement 6 Loan application 0 Custom approval',
  PRIMARY KEY (`examine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1164178 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Approval Form' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine
-- ----------------------------
INSERT INTO `wk_examine` VALUES (25375, 2, NULL,'Payment approval process', 1, NULL, 3, 1, '38e4ecd1525111ebbe7418c04d26d688','', '2021-01-09 16:03:54', 3, NULL, NULL, 0);
INSERT INTO `wk_examine` VALUES (25376, 1, NULL,'Contract approval process', 1, NULL, 3, 1, '38e4f6e4525111ebbe7418c04d26d688','Description', '2021-01-09 16:03:54', 3, NULL, NULL, 0);
INSERT INTO `wk_examine` VALUES (25377, 3, NULL,'Invoice approval process', 1, NULL, 0, 1, '38e4f798525111ebbe7418c04d26d688','', '2021-01-09 16:03:54', 0, NULL , NULL, 0);
INSERT INTO `wk_examine` VALUES (1072979, 0,'wk wk-l-record,#3ABCFB','General approval', 1, '2019-04-26 15:06:34', 3, 1, '38efbcd2525111ebbe7418c04d26d688' ,'General approval', '2021-01-09 16:03:54', 3,'','', 1);
INSERT INTO `wk_examine` VALUES (1072980, 0,'wk wk-leave,#00CAAB','Leave Approval', 1, '2019-04-17 18:52:44', 3, 1, '38efbdd4525111ebbe7418c04d26d688', ' Leave approval', '2021-01-09 16:03:54', 3,'','', 2);
INSERT INTO `wk_examine` VALUES (1072981, 0,'wk wk-trip,#3ABCFB','Travel Approval', 1, '2019-04-17 18:52:50', 3, 1, '38efbe57525111ebbe7418c04d26d688', ' Business trip approval', '2021-01-09 16:03:54', 3,'','', 3);
INSERT INTO `wk_examine` VALUES (1072982, 0,'wk wk-overtime,#FAAD14','Overtime approval', 1, '2019-04-17 18:52:59', 3, 1, '38efbe9f525111ebbe7418c04d26d688', ' Overtime approval', '2021-01-09 16:03:54', 3,'','', 4);
INSERT INTO `wk_examine` VALUES (1072983, 0,'wk wk-reimbursement,#3ABCFB','Travel Reimbursement', 1, '2019-04-17 18:53:13', 3, 1, '38efbee2525111ebbe7418c04d26d688', 'Travel reimbursement', '2021-01-09 16:03:54', 3,'','', 5);
INSERT INTO `wk_examine` VALUES (1072984, 0,'wk wk-go-out,#FF6033','Loan application', 1, '2019-04-17 18:54:44', 3, 1, '38efbf24525111ebbe7418c04d26d688' ,'Loan application', '2021-01-09 16:03:54', 3,'','', 6);

-- ----------------------------
-- Table structure for wk_examine_condition
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_condition`;
CREATE TABLE `wk_examine_condition` (
   `condition_id` int(11) NOT NULL AUTO_INCREMENT,
   `condition_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'condition name',
   `flow_id` int(11) NOT NULL COMMENT'Approval flow ID',
   `priority` int(4) NOT NULL COMMENT'The lower the priority number, the higher the priority',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
   `batch_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Batch ID',
   PRIMARY KEY (`condition_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1490 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Approval condition table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_condition
-- ----------------------------

-- ----------------------------
-- Table structure for wk_examine_condition_data
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_condition_data`;
CREATE TABLE `wk_examine_condition_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condition_id` int(11) NOT NULL COMMENT'Condition ID',
  `flow_id` int(11) NOT NULL COMMENT'Approval flow ID',
  `field_id` int(11) NULL DEFAULT NULL COMMENT'field ID',
  `field_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'field name',
  `condition_type` int(2) NULL DEFAULT NULL COMMENT'Connection condition 1 is equal to 2 is greater than 3 is less than 4 is greater than or equal to 5 is less than or equal to 6 between the two 7 contains 8 employees 9 departments 10 roles',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'value, json array format',
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Batch ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Field Chinese name',
  `type` int(2) NULL DEFAULT NULL COMMENT'Field type 1 Single line of text 2 Multiple lines of text 3 Single selection 4 Date 5 Number 6 Decimal 7 Mobile phone 8 File 9 Multiple selection 10 Personnel 11 Attachment 12 Department 13 Date and time 14 Email 15 Customer 16 Business Opportunities 17 Contacts 18 Map 19 Product Type 20 Contract 21 Repayment Plan',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1506 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Approval condition extension field table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_condition_data
-- ----------------------------

-- ----------------------------
-- Table structure for wk_examine_flow
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_flow`;
CREATE TABLE `wk_examine_flow` (
  `flow_id` int(10) NOT NULL AUTO_INCREMENT COMMENT'audit flow ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'name',
  `examine_id` bigint(10) UNSIGNED NULL DEFAULT NULL COMMENT'Approval ID',
  `examine_type` int(2) NOT NULL COMMENT '0 condition 1 designated member 2 supervisor 3 role 4 initiator optional 5 continuous multi-level supervisor',
  `examine_error_handling` int(1) NOT NULL DEFAULT 1 COMMENT'What to do when the user cannot be found for approval or the conditions are not met 1 Automatically pass 2 Administrator approval',
  `condition_id` int(11) NOT NULL DEFAULT 0 COMMENT'Condition ID',
  `sort` int(11) NOT NULL COMMENT'The order of execution, cannot be empty',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'User ID',
  `batch_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Batch ID',
  PRIMARY KEY (`flow_id`) USING BTREE,
  INDEX `examine_id`(`examine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1163342 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Approval Process Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_flow
-- ----------------------------
INSERT INTO `wk_examine_flow` VALUES (1163333,'Business approval 6375', 25375, 4, 2, 0, 1, NULL, 3, '38e4ecd1525111ebbe7418c04d26d688');
INSERT INTO `wk_examine_flow` VALUES (1163334,'Business approval 3841', 25376, 4, 2, 0, 1, NULL, 3, '38e4f6e4525111ebbe7418c04d26d688');
INSERT INTO `wk_examine_flow` VALUES (1163335,'Business approval 3682', 25377, 4, 2, 0, 1, NULL, 0, '38e4f798525111ebbe7418c04d26d688');
INSERT INTO `wk_examine_flow` VALUES (1163336,'Office approval 3621', 1072979, 4, 2, 0, 1, '2019-04-26 15:06:34', 3, '38efbcd2525111ebbe7418c04d26d688');
INSERT INTO `wk_examine_flow` VALUES (1163337,'Office approval 1325', 1072980, 4, 2, 0, 1, '2019-04-17 18:52:44', 3, '38efbdd4525111ebbe7418c04d26d688');
INSERT INTO `wk_examine_flow` VALUES (1163338,'Office approval 6681', 1072981, 4, 2, 0, 1, '2019-04-17 18:52:50', 3, '38efbe57525111ebbe7418c04d26d688');
INSERT INTO `wk_examine_flow` VALUES (1163339,'Office Approval 2494', 1072982, 4, 2, 0, 1, '2019-04-17 18:52:59', 3, '38efbe9f525111ebbe7418c04d26d688');
INSERT INTO `wk_examine_flow` VALUES (1163340,'Office Approval 8739', 1072983, 4, 2, 0, 1, '2019-04-17 18:53:13', 3, '38efbee2525111ebbe7418c04d26d688');
INSERT INTO `wk_examine_flow` VALUES (1163341,'Office approval 8180', 1072984, 4, 2, 0, 1, '2019-04-17 18:54:44', 3, '38efbf24525111ebbe7418c04d26d688');

-- ----------------------------
-- Table structure for wk_examine_flow_continuous_superior
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_flow_continuous_superior`;
CREATE TABLE `wk_examine_flow_continuous_superior` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `flow_id` int(11) NOT NULL COMMENT'Approval flow ID',
   `role_id` int(11) NULL DEFAULT NULL COMMENT'role ID',
   `max_level` int(2) NULL DEFAULT NULL COMMENT'The highest level of role approval or the Nth level of the organizational structure',
   `type` int(1) NULL DEFAULT NULL COMMENT '1 Specify the role 2 The highest level of the organizational structure',
   `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Batch ID',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Approval process continuous multi-level supervisor approval record table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_flow_continuous_superior
-- ----------------------------

-- ----------------------------
-- Table structure for wk_examine_flow_member
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_flow_member`;
CREATE TABLE `wk_examine_flow_member` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `flow_id` int(11) NOT NULL COMMENT'Approval flow ID',
   `user_id` bigint(20) NULL DEFAULT NULL COMMENT'Approver ID',
   `type` int(1) NULL DEFAULT NULL COMMENT '1 Approval in turn 2 Countersign 3 or sign',
   `sort` int(1) NOT NULL DEFAULT 0 COMMENT'sort rule',
   `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Batch ID',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4448 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Approval process designated member record table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_flow_member
-- ----------------------------

-- ----------------------------
-- Table structure for wk_examine_flow_optional
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_flow_optional`;
CREATE TABLE `wk_examine_flow_optional` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `flow_id` int(11) NOT NULL COMMENT'review process ID',
   `user_id` bigint(20) NULL DEFAULT NULL COMMENT'Approver ID',
   `role_id` int(11) NULL DEFAULT NULL COMMENT'role ID',
   `choose_type` int(1) NULL DEFAULT NULL COMMENT'Choose type 1 choose one person 2 choose multiple people',
   `type` int(1) NULL DEFAULT NULL COMMENT '1 Approval in turn 2 Countersign 3 or sign',
   `sort` int(1) NOT NULL DEFAULT 0 COMMENT'sort rule',
   `batch_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Batch ID',
   `range_type` int(1) NULL DEFAULT NULL COMMENT'Select range 1 whole company 2 designated member 3 designated role',
   PRIMARY KEY (`id`) USING BTREE,
   INDEX `flow_id`(`flow_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1313998 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Approval process optional member record table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_flow_optional
-- ----------------------------
INSERT INTO `wk_examine_flow_optional` VALUES (1313980, 1163333, NULL, NULL, 2, 1, 0, '38e4ecd1525111ebbe7418c04d26d688', 1);
INSERT INTO `wk_examine_flow_optional` VALUES (1313981, 1163334, NULL, NULL, 2, 1, 0, '38e4f6e4525111ebbe7418c04d26d688', 1);
INSERT INTO `wk_examine_flow_optional` VALUES (1313982, 1163335, NULL, NULL, 2, 1, 0, '38e4f798525111ebbe7418c04d26d688', 1);
INSERT INTO `wk_examine_flow_optional` VALUES (1313983, 1163333, NULL, NULL, 2, 1, 0, '38e4ecd1525111ebbe7418c04d26d688', 1);
INSERT INTO `wk_examine_flow_optional` VALUES (1313984, 1163334, NULL, NULL, 2, 1, 0, '38e4f6e4525111ebbe7418c04d26d688', 1);
INSERT INTO `wk_examine_flow_optional` VALUES (1313985, 1163335, NULL, NULL, 2, 1, 0, '38e4f798525111ebbe7418c04d26d688', 1);
INSERT INTO `wk_examine_flow_optional` VALUES (1313986, 1163336, NULL, NULL, 2, 1, 0, '38efbcd2525111ebbe7418c04d26d688', 1);
INSERT INTO `wk_examine_flow_optional` VALUES (1313987, 1163337, NULL, NULL, 2, 1, 0, '38efbdd4525111ebbe7418c04d26d688', 1);
INSERT INTO `wk_examine_flow_optional` VALUES (1313988, 1163338, NULL, NULL, 2, 1, 0, '38efbe57525111ebbe7418c04d26d688', 1);
INSERT INTO `wk_examine_flow_optional` VALUES (1313989, 1163339, NULL, NULL, 2, 1, 0, '38efbe9f525111ebbe7418c04d26d688', 1);
INSERT INTO `wk_examine_flow_optional` VALUES (1313990, 1163340, NULL, NULL, 2, 1, 0, '38efbee2525111ebbe7418c04d26d688', 1);
INSERT INTO `wk_examine_flow_optional` VALUES (1313991, 1163341, NULL, NULL, 2, 1, 0, '38efbf24525111ebbe7418c04d26d688', 1);

-- ----------------------------
-- Table structure for wk_examine_flow_role
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_flow_role`;
CREATE TABLE `wk_examine_flow_role` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `flow_id` int(11) NOT NULL COMMENT'review process ID',
   `role_id` int(11) NULL DEFAULT NULL COMMENT'role ID',
   `type` int(1) NULL DEFAULT NULL COMMENT '2 countersigned 3 or signed',
   `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Batch ID',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 311 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Approval process role approval record form' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_flow_role
-- ----------------------------

-- ----------------------------
-- Table structure for wk_examine_flow_superior
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_flow_superior`;
CREATE TABLE `wk_examine_flow_superior` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `flow_id` int(11) NOT NULL COMMENT'review process ID',
   `parent_level` int(2) NULL DEFAULT NULL COMMENT'The immediate superior level 1 represents the immediate superior 2 represents the immediate superior',
   `type` int(1) NULL DEFAULT NULL COMMENT'When the superior is not found, whether the superior will approve on behalf of the superior 0 No 1 Yes',
   `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Batch ID',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2478 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Approval process supervisor approval record form' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_flow_superior
-- ----------------------------

-- ----------------------------
-- Table structure for wk_examine_manager_user
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_manager_user`;
CREATE TABLE `wk_examine_manager_user` (
   `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `examine_id` bigint(10) UNSIGNED NOT NULL COMMENT'Approval ID',
   `user_id` bigint(20) NOT NULL COMMENT'Administrator ID',
   `sort` int(5) NOT NULL DEFAULT 0 COMMENT'from small to large',
   PRIMARY KEY (`id`) USING BTREE,
   INDEX `examine_id`(`examine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 527852 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Approval administrator setting table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_manager_user
-- ----------------------------
INSERT INTO `wk_examine_manager_user` VALUES (527837, 25375, 14773, 0);
INSERT INTO `wk_examine_manager_user` VALUES (527838, 25376, 14773, 0);
INSERT INTO `wk_examine_manager_user` VALUES (527839, 25377, 14773, 0);
INSERT INTO `wk_examine_manager_user` VALUES (527840, 1072979, 14773, 0);
INSERT INTO `wk_examine_manager_user` VALUES (527841, 1072980, 14773, 0);
INSERT INTO `wk_examine_manager_user` VALUES (527842, 1072981, 14773, 0);
INSERT INTO `wk_examine_manager_user` VALUES (527843, 1072982, 14773, 0);
INSERT INTO `wk_examine_manager_user` VALUES (527844, 1072983, 14773, 0);
INSERT INTO `wk_examine_manager_user` VALUES (527845, 1072984, 14773, 0);

-- ----------------------------
-- Table structure for wk_examine_record
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_record`;
CREATE TABLE `wk_examine_record` (
   `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'audit record ID',
   `examine_id` bigint(11) NOT NULL COMMENT'audit ID',
   `label` int(1) NULL DEFAULT NULL COMMENT'Business Type',
   `flow_id` int(11) NOT NULL COMMENT'Flow ID',
   `type_id` int(11) NULL DEFAULT NULL COMMENT'Associated business primary key ID',
   `examine_status` int(1) NULL DEFAULT NULL COMMENT'Audit status 0 Unaudited 1 Audit passed 2 Audit rejected 3 Under review 4 Withdrawn',
   `create_time` datetime(0) NOT NULL COMMENT'create time',
   `create_user_id` bigint(20) NOT NULL COMMENT'creator',
   `update_time` datetime(0) NOT NULL COMMENT'modification time',
   `update_user_id` bigint(20) NOT NULL COMMENT'modify person',
   PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1004974 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Audit record table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_record
-- ----------------------------

-- ----------------------------
-- Table structure for wk_examine_record_log
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_record_log`;
CREATE TABLE `wk_examine_record_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `examine_id` bigint(11) NOT NULL COMMENT'Approval ID',
  `flow_id` int(11) NOT NULL COMMENT'Approval flow ID',
  `record_id` int(11) NOT NULL COMMENT'Approval record ID',
  `type` int(1) NULL DEFAULT NULL COMMENT '1 Approval in turn 2 Countersign 3 or sign',
  `sort` int(6) NULL DEFAULT NULL COMMENT'sort',
  `examine_status` int(1) NOT NULL COMMENT'review status 0 pending review, 1 passed, 2 rejected, 3 under review 4: withdrawn 5 not submitted 6 created 7 deleted 8 Update status',
  `examine_user_id` bigint(20) NULL DEFAULT 0 COMMENT'reviewer ID',
  `examine_role_id` int(11) NULL DEFAULT 0 COMMENT'Audit role ID',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'modification time',
  `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT'batch ID',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Remarks for review',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1137829 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Audit log table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_record_log
-- ----------------------------

-- ----------------------------
-- Table structure for wk_examine_record_optional
-- ----------------------------
DROP TABLE IF EXISTS `wk_examine_record_optional`;
CREATE TABLE `wk_examine_record_optional` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Primary key ID',
   `flow_id` int(11) NOT NULL COMMENT'Flow ID',
   `record_id` int(11) NOT NULL COMMENT'Audit record ID',
   `user_id` bigint(20) NOT NULL COMMENT'User ID',
   `sort` int(2) NOT NULL DEFAULT 1 COMMENT'Sort. From small to large',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 326 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Review optional member selection member table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_examine_record_optional
-- ----------------------------

-- ----------------------------
-- Table structure for wk_km_action_record
-- ----------------------------
DROP TABLE IF EXISTS `wk_km_action_record`;
CREATE TABLE `wk_km_action_record` (
   `record_id` int(11) NOT NULL AUTO_INCREMENT,
   `status` int(1) NULL DEFAULT NULL COMMENT '1 browse 2 Delete',
   `type` int(1) NOT NULL COMMENT '1 Knowledge Base 2 Folder 3 Document 4 File',
   `type_id` int(11) NOT NULL,
   `create_user_id` bigint(20) NOT NULL,
   `create_time` datetime(0) NOT NULL,
   PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Knowledge base operation record (recently used)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_km_action_record
-- ----------------------------

-- ----------------------------
-- Table structure for wk_km_auth
-- ----------------------------
DROP TABLE IF EXISTS `wk_km_auth`;
CREATE TABLE `wk_km_auth` (
   `auth_id` int(11) NOT NULL AUTO_INCREMENT,
   `is_open` int(1) NULL DEFAULT NULL COMMENT'Is it public 0 private 1 public',
   `open_auth` int(1) NULL DEFAULT NULL COMMENT'Public authority 2 can be updated 3 can be seen, not Update',
   PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Document folder permission table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_km_auth
-- ----------------------------
INSERT INTO `wk_km_auth` VALUES (87, 1, 2);
INSERT INTO `wk_km_auth` VALUES (88, 1, 2);
INSERT INTO `wk_km_auth` VALUES (89, 1, 2);
INSERT INTO `wk_km_auth` VALUES (90, 1, 2);
INSERT INTO `wk_km_auth` VALUES (91, 1, 2);

-- ----------------------------
-- Table structure for wk_km_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `wk_km_auth_user`;
CREATE TABLE `wk_km_auth_user` (
   `r_id` int(11) NOT NULL AUTO_INCREMENT,
   `auth_id` int(11) NULL DEFAULT NULL,
   `user_id` bigint(20) NULL DEFAULT NULL,
   `auth` int(1) NULL DEFAULT NULL COMMENT'Private permissions 1 All permissions 2 Update permissions 3 Read-only permissions',
   `create_time` datetime(0) NULL DEFAULT NULL,
   `create_user_id` bigint(20) NULL DEFAULT NULL,
   PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Knowledge base permission user association table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_km_auth_user
-- ----------------------------
INSERT INTO `wk_km_auth_user` VALUES (142, 87, 14773, 1, '2020-08-22 16:11:27', 14773);
INSERT INTO `wk_km_auth_user` VALUES (143, 88, 14773, 1, '2020-08-22 16:11:27', 14773);
INSERT INTO `wk_km_auth_user` VALUES (144, 89, 14773, 1, '2020-08-22 16:11:27', 14773);
INSERT INTO `wk_km_auth_user` VALUES (145, 90, 14773, 1, '2020-08-22 16:11:27', 14773);
INSERT INTO `wk_km_auth_user` VALUES (146, 91, 14773, 1, '2020-08-22 16:11:27', 14773);

-- ----------------------------
-- Table structure for wk_km_collect
-- ----------------------------
DROP TABLE IF EXISTS `wk_km_collect`;
CREATE TABLE `wk_km_collect` (
   `collect_id` int(11) NOT NULL AUTO_INCREMENT,
   `type` int(1) NOT NULL COMMENT '1 knowledge base 2 folder 3 file',
   `type_id` int(11) NOT NULL,
   `create_time` datetime(0) NOT NULL,
   `create_user_id` bigint(20) NULL DEFAULT NULL,
   PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Knowledge base collection table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_km_collect
-- ----------------------------

-- ----------------------------
-- Table structure for wk_km_document
-- ----------------------------
DROP TABLE IF EXISTS `wk_km_document`;
CREATE TABLE `wk_km_document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT'document title',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `type` int(1) NOT NULL COMMENT '3 rich text 4 file',
  `parent_id` int(20) NULL DEFAULT 0,
  `status` int(1) NULL DEFAULT 1 COMMENT'-1 Delete 0 Draft 1 Normal 2 Template',
  `library_id` int(20) NULL DEFAULT NULL,
  `folder_id` int(20) NOT NULL COMMENT'folder id',
  `auth_id` int(20) NULL DEFAULT NULL,
  `label_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'label id',
  `create_time` datetime(0) NOT NULL,
  `create_user_id` bigint(20) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_user_id` bigint(20) NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`document_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Knowledge base document table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_km_document
-- ----------------------------
INSERT INTO `wk_km_document` VALUES (85, 'Product Requirements Document', '<div id=\"wk-knowledge-title-wukong\">\n<p id=\"wk-knowledge-content-wukong\">产品需求文档</p>\n</div>\n<h1 style=\"mso-pagination: widow-orphan;\">基本信息</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">目标上线时间：请输入时间</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">项目人员</h1>\n<p class=\"MsoNormal\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->产品：请输入人员<a name=\"_GoBack\"></a></p>\n<p class=\"MsoNormal\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->设计：请输入人员</p>\n<p class=\"MsoNormal\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->研发：请输入人员</p>\n<p class=\"MsoNormal\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->测试：请输入人员</p>\n<p class=\"MsoNormal\" style=\"margin-left: 36.0pt; text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">需求背景</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">描述产品需求诞生的背景；我们为什么要做这件事情，和战略方向的契合点。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">产品目标</h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">描述产品的目标用户，以及期望通过产品实现的核心目标。</p>\n<p class=\"MsoNormal\" style=\"margin-left: 36.0pt; text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">衡量指标</h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">用于衡量产品成功的关键指标</p>\n<p class=\"MsoNormal\" style=\"margin-left: 36.0pt; text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin-left: 36.0pt; text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">产品需求</p>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 106.5pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n<td style=\"width: 106.5pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">作为</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">我想要的</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">以便于</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1;\">\n<td style=\"width: 106.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 106.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">产品经理</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">从模版直接创建产品需求文档的功能</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">快速并有条理的进行需求文档的撰写</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 2; mso-yfti-lastrow: yes;\">\n<td style=\"width: 106.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">2</span></p>\n</td>\n<td style=\"width: 106.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">团队负责人</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">自定义文档模版的能力</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">规范不同场景下的撰写文档的格式和要求</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">功能及界面设计</h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">描述详细功能设计，以及相关的线框设计、视觉设计图。</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">+</span>上传图片</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">+</span>上传附件</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">问题</p>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 47.95pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"64\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">#</span></p>\n</td>\n<td style=\"width: 224.75pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"300\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">问题</p>\n</td>\n<td style=\"width: 153.0pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"204\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">结论</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1;\">\n<td style=\"width: 47.95pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"64\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 224.75pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"300\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">描述评审、研发等过程中发现的问题</p>\n</td>\n<td style=\"width: 153.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"204\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">描述最终讨论得出的决定</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 2; mso-yfti-lastrow: yes; height: 22.15pt;\">\n<td style=\"width: 47.95pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.15pt;\" valign=\"top\" width=\"64\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">2</span></p>\n</td>\n<td style=\"width: 224.75pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.15pt;\" valign=\"top\" width=\"300\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n<td style=\"width: 153.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 22.15pt;\" valign=\"top\" width=\"204\">\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">暂不支持</h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">由于受限团队目标、技术、时间等不支持的功能</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">附录</h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">+</span>上传附件</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>', 3, 0, 1, 25, 0, 87, NULL, '2020-08-22 16:11:27', 14773, '2020-08-22 16:11:27', NULL, NULL);
INSERT INTO `wk_km_document` VALUES (86, 'Meeting minutes', '<div id=\"wk-knowledge-title-wukong\">\n<p id=\"wk-knowledge-content-wukong\" style=\"font-size: 24pt; font-weight: bold;\">会议纪要</p>\n</div>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">产品研发团队的周会纪要</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">日期：请输入日期</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">与会人员：请输入人员</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">目标</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">制定本次会议的目标或者描述会议的上下文。</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">议程</h1>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 47.95pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"64\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">#</span></p>\n</td>\n<td style=\"width: 165.05pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"220\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">议题</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">负责人</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1; mso-yfti-lastrow: yes;\">\n<td style=\"width: 47.95pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"64\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 165.05pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"220\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">议题内容描述</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">持续时间</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\">记录</h1>\n<p class=\"MsoListParagraph\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-char-indent-count: 0; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->会议要点<span lang=\"EN-US\">1</span></p>\n<p class=\"MsoListParagraph\" style=\"margin-left: 21.0pt; text-align: left; text-indent: -21.0pt; mso-char-indent-count: 0; mso-pagination: widow-orphan; mso-list: l0 level1 lfo1;\" align=\"left\"><!-- [if !supportLists]--><span lang=\"EN-US\"><span style=\"mso-list: Ignore;\">l<span style=\"font-style: normal; font-variant: normal; font-stretch: normal; line-height: normal;\">&nbsp; </span></span></span><!--[endif]-->会议要点<span lang=\"EN-US\">2</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\"><a name=\"_GoBack\"></a>后续工作</h1>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 62.1pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"83\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">负责人</p>\n</td>\n<td style=\"width: 150.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"201\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作安排</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">执行人</p>\n</td>\n<td style=\"width: 106.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1; mso-yfti-lastrow: yes;\">\n<td style=\"width: 62.1pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"83\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 150.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"201\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作安排项</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 106.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"142\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>', 3, 0, 1, 25, 0, 88, NULL, '2020-08-22 16:11:27', 14773, '2020-08-22 16:11:27', NULL, NULL);
INSERT INTO `wk_km_document` VALUES (87, 'Technical documents', '<div id=\"wk-knowledge-title-wukong\">\n<p id=\"wk-knowledge-content-wukong\" style=\"font-size: 24pt; font-weight: bold;\">技术文档</p>\n</div>\n<p class=\"MsoNormal\">标题</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\">在这里描述</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan; tab-stops: 45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt 412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">1//</span>在这里编写代码</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">2</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">3</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">4</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">5</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">+ </span>上传图片</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\"><a name=\"_GoBack\"></a><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\">标题</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\">在这里描述</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan; tab-stops: 45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt 412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt;\" align=\"left\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">1//</span>在这里编写代码</p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">2</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">3</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">4</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">5</span></p>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\"><span lang=\"EN-US\">+ </span>上传图片</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>', 3, 0, 1, 25, 0, 89, NULL, '2020-08-22 16:11:27', 14773, '2020-08-22 16:11:27', NULL, NULL);
INSERT INTO `wk_km_document` VALUES (88, 'Competitive product analysis', '<div id=\"wk-knowledge-title-wukong\">\n<p id=\"wk-knowledge-content-wukong\" style=\"font-size: 24pt; font-weight: bold;\">竞品分析</p>\n</div>\n<h1 style=\"mso-pagination: widow-orphan;\">目的</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">描述做这次竞品分析的目的，因为不同的目的侧重点也会有所差异。</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">可能是为了寻找可借鉴学习之处；可能是为了摸查竞争对手情况做好应对策略；也有可能是作为融资计划的参考<a name=\"_GoBack\"></a>数据。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">市场分析</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">描述目前行业市场的相关信息，可以通过以下渠道收集信息：</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">从公司内部市场、运营部门、管理层等收集信息；行业媒体平台新闻及论坛及<span lang=\"EN-US\">QQ</span>群，搜索引擎，比如艾瑞咨询，<span lang=\"EN-US\">AppAnnie</span>；行业专家博客、微博、微信公众账号订阅。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">竞品概况</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">描述竞品相关的一些信息，比如公司团队状况、产品定位、核心数据分析、盈利模式等等。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">产品分析</h1>\n<h2 style=\"mso-pagination: widow-orphan;\">产品功能</h2>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">可以从产品基本信息、产品功能逻辑、产品渠道（平台）等方面进行分析。</p>\n<h2 style=\"mso-pagination: widow-orphan;\">产品交互设计</h2>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">通过截图的方式对比交互和设计内容，可以包含：主要风格、色彩体系、布局结构、品质感、字体、功能页面比较。</p>\n<h2 style=\"mso-pagination: widow-orphan;\">技术分析</h2>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">以移动<span lang=\"EN-US\">App</span>举例，技术分析包含：应用大小、启动时长、功能页面加载时长、<span lang=\"EN-US\">CPU</span>、内存消耗、崩溃率、版本迭代速度等。 这需要根据不同产品进行不同的技术分析。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">产品优劣势</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">综合评价所选竞品的优势势，以及各自其中的机会和威胁。</p>\n<h1 style=\"mso-pagination: widow-orphan;\">总结</h1>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">分析的结论一般可以包括两大部分，一是对研究对象的分析总结，二是对自己的行动建议。</p>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>', 3, 0, 1, 25, 0, 90, NULL, '2020-08-22 16:11:27', 14773, '2020-08-22 16:11:27', NULL, NULL);
INSERT INTO `wk_km_document` VALUES (89, 'Product planning', '<div id=\"wk-knowledge-title-wukong\">\n<p id=\"wk-knowledge-content-wukong\" style=\"font-size: 24pt; font-weight: bold;\">产品规划</p>\n</div>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">发布时间：请输入日期</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">产品负责人：请输入人员</p>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\"><span lang=\"EN-US\">Sprint 1</span></h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">时间：请输入起止时间</p>\n<p>工作项：</p>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">该冲刺的工作项</p>\n</td>\n<td style=\"width: 77.95pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">执行人</p>\n</td>\n<td style=\"width: 127.6pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 2; mso-yfti-lastrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">2</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n</tr>\n</tbody>\n</table>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\"><span lang=\"EN-US\">Sprint 2</span></h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">时间：请输入起止时间</p>\n<p>工作项：</p>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">该冲刺的工作项</p>\n</td>\n<td style=\"width: 77.95pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">执行人</p>\n</td>\n<td style=\"width: 127.6pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 2; mso-yfti-lastrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">2</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n</tr>\n</tbody>\n</table>\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n<h1 style=\"mso-pagination: widow-orphan;\"><span lang=\"EN-US\">Sprint 3<a name=\"_GoBack\"></a></span></h1>\n<p class=\"MsoNormal\" style=\"text-align: left; mso-pagination: widow-orphan;\" align=\"left\">时间：请输入起止时间</p>\n<p>工作项：</p>\n<table class=\"MsoTableGrid\" style=\"border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 1184; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt;\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n<tbody>\n<tr style=\"mso-yfti-irow: 0; mso-yfti-firstrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">该冲刺的工作项</p>\n</td>\n<td style=\"width: 77.95pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">执行人</p>\n</td>\n<td style=\"width: 127.6pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 1;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">1</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">人员姓名</p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">截止时间</p>\n</td>\n</tr>\n<tr style=\"mso-yfti-irow: 2; mso-yfti-lastrow: yes;\">\n<td style=\"width: 155.7pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"208\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\">工作项<span lang=\"EN-US\">2</span></p>\n</td>\n<td style=\"width: 77.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"104\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n<td style=\"width: 127.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt;\" valign=\"top\" width=\"170\">\n<p style=\"mso-margin-top-alt: auto; mso-margin-bottom-alt: auto; mso-pagination: widow-orphan;\"><span lang=\"EN-US\">&nbsp;</span></p>\n</td>\n</tr>\n</tbody>\n</table>\n<p class=\"MsoNormal\"><span lang=\"EN-US\">&nbsp;</span></p>', 3, 0, 1, 25, 0, 91, NULL, '2020-08-22 16:11:27', 14773, '2020-08-22 16:11:27', NULL, NULL);

-- ----------------------------
-- Table structure for wk_km_document_favor
-- ----------------------------
DROP TABLE IF EXISTS `wk_km_document_favor`;
CREATE TABLE `wk_km_document_favor`  (
  `favor_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`favor_id`) USING BTREE,
  UNIQUE INDEX `wk_km_document_favor_document_id_create_user_id_uindex`(`document_id`, `create_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Document Like Form' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_km_document_favor
-- ----------------------------

-- ----------------------------
-- Table structure for wk_km_document_label
-- ----------------------------
DROP TABLE IF EXISTS `wk_km_document_label`;
CREATE TABLE `wk_km_document_label`  (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Document tag table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_km_document_label
-- ----------------------------

-- ----------------------------
-- Table structure for wk_km_document_share
-- ----------------------------
DROP TABLE IF EXISTS `wk_km_document_share`;
CREATE TABLE `wk_km_document_share` (
   `share_id` int(11) NOT NULL AUTO_INCREMENT,
   `document_id` int(11) NULL DEFAULT NULL COMMENT'document id',
   `share_user_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Share internal member id',
   `share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'external sharing link',
   `token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'The unique identifier of the external Read-only document',
   `status` int(1) NULL DEFAULT NULL COMMENT '1 enable 0 disable sharing',
   `create_user_id` bigint(20) NULL DEFAULT NULL,
   `create_time` datetime(0) NULL DEFAULT NULL,
   `close_user_id` bigint(20) NULL DEFAULT NULL,
   `close_time` datetime(0) NULL DEFAULT NULL,
   PRIMARY KEY (`share_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Document sharing' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_km_document_share
-- ----------------------------

-- ----------------------------
-- Table structure for wk_km_folder
-- ----------------------------
DROP TABLE IF EXISTS `wk_km_folder`;
CREATE TABLE `wk_km_folder` (
   `folder_id` int(11) NOT NULL AUTO_INCREMENT,
   `library_id` int(11) NULL DEFAULT NULL COMMENT'knowledge base id',
   `parent_id` int(11) NULL DEFAULT 0 COMMENT'parent id',
   `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
   `status` int(1) NULL DEFAULT 1 COMMENT'-1 Delete 1 normal',
   `create_user_id` bigint(20) NULL DEFAULT NULL,
   `create_time` datetime(0) NULL DEFAULT NULL,
   `auth_id` int(11) NULL DEFAULT NULL,
   `delete_user_id` bigint(20) NULL DEFAULT NULL,
   `delete_time` datetime(0) NULL DEFAULT NULL,
   PRIMARY KEY (`folder_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Knowledge base folder' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_km_folder
-- ----------------------------

-- ----------------------------
-- Table structure for wk_km_knowledge_library
-- ----------------------------
DROP TABLE IF EXISTS `wk_km_knowledge_library`;
CREATE TABLE `wk_km_knowledge_library` (
  `library_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT'knowledge base name',
  `description` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'Introduction',
  `is_open` int(1) NOT NULL COMMENT'Is it public 1 public 2 private',
  `status` int(1) NULL DEFAULT 1 COMMENT'-1 Delete 1 normal 2 template',
  `is_system_cover` int(1) NULL DEFAULT NULL COMMENT '0 No 1 Yes',
  `cover_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT'knowledge base cover',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_user_id` bigint(20) NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`library_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Knowledge Base' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_km_knowledge_library
-- ----------------------------
INSERT INTO `wk_km_knowledge_library` VALUES (25,'Product R&D','Provide complete product process documentation', 0, 1, 1,'https://www.72crm.com/api/uploads/kw/1.png' , 14773, '2020-08-22 16:11:27', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for wk_km_knowledge_library_user
-- ----------------------------
DROP TABLE IF EXISTS `wk_km_knowledge_library_user`;
CREATE TABLE `wk_km_knowledge_library_user`  (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `library_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role` int(1) NULL DEFAULT NULL COMMENT '1 Founder 2 Administrator 3 Member',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'Knowledge base member' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_km_knowledge_library_user
-- ----------------------------
INSERT INTO `wk_km_knowledge_library_user` VALUES (55, 25, 14773, 1);

-- ----------------------------
-- Table structure for wk_oa_announcement
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_announcement`;
CREATE TABLE `wk_oa_announcement` (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT'title',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT'content',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT'start time',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT'End time',
  `dept_ids` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT'Notification department',
  `owner_user_ids` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT'Notification person',
  `read_user_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Read users',
  PRIMARY KEY (`announcement_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Announcement Form' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_announcement
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_calendar_type
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_calendar_type`;
CREATE TABLE `wk_oa_calendar_type` (
   `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'calendar type id',
   `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'type name',
   `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'color',
   `type` int(1) NULL DEFAULT NULL COMMENT '1 system type 2 custom type',
   `create_time` datetime(0) NULL DEFAULT NULL,
   `create_user_id` bigint(20) NULL DEFAULT NULL,
   `update_time` datetime(0) NULL DEFAULT NULL,
   `sort` int(2) NULL DEFAULT 1,
   PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 500 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Calendar Type' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_calendar_type
-- ----------------------------
INSERT INTO `wk_oa_calendar_type` VALUES (492,'Assigned tasks', '1', 1, '2020-01-13 09:44:05', 14773, NULL, 1);
INSERT INTO `wk_oa_calendar_type` VALUES (493,'Clues to be contacted', '5', 1, '2020-01-13 09:44:05', 14773, NULL, 2);
INSERT INTO `wk_oa_calendar_type` VALUES (494,'Customers to be contacted', '2', 1, '2020-01-13 09:44:05', 14773, NULL, 3);
INSERT INTO `wk_oa_calendar_type` VALUES (495,'Business opportunities to be contacted', '6', 1, '2020-01-13 09:44:05', 14773, NULL, 4);
INSERT INTO `wk_oa_calendar_type` VALUES (496,'Expected trading opportunities', '7', 1, '2020-01-13 09:44:05', 14773, NULL, 5);
INSERT INTO `wk_oa_calendar_type` VALUES (497,'Expiring contract', '3', 1, '2020-01-13 09:44:05', 14773, NULL, 6);
INSERT INTO `wk_oa_calendar_type` VALUES (498,'Planned payment', '4', 1, '2020-01-13 09:44:05', 14773, NULL, 7);
INSERT INTO `wk_oa_calendar_type` VALUES (499,'Meeting','#53D397', 2, '2020-01-13 09:44:05', 14773, NULL, 1);

-- ----------------------------
-- Table structure for wk_oa_calendar_type_user
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_calendar_type_user`;
CREATE TABLE `wk_oa_calendar_type_user` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `user_id` bigint(20) NOT NULL COMMENT'user id',
   `type_id` int(11) NOT NULL COMMENT'calendar type id',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8738 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='User associated calendar type' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_calendar_type_user
-- ----------------------------
INSERT INTO `wk_oa_calendar_type_user` VALUES (8733, 14773, 487);
INSERT INTO `wk_oa_calendar_type_user` VALUES (8734, 14773, 488);
INSERT INTO `wk_oa_calendar_type_user` VALUES (8735, 14773, 489);
INSERT INTO `wk_oa_calendar_type_user` VALUES (8736, 14773, 490);
INSERT INTO `wk_oa_calendar_type_user` VALUES (8737, 14773, 491);

-- ----------------------------
-- Table structure for wk_oa_event
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_event`;
CREATE TABLE `wk_oa_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT'title',
  `type_id` int(1) NOT NULL COMMENT'Schedule Type',
  `start_time` datetime(0) NOT NULL COMMENT'start time',
  `end_time` datetime(0) NOT NULL COMMENT'End time',
  `owner_user_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'participants',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `repetition_type` int(1) NULL DEFAULT 1 COMMENT'Repetition type 1 never repeats 2 daily 3 weekly 4 monthly 5 yearly',
  `repeat_rate` int(10) NULL DEFAULT NULL COMMENT'repeat rate',
  `repeat_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '3:week/4:month',
  `end_type` int(1) NULL DEFAULT NULL COMMENT'End type 1 never 2 repeat times 3 end date',
  `end_type_config` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '2: times/3: time',
  `repeat_start_time` datetime(0) NOT NULL COMMENT'Loop start time',
  `repeat_end_time` datetime(0) NULL DEFAULT NULL COMMENT'Loop end time',
  `batch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Schedule' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_event
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_event_notice
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_event_notice`;
CREATE TABLE `wk_oa_event_notice` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `event_id` int(11) NOT NULL COMMENT'Agenda ID',
   `type` int(1) NOT NULL COMMENT '1 minute 2 hours 3 days',
   `value` int(2) NOT NULL,
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Schedule reminder setting table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_event_notice
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_event_relation
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_event_relation`;
CREATE TABLE `wk_oa_event_relation` (
   `eventrelation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Schedule related business table',
   `event_id` int(11) NOT NULL COMMENT'Agenda ID',
   `customer_ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Customer IDs',
   `contacts_ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Contact IDs',
   `business_ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Business IDs',
   `contract_ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'contract IDs',
   `create_time` datetime(0) NOT NULL COMMENT'create time',
   PRIMARY KEY (`eventrelation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Schedule related business table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_event_relation
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_event_update_record
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_event_update_record`;
CREATE TABLE `wk_oa_event_update_record` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `event_id` int(11) NOT NULL,
   `time` bigint(20) NOT NULL COMMENT'title',
   `status` int(1) NULL DEFAULT NULL COMMENT '1 Delete this time 2 Modify this time 3 Modify this time and beyond',
   `new_event_id` int(11) NULL DEFAULT NULL,
   `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT ='Schedule' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_event_update_record
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_examine
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_examine`;
CREATE TABLE `wk_oa_examine` (
  `examine_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT 1 COMMENT'Approval type',
  `content` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'content',
  `remark` varchar(800) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Remarks',
  `type_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'leave type',
  `money` decimal(18, 2) NULL DEFAULT NULL COMMENT'Total amount of travel and reimbursement',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT'start time',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT'End time',
  `duration` decimal(18, 2) NULL DEFAULT NULL COMMENT'Duration',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `batch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Attachment batch id',
  `examine_record_id` int(11) NULL DEFAULT NULL COMMENT'audit record ID',
  `examine_status` int(1) NULL DEFAULT NULL COMMENT'Audit status 0 Unaudited 1 Audit passed 2 Audit rejected 3 Under audit 4 Withdrawn',
  PRIMARY KEY (`examine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Approval Form' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_examine
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_examine_category
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_examine_category`;
CREATE TABLE `wk_oa_examine_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'name',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Description',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'icon',
  `type` int(1) NULL DEFAULT 0 COMMENT '1 Ordinary approval 2 Leave approval 3 Business trip approval 4 Overtime approval 5 Travel reimbursement 6 Loan application 0 Custom approval',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  `status` int(1) NULL DEFAULT 1 COMMENT '1 is enabled, 0 is disabled',
  `is_sys` int(1) NULL DEFAULT NULL COMMENT '1 is the system type and cannot be deleted',
  `examine_type` int(1) NULL DEFAULT NULL COMMENT '1 fixed 2 optional',
  `user_ids` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Visible range (employees)',
  `dept_ids` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Visible range (department)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `is_deleted` int(1) NULL DEFAULT 0 COMMENT '1 has been deleted',
  `delete_time` datetime(0) NULL DEFAULT NULL COMMENT'Delete time',
  `delete_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Delete person ID',
  PRIMARY KEY (`category_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72985 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Approval Type Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_examine_category
-- ----------------------------
INSERT INTO `wk_oa_examine_category` VALUES (72979,'General approval','General approval','wk wk-l-record,#3ABCFB', 1, 3, 1, 1, 2,'','', '2019- 04-26 15:06:34', '2019-04-26 15:06:34', 0, NULL, NULL);
INSERT INTO `wk_oa_examine_category` VALUES (72980,'Leave Approval','Leave Approval','wk wk-leave,#00CAAB', 2, 3, 1, 1, 2,'','', '2019-04- 17 18:52:44', '2019-04-17 18:52:44', 0, NULL, NULL);
INSERT INTO `wk_oa_examine_category` VALUES (72981,'Travel Approval','Business Trip Approval','wk wk-trip,#3ABCFB', 3, 3, 1, 1, 2,'','', '2019-04- 17 18:52:50', '2019-04-17 18:52:50', 0, NULL, NULL);
INSERT INTO `wk_oa_examine_category` VALUES (72982,'Overtime approval','Overtime approval','wk wk-overtime,#FAAD14', 4, 3, 1, 1, 2,'','', '2019-04- 17 18:52:59', '2019-04-17 18:52:59', 0, NULL, NULL);
INSERT INTO `wk_oa_examine_category` VALUES (72983,'Travel Reimbursement','Travel Reimbursement','wk wk-reimbursement,#3ABCFB', 5, 3, 1, 1, 2,'','', '2019- 04-17 18:53:13', '2019-04-17 18:53:13', 0, NULL, NULL);
INSERT INTO `wk_oa_examine_category` VALUES (72984,'Loan application','Loan application','wk wk-go-out,#FF6033', 6, 3, 1, 1, 2,'','', '2019- 04-17 18:54:44', '2019-04-17 18:54:44', 0, NULL, NULL);

-- ----------------------------
-- Table structure for wk_oa_examine_data
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_examine_data`;
CREATE TABLE `wk_oa_examine_data` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `field_id` int(11) NOT NULL COMMENT'field id',
   `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT'field name',
   `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
   `create_time` datetime(0) NOT NULL,
   `batch_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='oa Approval Custom Field Value Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_examine_data
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_examine_field
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_examine_field`;
CREATE TABLE `wk_oa_examine_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'primary key ID',
  `field_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Custom field English ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT'' COMMENT'Field name',
  `type` int(2) NOT NULL DEFAULT 1 COMMENT'Field type 1 Single line of text 2 Multiple lines of text 3 Single selection 4 Date 5 Number 6 Decimal 7 Mobile phone 8 File 9 Multiple selection 10 Personnel 11 Attachment 12 Department 13 Date and time 14 Email 15 Customer 16 Business Opportunity 17 Contact Person 18 Map 19 Product Type 20 Contract 21 Repayment Plan',
  `remark` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Field description',
  `input_tips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'input tips',
  `max_length` int(12) NULL DEFAULT NULL COMMENT'maximum length',
  `default_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT'' COMMENT'default value',
  `is_unique` int(1) NULL DEFAULT 0 COMMENT'is it unique 1 is 0 no',
  `is_null` int(1) NULL DEFAULT 0 COMMENT'Is it mandatory 1 Yes 0 No',
  `sorting` int(5) NULL DEFAULT 1 COMMENT'Sorting from small to large',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT'If the type is an option, this cannot be empty. Multiple options are separated by',
  `operating` int(1) NULL DEFAULT 0 COMMENT'Is it possible to delete to modify 0 to modify 1 to modify 2 to delete 3 none',
  `is_hidden` int(1) NOT NULL DEFAULT 0 COMMENT'whether to hide 0 not to hide 1 to hide',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT'last modified time',
  `examine_category_id` int(11) NULL DEFAULT NULL COMMENT'Approval ID label is 10 required',
  `field_type` int(2) NOT NULL DEFAULT 0 COMMENT'Field source 0. Custom 1. Original fixed 2 Original field but the value exists in the extended table',
  PRIMARY KEY (`field_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 572 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Custom field table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_examine_field
-- ----------------------------
INSERT INTO `wk_oa_examine_field` VALUES (548,'content','Approval content', 1, NULL,'', NULL,'', 0, 1, 0, NULL, 3, 0, '2021-01-09 16: 03:54', 1072979, 1);
INSERT INTO `wk_oa_examine_field` VALUES (549,'remark','remark', 2, NULL,'', 1000,'', 0, 0, 1, NULL, 3, 0, '2021-01-09 16:03 :54', 1072979, 1);
INSERT INTO `wk_oa_examine_field` VALUES (550,'type_id','leave type', 3, NULL,'', NULL,'annual leave', 0, 1, 0,'annual leave, personal leave, sick leave, maternity leave, adjusted leave, marriage leave , Bereavement leave, other', 3, 0, '2021-01-09 16:03:54', 1072980, 1);
INSERT INTO `wk_oa_examine_field` VALUES (551,'content','Approval content', 1, NULL,'', NULL,'', 0, 1, 1, NULL, 3, 0, '2021-01-09 16: 03:54', 1072980, 1);
INSERT INTO `wk_oa_examine_field` VALUES (552,'start_time','start time', 13, NULL,'', NULL,'', 0, 1, 2, NULL, 3, 0, '2021-01-09 16: 03:54', 1072980, 1);
INSERT INTO `wk_oa_examine_field` VALUES (553,'end_time','end time', 13, NULL,'', NULL,'', 0, 1, 3, NULL, 3, 0, '2021-01-09 16: 03:54', 1072980, 1);
INSERT INTO `wk_oa_examine_field` VALUES (554,'duration','Duration (days)', 6, NULL,'', NULL,'', 0, 1, 4, NULL, 3, 0, '2021-01-09 16:03:54', 1072980, 1);
INSERT INTO `wk_oa_examine_field` VALUES (555,'remark','remark', 2, NULL,'', 1000,'', 0, 0, 5, NULL, 3, 0, '2021-01-09 16:03 :54', 1072980, 1);
INSERT INTO `wk_oa_examine_field` VALUES (556,'content','Business trip reason', 1, NULL,'', NULL,'', 0, 1, 0, NULL, 3, 0, '2021-01-09 16: 03:54', 1072981, 1);
INSERT INTO `wk_oa_examine_field` VALUES (557,'remark','remark', 2, NULL,'', 1000,'', 0, 0, 1, NULL, 3, 0, '2021-01-09 16:03 :54', 1072981, 1);
INSERT INTO `wk_oa_examine_field` VALUES (558,'duration','Total days on business trip', 6, NULL,'', NULL,'', 0, 1, 2, NULL, 3, 0, '2021-01-09 16 :03:54', 1072981, 1);
INSERT INTO `wk_oa_examine_field` VALUES (559,'cause','Itinerary details', 22, NULL,'', NULL,'', 0, 1, 2, NULL, 3, 0, '2021-01-09 16: 03:54', 1072981, 1);
INSERT INTO `wk_oa_examine_field` VALUES (560,'content','reason for overtime', 1, NULL,'', NULL,'', 0, 1, 0, NULL, 3, 0, '2021-01-09 16: 03:54', 1072982, 1);
INSERT INTO `wk_oa_examine_field` VALUES (561,'start_time','start time', 13, NULL,'', NULL,'', 0, 1, 1, NULL, 3, 0, '2021-01-09 16: 03:54', 1072982, 1);
INSERT INTO `wk_oa_examine_field` VALUES (562,'end_time','end time', 13, NULL,'', NULL,'', 0, 1, 2, NULL, 3, 0, '2021-01-09 16: 03:54', 1072982, 1);
INSERT INTO `wk_oa_examine_field` VALUES (563,'duration','Total overtime days', 6, NULL,'', NULL,'', 0, 1, 3, NULL, 3, 0, '2021-01-09 16 :03:54', 1072982, 1);
INSERT INTO `wk_oa_examine_field` VALUES (564,'remark','remark', 2, NULL,'', 1000,'', 0, 0, 4, NULL, 3, 0, '2021-01-09 16:03 :54', 1072982, 1);
INSERT INTO `wk_oa_examine_field` VALUES (565,'content','Travel matter', 1, NULL,'', NULL,'', 0, 1, 0, NULL, 3, 0, '2021-01-09 16 :03:54', 1072983, 1);
INSERT INTO `wk_oa_examine_field` VALUES (566,'money','Total reimbursement amount', 6, NULL,'', 0,'', 0, 1, 1, NULL, 3, 0, '2021-01-09 16 :03:54', 1072983, 1);
INSERT INTO `wk_oa_examine_field` VALUES (567,'remark','remark', 2, NULL,'', 1000,'', 0, 0, 2, NULL, 3, 0, '2021-01-09 16:03 :54', 1072983, 1);
INSERT INTO `wk_oa_examine_field` VALUES (568,'cause','Expense Details', 23, NULL,'', 1000,'', 0, 0, 2, NULL, 3, 0, '2021-01-09 16: 03:54', 1072983, 1);
INSERT INTO `wk_oa_examine_field` VALUES (569,'content','reason for borrowing', 1, NULL,'', NULL,'', 0, 1, 0, NULL, 3, 0, '2021-01-09 16: 03:54', 1072984, 1);
INSERT INTO `wk_oa_examine_field` VALUES (570,'money','Loan amount ($)', 6, NULL,'', 0,'', 0, 1, 1, NULL, 3, 0, '2021-01- 09 16:03:54', 1072984, 1);
INSERT INTO `wk_oa_examine_field` VALUES (571,'remark','remark', 2, NULL,'', 1000,'', 0, 0, 2, NULL, 3, 0, '2021-01-09 16:03 :54', 1072984, 1);

-- ----------------------------
-- Table structure for wk_oa_examine_log
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_examine_log`;
CREATE TABLE `wk_oa_examine_log` (
  `log_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT'ID',
  `record_id` int(11) NULL DEFAULT NULL COMMENT'Approval record ID',
  `examine_step_id` bigint(20) NULL DEFAULT NULL COMMENT'review step ID',
  `examine_status` int(1) NULL DEFAULT NULL COMMENT'audit status 0 unaudited 1 audit passed 2 audit rejected 4 withdrawn audit',
  `create_user` bigint(20) NULL DEFAULT NULL COMMENT'creator',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `examine_user` bigint(20) NULL DEFAULT NULL COMMENT'reviewer',
  `examine_time` datetime(0) NULL DEFAULT NULL COMMENT'examine time',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Remarks for review',
  `is_recheck` int(1) NULL DEFAULT 0 COMMENT'Whether it is to withdraw the previous log 0 or null as the new data 1: Withdraw the previous data',
  `order_id` int(30) NULL DEFAULT NULL COMMENT'order id',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Audit log table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_examine_log
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_examine_record
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_examine_record`;
CREATE TABLE `wk_oa_examine_record` (
   `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'audit record ID',
   `examine_id` int(11) NULL DEFAULT NULL COMMENT'Approval ID',
   `examine_step_id` bigint(20) NULL DEFAULT NULL COMMENT'ID of the current approval step',
   `examine_status` int(1) NULL DEFAULT NULL COMMENT'Audit status 0 Unaudited 1 Audit passed 2 Audit rejected 3 Under review 4 Withdrawn',
   `create_user` bigint(20) NULL DEFAULT NULL COMMENT'creator',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Remarks for review',
   PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Audit record table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_examine_record
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_examine_relation
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_examine_relation`;
CREATE TABLE `wk_oa_examine_relation` (
   `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Approval of related business table',
   `examine_id` int(11) NULL DEFAULT NULL COMMENT'Approval ID',
   `customer_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Customer IDs',
   `contacts_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Contact IDs',
   `business_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Business IDs',
   `contract_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'contract IDs',
   `status` int(2) NULL DEFAULT 1 COMMENT'Status 1 is available',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Approval of related business table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_examine_relation
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_examine_sort
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_examine_sort`;
CREATE TABLE `wk_oa_examine_sort` (
   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Primary key ID',
   `category_id` int(11) NULL DEFAULT NULL COMMENT'Approval type id',
   `sort` int(6) NULL DEFAULT NULL COMMENT'sort',
   `user_id` bigint(20) NULL DEFAULT NULL COMMENT'user id',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Approval type sorting' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_examine_sort
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_examine_step
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_examine_step`;
CREATE TABLE `wk_oa_examine_step` (
   `step_id` bigint(20) NOT NULL AUTO_INCREMENT,
   `step_type` int(1) NULL DEFAULT NULL COMMENT'Step type 1, the person in charge, 2, the designated user (any one), 3, the designated user (multi-person countersign), 4, the supervisor of the superior approver',
   `category_id` int(11) NOT NULL COMMENT'Approval ID',
   `check_user_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'Approver ID (separated by commas) ,1,2,',
   `step_num` int(2) NULL DEFAULT 1 COMMENT'sort',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   PRIMARY KEY (`step_id`) USING BTREE,
   INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Approval step table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_examine_step
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_examine_travel
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_examine_travel`;
CREATE TABLE `wk_oa_examine_travel` (
  `travel_id` int(11) NOT NULL AUTO_INCREMENT,
  `examine_id` int(11) NOT NULL COMMENT'Approval ID',
  `start_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'departure place',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT'Departure time',
  `end_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'destination',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT'arrival time',
  `traffic` decimal(18, 2) NULL DEFAULT NULL COMMENT'traffic fee',
  `stay` decimal(18, 2) NULL DEFAULT NULL COMMENT'accommodation fee',
  `diet` decimal(18, 2) NULL DEFAULT NULL COMMENT'food and beverage expenses',
  `other` decimal(18, 2) NULL DEFAULT NULL COMMENT'Other expenses',
  `money` decimal(18, 2) NULL DEFAULT NULL COMMENT'amount',
  `vehicle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'vehicle',
  `trip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'One way round trip (one way, round trip)',
  `duration` decimal(18, 2) NULL DEFAULT NULL COMMENT'Duration',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Remarks',
  `batch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'batch id',
  PRIMARY KEY (`travel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Daily travel schedule' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_examine_travel
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_log
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_log`;
CREATE TABLE `wk_oa_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(2) NOT NULL DEFAULT 1 COMMENT'Log type (1 daily report, 2 weekly report, March report)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'log title',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT'log content',
  `tomorrow` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Tomorrow\'s work content',
  `question` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Encountered a problem',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator ID',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT'update time',
  `send_user_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'notifier',
  `send_dept_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Notification Department',
  `read_user_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'read people',
  `batch_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'document batch ID',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Work log table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_log
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_log_bulletin
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_log_bulletin`;
CREATE TABLE `wk_oa_log_bulletin` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `log_id` int(11) NULL DEFAULT NULL COMMENT'log ID',
   `type` int(1) NULL DEFAULT NULL COMMENT'Association Type 1 Customer 2 Business Opportunity 3 Contract 4 Repayment 5 Follow-up Record',
   `type_id` int(11) NULL DEFAULT NULL COMMENT'Type ID',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Work log and business ID association table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_log_bulletin
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_log_record
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_log_record`;
CREATE TABLE `wk_oa_log_record` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `log_id` int(11) NOT NULL,
   `customer_num` int(5) NULL DEFAULT 0 COMMENT'Customer number',
   `business_num` int(11) NULL DEFAULT 0 COMMENT'Number of business opportunities',
   `contract_num` int(11) NULL DEFAULT 0 COMMENT'Contract number',
   `receivables_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT'Receipt amount',
   `activity_num` int(11) NULL DEFAULT 0 COMMENT'follow-up record',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Log-related sales summary report' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_log_record
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_log_relation
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_log_relation`;
CREATE TABLE `wk_oa_log_relation` (
   `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Log related business table',
   `log_id` int(11) NULL DEFAULT NULL COMMENT'log ID',
   `customer_ids` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Customer IDs',
   `contacts_ids` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Contact IDs',
   `business_ids` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Business IDs',
   `contract_ids` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'contract IDs',
   `status` int(2) NULL DEFAULT NULL COMMENT'Status 1 is available',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Log related business table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_log_relation
-- ----------------------------

-- ----------------------------
-- Table structure for wk_oa_log_rule
-- ----------------------------
DROP TABLE IF EXISTS `wk_oa_log_rule`;
CREATE TABLE `wk_oa_log_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(2) NOT NULL DEFAULT 1 COMMENT'Status 0 is disabled and 1 is enabled',
  `member_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'The id of the employee to be submitted, "," split',
  `type` int(2) NULL DEFAULT NULL COMMENT'Log type 1 daily report 2 weekly report 3 monthly report',
  `effective_day` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'The days to be counted every week 1-6 are Monday to Saturday and 7 are Sunday',
  `start_day` int(2) NULL DEFAULT NULL COMMENT'start date',
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'start time',
  `end_day` int(2) NULL DEFAULT NULL COMMENT'end date',
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT'end time',
  `create_user_id` bigint(20) NOT NULL COMMENT'creator',
  `create_time` datetime(0) NOT NULL COMMENT'create time',
  PRIMARY KEY (`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 268 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='oa log rule table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_oa_log_rule
-- ----------------------------
INSERT INTO `wk_oa_log_rule` VALUES (265, 1, NULL, 1, '1,2,3,4,5', NULL, '00:00', NULL, '23:00', 0, '2020-08-22 11:40:42');
INSERT INTO `wk_oa_log_rule` VALUES (266, 1, NULL, 2, NULL, 1, NULL, 7, NULL, 0, '2020-08-22 11:40:42');
INSERT INTO `wk_oa_log_rule` VALUES (267, 1, NULL, 3, NULL, 1, NULL, 31, NULL, 0, '2020-08-22 11:40:42');

-- ----------------------------
-- Table structure for wk_work
-- ----------------------------
DROP TABLE IF EXISTS `wk_work`;
CREATE TABLE `wk_work` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Project ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Project name',
  `status` int(2) NULL DEFAULT 1 COMMENT'Status 1 Enable 3 Archive 2 Delete',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT'Description',
  `color` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT'color',
  `is_open` int(2) NOT NULL DEFAULT 1 COMMENT'Whether everyone is visible 1 Yes 0 No',
  `owner_role` int(20) NULL DEFAULT NULL COMMENT'public project member role id',
  `archive_time` datetime(0) NULL DEFAULT NULL COMMENT'Archive time',
  `delete_time` datetime(0) NULL DEFAULT NULL COMMENT'Delete time',
  `is_system_cover` int(2) NULL DEFAULT NULL COMMENT'Whether it is the cover of the system, 0 is not 1 is',
  `cover_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Project cover path Only required for the cover of the system',
  `batch_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `owner_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'project member',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  PRIMARY KEY (`work_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Item table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_work
-- ----------------------------

-- ----------------------------
-- Table structure for wk_work_collect
-- ----------------------------
DROP TABLE IF EXISTS `wk_work_collect`;
CREATE TABLE `wk_work_collect` (
   `collect_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Item collection id',
   `work_id` int(11) NOT NULL COMMENT'Project id',
   `user_id` bigint(11) NOT NULL COMMENT'user id',
   `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
   PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT ='Project collection table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_work_collect
-- ----------------------------

-- ----------------------------
-- Table structure for wk_work_order
-- ----------------------------
DROP TABLE IF EXISTS `wk_work_order`;
CREATE TABLE `wk_work_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` int(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `order_num` int(4) NOT NULL DEFAULT 999,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Item sorting table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_work_order
-- ----------------------------

-- ----------------------------
-- Table structure for wk_work_task
-- ----------------------------
DROP TABLE IF EXISTS `wk_work_task`;
CREATE TABLE `wk_work_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'task table',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'task name',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
  `main_user_id` bigint(20) NULL DEFAULT NULL COMMENT'Person in charge ID',
  `owner_user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'MembersID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT'Add New Time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT'Update time',
  `status` int(2) NULL DEFAULT 1 COMMENT'Completion status 1 in progress 2 postponed 3 archive 5 finished',
  `class_id` int(5) NULL DEFAULT -1 COMMENT'class id',
  `label_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'label, number splicing',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT'Description',
  `pid` int(11) NULL DEFAULT 0 COMMENT'Parent ID',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT'start time',
  `stop_time` datetime(0) NULL DEFAULT NULL COMMENT'End time',
  `priority` int(2) NULL DEFAULT 0 COMMENT'Priority from large to small 3 high 2 medium 1 low 0 none',
  `work_id` int(11) NULL DEFAULT 0 COMMENT'Project ID',
  `is_top` int(2) NULL DEFAULT 0 COMMENT'Workbench display 0 inbox 1 do it today, 2 do the next step, 3 do it later',
  `is_open` int(2) NULL DEFAULT 1 COMMENT'Is it open?',
  `order_num` int(4) NULL DEFAULT 999 COMMENT'Order ID',
  `top_order_num` int(4) NULL DEFAULT 999 COMMENT'My task order ID',
  `archive_time` datetime(0) NULL DEFAULT NULL COMMENT'Archive time',
  `ishidden` int(2) NULL DEFAULT 0 COMMENT'Whether Delete 0 is not Delete 1 Delete',
  `hidden_time` datetime(0) NULL DEFAULT NULL COMMENT'Delete time',
  `batch_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'batch',
  `is_archive` int(2) NULL DEFAULT 0 COMMENT '1 archive',
  PRIMARY KEY (`task_id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Task table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_work_task
-- ----------------------------

-- ----------------------------
-- Table structure for wk_work_task_class
-- ----------------------------
DROP TABLE IF EXISTS `wk_work_task_class`;
CREATE TABLE `wk_work_task_class` (
   `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'task classification table',
   `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'category name',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
   `status` int(2) NULL DEFAULT 0 COMMENT'Status 1 is normal',
   `work_id` int(11) NULL DEFAULT NULL COMMENT'Project ID',
   `order_num` int(4) NULL DEFAULT NULL COMMENT'Order',
   PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Task classification table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_work_task_class
-- ----------------------------

-- ----------------------------
-- Table structure for wk_work_task_comment
-- ----------------------------
DROP TABLE IF EXISTS `wk_work_task_comment`;
CREATE TABLE `wk_work_task_comment` (
   `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Comment table',
   `user_id` bigint(20) NOT NULL COMMENT'Commenter ID',
   `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'content (answer)',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'Add New Time',
   `main_id` int(11) NULL DEFAULT 0 COMMENT'The id of the main comment',
   `pid` bigint(20) NULL DEFAULT 0 COMMENT'reply object ID',
   `status` int(2) NULL DEFAULT 1 COMMENT'status',
   `type_id` int(11) NULL DEFAULT 0 COMMENT'Comment project task ID or comment other module ID',
   `favour` int(7) NULL DEFAULT 0 COMMENT'Like',
   `type` int(2) NULL DEFAULT 0 COMMENT'Comment category 1: Task comment 2: Log comment',
   PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Task Comment Form' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_work_task_comment
-- ----------------------------

-- ----------------------------
-- Table structure for wk_work_task_label
-- ----------------------------
DROP TABLE IF EXISTS `wk_work_task_label`;
CREATE TABLE `wk_work_task_label` (
   `label_id` int(11) NOT NULL AUTO_INCREMENT,
   `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'tag name',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT'creator ID',
   `status` int(2) NULL DEFAULT 0 COMMENT'status',
   `color` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT'color',
   PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Task Tag Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_work_task_label
-- ----------------------------

-- ----------------------------
-- Table structure for wk_work_task_label_order
-- ----------------------------
DROP TABLE IF EXISTS `wk_work_task_label_order`;
CREATE TABLE `wk_work_task_label_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `order_num` int(4) NOT NULL DEFAULT 999,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Item label sorting table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_work_task_label_order
-- ----------------------------

-- ----------------------------
-- Table structure for wk_work_task_log
-- ----------------------------
DROP TABLE IF EXISTS `wk_work_task_log`;
CREATE TABLE `wk_work_task_log` (
   `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Project log table',
   `user_id` bigint(20) NOT NULL COMMENT'Operator ID',
   `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT'content',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   `status` int(2) NULL DEFAULT 0 COMMENT'Status 4Delete',
   `task_id` int(11) NULL DEFAULT 0 COMMENT'task ID',
   `work_id` int(11) NULL DEFAULT 0 COMMENT'Project ID',
   PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Task log table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_work_task_log
-- ----------------------------

-- ----------------------------
-- Table structure for wk_work_task_relation
-- ----------------------------
DROP TABLE IF EXISTS `wk_work_task_relation`;
CREATE TABLE `wk_work_task_relation` (
   `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT'Task related business table',
   `task_id` int(11) NULL DEFAULT NULL COMMENT'task ID',
   `customer_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Customer IDs',
   `contacts_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Contact IDs',
   `business_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'Business IDs',
   `contract_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT'contract IDs',
   `status` int(2) NULL DEFAULT NULL COMMENT'Status 1 is available',
   `create_time` datetime(0) NULL DEFAULT NULL COMMENT'create time',
   PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Task related business table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_work_task_relation
-- ----------------------------

-- ----------------------------
-- Table structure for wk_work_user
-- ----------------------------
DROP TABLE IF EXISTS `wk_work_user`;
CREATE TABLE `wk_work_user` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `work_id` int(11) NOT NULL COMMENT'Project ID',
   `user_id` bigint(20) NOT NULL COMMENT'Member ID',
   `role_id` int(11) NOT NULL COMMENT'role ID',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT ='Project Member Table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wk_work_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
