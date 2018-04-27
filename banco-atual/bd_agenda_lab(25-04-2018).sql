-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 25-Abr-2018 às 23:41
-- Versão do servidor: 5.7.19-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bd_agenda_lab`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento`
--

CREATE TABLE IF NOT EXISTS `agendamento` (
`id_agendamento` int(11) NOT NULL,
  `observacoes` blob,
  `admin_relatorio` blob,
  `cursos` varchar(20) DEFAULT NULL,
  `FK_ID_USERS` int(11) DEFAULT NULL,
  `FK_ID_LABS` int(11) DEFAULT NULL,
  `FK_ID_HORARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `horario`
--

CREATE TABLE IF NOT EXISTS `horario` (
`id_horario` int(11) NOT NULL,
  `datas` date NOT NULL,
  `periodo` varchar(30) NOT NULL DEFAULT 'N/D'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `labs`
--

CREATE TABLE IF NOT EXISTS `labs` (
`id_labs` int(11) NOT NULL,
  `tipoLabs` varchar(30) NOT NULL,
  `sala` varchar(30) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `requisitos` varchar(50) DEFAULT 'N/D'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id_users` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT 'N/D',
  `senha` varchar(50) NOT NULL,
  `codGera` varchar(50) DEFAULT NULL,
  `TipoUsers` int(11) NOT NULL,
  `cpf` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id_users`, `nome`, `email`, `senha`, `codGera`, `TipoUsers`, `cpf`) VALUES
(1, 'admin', 'admin@pitagoras.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, 0, 123456789),
(2, 'professor', 'professor@pitagoras.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, 1, 123456789);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamento`
--
ALTER TABLE `agendamento`
 ADD PRIMARY KEY (`id_agendamento`), ADD KEY `FK_ID_USERS` (`FK_ID_USERS`), ADD KEY `FK_ID_LABS` (`FK_ID_LABS`), ADD KEY `FK_ID_HORARIO` (`FK_ID_HORARIO`);

--
-- Indexes for table `horario`
--
ALTER TABLE `horario`
 ADD PRIMARY KEY (`id_horario`);

--
-- Indexes for table `labs`
--
ALTER TABLE `labs`
 ADD PRIMARY KEY (`id_labs`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamento`
--
ALTER TABLE `agendamento`
MODIFY `id_agendamento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `horario`
--
ALTER TABLE `horario`
MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `labs`
--
ALTER TABLE `labs`
MODIFY `id_labs` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `agendamento`
--
ALTER TABLE `agendamento`
ADD CONSTRAINT `FK_ID_HORARIO` FOREIGN KEY (`FK_ID_HORARIO`) REFERENCES `horario` (`ID_HORARIO`),
ADD CONSTRAINT `FK_ID_LABS` FOREIGN KEY (`FK_ID_LABS`) REFERENCES `labs` (`ID_LABS`),
ADD CONSTRAINT `FK_ID_USERS` FOREIGN KEY (`FK_ID_USERS`) REFERENCES `users` (`ID_USERS`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
