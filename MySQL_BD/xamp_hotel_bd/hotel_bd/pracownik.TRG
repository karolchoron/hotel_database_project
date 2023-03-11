TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `hotel_bd`.`TriggerPracownikKodPocztowy` BEFORE INSERT ON `pracownik` FOR EACH ROW\nBEGIN\n    DECLARE poczta INT;\n    SET poczta = (char_length(Pracownik.KodPocztowy));\n        IF poczta < 6 THEN\n        SIGNAL SQLSTATE \'45000\'\n        SET MESSAGE_TEXT = \'za_krotki_KOD_POCZTOWY\';\n    END IF;\n        IF poczta > 6 THEN\n        SIGNAL SQLSTATE \'45000\'\n        SET MESSAGE_TEXT = \'za_dlugi_KOD_POCZTOWY\';\n    END IF;\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_general_ci'
db_cl_names='utf8mb4_general_ci'
created=161296671504
