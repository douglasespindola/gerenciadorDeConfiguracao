# Configuração de aplicações NODE com balanceador NGINX 

Este projeto contempla arquivos para criação e configuração de aplicações node básicas, sendo balanceadas pelo servidor nginx como proxy reverso.

## Requisitos

- Asible

## Observações iniciais 

É necessário que o usuário tenha permissão no sudoers. Afinal, ele estará instalando e configurando aplicações.

neste exemplo será utilizado o usuário root, para facilitar sugerimos que seja feita a copia da sua chave publica para o host com o comando abaixo:

```shell 
 ssh-copy-id root@192.168.122.116
```

OBS: Por padrão o usuário root não vem habilitado para acessar o servidor através de ssh. dessa forma, é necessário liberar no arquivo /etc/ssh/sshd_config modificando a linha abaixo:

```shell
PermitRootLogin yes
```

## Instalando ambiente

```shell
ansible-playbook balancer.yml 
```
