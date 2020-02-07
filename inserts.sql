insert into cs5200_A2.person (person_id, first_name, last_name, user_name, password, email)
value (12, 'Alice', 'Wonder', 'alice', 'alice', 'alice@wonder.com');
insert into cs5200_A2.developer value ('4321rewq', 12);

insert into cs5200_A2.person (person_id, first_name, last_name, user_name, password, email)
value (23, 'Bob', 'Marley', 'bob', 'bob', 'bob@marley.com');
insert into cs5200_A2.developer value ('5432trew', 23);

insert into cs5200_A2.person (person_id, first_name, last_name, user_name, password, email)
value (34, 'Charles', 'Garcia', 'charlie', 'charlie', 'chuch@garcia.com');
insert into cs5200_A2.developer value ('6543ytre', 34);

insert into cs5200_A2.person (person_id, first_name, last_name, user_name, password, email)
value (45, 'Dan', 'Martin', 'dan', 'dan', 'dan@martin.com');
insert into cs5200_A2.user (user_agreement, person) value (True, 45);

insert into cs5200_A2.person (person_id, first_name, last_name, user_name, password, email)
value (56, 'Ed', 'Karaz', 'ed', 'ed', 'ed@kar.com');
insert into cs5200_A2.user (user_agreement, person) value (True, 56);

insert into cs5200_A2.website 
(website_id, website_name, website_description, website_created, website_updated, visits)
value 
(123, 'Facebook', 'an online social media and social networking service', now(), now(), 1234234);
insert into cs5200_A2.web_role value (12, 'owner', 123);
insert into cs5200_A2.web_role value (23, 'editor', 123);
insert into cs5200_A2.web_role value (34, 'admin', 123);

insert into cs5200_A2.website 
(website_id, website_name, website_description, website_created, website_updated, visits)
value 
(234, 'Twitter', 'an online news and social networking service', now(), now(), 4321543);
insert into cs5200_A2.web_role value (23, 'owner', 234);
insert into cs5200_A2.web_role value (34, 'editor', 234);
insert into cs5200_A2.web_role value (12, 'admin', 234);

insert into cs5200_A2.website 
(website_id, website_name, website_description, website_created, website_updated, visits)
value 
(345, 'Wikipedia', 'a free online encyclopedia', now(), now(), 3456654);
insert into cs5200_A2.web_role value (34, 'owner', 345);
insert into cs5200_A2.web_role value (12, 'editor', 345);
insert into cs5200_A2.web_role value (23, 'admin', 345);

insert into cs5200_A2.website 
(website_id, website_name, website_description, website_created, website_updated, visits)
value 
(456, 'CNN', 'an American basic cable and satellite television news channel', now(), now(), 6543345);
insert into cs5200_A2.web_role value (12, 'owner', 456);
insert into cs5200_A2.web_role value (23, 'editor', 456);
insert into cs5200_A2.web_role value (34, 'admin', 456);

insert into cs5200_A2.website 
(website_id, website_name, website_description, website_created, website_updated, visits)
value 
(567, 'CNET', 'an American media website that publishes reviews, news, articles, blogs, podcasts and videos on technology and consumer electronics', now(), now(), 5433455);
insert into cs5200_A2.web_role value (23, 'owner', 567);
insert into cs5200_A2.web_role value (34, 'editor', 567);
insert into cs5200_A2.web_role value (12, 'admin', 567);

insert into cs5200_A2.website 
(website_id, website_name, website_description, website_created, website_updated, visits)
value 
(678, 'Gizmodo', 'a design, technology, science and science fiction website that also writes articles on politics', now(), now(), 4322345);
insert into cs5200_A2.web_role value (34, 'owner', 678);
insert into cs5200_A2.web_role value (12, 'editor', 678);
insert into cs5200_A2.web_role value (23, 'admin', 678);

insert into cs5200_A2.page 
value
(123, 'Home', 'Landing page', '2020-01-06', '2020-02-07', 123434, 567);
insert into cs5200_A2.page_role value (12, 'editor', 123);
insert into cs5200_A2.page_role value (23, 'reviewer', 123);
insert into cs5200_A2.page_role value (34, 'writer', 123);

insert into cs5200_A2.page 
value
(234, 'About', 'Website description', '2020-01-06', '2020-02-07', 234545, 678);
insert into cs5200_A2.page_role value (23, 'editor', 234);
insert into cs5200_A2.page_role value (34, 'reviewer', 234);
insert into cs5200_A2.page_role value (12, 'writer', 234);

insert into cs5200_A2.page 
value
(345, 'Contact', 'Addresses, phones, and contact info', '2020-01-06', '2020-02-07', 345656, 345);
insert into cs5200_A2.page_role value (34, 'editor', 345);
insert into cs5200_A2.page_role value (12, 'reviewer', 345);
insert into cs5200_A2.page_role value (23, 'writer', 345);

insert into cs5200_A2.page 
value
(456, 'Preferences', 'Where users can configure their preferences', '2020-01-06', '2020-02-07', 456776, 456);
insert into cs5200_A2.page_role value (12, 'editor', 456);
insert into cs5200_A2.page_role value (23, 'reviewer', 456);
insert into cs5200_A2.page_role value (34, 'writer', 456);

insert into cs5200_A2.page 
value
(567, 'Profile', 'Users can configure their personal information', '2020-01-06', '2020-02-07', 567878, 567);
insert into cs5200_A2.page_role value (23, 'editor', 567);
insert into cs5200_A2.page_role value (34, 'reviewer', 567);
insert into cs5200_A2.page_role value (12, 'writer', 567);


insert into cs5200_A2.widget 
(widget_id, widget_name, dtype, text, w_order, page_id)
value
(123, 'head123', 'heading', 'Welcome', 0, 123);

insert into cs5200_A2.widget 
(widget_id, widget_name, dtype, text, w_order, page_id)
value
(234, 'post234', 'html', '<p>Lorem</p>', 0, 234);

insert into cs5200_A2.widget 
(widget_id, widget_name, dtype, text, w_order, page_id)
value
(345, 'head345', 'heading', 'Hi', 1, 345);

insert into cs5200_A2.widget 
(widget_id, widget_name, dtype, text, w_order, page_id)
value
(456, 'intro456', 'html', '<h1>Hi</h1>', 2, 345);

insert into cs5200_A2.widget 
(widget_id, widget_name, dtype, w_order, page_id, width, height, image_src)
value
(567, 'image345', 'image', 3, 345, 50, 100, '/img/567.png');

insert into cs5200_A2.widget 
(widget_id, widget_name, dtype, w_order, page_id, width, height, youtube_url)
value
(678, 'video456', 'youtube', 0, 456, 400, 300, 'https://youtu.be/h67VX51QXiQ');

insert into cs5200_A2.phone 
(phone, person, phone_primary)
value
('123-234-3456', 12, True);

insert into cs5200_A2.phone 
(phone, person, phone_primary)
value
('234-345-4566', 12, False);

insert into cs5200_A2.phone 
(phone, person, phone_primary)
value
('345-456-5677', 23, True);

insert into cs5200_A2.phone 
(phone, person, phone_primary)
value
('321-432-5435', 34, True);

insert into cs5200_A2.phone 
(phone, person, phone_primary)
value
('432-432-5433', 34, False);

insert into cs5200_A2.phone 
(phone, person, phone_primary)
value
('543-543-6544', 34, False);

insert into cs5200_A2.address
(street1, city, zip, person, address_primary)
value 
('123 Adam St.', 'Alton', 01234, 12, True);
 
 insert into cs5200_A2.address
(street1, city, zip, person, address_primary)
value 
('234 Birch St.', 'Boston', 02345, 12, False);

insert into cs5200_A2.address
(street1, city, zip, person, address_primary)
value 
('345 Charles St.', 'Chelms', 03455, 23, True);

insert into cs5200_A2.address
(street1, city, zip, person, address_primary)
value 
('456 Down St.', 'Dalton', 04566, 23, False);

insert into cs5200_A2.address
(street1, city, zip, person, address_primary)
value 
('543 East St.', 'Everett', 01112, 23,False);

insert into cs5200_A2.address
(street1, city, zip, person, address_primary)
value 
('654 Frank St.', 'Foulton', 04322, 34 , False);