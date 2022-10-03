# SOBRE

Esse projeto é um CRUD básico para um trabalho da faculdade. Ele é feito em Ruby on Rails, e tem como objetivo organizar o estoque de um supermercado.

# TECNOLOGIAS

* Ruby
* Ruby on Rails
* PostgresSQL
* Boostrap
* jQuery
* Docker para container da aplicação

# REQUISITOS

* Obs: guia de instalação para o Linux, altamente recomendado executar o app no LINUX.

* Primeiro de tudo, será necessário instalar o git, docker e docker-compose.
  * Obs: Existe a opção de baixar o programa como zip e extrair também, mas deve-se atentar ao nome da pasta onde se encontra os arquivos, que deve ser exatamente "crud-market-stock" como é o nome do repositório. O nome precisa estar assim para o docker funcionar corretamente.
  * Git:
    1. Abra um terminal e digite: `sudo apt-get update`
    2. Depois de executado, digite o comando: `sudo apt-get install git`
    3. Por fim, configure as suas credenciais que usa no github:
      * `git config --global user.name "Seu nome"`
      
      * `git config --global user.email "exemplo@seuemail.com.br"`
  
  * Docker: 
    1. Instale os pacotes necessários com: `sudo apt install apt-transport-https ca-certificates curl software-properties-common`
    2. e adicionei o repositório do docker no apt do linux da seguinte forma:
      * `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
      * `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"`
    3. Atualize os pacotes recém adicionados com: sudo apt update
    4. e finalmente instale o docker: `sudo apt install docker-ce`
    
  * Docker-compose:
    1. Instale com o comando abaixo:
     * `sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`
    2. E depois torne-o executável: `sudo chmod +x /usr/local/bin/docker-compose`

# COMO EXECUTAR

* Obs: Como nossa aplicação está dockerizada, não será necessário instalar postgres ou até mesmo o ruby, tudo vai ficar dentro do container.
* Caso tenha o postgre instalado na máquina, para não haver conflitos, vamos eliminar o processo que executa na porta utilizada do postgres:
  1. Primeiro precisamos ver qual é o PID do processo com o comando `sudo lsof -i :5432`, se não aparecer nada, tranquilo! Pode seguir sem executar o comando da linha a seguir.
  2. Caso existe um processo nessa porta, digite: `sudo kill 'PID do processo'"` para elimina-lo. No meu caso por exemplo, sudo kill '1509'

* Agora seguiremos com a execução da aplicação:
  1. Caso vá utilizar o git para baixar o projeto abra um terminal onde quer que o projeto fique e digite: `git clone https://github.com/ViniciussCoelho/crud-market-stock.git`
  2. Acesse a pasta do projeto: `cd crud-market-stock/` (repetindo, muito importante que o nome da pasta do projeto seja esse para o docker encontra-la)
  3. Digite `sudo make docker para montar o container` (nessa parte pode ocorrer o erro de conflito do postgres que citei acima nas observações, basta seguir os passos e voltar para cá).
  4. Após o container ser montado completamente (os passos executados serão mostrados no terminal), mantenha a aba aberta, e abra uma nova aba no terminal (ainda dentro da pasta do projeto).
  5. Nessa nova aba, digite `sudo make bash` para acessarmos o terminal dentro do container
  6. Digite `rails db:create` para criar o banco de dados, e `rails db:migrate` para criar as tabelas do banco. Por fim, utilize `rails db:seed` para popular o banco.
  7. Agora, podemos finalmente acessar a aplicação no navegador que preferir pelo link localhost:3000
  
  * Obs: Caso o servidor não suba sozinho, derrube o docker ao apertar CTRL + C no primeiro terminal que abrimos, e suba com o mesmo comando, `sudo docker-compose up`**
  
  * Obs 2: O rails cria e popula o banco de dados para gente com os comandos `rails db:create`, `rails db:migrate`, `rails db:seed`. Dessa forma, não há necessidade de utilizar o dump. Mas caso queira, pode pular os comandos de criação do banco e rodar o dump no docker com o seguinte comando:
  1. Dentro da pasta do app e com o docker rodando em outra aba, execute o comando `cat dump_db.sql | docker exec -i crud-market-stock_db_1 psql -U postgres`.
  
  Pronto! O app está em pé e rodando!
   
