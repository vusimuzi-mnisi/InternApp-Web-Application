Web application developed using Java EE
============================================
Skills used: 
HTML, 
CSS, 
JAVASCRIPT, 
JAVA, 
JDBC, 
JAVA SERVER PAGES, 
SERVLETS, 
HTTP session, request and response


To Run project you would need :
==========================================
Apache Netbeans,
Glassfish server,

DATABASE "internappdatabase"
==============================

dbTables :
users_tbl(username,password,role),

applicants_tbl(id,name,surname,email,gender)
//id is auto generated,

internships_tbl(id,title,description,closing_date)
//id is auto generated,

applications_table(application_id,internship_id,intern_username,application_date)
//application_id is auto generated and internship_id is a foreign key from internships_tbl

