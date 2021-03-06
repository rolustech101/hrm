DROP FUNCTION  `fn_autoincrementvalue` ;

CREATE DEFINER =  `root`@`localhost` FUNCTION  `fn_autoincrementvalue` (
`pTableName` VARCHAR( 50 )
) RETURNS INT( 11 ) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER BEGIN RETURN (
SELECT AUTO_INCREMENT FROM information_schema.`TABLES` 
WHERE TABLE_NAME = pTableName
LIMIT 1
);

END
