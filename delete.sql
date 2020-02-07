delete from cs5200_A2.address where person = 12 and address_primary = True;
delete from cs5200_A2.widget where w_order = (select b.a from (select max(w_order) a from cs5200_A2.widget)b);
delete from cs5200_A2.page where website = 345 and page_updated = (select b.a from (select max(page_updated) a from cs5200_A2.page)b);
delete from cs5200_A2.website where website_id = 567;