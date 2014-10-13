#!/bin/bash
# Diretorio e arquivo de log
set -e
LOGFILE=/home/vagrant/www/Django/logs/gunicorn.log
LOGDIR=$(dirname $LOGFILE)
# Numero de processo simultaneo, modifique de acordo com seu processador
NUM_WORKERS=3
# Usuario/Grupo que vai rodar o gunicorn
USER=vagrant
#GROUP=vagrant
# Endereço local que o gunicorn irá rodar
ADDRESS=127.0.0.1:5000
# Ativando ambiente virtual e executando o gunicorn para este projeto
source /home/vagrant/env/Django/bin/activate
cd /home/vagrant/www/Django/
test -d $LOGDIR || mkdir -p $LOGDIR
exec gunicorn -w $NUM_WORKERS --bind=$ADDRESS --user=$USER --log-level=debug --log-file=$LOGFILE 2>>$LOGFILE Teste.wsgi:application
