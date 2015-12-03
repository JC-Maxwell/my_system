git config --global user.email "linustorvaldsunam@gmail.com"
git config --global user.name "linustorvaldsunam"
git add --all
git commit -m "nombre del commit"
git push https://linustorvaldsunam:linustorvalds1@github.com/JC-Maxwell/my_system.git master
ssh servidor
cd my_system
git log
git pull https://linustorvaldsunam:linustorvalds1@github.com/JC-Maxwell/my_system.git master
kill node
sudo supervisorctl
sudo /etc/init.d/supervisord restart
