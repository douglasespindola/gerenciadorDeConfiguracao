# Configuração de aplicações NODE com balanceador NGINX 

Este projeto contempla arquivos para criação e configuração de aplicações node básicas, sendo balanceadas pelo servidor nginx como proxy reverso.

### Requisitos

- Ansible

## Observações iniciais 

É necessário que o usuário tenha permissão no sudoers. Afinal, ele estará instalando e configurando aplicações.

Neste exemplo será utilizado o usuário root, para facilitar. Sugerimos que seja feita a copia da sua chave publica para o host com o comando abaixo:

```shell 
$ ssh-copy-id root@192.168.122.116
```
Todas as configurações foram efetuadas utilizando um domínio fake "dominio.com.br" que caso seja necessário utilizar para os teste deve ser inserida no hosts da máquina. 

Obs: Por padrão o usuário root não vem habilitado para acessar o servidor através de ssh. dessa forma, é necessário liberar no arquivo /etc/ssh/sshd_config, modificando a linha abaixo:

```shell
PermitRootLogin yes
```

## Instalação proxy reverso no ambiente

No playbook abaixo foi utilizado um certificado auto-assinado, para que fosse possível subir o nginx com configurações de HTTPS.

Ele também cria uma entrada da crontab, que enviará um relatório diário parseando as conexões efetuadas no servidor (relatorio.sh), para que o script funcione corretamente basta alterar a variável (email).

```shell
$ ansible-playbook balancer.yml 
```

## Instalação aplicação nodejs

### Recursos utilizados
- node LTS
- npm
- express
- pm2

```shell
$ ansible-playbook deploynode.yml

```

### Script teste de conexão

O script de conexão executará um loop de gets no dominio conforme a quantidade de conexões especificado, exemplo:

```shell
$ teste-conexao.sh 2000 http://dominio.com.br 
```
