CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `beds_info` AS
    SELECT 
        COUNT(`be`.`bed_id`) AS `beds`,
        `ro`.`room_type` AS `room_type`,
        `be`.`status` AS `status`,
        `ro`.`room_id` AS `room_id`
    FROM
        (`beds` `be`
        LEFT JOIN `rooms` `ro` ON ((`ro`.`room_id` = `be`.`room_id`)))
    GROUP BY `ro`.`room_type`, `be`.`status`, `ro`.`room_id`;
