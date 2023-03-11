TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `hotel_bd`.`TriggerData` BEFORE INSERT ON `rezerwacja` FOR EACH ROW\nBEGIN\n\n	IF Rezerwacja.DataOD < now() THEN\n		SIGNAL SQLSTATE \'45000\'\n		SET MESSAGE_TEXT = \'DataOD_nie_moze_wczesniejsza_niz_dzisiaj\';\n	END IF;\n		\n	IF Rezerwacja.DataOD > Rezerwacja.DataDO THEN\n		SIGNAL SQLSTATE \'10001\'\n        SET MESSAGE_TEXT = \'DataDO_nie_moze_wczesniejsza_od_DataOD\';\n    END IF;\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_general_ci'
db_cl_names='utf8mb4_general_ci'
created=161296633309
