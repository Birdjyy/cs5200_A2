# developer
select * from cs5200_A2.developer;
select * from cs5200_A2.developer where person = 34;
select * from cs5200_A2.web_role where website = 234 and web_role_name <> 'owner';
select * from cs5200_A2.page_role where page_role_name = 'reviewer' and page in (select page_id from cs5200_A2.page where views < 300000);
select * from cs5200_A2.page_role where page_role_name = 'writer' and page = (select page_id from cs5200_A2.page where website = 567 and title = 'Home');
# website
select * from cs5200_A2.website where visits = (select min(visits) from cs5200_A2.website);
select website_name from cs5200_A2.website where website_id = 678;
select * from cs5200_A2.website where website_id in (select website from cs5200_A2.page where page_id in (select page from page_role where page_role_name = 'reviewer' and developer = 23 and page in (select page_id from widget where widget_name like 'video%')));
select * from cs5200_A2.website where website_id in (select website from cs5200_A2.web_role where web_role_name = 'owner' and developer = '12');
select * from cs5200_A2.website where visits > 6000000 and website_id in (select website from cs5200_A2.web_role where web_role_name = 'admin' and developer = '34');
# pages
select * from cs5200_A2.page where views = (select max(views) from cs5200_A2.page);
select title from cs5200_A2.page where page_id = 234;
select * from cs5200_A2.page where page_id in (select page from cs5200_A2.page_role where page_role_name = 'editor' and developer = 12);
select sum(views) from cs5200_A2.page group by website having website = 567;
select avg(views) from cs5200_A2.page group by website having website = 345;
# widget
select * from cs5200_A2.widget where page_id in (select page_id from cs5200_A2.page where website = 567 and title = 'Home');
select * from cs5200_A2.widget where dtype = 'youtube' and page_id in (select page_id from cs5200_A2.page where website = 456);
select * from cs5200_A2.widget where dtype = 'image' and page_id in (select page_id from cs5200_A2.page_role where developer = 12 and page_role_name = 'reviewer');
select count(*) from cs5200_A2.widget where page_id = 345;
# verify
select website_name from cs5200_A2.website where website_id in (select website from cs5200_A2.web_priviledge where developer = 23 and web_priviledge_name = 'delete');
select title from cs5200_A2.page where page_id in (select page from cs5200_A2.page_priviledge where developer = 34 and page_priviledge_name = 'create');


