
CREATE DATABASE IF NOT EXISTS `bd3d` default character set utf8 default collate utf8_general_ci; 

USE `bd3d`;

CREATE TABLE IF NOT EXISTS `status` (
  `idstatus` int(11) NOT NULL DEFAULT 0,
  `nome_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idstatus`)
) ;



INSERT INTO `status` (`idstatus`, `nome_status`) VALUES
	(1, 'Pendente'),
	(2, 'Concluída'),
	(3, 'Cancelada');  


/*!40000 ALTER TABLE `status` ENABLE KEYS */;

-- Copiando estrutura para tabela petshop.funcionario
CREATE TABLE IF NOT EXISTS `funcionarios` (
  `idfuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `sobrenome` varchar(50) DEFAULT NULL,
  `cpf` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `data_registro` date DEFAULT NULL,
  PRIMARY KEY (`idfuncionario`)
) ;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idusuario`)
) ;

INSERT INTO `usuarios` (`usuario`, `senha`, `idusuario`) VALUES
	('admin', 'admin123', 1);

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT, 
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  PRIMARY KEY (`idcliente`)
  
);
 
--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`nome`,    `endereco`, `email`,             `telefone`, `cpf`) VALUES 
					   ('Paula F',  'Rua A'  , 'paula@hotmail.com', '555555', '33333'),
						('Hugo', 'Rua C', 'hugovasconcelosf', '988878', '8787878');
						
--
-- Estrutura da tabela `filamentos`
--
CREATE TABLE IF NOT EXISTS `filamentos` (
  `idfilamento` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `cor` varchar(100) DEFAULT NULL,
  `valor` decimal(10,0) NOT NULL,
  `qtde_estoque` int(11) NOT NULL,
  PRIMARY KEY(`idfilamento`)		
) ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE IF NOT EXISTS `fornecedores` (
  `idfornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  PRIMARY KEY(`idfornecedor`)
) ;


INSERT INTO `fornecedores` (`nome`, `endereco`, `email`, `telefone`, `cpf`) VALUES
( 'Pedro Freitas', 'Rua 5', 'pedro@hotmail.com', '55555', '555555'),
( 'Fabio Freitas', 'Rua D', 'fabio@hotmail.com', '3333333', '555555');

-- --------------------------------------------------------

--
-- Estrutura da tabela `impressoras`
--

CREATE TABLE IF NOT EXISTS `impressoras` (
  `idimpressora` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(250) DEFAULT NULL,
  `modelo` varchar(250) DEFAULT NULL,
  `qtrolos` int(11) NOT NULL,
  PRIMARY KEY(`idimpressora`)
  
) ;
-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `descricao` varchar(250) NOT NULL,
  `preco` float NOT NULL,
  `quantidade` int(11) NOT NULL,
  `total_venda` float NOT NULL,
  `status` int(11) NOT NULL,
  `dataCompra` date NOT NULL,
  PRIMARY KEY(`idpedido`)
) ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_impressora`
--

CREATE TABLE IF NOT EXISTS `pedido_impressora` (
  `idpedido` int(11) NOT NULL,
  `idimpressora` int(11) NOT NULL,
  `tempoestimado` int(11) NOT NULL,
  `rolos` int(11) NOT NULL
) ;
-- --------------------------------------------------------
--
--

ALTER TABLE `impressoras` ADD `nome` VARCHAR(250) NOT NULL AFTER `idimpressora`;