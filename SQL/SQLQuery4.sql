/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [序号]
      ,[乡镇]
      ,[村]
      ,[dbo].[dangwuFarm].[姓名]
  
      ,[证件号码]
      ,[关系]
      ,[民族]
      ,[文化程度]
      ,[在校生状况]
      ,[健康状况]
      ,[劳动能力]
      ,[务工状况]
      ,[务工时间]
      ,[新农合]
      ,[居民养老]
      ,[添加原因]
      ,[是否现役军人]
      ,[养老保险金]
      ,[F20]
  FROM [clusterFarm].[dbo].[家庭成员信息] inner join [dbo].[dangwuFarm] on
   [clusterFarm].[dbo].[家庭成员信息].[姓名]=[dbo].[dangwuFarm].姓名

   select distinct 民族,count(*)
   from [clusterFarm].[dbo].[家庭成员信息]
   group by 民族

 alter table [clusterFarm].[dbo].[家庭成员信息]
 add nationCode int
 
 update [clusterFarm].[dbo].[家庭成员信息]
 set nationCode=14
 where 民族='白族'
  update [clusterFarm].[dbo].[家庭成员信息]
  set nationCode=9
 where 民族='布依族'
  update [clusterFarm].[dbo].[家庭成员信息]
    set nationCode=1
 where 民族='汉族'
  update [clusterFarm].[dbo].[家庭成员信息]
     set nationCode=6
 where 民族='苗族'
  update [clusterFarm].[dbo].[家庭成员信息]
       set nationCode=0
 where 民族='其他'
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  alter table [clusterFarm].[dbo].[家庭成员信息]
 add eduCode int

   select distinct [文化程度],count(*)
   from [clusterFarm].[dbo].[家庭成员信息]
   group by [文化程度]
     update [clusterFarm].[dbo].[家庭成员信息]
       set eduCode=0
	   where[文化程度] ='学龄前儿童'
	        update [clusterFarm].[dbo].[家庭成员信息]
	   set eduCode=1
	   where[文化程度] ='文盲或半文盲'
	   	        update [clusterFarm].[dbo].[家庭成员信息]
	   set eduCode=2
	   where[文化程度] ='小学'
	   	    update [clusterFarm].[dbo].[家庭成员信息]
	   set eduCode=3
	   where[文化程度] ='初中'
	     update [clusterFarm].[dbo].[家庭成员信息]
	   set  eduCode=4
	   where[文化程度] ='高中'
	     update [clusterFarm].[dbo].[家庭成员信息]
	   set  eduCode=5
	   where[文化程度] ='大专及以上'
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     alter table [clusterFarm].[dbo].[家庭成员信息]
 add workForceCode int
   select distinct  [劳动能力],count(*)
   from [clusterFarm].[dbo].[家庭成员信息]
   group by 
   [劳动能力]
      
	  	     update [clusterFarm].[dbo].[家庭成员信息]
	   set   workForceCode=1
	   where    [劳动能力] ='无劳动力'
	        update [clusterFarm].[dbo].[家庭成员信息]
	   set   workForceCode=2
	   where    [劳动能力] ='丧失劳动力'
	          update [clusterFarm].[dbo].[家庭成员信息]
	   set   workForceCode=3
	   where    [劳动能力] ='普通劳动力'
	    update [clusterFarm].[dbo].[家庭成员信息]
	   set   workForceCode=4
	   where    [劳动能力] ='技能劳动力'
##############################################################
   select distinct   [务工状况],count(*)
   from [clusterFarm].[dbo].[家庭成员信息]
   group by [务工状况]
   
     alter table [clusterFarm].[dbo].[家庭成员信息]
 add outworkCode int
  update [clusterFarm].[dbo].[家庭成员信息]
	   set   outworkCode=1
	   where    [务工状况] ='其他'
  update [clusterFarm].[dbo].[家庭成员信息]
	   set   outworkCode=2
	   where    [务工状况] ='乡(镇)内务工'
  update [clusterFarm].[dbo].[家庭成员信息]
	   set   outworkCode=3
	   where    [务工状况] ='乡(镇)外县内务工'
 update [clusterFarm].[dbo].[家庭成员信息]
	   set   outworkCode=4
	   where    [务工状况] ='县外省内务工'
	    update [clusterFarm].[dbo].[家庭成员信息]
	   set   outworkCode=5
	   where    [务工状况] ='省外务工'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      select distinct cast(REPLACE([务工时间],'个月','') as int),count(*)
   from [clusterFarm].[dbo].[家庭成员信息]
   group by [务工时间]

  alter table [clusterFarm].[dbo].[家庭成员信息]
 add outworkMonth int

 update [clusterFarm].[dbo].[家庭成员信息] set outworkMonth =cast(REPLACE([务工时间],'个月','') as int)

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
  alter table [clusterFarm].[dbo].[家庭成员信息]
 add healthCode int
 create table health (
  healthCondition nvarchar(50),code int identity(1,1) )

  insert into  health( healthCondition)

      select distinct   [健康状况] 
   from [clusterFarm].[dbo].[家庭成员信息]
   order by  [健康状况] 
 
 update  [clusterFarm].[dbo].[家庭成员信息]
 set  healthCode=code 
 from health
 where healthCondition=[健康状况]





   select * from 
   [clusterFarm].[dbo].[家庭成员信息]
   where [健康状况] is null

   delete from  [clusterFarm].[dbo].[家庭成员信息] where [健康状况] is null

   select * from [clusterFarm].[dbo].[家庭成员信息] where 民族='其他'


     alter table [clusterFarm].[dbo].[家庭成员信息]
 add PensionCode int

 update [clusterFarm].[dbo].[家庭成员信息]
 set PensionCode =0
 where [居民养老]='否'
