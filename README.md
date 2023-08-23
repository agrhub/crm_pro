# Wukong CRM-11.0


## Wukong CRM Introduction


Wukong CRM has a high reputation in China's open source management software industry. At present, the software has reached tens of millions of users, and the open source system has been downloaded more than 2 million times, covering various industries such as design and manufacturing, service industry, financial industry, and government agencies. It has reached strategic cooperation with many well-known companies such as Alibaba, Tencent, OPPO, Aerospace Information, CCTV, etc.

The company has successively won more than 20 honorary awards such as Henan High-tech Enterprise, National 3A Credit Enterprise, IOS9001, IOS27001 Software Product Certification. Owns more than 50 software copyrights. Obtained more than 20 domestic media reports. Since its establishment, the company has taken high technology as the starting point, technology as the core, and perfect after-sales service as the backing, adhering to the spirit of stability and development, truth-seeking and innovation, and has provided services to tens of thousands of enterprises at home and abroad. In the process of maximizing the value of the enterprise, it has realized the enhancement of its own value, achieved the greatest degree of win-win cooperation, and has won wide praise and recognition from all walks of life.

Official website address: [http://www.5kcrm.com](http://www.5kcrm.com/)

Demo address: (https://demo10.72crm.com/#/crm)
Account: 18688888888 Password: 123456a



QQ group exchange group: [1026560336](http:////shang.qq.com/wpa/qunwpa?idkey=13d5e5809eb9feb350336e55c8b7a00b9cb472078b09b4441222a52dd76b278e)


Scan the QR code to add Xiaowu's official customer service WeChat, and invite you to join the WeChat exchange group:

<img src="https://images.gitee.com/uploads/images/2019/1231/115927_f9c580c8_345098.png" width="200">

Follow Wukong CRM official account to learn more about Wukong

<img src="https://images.gitee.com/uploads/images/2019/1202/135713_d3566c6a_345098.jpeg" width="200">





 :boom: :boom: :boom: Note: Wukong CRM adopts a new front-end and back-end separation mode. This warehouse code has integrated the front-end vue packaged files, ** can eliminate the packaging operation, and no need to run the front-end**. If you need to adjust the front-end code, please download the front-end code separately


(<a href="https://gitee.com/wukongcrm/W72crm_web" target="_blank">Click to download the front-end code</a>)


## Wukong CRM Directory Structure

``` lua
wk_crm
├── admin - system management module and user management module
├── authorization - authentication module, currently only used for login authentication, may be changed later
├── bi - business intelligence module
├── core - general code and tools
├── crm - customer management module
├── gateway - gateway module
├── job - Timing task module
├── oa - OA module
└── work - project management module


```


## The main technology stack used by Wukong CRM

| Name | Version | Description |
|---------------------|--------------------------- |----|
| spring-cloud-alibaba| 2.2.1.RELEASE(Hoxton.SR3) | Core Framework |
| swagger | 2.9.2 | Interface documentation |
| mybatis-plus | 3.3.0 | ORM framework |
| sentinel | 2.2.1.RELEASE | Circuit breaker and current limit |
| nacos | 1.2.1.RELEASE | Registry and distributed configuration management |
| seata | 1.2.0 | Distributed transaction |
| elasticsearch | 2.2.5.RELEASE(6.8.6) | Search engine middleware |
| jetcache | 2.6.0 | Distributed Cache Framework |
| xxl-job | 2.1.2 | Distributed timing task framework |
| gateway | 2.2.2.RELEASE | Microservice gateway |
| feign | 2.2.2.RELEASE | Service call |


## Wukong CRM project architecture diagram


<img src="https://images.gitee.com/uploads/images/2020/0910/094237_e7cb3bca_1096736.jpeg" width="650">

## Instructions for use

### 1. Front-end environment
-Jdk1.8
-Maven 3.5.0+
-Mysql5.7.20 (<a href="https://gitee.com/wukongcrm/crm_pro/wikis/mysql configuration instructions" target="_blank">Database installation notes</a>)
-Redis (unlimited version)
-Elasticsearch 6.8.6 (<a href="https://gitee.com/wukongcrm/crm_pro/wikis/elasticsearch configuration instructions" target="_blank">Environment configuration considerations</a>)
-Seata (1.2.0) (<a href="https://gitee.com/wukongcrm/crm_pro/wikis/seata" target="_blank">configuration instructions</a>)
-Sentinel (1.7.2) (Sentinel uses port 8079 in the project)
-Nacos (1.2.1)

### Installation

### One-click installation instructions

This project supports Docker one-click installation, [see the specific installation method](https://gitee.com/wukongcrm/crm_pro/wikis/Docker one-click installation tutorial?sort_id=3033975)

### common problem

<a href="https://bbs.72crm.com/portal.php?fid=44" target="_blank">Common problems and solutions</a>



### Manual installation instructions
     
#### 1. Import the initialization sql, the independent database used by the gateway module under the project, and other modules use the same database
      

```
-Initialize the gateway module database: Create a new database `nacos` and run `DB/config_info_route.sql` in the `nacos` database
-Initialize the rest of the module database: create a new database `wk_crm_single` and run `DB/wk_crm_single.sql` in the `wk_crm_single` database
-Initialize the timed task module database: create a new database `xxl_job` and run `DB/xxl_job.sql` in the `xxl_job` database
-Initialize the seata database: create a new database `seata` and run `DB/seata.sql` in the `seata` database

Remove ONLY_FULL_GROUP_BY from phpmyadmin

Open phpmyadmin & select localhost
Click on menu Variables & scroll down for sql mode
Click on edit button to change the values & remove ONLY_FULL_GROUP_BY & click on save.

```


#### 2. Execute `mvn install` in the project root directory



#### 3. Configure database account information and redis account information in the resource directory of each module (the application-dev.yml configuration file is used by default, and the application-test.yml configuration file used by the default startup script after packaging)`



#### 4. Modify the elasticsearch configuration in `crm\src\main\resources\application-dev.yml`

        
```
spring.elasticsearch.rest.uris = elasticsearch address Example: 127.0.0.1:9200
spring.elasticsearch.rest.username = elasticsearch username Example: elastic can be left blank without a password
spring.elasticsearch.rest.password = elasticsearch password Example: password can be left blank without a password

```

Note: elasticsearch [configuration notes](https://gitee.com/wukongcrm/crm_pro/wikis/elasticsearch configuration instructions?sort_id=2927431)

#### 5. (Optional) Modify the file upload address in the system, the default is local configuration, local upload also needs to configure the public network address, pointing to the server gateway

```
crm.upload.config:1 File upload configuration 1: Local 2: Alibaba Cloud OSS
crm.upload.oss oss upload file configuration content
crm.upload.oss.bucketName needs to configure two buckets, 0 is login to access the file upload address, 1 is the fully public file upload address
crm.upload.local configuration content required to upload files locally
crm.upload.local.uploadPath needs to configure two addresses, 0 is login to access the file upload address, 1 is the fully public file upload address
```

#### 6. (Optional) To modify jetcache cache configuration, please refer to <a href="https://github.com/alibaba/jetcache/wiki" target="_blank">official documents</a>


#### 7. (Optional) Modify the project log file in `core\src\main\resources\logback-spring.xml`
            

#### 8. Project packaging and deployment


```
·Execute mvn clean -Dmaven.test.skip=true package in the project root directory
· Then put the corresponding module under the target folder
·${name}-${version}-SNAPSHOT.zip/tar.gz upload to the server, for example: admin-0.0.1-SNAPSHOT.zip and unzip the compressed file, check the corresponding configuration file.

```


#### 9. Project launch <br/>


```
First start basic services such as nacos, seata, sentinel, elasticsearch, mysql, redis, etc.
Start each module service by executing `sh 72crm.sh start` (run 72crm.bat directly under windows) under the file module decompressed in step 8.
The basic modules of the project: gateway, authorization, and admin must be started, and other modules can be started on demand.
After the startup is complete, visit in the browser: http://localhost:8443/ to log in to the system

```

#### 10. Upgrade instructions and precautions<br/>

```
1. The back-end code update can directly download the full code replacement
2. For database update, please download DB/update/V11.x.x.sql and execute incrementally (such as the current version
3. For docker update, please use online update or manually back up the database data and execute the incremental upgrade SQL, then back up to the local, then download the new version of the docker image, and restore the SQL to the new version of the database after the incremental upgrade

```


### Three, other instructions

#### 1. Code generator and interface documentation<br/>


```
Code generator address: core\src\test\com\kakarote\generator\Generator.java
Interface document address `http://localhost:8443/swagger-ui.html` or visit the corresponding service under http://service address: port/swagger-ui.html
```


#### 2. Module dependencies <br/>

```
-Except for the gateway, all other projects rely on the admin module to obtain information about the currently logged in person
-The tasks of the oa module depend on the work module, and some other related business functions depend on the crm module
-Business intelligence relies on crm, oa modules

```


### Three, Wukong CRM function module preview


![Enter picture description](https://images.gitee.com/uploads/images/2020/0928/172541_efed65bd_345098.png "01.png")
![Enter picture description](https://images.gitee.com/uploads/images/2020/0928/172557_c001d047_345098.png "02.png")
![Enter picture description](https://images.gitee.com/uploads/images/2020/0928/172612_97363074_345098.png "03.png")
![Enter picture description](https://images.gitee.com/uploads/images/2020/0928/172625_47a2798b_345098.png "04.png")
![Enter picture description](https://images.gitee.com/uploads/images/2020/0928/172636_ae5cad59_345098.png "05.png")
![Enter picture description](https://images.gitee.com/uploads/images/2020/0928/172648_c7928c60_345098.png "06.png")
![Enter picture description](https://images.gitee.com/uploads/images/2020/0928/172704_ac4c3308_345098.png "07.png")
![Enter picture description](https://images.gitee.com/uploads/images/2020/0928/172714_84b7ee29_345098.png "08.png")
![Enter picture description](https://images.gitee.com/uploads/images/2020/0928/172726_4552bddb_345098.png "10.png")
![Enter picture description](https://images.gitee.com/uploads/images/2020/0928/172736_da77deec_345098.png "11.png")
![Enter picture description](https://images.gitee.com/uploads/images/2020/0928/172745_e22b7a4a_345098.png "12.png")