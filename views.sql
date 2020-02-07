CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `jinyaoyu`@`%` 
    SQL SECURITY DEFINER
VIEW `deleveloper_roles_and_privileges` AS
    SELECT 
        `p`.`first_name` AS `first_name`,
        `p`.`last_name` AS `last_name`,
        `p`.`user_name` AS `user_name`,
        `p`.`email` AS `email`,
        `w`.`website_name` AS `website_name`,
        `w`.`visits` AS `visits`,
        `w`.`website_updated` AS `website_updated`,
        `wr`.`web_role_name` AS `web_role_name`,
        `wp`.`web_priviledge_name` AS `web_priviledge_name`,
        `page`.`title` AS `title`,
        `page`.`views` AS `views`,
        `page`.`page_updated` AS `page_updated`,
        `pr`.`page_role_name` AS `page_role_name`,
        `pp`.`page_priviledge_name` AS `page_priviledge_name`
    FROM
        ((((((`person` `p`
        JOIN `website` `w`)
        JOIN `web_role` `wr`)
        JOIN `web_priviledge` `wp`)
        JOIN `page`)
        JOIN `page_role` `pr`)
        JOIN `page_priviledge` `pp`)
    WHERE
        ((`wr`.`developer` = `p`.`person_id`)
            AND (`wr`.`website` = `w`.`website_id`)
            AND (`wp`.`website` = `w`.`website_id`)
            AND (`wp`.`developer` = `p`.`person_id`)
            AND (`pr`.`developer` = `p`.`person_id`)
            AND (`pr`.`page` = `page`.`page_id`)
            AND (`pp`.`page` = `page`.`page_id`)
            AND (`pp`.`developer` = `p`.`person_id`))
    ORDER BY `p`.`first_name` , `w`.`website_name` , `page`.`title`