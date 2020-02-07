update cs5200_A2.phone set phone = '333-444-5555' where person = 34 and phone_primary = True;

update cs5200_A2.widget set w_order = 3 where widget_name = 'head345';
update widget set w_order = 1 where widget_name = 'image345';

update cs5200_A2.page set title = concat('CNET - ', title) where website = 567;
update cs5200_A2.page_role set page_role_name = 'writer' where developer = 23 and page = (select page_id from cs5200_A2.page where title like '%Home%');
update cs5200_A2.page_role set page_role_name = 'reviewer' where developer = 34 and page = (select page_id from cs5200_A2.page where title like '%Home%');
