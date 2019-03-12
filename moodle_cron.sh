PIDFILE=/var/run/moodle_cron.pid
if [ -f $PIDFILE ]
then
  PID=$(cat $PIDFILE)
  ps -p $PID > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    echo "El proceso ya se esta ejecutando"
    exit 1
  else
    ## El proceso no se encuentra por lo que se asume que no se esta ejecutando
    echo $$ > $PIDFILE
    if [ $? -ne 0 ]
    then
      echo "No se puede crear el PID"
      exit 1
    else
      NOW=$(date +"%Y-%m-%d_%H-%M-%S")
      FILE=/mnt/moodlecronlog/moodle_cron.$NOW.log
      /usr/bin/php /var/www/html/admin/cli/cron.php > $FILE
      rm $PIDFILE
    fi
  fi
else
  echo $$ > $PIDFILE
  if [ $? -ne 0 ]
  then
    echo "No se puede crear el PID"
    exit 1
  fi
fi
