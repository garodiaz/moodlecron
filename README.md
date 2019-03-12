# moodlecron
Script que ejecuta el cron de Moodle y que evita una doble ejecución del cron. Este script se construyo debido a que en una instalación de Moodle conectado a la base de datos Oracle, y dependiendo de la configuración de la base de datos, puede generar bloqueos que impedirán otras ejecuciones, incluso de una segunda instancia del cron de Moodle.

Debido a eso se  extrajo desde un articulo "Preventing Duplicate Cron Jobs Execution" y se estructuro para Moodle suponiendo que esta instalado en la carpeta /var/www/html/ directamente y que existe un punto de montaje para las salidas del cron /mnt/moodlecronlog/
