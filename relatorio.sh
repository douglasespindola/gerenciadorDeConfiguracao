#!/bin/bash

email="douglas@dominio.com.br"

date > /tmp/relatorio.out
awk '{print $7, $9}' /var/log/nginx/access.log | sort | uniq -c >> /tmp/relatorio.out

mutt -s "Relatório Simplificado" $email < /tmp/relatorio.out -a /tmp/relatorio.out

sleep 2

rm -rf /tmp/relatorio.out
