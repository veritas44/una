
-- SETTINGS

SET @iTypeOrder = (SELECT MAX(`order`) FROM `sys_options_types` WHERE `group` = 'modules');
INSERT INTO `sys_options_types`(`group`, `name`, `caption`, `icon`, `order`) VALUES 
('modules', 'bx_persons', '_bx_persons', 'bx_persons@modules/boonex/persons/|std-mi.png', IF(ISNULL(@iTypeOrder), 1, @iTypeOrder + 1));
SET @iTypeId = LAST_INSERT_ID();

INSERT INTO `sys_options_categories` (`type_id`, `name`, `caption`, `order`)
VALUES (@iTypeId, 'bx_persons', '_bx_persons', 1);
SET @iCategId = LAST_INSERT_ID();

INSERT INTO `sys_options` (`name`, `value`, `category_id`, `caption`, `type`, `extra`, `check`, `check_error`, `order`) VALUES
('bx_persons_autoapproval', 'on', @iCategId, '_bx_persons_option_autoapproval', 'checkbox', '', '', '', 1),
('bx_persons_default_acl_level', '3', @iCategId, '_bx_persons_option_default_acl_level', 'select', 'a:4:{s:6:"module";s:6:"system";s:6:"method";s:15:"get_memberships";s:6:"params";a:2:{i:0;b:0;i:1;b:1;}s:5:"class";s:16:"TemplAclServices";}', '', '', 2),
('bx_persons_num_connections_quick', '4', @iCategId, '_bx_persons_option_num_connections_quick', 'digit', '', '', '', 10),
('bx_persons_num_rss', '10', @iCategId, '_bx_persons_option_num_rss', 'digit', '', '', '', 12);

-- PAGES

-- PAGE: create profile

INSERT INTO `sys_objects_page`(`object`, `uri`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_create_profile', 'create-persons-profile', '_bx_persons_page_title_sys_create_profile', '_bx_persons_page_title_create_profile', 'bx_persons', 5, 2147483647, 1, 'page.php?i=create-persons-profile', '', '', '', 0, 1, 0, '', '');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_persons_create_profile', 1, 'bx_persons', '_bx_persons_page_block_title_create_profile', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:10:\"bx_persons\";s:6:\"method\";s:13:\"entity_create\";}', 0, 1, 1);

-- PAGE: view profile

INSERT INTO `sys_objects_page`(`object`, `uri`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_view_profile', 'view-persons-profile', '_bx_persons_page_title_sys_view_profile', '_bx_persons_page_title_view_profile', 'bx_persons', 10, 2147483647, 1, 'page.php?i=view-persons-profile', '', '', '', 0, 1, 0, 'BxPersonsPageEntry', 'modules/boonex/persons/classes/BxPersonsPageEntry.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_persons_view_profile', 1, 'bx_persons', '_bx_persons_page_block_title_profile_actions', 3, 2147483647, 'service', 'a:2:{s:6:\"module\";s:10:\"bx_persons\";s:6:\"method\";s:14:\"entity_actions\";}', 0, 0, 0),
('bx_persons_view_profile', 1, 'bx_persons', '_bx_persons_page_block_title_profile_cover', 3, 2147483647, 'service', 'a:2:{s:6:\"module\";s:10:\"bx_persons\";s:6:\"method\";s:13:\"profile_cover\";}', 0, 0, 1),
('bx_persons_view_profile', 2, 'bx_persons', '_bx_persons_page_block_title_profile_info', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:10:\"bx_persons\";s:6:\"method\";s:11:\"entity_info\";}', 0, 0, 0),
('bx_persons_view_profile', 3, 'bx_persons', '_bx_persons_page_block_title_profile_friends', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:10:\"bx_persons\";s:6:\"method\";s:15:\"profile_friends\";}', 0, 0, 0);

-- PAGE: edit profile

INSERT INTO `sys_objects_page`(`object`, `uri`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_edit_profile', 'edit-persons-profile', '_bx_persons_page_title_sys_edit_profile', '_bx_persons_page_title_edit_profile', 'bx_persons', 5, 2147483647, 1, 'page.php?i=edit-persons-profile', '', '', '', 0, 1, 0, 'BxPersonsPageEntry', 'modules/boonex/persons/classes/BxPersonsPageEntry.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_persons_edit_profile', 1, 'bx_persons', '_bx_persons_page_block_title_edit_profile', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:10:\"bx_persons\";s:6:\"method\";s:11:\"entity_edit\";}', 0, 0, 0);

-- PAGE: edit profile cover

INSERT INTO `sys_objects_page`(`object`, `uri`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_edit_profile_cover', 'edit-persons-cover', '_bx_persons_page_title_sys_edit_profile_cover', '_bx_persons_page_title_edit_profile_cover', 'bx_persons', 5, 2147483647, 1, 'page.php?i=edit-persons-cover', '', '', '', 0, 1, 0, 'BxPersonsPageEntry', 'modules/boonex/persons/classes/BxPersonsPageEntry.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_persons_edit_profile_cover', 1, 'bx_persons', '_bx_persons_page_block_title_edit_profile_cover', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:10:\"bx_persons\";s:6:\"method\";s:17:\"entity_edit_cover\";}', 0, 0, 0);

-- PAGE: delete profile

INSERT INTO `sys_objects_page`(`object`, `uri`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_delete_profile', 'delete-persons-profile', '_bx_persons_page_title_sys_delete_profile', '_bx_persons_page_title_delete_profile', 'bx_persons', 5, 2147483647, 1, 'page.php?i=delete-persons-profile', '', '', '', 0, 1, 0, 'BxPersonsPageEntry', 'modules/boonex/persons/classes/BxPersonsPageEntry.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_persons_delete_profile', 1, 'bx_persons', '_bx_persons_page_block_title_delete_profile', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:10:\"bx_persons\";s:6:\"method\";s:13:\"entity_delete\";}', 0, 0, 0);

-- PAGE: profile info

INSERT INTO `sys_objects_page`(`object`, `uri`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_profile_info', 'persons-profile-info', '_bx_persons_page_title_sys_profile_info', '_bx_persons_page_title_profile_info', 'bx_persons', 5, 2147483647, 1, 'page.php?i=persons-profile-info', '', '', '', 0, 1, 0, 'BxPersonsPageEntry', 'modules/boonex/persons/classes/BxPersonsPageEntry.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_persons_profile_info', 1, 'bx_persons', '_bx_persons_page_block_title_profile_info', 11, 2147483647, 'service', 'a:2:{s:6:\"module\";s:10:\"bx_persons\";s:6:\"method\";s:11:\"entity_info\";}', 0, 0, 1);

-- PAGE: profile friends

INSERT INTO `sys_objects_page`(`object`, `uri`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_profile_friends', 'persons-profile-friends', '_bx_persons_page_title_sys_profile_friends', '_bx_persons_page_title_profile_friends', 'bx_persons', 5, 2147483647, 1, 'page.php?i=persons-profile-friends', '', '', '', 0, 1, 0, 'BxPersonsPageEntry', 'modules/boonex/persons/classes/BxPersonsPageEntry.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_persons_profile_friends', 1, 'bx_persons', '_bx_persons_page_block_title_profile_friends', 11, 2147483647, 'service', 'a:3:{s:6:\"module\";s:6:\"system\";s:6:\"method\";s:17:\"connections_table\";s:5:\"class\";s:23:\"TemplServiceConnections\";}', 0, 0, 1);

-- PAGE: module home

INSERT INTO `sys_objects_page`(`object`, `title_system`, `title`, `module`, `layout_id`, `visible_for_levels`, `visible_for_levels_editable`, `uri`, `url`, `meta_description`, `meta_keywords`, `meta_robots`, `cache_lifetime`, `cache_editable`, `deletable`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_home', '_bx_persons_page_title_sys_home', '_bx_persons_page_title_home', 'bx_persons', 5, 2147483647, 1, 'persons-home', 'page.php?i=persons-home', '', '', '', 0, 1, 0, 'BxPersonsPageBrowse', 'modules/boonex/persons/classes/BxPersonsPageBrowse.php');

INSERT INTO `sys_pages_blocks`(`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES 
('bx_persons_home', 1, 'bx_persons', '_bx_persons_page_block_title_latest_profiles', 0, 2147483647, 'service', 'a:3:{s:6:\"module\";s:10:\"bx_persons\";s:6:\"method\";s:22:\"browse_recent_profiles\";s:6:"params";a:1:{i:0;b:1;}}', 0, 1, 0);

-- PAGE: add block to homepage

SET @iBlockOrder = (SELECT `order` FROM `sys_pages_blocks` WHERE `object` = 'sys_home' AND `cell_id` = 1 ORDER BY `order` DESC LIMIT 1);
INSERT INTO `sys_pages_blocks` (`object`, `cell_id`, `module`, `title`, `designbox_id`, `visible_for_levels`, `type`, `content`, `deletable`, `copyable`, `order`) VALUES
('sys_home', 1, 'bx_persons', '_bx_persons_page_block_title_latest_profiles', 0, 2147483647, 'service', 'a:2:{s:6:"module";s:10:"bx_persons";s:6:"method";s:22:"browse_recent_profiles";}', 1, 0, IFNULL(@iBlockOrder, 0) + 1);

-- MENU

-- MENU: add to site menu

SET @iSiteMenuOrder = (SELECT `order` FROM `sys_menu_items` WHERE `set_name` = 'sys_site' AND `active` = 1 ORDER BY `order` DESC LIMIT 1);
INSERT INTO `sys_menu_items` (`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('sys_site', 'bx_persons', 'persons-home', '_bx_persons_menu_item_title_system_entries_home', '_bx_persons_menu_item_title_entries_home', 'page.php?i=persons-home', '', '', 'user col-blue3', 'bx_persons_submenu', 2147483647, 1, 1, IFNULL(@iSiteMenuOrder, 0) + 1);


--SET @iCreateProfileMenuOrder = (SELECT `order` FROM `sys_menu_items` WHERE `set_name` = 'sys_profiles_create' AND `active` = 1 ORDER BY `order` DESC LIMIT 1);
--INSERT INTO `sys_menu_items` (`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES
--('sys_profiles_create', 'bx_persons', 'create-person-profile', '_bx_persons_menu_item_title_system_profile_type', '_bx_persons_menu_item_title_profile_type', 'page.php?i=create-persons-profile', '', '', 'user', '', 2147483647, 1, 1, IFNULL(@iCreateProfileMenuOrder, 0) + 1);

SET @iAddMenuOrder = (SELECT `order` FROM `sys_menu_items` WHERE `set_name` = 'sys_add_profile_links' AND `active` = 1 ORDER BY `order` DESC LIMIT 1);
INSERT INTO `sys_menu_items` (`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('sys_add_profile_links', 'bx_persons', 'create-persons-profile', '_bx_persons_menu_item_title_system_create_profile', '_bx_persons_menu_item_title_create_profile', 'page.php?i=create-persons-profile', '', '', 'user', '', 2147483647, 1, 1, IFNULL(@iAddMenuOrder, 0) + 1);

-- MENU: view actions

INSERT INTO `sys_objects_menu`(`object`, `title`, `set_name`, `module`, `template_id`, `deletable`, `active`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_view_actions', '_bx_persons_menu_title_view_profile_actions', 'bx_persons_view_actions', 'bx_persons', 9, 0, 1, 'BxPersonsMenuView', 'modules/boonex/persons/classes/BxPersonsMenuView.php');

INSERT INTO `sys_menu_sets`(`set_name`, `module`, `title`, `deletable`) VALUES 
('bx_persons_view_actions', 'bx_persons', '_bx_persons_menu_set_title_view_profile_actions', 0);

INSERT INTO `sys_menu_items`(`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('bx_persons_view_actions', 'bx_persons', 'profile-friend-add', '_bx_persons_menu_item_title_system_befriend', '{title_add_friend}', 'javascript:void(0)', 'bx_conn_action(this, \'sys_profiles_friends\', \'add\', \'{profile_id}\')', '', 'plus', '', 2147483647, 1, 0, 10),
('bx_persons_view_actions', 'bx_persons', 'profile-subscribe-add', '_bx_persons_menu_item_title_system_subscribe', '_bx_persons_menu_item_title_subscribe', 'javascript:void(0)', 'bx_conn_action(this, \'sys_profiles_subscriptions\', \'add\', \'{profile_id}\')', '', 'check', '', 2147483647, 1, 0, 20),
('bx_persons_view_actions', 'bx_persons', 'profile-set-acl-level', '_sys_menu_item_title_system_set_acl_level', '_sys_menu_item_title_set_acl_level', 'javascript:void(0)', 'bx_menu_popup(''sys_set_acl_level'', window, {}, {profile_id: {profile_id}});', '', 'certificate', '', 192, 1, 0, 1000),
('bx_persons_view_actions', 'bx_persons', 'profile-actions-more', '_bx_persons_menu_item_title_system_more_actions', '_bx_persons_menu_item_title_more_actions', 'javascript:void(0)', 'bx_menu_popup(''bx_persons_view_actions_more'', this, {}, {profile_id:{profile_id}});', '', 'cog', 'bx_persons_view_actions_more', 2147483647, 1, 0, 9999);

-- MENU: view actions more

INSERT INTO `sys_objects_menu`(`object`, `title`, `set_name`, `module`, `template_id`, `deletable`, `active`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_view_actions_more', '_bx_persons_menu_title_view_profile_actions_more', 'bx_persons_view_actions_more', 'bx_persons', 6, 0, 1, 'BxPersonsMenuView', 'modules/boonex/persons/classes/BxPersonsMenuView.php');

INSERT INTO `sys_menu_sets`(`set_name`, `module`, `title`, `deletable`) VALUES 
('bx_persons_view_actions_more', 'bx_persons', '_bx_persons_menu_set_title_view_profile_actions_more', 0);

INSERT INTO `sys_menu_items`(`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('bx_persons_view_actions_more', 'bx_persons', 'profile-friend-remove', '_bx_persons_menu_item_title_system_unfriend', '{title_remove_friend}', 'javascript:void(0)', 'bx_conn_action(this, \'sys_profiles_friends\', \'remove\', \'{profile_id}\')', '', 'minus', '', 2147483647, 1, 0, 10),
('bx_persons_view_actions_more', 'bx_persons', 'profile-subscribe-remove', '_bx_persons_menu_item_title_system_unsubscribe', '_bx_persons_menu_item_title_unsubscribe', 'javascript:void(0)', 'bx_conn_action(this, \'sys_profiles_subscriptions\', \'remove\', \'{profile_id}\')', '', 'check', '', 2147483647, 1, 0, 20),
('bx_persons_view_actions_more', 'bx_persons', 'edit-persons-profile', '_bx_persons_menu_item_title_system_edit_profile', '_bx_persons_menu_item_title_edit_profile', 'page.php?i=edit-persons-profile&id={content_id}', '', '', 'pencil', '', 2147483647, 1, 0, 30),
('bx_persons_view_actions_more', 'bx_persons', 'delete-persons-profile', '_bx_persons_menu_item_title_system_delete_profile', '_bx_persons_menu_item_title_delete_profile', 'page.php?i=delete-persons-profile&id={content_id}', '', '', 'remove', '', 2147483647, 1, 0, 40);

-- MENU: module sub-menu

INSERT INTO `sys_objects_menu`(`object`, `title`, `set_name`, `module`, `template_id`, `deletable`, `active`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_submenu', '_bx_persons_menu_title_submenu', 'bx_persons_submenu', 'bx_persons', 8, 0, 1, '', '');

INSERT INTO `sys_menu_sets`(`set_name`, `module`, `title`, `deletable`) VALUES 
('bx_persons_submenu', 'bx_persons', '_bx_persons_menu_set_title_submenu', 0);

INSERT INTO `sys_menu_items`(`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('bx_persons_submenu', 'bx_persons', 'persons-home', '_bx_persons_menu_item_title_system_entries_public', '_bx_persons_menu_item_title_entries_public', 'page.php?i=persons-home', '', '', '', '', 2147483647, 1, 1, 1);

-- MENU: view submenu

INSERT INTO `sys_objects_menu`(`object`, `title`, `set_name`, `module`, `template_id`, `deletable`, `active`, `override_class_name`, `override_class_file`) VALUES 
('bx_persons_view_submenu', '_bx_persons_menu_title_view_profile_submenu', 'bx_persons_view_submenu', 'bx_persons', 8, 0, 1, 'BxPersonsMenuView', 'modules/boonex/persons/classes/BxPersonsMenuView.php');

INSERT INTO `sys_menu_sets`(`set_name`, `module`, `title`, `deletable`) VALUES 
('bx_persons_view_submenu', 'bx_persons', '_bx_persons_menu_set_title_view_profile_submenu', 0);

INSERT INTO `sys_menu_items`(`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES 
('bx_persons_view_submenu', 'bx_persons', 'persons-profile-info', '_bx_persons_menu_item_title_system_view_profile_info', '_bx_persons_menu_item_title_view_profile_info', 'page.php?i=persons-profile-info&id={content_id}', '', '', '', '', 2147483647, 1, 0, 0),
('bx_persons_view_submenu', 'bx_persons', 'persons-profile-friends', '_bx_persons_menu_item_title_system_view_profile_friends', '_bx_persons_menu_item_title_view_profile_friends', 'page.php?i=persons-profile-friends&profile_id={profile_id}', '', '', '', '', 2147483647, 1, 0, 1);

-- MENU: notifications menu in account popup

SET @iNotifMenuOrder = (SELECT `order` FROM `sys_menu_items` WHERE `set_name` = 'sys_account_notifications' AND `active` = 1 ORDER BY `order` DESC LIMIT 1);
INSERT INTO `sys_menu_items` (`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `addon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES
('sys_account_notifications', 'bx_persons', 'notifications-friend-requests', '_bx_persons_menu_item_title_system_friends', '_bx_persons_menu_item_title_friends', 'page.php?i=persons-profile-friends&profile_id={member_id}', '', '', 'group col-blue3', 'a:4:{s:6:"module";s:6:"system";s:6:"method";s:31:"get_unconfirmed_connections_num";s:6:"params";a:1:{i:0;s:20:"sys_profiles_friends";}s:5:"class";s:23:"TemplServiceConnections";}', '', 2147483646, 1, 0, IFNULL(@iNotifMenuOrder, 0) + 1);

-- MENU: profile stats

SET @iNotifMenuOrder = (SELECT `order` FROM `sys_menu_items` WHERE `set_name` = 'sys_account_notifications' AND `active` = 1 ORDER BY `order` DESC LIMIT 1);
INSERT INTO `sys_menu_items` (`set_name`, `module`, `name`, `title_system`, `title`, `link`, `onclick`, `target`, `icon`, `addon`, `submenu_object`, `visible_for_levels`, `active`, `copyable`, `order`) VALUES
('sys_profile_stats', 'bx_persons', 'profile-stats-friend-requests', '_bx_persons_menu_item_title_system_friend_requests', '_bx_persons_menu_item_title_friend_requests', 'page.php?i=persons-profile-friends&profile_id={member_id}', '', '', 'group col-blue3', 'a:4:{s:6:"module";s:6:"system";s:6:"method";s:31:"get_unconfirmed_connections_num";s:6:"params";a:1:{i:0;s:20:"sys_profiles_friends";}s:5:"class";s:23:"TemplServiceConnections";}', '', 2147483646, 1, 0, IFNULL(@iNotifMenuOrder, 0) + 1);


-- ACL

INSERT INTO `sys_acl_actions` (`Module`, `Name`, `AdditionalParamName`, `Title`, `Desc`, `Countable`, `DisabledForLevels`) VALUES
('bx_persons', 'create entry', NULL, '_bx_persons_acl_action_create_profile', '', 1, 1);
SET @iIdActionProfileCreate = LAST_INSERT_ID();

INSERT INTO `sys_acl_actions` (`Module`, `Name`, `AdditionalParamName`, `Title`, `Desc`, `Countable`, `DisabledForLevels`) VALUES
('bx_persons', 'delete entry', NULL, '_bx_persons_acl_action_delete_profile', '', 1, 1);
SET @iIdActionProfileDelete = LAST_INSERT_ID();

INSERT INTO `sys_acl_actions` (`Module`, `Name`, `AdditionalParamName`, `Title`, `Desc`, `Countable`, `DisabledForLevels`) VALUES
('bx_persons', 'view entry', NULL, '_bx_persons_acl_action_view_profile', '', 1, 0);
SET @iIdActionProfileView = LAST_INSERT_ID();

INSERT INTO `sys_acl_actions` (`Module`, `Name`, `AdditionalParamName`, `Title`, `Desc`, `Countable`, `DisabledForLevels`) VALUES
('bx_persons', 'edit any entry', NULL, '_bx_persons_acl_action_edit_any_profile', '', 1, 3);
SET @iIdActionProfileEditAny = LAST_INSERT_ID();


SET @iUnauthenticated = 1;
SET @iAccount = 2;
SET @iStandard = 3;
SET @iUnconfirmed = 4;
SET @iPending = 5;
SET @iSuspended = 6;
SET @iModerator = 7;
SET @iAdministrator = 8;
SET @iPremium = 9;


INSERT INTO `sys_acl_matrix` (`IDLevel`, `IDAction`) VALUES

-- profile create
(@iAccount, @iIdActionProfileCreate),
(@iStandard, @iIdActionProfileCreate),
(@iUnconfirmed, @iIdActionProfileCreate),
(@iPending, @iIdActionProfileCreate),
(@iModerator, @iIdActionProfileCreate),
(@iAdministrator, @iIdActionProfileCreate),
(@iPremium, @iIdActionProfileCreate),

-- profile delete
(@iAccount, @iIdActionProfileDelete),
(@iStandard, @iIdActionProfileDelete),
(@iUnconfirmed, @iIdActionProfileDelete),
(@iPending, @iIdActionProfileDelete),
(@iModerator, @iIdActionProfileDelete),
(@iAdministrator, @iIdActionProfileDelete),
(@iPremium, @iIdActionProfileDelete),

-- profile view
(@iUnauthenticated, @iIdActionProfileView),
(@iAccount, @iIdActionProfileView),
(@iStandard, @iIdActionProfileView),
(@iUnconfirmed, @iIdActionProfileView),
(@iPending, @iIdActionProfileView),
(@iModerator, @iIdActionProfileView),
(@iAdministrator, @iIdActionProfileView),
(@iPremium, @iIdActionProfileView),

-- any profile edit
(@iModerator, @iIdActionProfileEditAny),
(@iAdministrator, @iIdActionProfileEditAny);


-- VIEWS
INSERT INTO `sys_objects_view` (`name`, `table_track`, `period`, `is_on`, `trigger_table`, `trigger_field_id`, `trigger_field_count`, `class_name`, `class_file`) VALUES 
('bx_persons', 'bx_persons_views_track', '86400', '1', 'bx_persons_data', 'id', 'views', '', '');

-- SEARCH
INSERT INTO `sys_objects_search` (`ObjectName`, `Title`, `ClassName`, `ClassPath`) VALUES
('bx_persons', '_bx_persons', 'BxPersonsSearchResult', 'modules/boonex/persons/classes/BxPersonsSearchResult.php');
