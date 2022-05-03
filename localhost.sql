-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 03/05/2022 às 08:29
-- Versão do servidor: 5.7.37-0ubuntu0.18.04.1
-- Versão do PHP: 7.2.34-28+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `alunos`
--
CREATE DATABASE IF NOT EXISTS `alunos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `alunos`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Funcionario`
--

CREATE TABLE `Funcionario` (
  `cod` int(3) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `salario` float(9,2) DEFAULT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `coddepto` int(3) DEFAULT NULL,
  `comissao` float(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Funcionario`
--

INSERT INTO `Funcionario` (`cod`, `nome`, `salario`, `cargo`, `coddepto`, `comissao`) VALUES
(111, 'Joao', 1000.00, 'analista de sistemas', 111, 100.00),
(222, 'Ana', 2000.00, 'Vendedora', 222, 200.00),
(333, 'Luiz', 3000.00, 'Analista de sistemas', 111, 300.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Requisicao`
--

CREATE TABLE `Requisicao` (
  `codreq` int(3) NOT NULL,
  `codfunc` int(3) DEFAULT NULL,
  `datareq` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Requisicao`
--

INSERT INTO `Requisicao` (`codreq`, `codfunc`, `datareq`) VALUES
(1, 111, '2004-05-01'),
(2, 222, '2004-05-15'),
(3, 111, '2004-05-10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `disciplina` varchar(100) NOT NULL,
  `professor` varchar(100) NOT NULL,
  `materia` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `avaliacao`
--

INSERT INTO `avaliacao` (`id`, `disciplina`, `professor`, `materia`) VALUES
(3, 'Informatica', 'Lazaro', 'Web'),
(4, 'informatica', 'lazaro', 'web');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dept`
--

CREATE TABLE `dept` (
  `DCODIGO` text,
  `DNOME` text,
  `GERENTE` text,
  `DSUPER` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `dept`
--

INSERT INTO `dept` (`DCODIGO`, `DNOME`, `GERENTE`, `DSUPER`) VALUES
('A00', 'DIV. SERVIÇOS DE COMPUTADOR', '000010', 'A00'),
('B01', 'PLANEJAMENTO', '000020', 'A00'),
('C01', 'CENTRO DE INFORMAÇÕES', '000030', 'A00'),
('D01', 'CENTRO DE DESENVOLVIMENTO', 'NULL', 'A00'),
('E01', 'SERVIÇOS DE SUPORTE', '000050', 'A00'),
('D11', 'SISTEMAS MANUFATURA', '000060', 'D01'),
('D21', 'SISTEMA ADMINISTRAÇÃO', '000070', 'D01'),
('E11', 'OPERAÇÃO', '000090', 'E01'),
('E21', 'SUPORTE SOFTWARE', '000100', 'E01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `empr`
--

CREATE TABLE `empr` (
  `MATR` bigint(20) DEFAULT NULL,
  `NOME` text,
  `SOBRENOME` text,
  `DEPT` text,
  `FONE` int(11) DEFAULT NULL,
  `DINADIM` text,
  `CARGO` text,
  `NIVELED` int(11) DEFAULT NULL,
  `SEXO` text,
  `DATANAS` text,
  `SALARIO` int(11) DEFAULT NULL,
  `BONUS` double DEFAULT NULL,
  `COMIS` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `empr`
--

INSERT INTO `empr` (`MATR`, `NOME`, `SOBRENOME`, `DEPT`, `FONE`, `DINADIM`, `CARGO`, `NIVELED`, `SEXO`, `DATANAS`, `SALARIO`, `BONUS`, `COMIS`) VALUES
(10, 'CHRISTINE', 'HAAS', 'A00', 1020, '01/01/1965', 'GERENTE', 19, 'F', '14/08/1933', 52750, 1.055, 5.275),
(20, 'MICHAEL', 'THOMPSON', 'B01', 3094, '10/10/1973', 'GERENTE', 18, 'M', '02/02/1948', 41250, 825, 4.125),
(30, 'SALLY', 'KWAN', 'C01', 3300, '05/04/1975', 'GERENTE', 15, 'F', '11/05/1941', 38250, 765, 3.825),
(50, 'JOHN', 'GEYER', 'E01', 2122, '17/08/1949', 'GERENTE', 16, 'M', '15/09/2025', 40175, 803, 4.017),
(60, 'IRVING', 'STERN', 'D11', 6423, '14/09/1973', 'GERENTE', 14, 'M', '07/07/1945', 32250, 645, 3.225),
(70, 'EVA', 'PULASKI', 'D21', 7831, '30/09/1980', 'GERENTE', 14, 'F', '26/05/1953', 36170, 723, 3.617),
(90, 'EILEEN', 'HENDERSON', 'E11', 1212, '01/06/1973', 'GERENTE', 17, 'F', '14/01/1946', 40300, 806, 4.03),
(100, 'THEODORE', 'SPENSER', 'E21', 3497, '12/04/1989', 'GERENTE', 15, 'M', '25/11/1961', 39000, 780, 3.9),
(110, 'VINCENZO', 'LUCCHESI', 'A00', 8645, '16/05/1958', 'REPVENDA', 18, 'M', '05/11/2029', 46500, 930, 4.65),
(130, 'DOLORES', 'QUINTANA', 'C01', 8623, '10/10/1973', 'REPVENDA', 12, 'F', '25/05/1946', 23300, 466, 2.33),
(140, 'HEATHER', 'NICHOLLS', 'C01', 2299, '05/04/1975', 'ANALISTA', 14, 'M', '18/11/1947', 35040, 700, 3.504),
(150, 'BRUCE', 'ADAMSON', 'D11', 4510, '17/08/1949', 'ANALISTA', 15, 'M', '01/04/1922', 38780, 775, 3.878),
(160, 'ELIZABETH', 'PIANKA', 'D11', 3782, '02/04/1943', 'ATENDTE', 12, 'F', '15/11/1915', 22384, 447, 2.238),
(170, 'MASATOSHI', 'YOSHIMURA', 'D11', 2890, '03/04/1990', 'ATENDTE', 12, 'M', '16/11/1962', 29403, 588, 2.94),
(180, 'MARYLIN', 'SCOUTTEN', 'D11', 1682, '04/03/1976', 'PRJTISTA', 11, 'F', '17/10/1948', 19330, 386, 1.933),
(190, 'JAMES', 'WALKER', 'D11', 2986, '04/03/1979', 'ANALISTA', 15, 'M', '17/10/1951', 38990, 779, 3.899),
(200, 'DAVID', 'BROWN', 'D11', 4501, '03/12/1950', 'PRJTISTA', 17, 'M', '18/07/1923', 40505, 810, 4.05),
(210, 'WILLIAM', 'JONES', 'D11', 942, '11/04/1979', 'ATENDTE', 11, 'M', '23/02/1953', 18270, 365, 1.827),
(220, 'JENIFER', 'LUTZ', 'D11', 672, '10/12/1976', 'PRJTISTA', 11, 'F', '25/07/1949', 19405, 388, 1.94),
(230, 'JAMES', 'JEFFERSON', 'D21', 2094, '10/11/1987', 'PRJTISTA', 11, 'M', '24/06/1960', 19333, 386, 1.933),
(240, 'SALVATORE', 'MARINO', 'D21', 3780, '03/01/1990', 'ATENDTE', 12, 'M', '18/08/1962', 20930, 418, 2.093),
(250, 'DANIEL', 'SMITH', 'D21', 961, '30/10/1969', 'REPCAMPO', 11, 'M', '12/11/1939', 19180, 383, 1.918),
(260, 'SYBIL', 'JOHNSON', 'D21', 8953, '11/09/1975', 'REPCAMPO', 10, 'M', '05/10/1936', 17250, 345, 1.725),
(270, 'MARIA', 'PEREZ', 'D21', 9001, '09/08/1976', 'ATENDTE', 9, 'F', '24/03/1949', 13403, 268, 1.34),
(280, 'ETHEL', 'SCHNEIDER', 'E11', 8997, '14/03/1976', 'PRJTISTA', 13, 'F', '27/10/1948', 30400, 608, 3.04),
(290, 'JOHN', 'PARKER', 'E11', 4543, '30/05/1980', 'ATENDTE', 10, 'M', '09/07/1946', 15340, 306, 1.534),
(300, 'PHILIP', 'SMITH', 'E11', 3232, '19/06/1972', 'ATENDTE', 10, 'M', '27/10/1936', 17750, 355, 1.775),
(310, 'MAUDE', 'SETRIGHT', 'E11', 8932, '12/09/1964', 'REPCAMPO', 10, 'F', '21/04/1931', 15900, 318, 1.59),
(320, 'RAMLAL', 'MEHTA', 'E21', 9990, '07/07/1965', 'PRJTISTA', 11, 'M', '11/08/1932', 19950, 399, 1.995),
(330, 'WING', 'LEE', 'E21', 2103, '18/01/1975', 'REPCAMPO', 9, 'M', '02/09/1947', 10304, 206, 1.03),
(340, 'JASON', 'GOUNOT', 'E21', 5698, '18/04/1987', 'REPCAMPO', 17, 'M', '01/12/1959', 40330, 806, 4.033);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `Funcionario`
--
ALTER TABLE `Funcionario`
  ADD PRIMARY KEY (`cod`);

--
-- Índices de tabela `Requisicao`
--
ALTER TABLE `Requisicao`
  ADD PRIMARY KEY (`codreq`),
  ADD KEY `codfunc` (`codfunc`);

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `Requisicao`
--
ALTER TABLE `Requisicao`
  ADD CONSTRAINT `Requisicao_ibfk_1` FOREIGN KEY (`codfunc`) REFERENCES `Funcionario` (`cod`);
--
-- Banco de dados: `curso`
--
CREATE DATABASE IF NOT EXISTS `curso` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `curso`;
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Fazendo dump de dados para tabela `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('alunos', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Fazendo dump de dados para tabela `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('alunos', 'usuario', 'table', 'alunos', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Fazendo dump de dados para tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('alunos', '[{\"db\":\"alunos\",\"table\":\"avaliacao\"},{\"db\":\"alunos\",\"table\":\"usuario\"},{\"db\":\"alunos\",\"table\":\"agenda\"},{\"db\":\"curso\",\"table\":\"users\"},{\"db\":\"alunos\",\"table\":\"clientes\"}]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Fazendo dump de dados para tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('alunos', '2020-01-15 13:02:43', '{\"lang\":\"pt_BR\",\"collation_connection\":\"utf8mb4_unicode_ci\"}'),
('phpmyadmin', '2020-01-15 12:56:41', '{\"lang\":\"pt_BR\",\"collation_connection\":\"utf8mb4_unicode_ci\"}'),
('root', '2020-01-15 12:58:30', '{\"lang\":\"pt_BR\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices de tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices de tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices de tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices de tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices de tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices de tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices de tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices de tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices de tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
