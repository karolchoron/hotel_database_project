TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `hotel_bd`.`TriggerTypPokoju` BEFORE INSERT ON `pokoj` FOR EACH ROW\nBEGIN\n    IF TypPokoju.CenaP < 0 THEN\n        SIGNAL SQLSTATE \'45000\'\n        SET MESSAGE_TEXT = \'Cena_nie_moze_byc_mniejsza_niz_0\';\n    END IF;\n\n    IF TypPokoju.CenaP = 0 THEN\n        SIGNAL SQLSTATE \'45001\'\n        SET MESSAGE_TEXT = \'Cena_nie_moze_byc_rowna_0\';\n    END IF;\n\n    IF TypPokoju.LiczbaLozek <= 0 THEN\n        SIGNAL SQLSTATE \'45002\'\n        SET MESSAGE_TEXT = \'liczba_lozek_nie_moze_byc_mniejsza_niz_0\';\n    END IF;\n\n    IF TypPokoju.IluOsobowy <= 0 THEN\n        SIGNAL SQLSTATE \'45003\'\n        SET MESSAGE_TEXT = \'liczba_osob_nie_moze_byc_rowna_0\';\n    END IF;\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_general_ci'
db_cl_names='utf8mb4_general_ci'
created=161296702735
