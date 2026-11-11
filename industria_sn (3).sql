-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 11/11/2026 às 14:01
-- Versão do servidor: 8.0.43-0ubuntu0.24.04.2
-- Versão do PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `industria_sn`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `componentes_maq`
--

CREATE TABLE `componentes_maq` (
  `id_componente` int NOT NULL,
  `id_maquina` int NOT NULL,
  `nome_componente` varchar(100) DEFAULT NULL,
  `horas_uso_acumulado` int NOT NULL,
  `limites_horas_alerta` int NOT NULL
) ;

--
-- Despejando dados para a tabela `componentes_maq`
--

INSERT INTO `componentes_maq` (`id_componente`, `id_maquina`, `nome_componente`, `horas_uso_acumulado`, `limites_horas_alerta`) VALUES
(1, 1, 'Sistema de Perfuracao', 280, 450),
(2, 2, 'Engrenagem Principal', 390, 550),
(3, 3, 'Valvula Pneumatica', 320, 350),
(4, 4, 'Correia Transportadora', 410, 650),
(5, 5, 'Rotor da Bomba', 310, 400);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque_pecas`
--

CREATE TABLE `estoque_pecas` (
  `id_pecas` int NOT NULL,
  `codigo_part_number` varchar(50) DEFAULT NULL,
  `descricao` varchar(150) NOT NULL,
  `qtd_estoque` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ;

--
-- Despejando dados para a tabela `estoque_pecas`
--

INSERT INTO `estoque_pecas` (`id_pecas`, `codigo_part_number`, `descricao`, `qtd_estoque`, `preco_unitario`) VALUES
(1, 'PN-FUR-101', 'Broca industrial de alta resistencia', 18, 95.00),
(2, 'PN-ENG-102', 'Engrenagem de transmissao metalica', 12, 380.00),
(3, 'PN-VAL-103', 'Valvula de controle pneumatica', 20, 175.00),
(4, 'PN-COR-104', 'Correia reforcada para esteira', 35, 145.00),
(5, 'PN-ROT-105', 'Rotor para bomba hidraulica', 8, 720.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_sensores`
--

CREATE TABLE `historico_sensores` (
  `id_leitura` int NOT NULL,
  `id_ordem` int NOT NULL,
  `temperatura_medida` decimal(5,2) NOT NULL,
  `vibracao_mm_s` decimal(5,2) NOT NULL,
  `data_hora_leitura` datetime NOT NULL,
  `prompt_geracao_ia` varchar(100) DEFAULT 'gerado_por_llm'
) ;

--
-- Despejando dados para a tabela `historico_sensores`
--

INSERT INTO `historico_sensores` (`id_leitura`, `id_ordem`, `temperatura_medida`, `vibracao_mm_s`, `data_hora_leitura`, `prompt_geracao_ia`) VALUES
(1, 1, 58.40, 1.75, '2026-10-15 07:50:00', 'analise_sistema_perfuracao'),
(2, 2, 92.30, 5.10, '2026-10-18 10:35:00', 'verificacao_engrenagem'),
(3, 3, 135.60, 7.25, '2026-10-21 14:05:00', 'identificacao_falha_pneumatica'),
(4, 4, 62.80, 2.15, '2026-10-25 08:20:00', 'monitoramento_esteira'),
(5, 5, 88.90, 4.75, '2026-10-28 15:45:00', 'diagnostico_bomba_hidraulica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `linhas_producao`
--

CREATE TABLE `linhas_producao` (
  `id_linha` int NOT NULL,
  `id_unidade` int NOT NULL,
  `nome_linha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `linhas_producao`
--

INSERT INTO `linhas_producao` (`id_linha`, `id_unidade`, `nome_linha`) VALUES
(1, 1, 'Linha de Fabricacao Alfa'),
(2, 2, 'Linha de Corte Industrial'),
(3, 3, 'Linha de Automacao Beta'),
(4, 4, 'Linha de Montagem Delta'),
(5, 5, 'Linha de Processamento Gama');

-- --------------------------------------------------------

--
-- Estrutura para tabela `maquinas_senai`
--

CREATE TABLE `maquinas_senai` (
  `id_maquina` int NOT NULL,
  `id_linha` int NOT NULL,
  `id_tipo` int NOT NULL,
  `tag_patrimonio` varchar(30) NOT NULL,
  `data_aquisicao` date NOT NULL,
  `status_operacao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `maquinas_senai`
--

INSERT INTO `maquinas_senai` (`id_maquina`, `id_linha`, `id_tipo`, `tag_patrimonio`, `data_aquisicao`, `status_operacao`) VALUES
(1, 1, 1, 'SENAI-EQP-101', '2021-05-12', 'operando'),
(2, 2, 2, 'SENAI-EQP-102', '2020-08-25', 'operando'),
(3, 3, 3, 'SENAI-EQP-103', '2023-07-14', 'manutencao'),
(4, 4, 4, 'SENAI-EQP-104', '2019-11-30', 'operando'),
(5, 5, 5, 'SENAI-EQP-105', '2024-06-09', 'parada');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ordens_servico`
--

CREATE TABLE `ordens_servico` (
  `id_ordem` int NOT NULL,
  `id_maquina` int NOT NULL,
  `id_tecnico` int NOT NULL,
  `data_abertura` datetime NOT NULL,
  `tipo_manutencao` varchar(20) NOT NULL,
  `status_os` varchar(20) NOT NULL
) ;

--
-- Despejando dados para a tabela `ordens_servico`
--

INSERT INTO `ordens_servico` (`id_ordem`, `id_maquina`, `id_tecnico`, `data_abertura`, `tipo_manutencao`, `status_os`) VALUES
(1, 1, 2, '2026-10-15 07:45:00', 'preventiva', 'concluida'),
(2, 2, 1, '2026-10-18 10:30:00', 'corretiva', 'em andamento'),
(3, 3, 3, '2026-10-21 14:00:00', 'preditiva', 'aberta'),
(4, 4, 5, '2026-10-25 08:15:00', 'preventiva', 'concluida'),
(5, 5, 4, '2026-10-28 15:40:00', 'corretiva', 'cancelada');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pecas_os`
--

CREATE TABLE `pecas_os` (
  `id_ordem` int NOT NULL,
  `id_pecas` int NOT NULL,
  `qtd_utilizada` int NOT NULL,
  `preco_aplicado` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `pecas_os`
--

INSERT INTO `pecas_os` (`id_ordem`, `id_pecas`, `qtd_utilizada`, `preco_aplicado`) VALUES
(1, 1, 2, 95.00),
(2, 2, 1, 380.00),
(3, 3, 2, 175.00),
(4, 4, 3, 145.00),
(5, 5, 1, 720.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tecnicos`
--

CREATE TABLE `tecnicos` (
  `id_tecnico` int NOT NULL,
  `nome_tecnico` varchar(100) NOT NULL,
  `especialidade` varchar(50) NOT NULL,
  `nivel_certificado` varchar(30) NOT NULL
) ;

--
-- Despejando dados para a tabela `tecnicos`
--

INSERT INTO `tecnicos` (`id_tecnico`, `nome_tecnico`, `especialidade`, `nivel_certificado`) VALUES
(1, 'Anderson Ribeiro', 'Mecanica de Precisao', 'PLENO'),
(2, 'Bruno Martins', 'Eletronica Industrial', 'SENIOR'),
(3, 'Felipe Almeida', 'Automacao e Robotica', 'SPECIALIST'),
(4, 'Diego Rodrigues', 'Sistemas Pneumaticos', 'JUNIOR'),
(5, 'Gabriel Souza', 'Manutencao Industrial', 'SENIOR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_maquina`
--

CREATE TABLE `tipo_maquina` (
  `id_tipo` int NOT NULL,
  `nome_tipo` varchar(50) DEFAULT NULL,
  `horas_revisao_padrao` int DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `tipo_maquina`
--

INSERT INTO `tipo_maquina` (`id_tipo`, `nome_tipo`, `horas_revisao_padrao`) VALUES
(1, 'Furadeira Industrial', 450),
(2, 'Torno Mecanico', 550),
(3, 'Prensa Pneumatica', 350),
(4, 'Esteira Transportadora', 650),
(5, 'Bomba Hidraulica', 400);

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidades_senai`
--

CREATE TABLE `unidades_senai` (
  `id_unidade` int NOT NULL,
  `nome_unidade` varchar(100) NOT NULL,
  `cidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `unidades_senai`
--

INSERT INTO `unidades_senai` (`id_unidade`, `nome_unidade`, `cidade`) VALUES
(1, 'SENAI Unidade Tecnologica', 'Ponta Grossa'),
(2, 'SENAI Unidade Metalmecanica', 'Cianorte'),
(3, 'SENAI Unidade Automacao', 'Campo Mourao'),
(4, 'SENAI Unidade Regional', 'Toledo'),
(5, 'SENAI Unidade Avancada', 'Paranavai');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `componentes_maq`
--
ALTER TABLE `componentes_maq`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `fk_id_componentes_id_maquinas_senai` (`id_maquina`);

--
-- Índices de tabela `estoque_pecas`
--
ALTER TABLE `estoque_pecas`
  ADD PRIMARY KEY (`id_pecas`),
  ADD UNIQUE KEY `codigo_part_number` (`codigo_part_number`);

--
-- Índices de tabela `historico_sensores`
--
ALTER TABLE `historico_sensores`
  ADD PRIMARY KEY (`id_leitura`),
  ADD KEY `fk_id_leitura_id_ordem` (`id_ordem`);

--
-- Índices de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD PRIMARY KEY (`id_linha`),
  ADD KEY `fk_id_linha_id_unidade` (`id_unidade`);

--
-- Índices de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD PRIMARY KEY (`id_maquina`),
  ADD UNIQUE KEY `tag_patrimonio` (`tag_patrimonio`),
  ADD KEY `fk_id_maquina_id_linha` (`id_linha`),
  ADD KEY `fk_id_maquina_id_tipo` (`id_tipo`);

--
-- Índices de tabela `ordens_servico`
--
ALTER TABLE `ordens_servico`
  ADD PRIMARY KEY (`id_ordem`),
  ADD KEY `fk_id_ordem_id_maquina` (`id_maquina`),
  ADD KEY `fk_id_ordem_id_tecnicos` (`id_tecnico`);

--
-- Índices de tabela `pecas_os`
--
ALTER TABLE `pecas_os`
  ADD PRIMARY KEY (`id_ordem`,`id_pecas`),
  ADD KEY `fk_id_pecas` (`id_pecas`);

--
-- Índices de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`id_tecnico`);

--
-- Índices de tabela `tipo_maquina`
--
ALTER TABLE `tipo_maquina`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Índices de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  ADD PRIMARY KEY (`id_unidade`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `componentes_maq`
--
ALTER TABLE `componentes_maq`
  MODIFY `id_componente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `estoque_pecas`
--
ALTER TABLE `estoque_pecas`
  MODIFY `id_pecas` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `historico_sensores`
--
ALTER TABLE `historico_sensores`
  MODIFY `id_leitura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `linhas_producao`
--
ALTER TABLE `linhas_producao`
  MODIFY `id_linha` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  MODIFY `id_maquina` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `ordens_servico`
--
ALTER TABLE `ordens_servico`
  MODIFY `id_ordem` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tecnicos`
--
ALTER TABLE `tecnicos`
  MODIFY `id_tecnico` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_maquina`
--
ALTER TABLE `tipo_maquina`
  MODIFY `id_tipo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `unidades_senai`
--
ALTER TABLE `unidades_senai`
  MODIFY `id_unidade` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `componentes_maq`
--
ALTER TABLE `componentes_maq`
  ADD CONSTRAINT `fk_id_componentes_id_maquinas_senai` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`);

--
-- Restrições para tabelas `historico_sensores`
--
ALTER TABLE `historico_sensores`
  ADD CONSTRAINT `fk_id_leitura_id_ordem` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_servico` (`id_ordem`);

--
-- Restrições para tabelas `linhas_producao`
--
ALTER TABLE `linhas_producao`
  ADD CONSTRAINT `fk_id_linha_id_unidade` FOREIGN KEY (`id_unidade`) REFERENCES `unidades_senai` (`id_unidade`);

--
-- Restrições para tabelas `maquinas_senai`
--
ALTER TABLE `maquinas_senai`
  ADD CONSTRAINT `fk_id_maquina_id_linha` FOREIGN KEY (`id_linha`) REFERENCES `linhas_producao` (`id_linha`),
  ADD CONSTRAINT `fk_id_maquina_id_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_maquina` (`id_tipo`);

--
-- Restrições para tabelas `ordens_servico`
--
ALTER TABLE `ordens_servico`
  ADD CONSTRAINT `fk_id_ordem_id_maquina` FOREIGN KEY (`id_maquina`) REFERENCES `maquinas_senai` (`id_maquina`),
  ADD CONSTRAINT `fk_id_ordem_id_tecnicos` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnicos` (`id_tecnico`);

--
-- Restrições para tabelas `pecas_os`
--
ALTER TABLE `pecas_os`
  ADD CONSTRAINT `fk_id_ordem` FOREIGN KEY (`id_ordem`) REFERENCES `ordens_servico` (`id_ordem`),
  ADD CONSTRAINT `fk_id_pecas` FOREIGN KEY (`id_pecas`) REFERENCES `estoque_pecas` (`id_pecas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
