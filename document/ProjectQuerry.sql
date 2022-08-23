--Sum number of request in Month
select sum(DATEDIFF(day, r.[from], DATEADD(day, 1, r.[to]))) as NumberOfRequest from Employee e
inner join Request r on r.eid = e.eid
where r.[from] >= '2022-08-01' and r.[to] <= '2022-08-31' and e.eid= 1
group by e.eid

--Check a request of Employee in Day
select * from Employee e 
inner join Request r on r.eid = e.eid
where  '2022-08-2' >= r.[from] and '2022-08-2' <= r.[to] and e.eid = 1

--Select timesheet in day of an employee
select * from Employee e inner join TimeSheet t on e.eid = t.eid
where t.checkin >= '2022-08-01' and t.checkin < DATEADD(day, 1, '2022-08-01')
and e.eid = 1





--------------------------------------------------------------------------------------------
--Select all timesheet in month of all employee
select e.eid,e.ename,p.pid,p.pname,p.salary,ISNULL(t.tid,-1) tid,t.checkin,t.checkout 
from Employee e inner join Position p on e.pid = p.pid
left join(select * from TimeSheet t
	where t.checkin >= '2022-09-01' and t.checkin < '2022-10-01' ) t on e.eid = t.eid


--Get requests of an Employee in month
select e.eid, r.rid,r.[from],r.[to],t.* from Employee e 
inner join Request r on r.eid = e.eid inner join Type t on r.tid = t.tid
where r.[from] >= '2022-08-01' and r.[to] <= '2022-08-31' --and e.eid = 1


--Get holiday in Month
select * from Holiday h inner join HolidayType ht on h.tid = ht.tid
where  ([from] >= '2022-04-01' and [from] <= '2022-04-30') 
or ([to] >= '2022-04-01' and [to] <= '2022-04-30')

