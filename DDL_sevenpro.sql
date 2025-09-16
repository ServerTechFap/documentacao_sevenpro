
-- DROPA O BANCO CASO ELE EXISTA E CRIA UM NOVO
DROP DATABASE IF EXISTS sevenpro;
CREATE DATABASE sevenpro;

-- SELECIONA O BANCO sevenpro PARA EXECUTAR AS QUERYS ABAIXO
USE sevenpro;

-- CRIACAO DA TABELA alembic_version
DROP TABLE IF EXISTS `alembic_version`;

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 00
DROP TABLE IF EXISTS `tb00_system`;

CREATE TABLE `tb00_system` (
  `co_system` int NOT NULL AUTO_INCREMENT,
  `no_system` varchar(50) DEFAULT NULL,
  `nu_version` varchar(10) DEFAULT NULL,
  `no_descricao` varchar(200) DEFAULT NULL,
  `co_create` int DEFAULT NULL,
  `dt_create` datetime DEFAULT NULL,
  `co_update` int DEFAULT NULL,
  `dt_update` datetime DEFAULT NULL,
  PRIMARY KEY (`co_system`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 01
DROP TABLE IF EXISTS `tb01_tipo_perfil`;

CREATE TABLE `tb01_tipo_perfil` (
  `co_perfil` int NOT NULL AUTO_INCREMENT,
  `no_perfil` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`co_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 02
DROP TABLE IF EXISTS `tb02_user`;

CREATE TABLE `tb02_user` (
  `co_user` int NOT NULL AUTO_INCREMENT,
  `no_user` varchar(100) DEFAULT NULL,
  `no_email` varchar(50) DEFAULT NULL,
  `co_perfil` int DEFAULT NULL,
  `no_password` varchar(150) DEFAULT NULL,
  `no_telefone` varchar(20) DEFAULT NULL,
  `is_activated` int DEFAULT NULL,
  `ic_interno` int DEFAULT NULL,
  `is_blocked` int DEFAULT NULL,
  `co_validate` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `co_credencial` varchar(400) DEFAULT NULL,
  `co_create` int DEFAULT NULL,
  `dt_create` datetime DEFAULT NULL,
  `co_update` int DEFAULT NULL,
  `dt_update` datetime DEFAULT NULL,
  `ic_ativo` int DEFAULT NULL,
  `ic_hackathon` int DEFAULT NULL,
  PRIMARY KEY (`co_user`),
  UNIQUE KEY `no_email` (`no_email`),
  KEY `FK_TB02_TB01` (`co_perfil`),
  CONSTRAINT `tb02_user_ibfk_1` FOREIGN KEY (`co_perfil`) REFERENCES `tb01_tipo_perfil` (`co_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 03
DROP TABLE IF EXISTS `tb03_tipo_inscricao`;

CREATE TABLE `tb03_tipo_inscricao` (
  `co_tipo_inscricao` int NOT NULL AUTO_INCREMENT,
  `no_tipo_inscricao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`co_tipo_inscricao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 04
DROP TABLE IF EXISTS `tb04_tipo_pagamento`;

CREATE TABLE `tb04_tipo_pagamento` (
  `co_tipo_pagamento` int NOT NULL AUTO_INCREMENT,
  `no_tipo_pagamento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`co_tipo_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 05
DROP TABLE IF EXISTS `tb05_evento`;

CREATE TABLE `tb05_evento` (
  `co_evento` int NOT NULL AUTO_INCREMENT,
  `no_evento` varchar(100) DEFAULT NULL,
  `dt_inicio_evento` datetime DEFAULT NULL,
  `dt_inicio_inscricao` datetime DEFAULT NULL,
  `dt_fim_evento` datetime DEFAULT NULL,
  `dt_fim_inscricao` datetime DEFAULT NULL,
  `no_local_evento` varchar(100) DEFAULT NULL,
  `no_latitude` varchar(15) DEFAULT NULL,
  `no_longitude` varchar(15) DEFAULT NULL,
  `ic_gratuito` char NOT NULL,
  `no_imagem` varchar(100) NOT NULL,
  PRIMARY KEY (`co_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 06
DROP TABLE IF EXISTS `tb06_inscricao`;

CREATE TABLE `tb06_inscricao` (
  `co_inscricao` int NOT NULL AUTO_INCREMENT,
  `co_user` int DEFAULT NULL,
  `co_tipo_inscricao` int DEFAULT NULL,
  `dt_inscricao` datetime DEFAULT NULL,
  `ic_conf_pagamento` int DEFAULT NULL,
  `dt_conf_pagamento` datetime DEFAULT NULL,
  `co_desconto` varchar(15) DEFAULT NULL,
  `co_tipo_pagamento` int DEFAULT NULL,
  `co_evento` int DEFAULT NULL,
  PRIMARY KEY (`co_inscricao`),
  KEY `FK_TB06_TB02` (`co_user`),
  KEY `FK_TB06_TB03` (`co_tipo_inscricao`),
  KEY `FK_TB06_TB04` (`co_tipo_pagamento`),
  KEY `FK_TB06_TB05` (`co_evento`),
  CONSTRAINT `tb06_inscricao_ibfk_1` FOREIGN KEY (`co_user`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb06_inscricao_ibfk_2` FOREIGN KEY (`co_tipo_inscricao`) REFERENCES `tb03_tipo_inscricao` (`co_tipo_inscricao`),
  CONSTRAINT `tb06_inscricao_ibfk_3` FOREIGN KEY (`co_tipo_pagamento`) REFERENCES `tb04_tipo_pagamento` (`co_tipo_pagamento`),
  CONSTRAINT `tb06_inscricao_ibfk_4` FOREIGN KEY (`co_evento`) REFERENCES `tb05_evento` (`co_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 07
DROP TABLE IF EXISTS `tb07_local`;

CREATE TABLE `tb07_local` (
  `co_local` int NOT NULL AUTO_INCREMENT,
  `qt_max_lugar` int DEFAULT NULL,
  `no_local` varchar(50) DEFAULT NULL,
  `de_local` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`co_local`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 09
DROP TABLE IF EXISTS `tb09_hora_apresentacao`;

CREATE TABLE `tb09_hora_apresentacao` (
  `co_hora_apresentacao` int NOT NULL AUTO_INCREMENT,
  `co_apresentacao` int DEFAULT NULL,
  `co_local` int DEFAULT NULL,
  `dt_inicio` datetime DEFAULT NULL,
  `mm_duracao` int DEFAULT NULL,
  PRIMARY KEY (`co_hora_apresentacao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 26
DROP TABLE IF EXISTS `tb26_tipo_apresentacao`;

CREATE TABLE `tb26_tipo_apresentacao` (
  `co_tipo_apresentacao` int NOT NULL AUTO_INCREMENT,
  `no_tipo_apresentacao` varchar(100) DEFAULT NULL,
  `no_imagem` varchar(100) NOT NULL,
  PRIMARY KEY (`co_tipo_apresentacao`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 08
DROP TABLE IF EXISTS `tb08_apresentacao`;

CREATE TABLE `tb08_apresentacao` (
  `co_apresentacao` int NOT NULL AUTO_INCREMENT,
  `no_apresentacao` varchar(100) DEFAULT NULL,
  `co_apresentador` int DEFAULT NULL,
  `co_local` int DEFAULT NULL,
  `co_hora_apresentacao` int DEFAULT NULL,
  `co_tipo_apresentacao` int DEFAULT NULL,
  `co_cadastro` int DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  `dt_apresentacao` datetime DEFAULT NULL,
  `co_mediador` int DEFAULT NULL,
  `no_imagem` varchar(100) NOT NULL,
  `co_evento` int NOT NULL,
  PRIMARY KEY (`co_apresentacao`),
  KEY `FK_TB08_TB07` (`co_local`),
  KEY `FK_TB08_TB02` (`co_apresentador`),
  KEY `FK_TB08_TB002` (`co_mediador`),
  KEY `FK_TB08_TB0002` (`co_cadastro`),
  KEY `FK_TB08_TB09` (`co_hora_apresentacao`),
  KEY `FK_TB08_TB26` (`co_tipo_apresentacao`),
  CONSTRAINT `tb08_apresentacao_ibfk_1` FOREIGN KEY (`co_local`) REFERENCES `tb07_local` (`co_local`),
  CONSTRAINT `tb08_apresentacao_ibfk_2` FOREIGN KEY (`co_apresentador`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb08_apresentacao_ibfk_3` FOREIGN KEY (`co_mediador`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb08_apresentacao_ibfk_4` FOREIGN KEY (`co_cadastro`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb08_apresentacao_ibfk_5` FOREIGN KEY (`co_hora_apresentacao`) REFERENCES `tb09_hora_apresentacao` (`co_hora_apresentacao`),
  CONSTRAINT `tb08_apresentacao_ibfk_6` FOREIGN KEY (`co_tipo_apresentacao`) REFERENCES `tb26_tipo_apresentacao` (`co_tipo_apresentacao`),
  CONSTRAINT `tb08_apresentacao_ibfk_7` FOREIGN KEY(`co_evento`) REFERENCES `tb05_evento`(`co_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 10
DROP TABLE IF EXISTS `tb10_inscricao_apresentacao`;

CREATE TABLE `tb10_inscricao_apresentacao` (
  `co_inscricao_apresentacao` int NOT NULL AUTO_INCREMENT,
  `co_user` int DEFAULT NULL,
  `ic_apresentacao` int DEFAULT NULL,
  `ic_pago` int DEFAULT NULL,
  `ic_pago_configmado` int DEFAULT NULL,
  `co_apresentacao` int DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  `co_cadastro` int DEFAULT NULL,
  `ic_ativo` int DEFAULT NULL,
  PRIMARY KEY (`co_inscricao_apresentacao`),
  KEY `FK_TB10_TB02` (`co_user`),
  KEY `FK_TB10_TB08` (`co_apresentacao`),
  KEY `FK_TB10_TB002` (`co_cadastro`),
  CONSTRAINT `tb10_inscricao_apresentacao_ibfk_1` FOREIGN KEY (`co_user`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb10_inscricao_apresentacao_ibfk_2` FOREIGN KEY (`co_apresentacao`) REFERENCES `tb08_apresentacao` (`co_apresentacao`),
  CONSTRAINT `tb10_inscricao_apresentacao_ibfk_3` FOREIGN KEY (`co_cadastro`) REFERENCES `tb02_user` (`co_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4037 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 11
DROP TABLE IF EXISTS `tb11_tipo_log`;

CREATE TABLE `tb11_tipo_log` (
  `co_tipo_log` int NOT NULL AUTO_INCREMENT,
  `no_tipo_log` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`co_tipo_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 12
DROP TABLE IF EXISTS `tb12_log`;

CREATE TABLE `tb12_log` (
  `co_log` int NOT NULL AUTO_INCREMENT,
  `co_tipo_log` int DEFAULT NULL,
  `dt_log` datetime DEFAULT NULL,
  `co_user` int DEFAULT NULL,
  `de_log` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`co_log`),
  KEY `FK_TB12_TB02` (`co_user`),
  KEY `FK_TB12_TB11` (`co_tipo_log`),
  CONSTRAINT `tb12_log_ibfk_1` FOREIGN KEY (`co_user`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb12_log_ibfk_2` FOREIGN KEY (`co_tipo_log`) REFERENCES `tb11_tipo_log` (`co_tipo_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 27
DROP TABLE IF EXISTS `tb27_tipo_arquivo`;

CREATE TABLE `tb27_tipo_arquivo` (
  `co_tipo_arquivo` int NOT NULL AUTO_INCREMENT,
  `no_tipo_arquivo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`co_tipo_arquivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 13
DROP TABLE IF EXISTS `tb13_arquivo`;

CREATE TABLE `tb13_arquivo` (
  `co_arquivo` int NOT NULL AUTO_INCREMENT,
  `no_arquivo` varchar(50) DEFAULT NULL,
  `co_user` int DEFAULT NULL,
  `co_tipo_arquivo` int DEFAULT NULL,
  `co_create` int DEFAULT NULL,
  `dt_create` datetime DEFAULT NULL,
  PRIMARY KEY (`co_arquivo`),
  KEY `FK_TB13_TB02` (`co_user`),
  KEY `FK_TB13_TB002` (`co_create`),
  KEY `FK_TB13_TB27` (`co_tipo_arquivo`),
  CONSTRAINT `tb13_arquivo_ibfk_1` FOREIGN KEY (`co_user`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb13_arquivo_ibfk_2` FOREIGN KEY (`co_create`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb13_arquivo_ibfk_3` FOREIGN KEY (`co_tipo_arquivo`) REFERENCES `tb27_tipo_arquivo` (`co_tipo_arquivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 14
DROP TABLE IF EXISTS `tb14_checkin_apresentacao`;

CREATE TABLE `tb14_checkin_apresentacao` (
  `co_checkin` int NOT NULL AUTO_INCREMENT,
  `co_apresentacao` int DEFAULT NULL,
  `co_user` int DEFAULT NULL,
  `co_hora` int DEFAULT NULL,
  `co_staff` int DEFAULT NULL,
  `dt_create` datetime DEFAULT NULL,
  `ic_sincronismo` int DEFAULT NULL,
  `co_inscricao_apresentacao` int DEFAULT NULL,
  PRIMARY KEY (`co_checkin`),
  UNIQUE KEY `tb14_checkin_apresentacao_unique` (`co_apresentacao`,`co_user`),
  KEY `FK_TB14_TB10` (`co_inscricao_apresentacao`),
  KEY `FK_TB14_TB02` (`co_user`),
  KEY `FK_TB14_TB002` (`co_staff`),
  KEY `FK_TB14_TB09` (`co_hora`),
  CONSTRAINT `tb14_checkin_apresentacao_ibfk_1` FOREIGN KEY (`co_inscricao_apresentacao`) REFERENCES `tb10_inscricao_apresentacao` (`co_inscricao_apresentacao`),
  CONSTRAINT `tb14_checkin_apresentacao_ibfk_2` FOREIGN KEY (`co_user`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb14_checkin_apresentacao_ibfk_3` FOREIGN KEY (`co_staff`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb14_checkin_apresentacao_ibfk_4` FOREIGN KEY (`co_apresentacao`) REFERENCES `tb08_apresentacao` (`co_apresentacao`),
  CONSTRAINT `tb14_checkin_apresentacao_ibfk_5` FOREIGN KEY (`co_hora`) REFERENCES `tb09_hora_apresentacao` (`co_hora_apresentacao`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 16
DROP TABLE IF EXISTS `tb16_tipo_segmento`;

CREATE TABLE `tb16_tipo_segmento` (
  `co_tipo` int NOT NULL AUTO_INCREMENT,
  `no_tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`co_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 15
DROP TABLE IF EXISTS `tb15_empresa`;

CREATE TABLE `tb15_empresa` (
  `co_empresa` int NOT NULL AUTO_INCREMENT,
  `no_empresa` varchar(100) DEFAULT NULL,
  `no_cnpj` varchar(20) DEFAULT NULL,
  `co_endereco` int DEFAULT NULL,
  `no_telefone` varchar(20) DEFAULT NULL,
  `no_site` varchar(100) DEFAULT NULL,
  `co_segmento` int DEFAULT NULL,
  PRIMARY KEY (`co_empresa`),
  KEY `FK_TB15_TB16` (`co_segmento`),
  CONSTRAINT `tb15_empresa_ibfk_1` FOREIGN KEY (`co_segmento`) REFERENCES `tb16_tipo_segmento` (`co_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 19
DROP TABLE IF EXISTS `tb19_hackathon`;

CREATE TABLE `tb19_hackathon` (
  `co_hackathon` int NOT NULL AUTO_INCREMENT,
  `no_hackathon` varchar(100) DEFAULT NULL,
  `co_evento` int DEFAULT NULL,
  `nu_edicao` int DEFAULT NULL,
  `co_arquivo` int DEFAULT NULL,
  `dt_inicio` datetime DEFAULT NULL,
  `dt_fim` datetime DEFAULT NULL,
  `dt_create` datetime DEFAULT NULL,
  `co_create` int DEFAULT NULL,
  PRIMARY KEY (`co_hackathon`),
  KEY `FK_TB19_TB02` (`co_create`),
  KEY `FK_TB19_TB05` (`co_evento`),
  KEY `FK_TB19_TB13` (`co_arquivo`),
  CONSTRAINT `tb19_hackathon_ibfk_1` FOREIGN KEY (`co_create`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb19_hackathon_ibfk_2` FOREIGN KEY (`co_evento`) REFERENCES `tb05_evento` (`co_evento`),
  CONSTRAINT `tb19_hackathon_ibfk_3` FOREIGN KEY (`co_arquivo`) REFERENCES `tb13_arquivo` (`co_arquivo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 17
DROP TABLE IF EXISTS `tb17_equipe`;

CREATE TABLE `tb17_equipe` (
  `co_equipe` int NOT NULL AUTO_INCREMENT,
  `co_evento` int DEFAULT NULL,
  `co_hackathon` int DEFAULT NULL,
  `qt_max_users` int DEFAULT NULL,
  `no_equipe` varchar(100) DEFAULT NULL,
  `co_lider` int DEFAULT NULL,
  `nu_posicao` int DEFAULT NULL,
  `co_cadastro` int DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`co_equipe`),
  KEY `FK_TB17_TB05` (`co_evento`),
  KEY `FK_TB17_TB19` (`co_hackathon`),
  KEY `FK_TB17_TB02` (`co_lider`),
  KEY `FK_TB17_TB002` (`co_cadastro`),
  CONSTRAINT `tb17_equipe_ibfk_1` FOREIGN KEY (`co_evento`) REFERENCES `tb05_evento` (`co_evento`),
  CONSTRAINT `tb17_equipe_ibfk_2` FOREIGN KEY (`co_hackathon`) REFERENCES `tb19_hackathon` (`co_hackathon`),
  CONSTRAINT `tb17_equipe_ibfk_3` FOREIGN KEY (`co_lider`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb17_equipe_ibfk_4` FOREIGN KEY (`co_cadastro`) REFERENCES `tb02_user` (`co_user`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 18
DROP TABLE IF EXISTS `tb18_user_equipe`;

CREATE TABLE `tb18_user_equipe` (
  `co_user_equipe` int NOT NULL AUTO_INCREMENT,
  `co_equipe` int DEFAULT NULL,
  `co_user` int DEFAULT NULL,
  `co_cadastro` int DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`co_user_equipe`),
  KEY `FK_TB18_TB02` (`co_user`),
  KEY `FK_TB18_TB002` (`co_cadastro`),
  KEY `FK_TB18_TB17` (`co_equipe`),
  CONSTRAINT `tb18_user_equipe_ibfk_1` FOREIGN KEY (`co_user`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb18_user_equipe_ibfk_2` FOREIGN KEY (`co_cadastro`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb18_user_equipe_ibfk_3` FOREIGN KEY (`co_equipe`) REFERENCES `tb17_equipe` (`co_equipe`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 20
DROP TABLE IF EXISTS `tb20_agenda_hackathon`;

CREATE TABLE `tb20_agenda_hackathon` (
  `co_agenda_hackathon` int NOT NULL AUTO_INCREMENT,
  `no_agenda_hackathon` varchar(100) DEFAULT NULL,
  `co_hackathon` int DEFAULT NULL,
  `co_local` int DEFAULT NULL,
  `dt_inicio` datetime DEFAULT NULL,
  `mm_duracao` time DEFAULT NULL,
  `co_create` int DEFAULT NULL,
  `dt_create` datetime DEFAULT NULL,
  `co_arquivo` int DEFAULT NULL,
  PRIMARY KEY (`co_agenda_hackathon`),
  KEY `FK_TB20_TB02` (`co_create`),
  KEY `FK_TB20_TB13` (`co_arquivo`),
  KEY `FK_TB20_TB07` (`co_local`),
  KEY `FK_TB20_TB19` (`co_hackathon`),
  CONSTRAINT `tb20_agenda_hackathon_ibfk_1` FOREIGN KEY (`co_create`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb20_agenda_hackathon_ibfk_2` FOREIGN KEY (`co_arquivo`) REFERENCES `tb13_arquivo` (`co_arquivo`),
  CONSTRAINT `tb20_agenda_hackathon_ibfk_3` FOREIGN KEY (`co_local`) REFERENCES `tb07_local` (`co_local`),
  CONSTRAINT `tb20_agenda_hackathon_ibfk_4` FOREIGN KEY (`co_hackathon`) REFERENCES `tb19_hackathon` (`co_hackathon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 21
DROP TABLE IF EXISTS `tb21_mail`;

CREATE TABLE `tb21_mail` (
  `co_mail` int NOT NULL AUTO_INCREMENT,
  `co_user` int DEFAULT NULL,
  `no_email` varchar(100) DEFAULT NULL,
  `no_assunto` varchar(200) DEFAULT NULL,
  `no_conteudo` varchar(4000) DEFAULT NULL,
  `ic_enviado` int DEFAULT NULL,
  `dt_create` datetime DEFAULT NULL,
  `dt_envio` datetime DEFAULT NULL,
  PRIMARY KEY (`co_mail`),
  KEY `FK_TB21_TB02` (`co_user`),
  CONSTRAINT `tb21_mail_ibfk_1` FOREIGN KEY (`co_user`) REFERENCES `tb02_user` (`co_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 23
DROP TABLE IF EXISTS `tb23_tipo_curso`;

CREATE TABLE `tb23_tipo_curso` (
  `co_tipo_curso` int NOT NULL AUTO_INCREMENT,
  `no_curso` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`co_tipo_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 22
DROP TABLE IF EXISTS `tb22_aluno_curso`;

CREATE TABLE `tb22_aluno_curso` (
  `co_aluno_curso` int NOT NULL AUTO_INCREMENT,
  `co_user` int DEFAULT NULL,
  `co_tipo_curso` int DEFAULT NULL,
  PRIMARY KEY (`co_aluno_curso`),
  KEY `FK_TB22_TB02` (`co_user`),
  KEY `FK_TB22_TB23` (`co_tipo_curso`),
  CONSTRAINT `tb22_aluno_curso_ibfk_1` FOREIGN KEY (`co_user`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb22_aluno_curso_ibfk_2` FOREIGN KEY (`co_tipo_curso`) REFERENCES `tb23_tipo_curso` (`co_tipo_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 24
DROP TABLE IF EXISTS `tb24_desafio`;

CREATE TABLE `tb24_desafio` (
  `co_desafio` int NOT NULL AUTO_INCREMENT,
  `co_hackathon` int DEFAULT NULL,
  `qt_max_equipes` int DEFAULT NULL,
  `no_desafio` varchar(100) DEFAULT NULL,
  `de_desafio` varchar(500) DEFAULT NULL,
  `dt_create` datetime DEFAULT NULL,
  PRIMARY KEY (`co_desafio`),
  KEY `FK_TB24_TB19` (`co_hackathon`),
  CONSTRAINT `tb24_desafio_ibfk_1` FOREIGN KEY (`co_hackathon`) REFERENCES `tb19_hackathon` (`co_hackathon`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 25
DROP TABLE IF EXISTS `tb25_equipe_desafio`;

CREATE TABLE `tb25_equipe_desafio` (
  `co_equipe_desafio` int NOT NULL AUTO_INCREMENT,
  `co_desafio` int DEFAULT NULL,
  `co_equipe` int DEFAULT NULL,
  `co_create` int DEFAULT NULL,
  `dt_create` datetime DEFAULT NULL,
  PRIMARY KEY (`co_equipe_desafio`),
  KEY `FK_TB25_TB02` (`co_create`),
  KEY `FK_TB25_TB17` (`co_equipe`),
  KEY `FK_TB25_TB24` (`co_desafio`),
  CONSTRAINT `tb25_equipe_desafio_ibfk_1` FOREIGN KEY (`co_create`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb25_equipe_desafio_ibfk_2` FOREIGN KEY (`co_equipe`) REFERENCES `tb17_equipe` (`co_equipe`),
  CONSTRAINT `tb25_equipe_desafio_ibfk_3` FOREIGN KEY (`co_desafio`) REFERENCES `tb24_desafio` (`co_desafio`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 28
DROP TABLE IF EXISTS `tb28_staff_apresentacao`;

CREATE TABLE `tb28_staff_apresentacao` (
  `co_staff_apresentacao` int NOT NULL AUTO_INCREMENT,
  `co_apresentacao` int NOT NULL,
  `co_staff` int NOT NULL,
  `dt_create` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`co_staff_apresentacao`),
  KEY `FK_TB25_TB17` (`co_apresentacao`),
  KEY `FK_TB25_TB22_2` (`co_staff`),
  CONSTRAINT `tb28_staff_apresentacao_ibfk_1` FOREIGN KEY (`co_staff`) REFERENCES `tb02_user` (`co_user`),
  CONSTRAINT `tb28_staff_apresentacao_ibfk_2` FOREIGN KEY (`co_apresentacao`) REFERENCES `tb08_apresentacao` (`co_apresentacao`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 29
DROP TABLE IF EXISTS `tb29_delta_checkin`;

CREATE TABLE `tb29_delta_checkin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mm_antes_apresentacao` time DEFAULT NULL,
  `mm_depois_apresentacao` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- CRIACAO DA TABELA 30
CREATE TABLE `tb30_evento_linha_tematica` (
	`co_evento_linha_tematica` int auto_increment,
	`co_evento` int not null,
	`co_tipo_apresentacao` int not null,
	`co_cadastro` int not null,
	`dt_cadastro` date,
	CONSTRAINT `pk_tb26`  PRIMARY KEY (`co_evento_linha_tematica`),
	CONSTRAINT `uk_tb30` UNIQUE(`co_evento`, `co_tipo_apresentacao`),
	CONSTRAINT `fk_tb30_tb05` FOREIGN KEY  (`co_evento`) REFERENCES `tb05_evento`(`co_evento`),
	CONSTRAINT `fh_tb30_tb26` FOREIGN KEY  (`co_tipo_apresentacao`) REFERENCES `tb26_tipo_apresentacao`(`co_tipo_apresentacao`)
);