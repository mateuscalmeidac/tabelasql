# Script de Criação do Banco de Dados 'dbempresa'

Este repositório contém um script SQL (`Instruções Criação Modelos.sql`) que define o esquema inicial do banco de dados `dbempresa`. Este banco de dados é projetado para suportar um sistema de gerenciamento de ordens de serviço (ou um sistema similar de gerenciamento de informações de clientes e usuários).

## Descrição

O script SQL realiza as seguintes ações:

* **Cria o banco de dados `dbempresa`:** Se o banco de dados ainda não existir, o script o cria.
* **Define as tabelas:**
    * `tbusuarios`: Armazena informações sobre os usuários do sistema (administradores, técnicos, etc.).
    * `tbclientes`: Armazena informações sobre os clientes.
    * `tbos`: Armazena informações sobre as ordens de serviço, incluindo o cliente associado, equipamento, defeito, serviço realizado, etc.
* **Define as relações entre as tabelas:** A tabela `tbos` possui uma chave estrangeira (`idcli`) que referencia a tabela `tbclientes`, estabelecendo um relacionamento entre ordens de serviço e clientes.

## Tabelas

### `tbusuarios`

Esta tabela armazena informações sobre os usuários do sistema.

* **Campos:**
    * `iduser` (INT, PRIMARY KEY): Identificador único do usuário.
    * `usuario` (VARCHAR(50), NOT NULL): Nome do usuário.
    * `fone` (VARCHAR(15)): Telefone do usuário.
    * `login` (VARCHAR(15), NOT NULL, UNIQUE): Nome de login do usuário (deve ser único).
    * `senha` (VARCHAR(15), NOT NULL): Senha do usuário.
    * `perfil` (VARCHAR(20), NOT NULL): Perfil do usuário (ex: "administrador", "tecnico").

### `tbclientes`

Esta tabela armazena informações sobre os clientes.

* **Campos:**
    * `idcli` (INT, PRIMARY KEY, AUTO_INCREMENT): Identificador único do cliente (gerado automaticamente).
    * `endcli` (VARCHAR(100)): Endereço do cliente.
    * `fonecli` (VARCHAR(15), NOT NULL): Telefone do cliente.
    * `emailcli` (VARCHAR(50)): Email do cliente.

### `tbos`

Esta tabela armazena informações sobre as ordens de serviço.

* **Campos:**
    * `os` (INT, PRIMARY KEY, AUTO_INCREMENT): Número da ordem de serviço (gerado automaticamente).
    * `data_os` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Data e hora de criação da ordem de serviço (gerado automaticamente).
    * `equipamento` (VARCHAR(150), NOT NULL): Descrição do equipamento.
    * `defeito` (VARCHAR(150), NOT NULL): Descrição do defeito.
    * `servico` (VARCHAR(150)): Descrição do serviço realizado.
    * `tecnico` (VARCHAR(30)): Nome do técnico responsável.
    * `valor` (DECIMAL(10,2)): Valor do serviço.
    * `idcli` (INT, NOT NULL, FOREIGN KEY): Identificador do cliente associado à ordem de serviço (chave estrangeira referenciando `tbclientes`).

## Pré-requisitos

* Um sistema de gerenciamento de banco de dados (SGBD) MySQL instalado e configurado.
* Acesso ao SGBD com permissões para criar bancos de dados e tabelas.

## Como Usar

1.  **Salve o script:** Salve o conteúdo do arquivo `Instruções Criação Modelos.sql` em um arquivo com o mesmo nome (ou um nome de sua preferência) com a extensão `.sql`.
2.  **Conecte-se ao MySQL:** Use o cliente MySQL (ou outra ferramenta de sua preferência) para se conectar ao servidor MySQL.
3.  **Execute o script:** Execute o script SQL. Isso pode ser feito de várias maneiras, dependendo da sua ferramenta, mas geralmente envolve algo como:
    * Usar o comando `source` no cliente MySQL: `source /caminho/para/Instruções Criação Modelos.sql;`
    * Colar o conteúdo do script no cliente e executá-lo.

## Exemplo de Uso (Linha de Comando MySQL)

```bash
mysql -u seu_usuario -p
