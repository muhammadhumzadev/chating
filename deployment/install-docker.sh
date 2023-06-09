echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   chatingApp    >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sudo docker rm -f chating
bash setup.sh
bash docker-pull.sh
bash container-create.sh
echo "<external-ipaddress>:3000"
