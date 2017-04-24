--46605%
db.s6a.find({"imsi" : "/^46605/"});
--查詢最小值 最大值
db.s6a.find({}).sort({"statD": 1}).limit(1);

--日期查詢, 未建立index查詢速度慢, 且查無資料
-- gte >=, lte <= , ne != 
-- 使用ISODate
"statT":ISODate("2016-10-03 07:00:00.000+08:00")
--同一欄位區間需要使用$and
 $and:[
 	{"startT" : {"$gte": ISODate("2016-10-03 07:00:04.000+08:00")}},
 	{"startT" : {"$lt" : ISODate("2016-10-03 08:00:04.000+08:00")}}
 ]
--不同欄位使用
db.map.find({"kpi":"56", "identity":"1", "cpt":"86157",
    "startT" : {"$lte":ISODate("2016-10-03 07:00:00.000+08:00")},
    "endT" : {"$gte":ISODate("2016-10-03 08:00:00.000+08:00")}
    });

