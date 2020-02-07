CREATE DEFINER=`jinyaoyu`@`%` TRIGGER `page_role_AFTER_INSERT` AFTER INSERT ON `page_role` FOR EACH ROW BEGIN
	IF new.page_role_name = 'owner' then 
		insert ignore into page_priviledge values ('create', new.developer, new.page);
		insert ignore into page_priviledge values ('read', new.developer, new.page);
		insert ignore into page_priviledge values ('update', new.developer, new.page);
		insert ignore into page_priviledge values ('delete', new.developer, new.page);
	elseif new.page_role_name = 'admin' then
		insert ignore into page_priviledge values ('create', new.developer, new.page);
		insert ignore into page_priviledge values ('read', new.developer, new.page);
		insert ignore into page_priviledge values ('update', new.developer, new.page);
		insert ignore into page_priviledge values ('delete', new.developer, new.page);
	elseif new.page_role_name = 'writer' then
		insert ignore into page_priviledge values ('create', new.developer, new.page);
		insert ignore into page_priviledge values ('read', new.developer, new.page);
		insert ignore into page_priviledge values ('update', new.developer, new.page);
	elseif new.page_role_name = 'editor' then
		insert ignore into page_priviledge values ('read', new.developer, new.page);
		insert ignore into page_priviledge values ('update', new.developer, new.page);
	elseif new.page_role_name = 'reviewer' then
		insert ignore into page_priviledge values ('read', new.developer, new.page);
	end if;
    END

CREATE DEFINER=`jinyaoyu`@`%` TRIGGER `page_role_AFTER_UPDATE` AFTER UPDATE ON `page_role` FOR EACH ROW BEGIN
	delete from page_priviledge where developer = old.developer and page = old.page;
    IF new.page_role_name = 'owner' then 
		insert ignore into page_priviledge values ('create', new.developer, new.page);
		insert ignore into page_priviledge values ('read', new.developer, new.page);
		insert ignore into page_priviledge values ('update', new.developer, new.page);
		insert ignore into page_priviledge values ('delete', new.developer, new.page);
	elseif new.page_role_name = 'admin' then
		insert ignore into page_priviledge values ('create', new.developer, new.page);
		insert ignore into page_priviledge values ('read', new.developer, new.page);
		insert ignore into page_priviledge values ('update', new.developer, new.page);
		insert ignore into page_priviledge values ('delete', new.developer, new.page);
	elseif new.page_role_name = 'writer' then
		insert ignore into page_priviledge values ('create', new.developer, new.page);
		insert ignore into page_priviledge values ('read', new.developer, new.page);
		insert ignore into page_priviledge values ('update', new.developer, new.page);
	elseif new.page_role_name = 'editor' then
		insert ignore into page_priviledge values ('read', new.developer, new.page);
		insert ignore into page_priviledge values ('update', new.developer, new.page);
	elseif new.page_role_name = 'reviewer' then
		insert ignore into page_priviledge values ('read', new.developer, new.page);
	end if;
END

CREATE DEFINER=`jinyaoyu`@`%` TRIGGER `page_role_AFTER_DELETE` AFTER DELETE ON `page_role` FOR EACH ROW BEGIN
	delete from page_priviledge where developer = old.developer and page = old.page;
END

CREATE DEFINER=`jinyaoyu`@`%` TRIGGER `website_roles_AFTER_INSERT` AFTER INSERT ON `web_role` FOR EACH ROW BEGIN
	IF new.web_role_name = 'owner' then 
		insert ignore into web_priviledge values ('create', new.developer, new.website);
		insert ignore into web_priviledge values ('read', new.developer, new.website);
		insert ignore into web_priviledge values ('update', new.developer, new.website);
		insert ignore into web_priviledge values ('delete', new.developer, new.website);
	elseif new.web_role_name = 'admin' then
		insert ignore into web_priviledge values ('create', new.developer, new.website);
		insert ignore into web_priviledge values ('read', new.developer, new.website);
		insert ignore into web_priviledge values ('update', new.developer, new.website);
		insert ignore into web_priviledge values ('delete', new.developer, new.website);
	elseif new.web_role_name = 'writer' then
		insert ignore into web_priviledge values ('create', new.developer, new.website);
		insert ignore into web_priviledge values ('read', new.developer, new.website);
		insert ignore into web_priviledge values ('update', new.developer, new.website);
	elseif new.web_role_name = 'editor' then
		insert ignore into web_priviledge values ('read', new.developer, new.website);
		insert ignore into web_priviledge values ('update', new.developer, new.website);
	elseif new.web_role_name = 'reviewer' then
		insert ignore into web_priviledge values ('read', new.developer, new.website);
	end if;
END

CREATE DEFINER=`jinyaoyu`@`%` TRIGGER `website_roles_AFTER_UPDATE` AFTER UPDATE ON `web_role` FOR EACH ROW BEGIN
	delete from web_priviledge where developer = old.developer and website = old.website;
	IF new.web_role_name = 'owner' then 
		insert ignore into web_priviledge values ('create', new.developer, new.website);
		insert ignore into web_priviledge values ('read', new.developer, new.website);
		insert ignore into web_priviledge values ('update', new.developer, new.website);
		insert ignore into web_priviledge values ('delete', new.developer, new.website);
	elseif new.web_role_name = 'admin' then
		insert ignore into web_priviledge values ('create', new.developer, new.website);
		insert ignore into web_priviledge values ('read', new.developer, new.website);
		insert ignore into web_priviledge values ('update', new.developer, new.website);
		insert ignore into web_priviledge values ('delete', new.developer, new.website);
	elseif new.web_role_name = 'writer' then
		insert ignore into web_priviledge values ('create', new.developer, new.website);
		insert ignore into web_priviledge values ('read', new.developer, new.website);
		insert ignore into web_priviledge values ('update', new.developer, new.website);
	elseif new.web_role_name = 'editor' then
		insert ignore into web_priviledge values ('read', new.developer, new.website);
		insert ignore into web_priviledge values ('update', new.developer, new.website);
	elseif new.web_role_name = 'reviewer' then
		insert ignore into web_priviledge values ('read', new.developer, new.website);
	end if;
END

CREATE DEFINER=`jinyaoyu`@`%` TRIGGER `website_roles_AFTER_DELETE` AFTER DELETE ON `web_role` FOR EACH ROW BEGIN
	delete from web_priviledge where developer = old.developer and website = old.website;
END

CREATE DEFINER=`jinyaoyu`@`%` TRIGGER `page_BEFORE_DELETE` BEFORE DELETE ON `page` FOR EACH ROW BEGIN
	delete from page_role where page = old.page_id;
    delete from widget where page_id = old.page_id;
END

CREATE DEFINER=`jinyaoyu`@`%` TRIGGER `website_BEFORE_DELETE` BEFORE DELETE ON `website` FOR EACH ROW BEGIN
	delete from page where website = old.website_id;
    delete from web_role where website = old.website_id;
END