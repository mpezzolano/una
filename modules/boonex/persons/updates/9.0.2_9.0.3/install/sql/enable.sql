-- PAGE
DELETE FROM `sys_pages_blocks` WHERE `object`='bx_persons_home' AND `title` IN ('_bx_persons_page_block_title_featured_profiles');
INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES
('bx_persons_home', 1, 'bx_persons', '_bx_persons_page_block_title_featured_profiles', 11, 2147483647, 'service', 'a:3:{s:6:"module";s:10:"bx_persons";s:6:"method";s:15:"browse_featured";s:6:"params";a:1:{i:0;s:7:"gallery";}}', 0, 1, 0);


-- VIEWS
UPDATE `sys_objects_view` SET `trigger_field_author`='author' WHERE `name`='bx_persons';


-- FEATURED
DELETE FROM `sys_objects_feature` WHERE `name`='bx_persons';
INSERT INTO `sys_objects_feature` (`name`, `is_on`, `is_undo`, `base_url`, `trigger_table`, `trigger_field_id`, `trigger_field_author`, `trigger_field_flag`, `class_name`, `class_file`) VALUES 
('bx_persons', '1', '1', 'page.php?i=view-persons-profile&id={object_id}', 'bx_persons_data', 'id', 'author', 'featured', '', '');


-- ALERTS
SET @iHandler := (SELECT `id` FROM `sys_alerts_handlers` WHERE `name`='bx_persons' LIMIT 1);

DELETE FROM `sys_alerts` WHERE `unit`='sys_profiles_friends' AND `action`='connection_added' AND `handler_id`=@iHandler;
INSERT INTO `sys_alerts` (`unit`, `action`, `handler_id`) VALUES
('sys_profiles_friends', 'connection_added', @iHandler);

UPDATE `sys_alerts` SET `action`='timeline_repost' WHERE `unit`='bx_persons' AND `action`='timeline_share';


-- EMAIL TEMPLATES
DELETE FROM `sys_email_templates` WHERE `Name`='bx_persons_friend_request';
INSERT INTO `sys_email_templates` (`Module`, `NameSystem`, `Name`, `Subject`, `Body`) VALUES
('bx_persons', '_bx_persons_email_friend_request', 'bx_persons_friend_request', '_bx_persons_email_friend_request_subject', '_bx_persons_email_friend_request_body');