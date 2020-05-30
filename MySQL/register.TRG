TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `user_after_insert` AFTER INSERT ON `register` FOR EACH ROW BEGIN\nINSERT into login VALUES(new.name, new.pass);\nEND'
sql_modes=1098907648
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_unicode_ci'
db_cl_names='utf8mb4_general_ci'
created=157462043080
