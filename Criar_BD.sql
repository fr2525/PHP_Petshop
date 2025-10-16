
CREATE DATABASE if not exists db_cadastro default character set utf8 default collate utf8_general_ci;

CREATE TABLE if not exists tb_clientes (
  id      int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cpf     int, 
  nome    varchar(50) NOT NULL,
  email   varchar(60) NOT NULL UNIQUE,
  celular varchar(15) NOT NULL
) default character set utf8 default collate utf8_general_ci;


CREATE TABLE if not exists tb_operadores (
  id      int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome    VARCHAR(50) NOT NULL,
  usuario VARCHAR(10) NOT NULL,
  celular VARCHAR(15),
  senha   VARCHAR(8) NOT NULL,
  nivel   tinyint NOT NULL, 	  
  salario decimal(12,2) ,
  comissao decimal(5,2)
 ) default character set utf8 default collate utf8_general_ci;


CREATE TABLE if not exists tb_lojas (
  id       int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome     VARCHAR(50) NOT NULL,
  endereco VARCHAR(100),
  CNPJ     VARCHAR(15)     
 ) default character set utf8 default collate utf8_general_ci;


--
-- Estrutura da tabela `filamento`
--

CREATE TABLE `filamento` (
  `id` int(11) NOT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `cor` varchar(100) DEFAULT NULL,
  `valor` decimal(10,0) NOT NULL,
  `qtde_estoque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `impressoras`
--

CREATE TABLE `impressoras` (
  `id` int(11) NOT NULL,
  `marca` varchar(250) DEFAULT NULL,
  `modelo` varchar(250) DEFAULT NULL,
  `qtrolos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_venda` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `descricao` varchar(250) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `preco` float NOT NULL,
  `quantidade` int(11) NOT NULL,
  `total_venda` float NOT NULL,
  `status` int(11) NOT NULL,
  `dataCompra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_impressoras`
--

CREATE TABLE `pedido_impressoras` (
  `id_pedido` int(11) NOT NULL,
  `id_impressora` int(11) NOT NULL,
  `tempoestimado` int(11) NOT NULL,
  `rolos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `descricao` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `status`
--

INSERT INTO `status` (`id_status`, `descricao`) VALUES
(1, 'Aberto'),
(2, 'Em process'),
(3, 'Finalizado'),
(4, 'Entregue');

-- --------------------------------------------------------

INSERT INTO `usuarios` (`id`, `nome`, `user`, `email`, `senha`, `dataCaptura`) VALUES
(6, 'Hugo Freitas', 'hugofreitas', 'hugovasconcelosf@hotmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2018-05-17'),
(7, 'admin', 'admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '2018-05-17');

--
-- Índices para tabelas despejadas
--
--
-- Índices para tabela `filamento`
--
ALTER TABLE `filamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `impressoras`
--
ALTER TABLE `impressoras`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_venda`);

--
-- Índices para tabela `pedido_impressoras`
--
ALTER TABLE `pedido_impressoras`
  ADD KEY `id_pedimpress` (`id_pedido`,`id_impressora`);

--
-- Índices para tabela `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabela `impressoras`
--
ALTER TABLE `impressoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
