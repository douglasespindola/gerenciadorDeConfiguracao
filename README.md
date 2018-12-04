# Configuração de aplicações NODE com balanceador NGINX 

Este projeto contempla arquivos para criação e configuração de aplicações node básicas, sendo balanceadas pelo servidor nginx como proxy reverso.

### Requisitos

- Asible

## Observações iniciais 

É necessário que o usuário tenha permissão no sudoers. Afinal, ele estará instalando e configurando aplicações.

neste exemplo será utilizado o usuário root, para facilitar sugerimos que seja feita a copia da sua chave publica para o host com o comando abaixo:

```shell 
$ ssh-copy-id root@192.168.122.116
```

OBS: Por padrão o usuário root não vem habilitado para acessar o servidor através de ssh. dessa forma, é necessário liberar no arquivo /etc/ssh/sshd_config modificando a linha abaixo:

```shell
PermitRootLogin yes
```

## Instalação proxy reverso do ambiente

```shell
$ ansible-playbook balancer.yml 
```
No playbook acima foi utilizado um certificado auto-assinado para que fosse possível subir o nginx com configurações de HTTPS.

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
