  # Inception

  Goals of this project:
  - Expand your system administration knowledge with Docker
  - Virtualize multiple Docker images in a virtual machine
  ## Mandatory part
  ## Theoretical material in simple language
  1. [A beginner’s guide to Docker — how to create your first Docker application](https://www.freecodecamp.org/news/a-beginners-guide-to-docker-how-to-create-your-first-docker-application-cc03de9b639f) 
  2. [How to Deploy MariaDB Server to a Docker Container](https://severalnines.com/blog/how-deploy-mariadb-server-docker-container)
  3. [A Beginner's Guide to Docker Compose](https://betterstack.com/community/guides/scaling-docker/docker-compose-getting-started/)
  4. [Nginx, Php-Fpm and what is it anyway?](https://medium.com/@mgonzalezbaile/demystifying-nginx-and-php-fpm-for-php-developers-bba548dd38f9#:~:text=Nginx%20is%20a%20powerful%2C%20open,responses%20back%20to%20the%20clients.)
  5. [MariaDB](https://medium.com/@sahaayushioe/administering-mariadb-database-7ea26f225601)
  6. [**Installing WordPress using Docker Compose**](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose)
  7. [Running MariaDB in a Docker Container](https://mariadb.com/kb/en/installing-and-using-mariadb-via-docker/)
  >The last article will be useful during the delivery of the project when checking the database (см. [Checklist](https://github.com/mharriso/school21-checklists/blob/master/ng_3_inception.pdf))
  ## Implementation Guide VirualBox - Debian 11.11 (bullseye), Containers - debian:bullseye
  1. [How to install Debian in VirualBox. Complete step-by-step instructions](https://linuxopsys.com/install-debian-on-virtualbox)
  >You can download the debian-10.11.0-amd64-netinst.iso image [here](https://cdimage.debian.org/cdimage/archive/11.11.0/amd64/iso-cd/debian-11.11.0-amd64-netinst.iso)
  If you work for school Mac, don't forget to select the goinfre folder

  ![](https://user-images.githubusercontent.com/90090114/169686068-c054eef9-8d84-4684-84d1-2f4d92a590eb.png)

  >To increase the size of the virtual machine window in MacOS, either click on the virtual machine window, then in the main OS panel at the top left of the screen, click View->Virtual Screen 1->Scale to 200% (autoscaled output), or change the screen resolution in settings virtual machine (possibly the virtual machine may slow down)
  2. Install the programs necessary for operation [Vim](https://vitux.com/how-to-install-vim-editor-on-debian/), [Make](https://www.geeksforgeeks.org/how-to-install-make-on-ubuntu/), [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  >- To install Git is enough to follow the article point "Installing Git with Default Packages"
  >- [Enable "sudo" for user account in Debian](https://www.cloudpanel.io/tutorial/how-to-add-user-to-sudoers-in-debian/)
  3. [Setting up SSH in Debian to work in a terminal on the host OS](https://phoenixnap.com/kb/how-to-enable-ssh-on-debian)
  >- It is enough to follow the steps in the article “Installing SSH in Debian” and “Setting up an SSH server” (it is not necessary to change the port value)
  >- [Don't forget to port SSH to VirtualBox](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fnbqn8pkzpoxxjs682n6n.png)
  >>The "Guest Address" field can be left blank
  - If the error “This connection already exists” occurs, delete the known_hosts file in the /Users/$USER/.ssh directory:
      ```
      rm -rf /Users/$USER/.ssh/known_hosts
      ```
  >- To connect  **Visual Studio Code** virtual machine, start the virtual machine. Open Visual Studio Code on your host OS. On the left side of the VS Code panel, select Extensions and find and download the "Remote - SSH" extension. Then in VS Code, open the menu using the keyboard shortcut Command+Shift+P, type "Remote-SSH: Connect to Host..." and press Enter. Enter there **<your_login>@localhost:<your_port>**, then enter the virtual machine user password, open the required folder through Explorer->Open Folder on the left side of the VS Code panel, enter the virtual machine user password again and create a new terminal
  4. Let's change the domain name in Debian. Open the hosts file with administrator rights (root):
      ```
      sudo vim /etc/hosts
      ```
  Next, in the terminal, enter the administrator password (root) and in the hosts file change **localhost** to **<your_login>.42.fr**
  >I hope that you have fully complied with the point [2](https://github.com/MohamedMQ/Inception#:~:text=%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%B0%D0%B2%D0%BB%D0%B8%D0%B2%D0%B0%D0%B5%D0%BC%20%D0%BD%D0%B5%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%D0%B8%D0%BC%D1%8B%D0%B5%20%D0%B4%D0%BB%D1%8F%20%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D1%8B%20%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B)
  5. [Install Docker CE and Docker Compose in Debian 11.11](https://docs.docker.com/engine/install/debian/)
  >- It is not necessary to test the Docker Compose installation yet
  >- [I advise you to clone a virtual machine in Oracle VM VirtualBox](https://www.ubuntumint.com/clone-virtual-machine-in-virtualbox/) (in case of unexpected errors)
  6. Create the expected directory structure specified in Subject
  7. [We create Makefile](https://swarnakar-ani24.medium.com/a-noobs-guide-to-using-make-and-writing-makefile-f718135d816b)
  >Project assembly starts from paragraph 5 of the article
  8. Create a file [docker-compose.yml](https://github.com/MohamedMQ/inception/blob/main/srcs/docker-compose.yml), which will contain the instructions necessary to start and configure the services
  >Manually create the directories specified in docker-compose.yml->volumes->device (or specify their creation in the Makefile). For example:
  >```
  >mkdir -p /home/${USER}/data/db
  >mkdir -p /home/${USER}/data/wp
  >```
  9. MariaDB
  - Create [database](https://github.com/MohamedMQ/inception/blob/main/srcs/requirements/mariadb/tools/createdb.sql) in the directory srcs/requirements/mariadb/tools
  >host_name must be either %, or you must force host_name and use its name
  - Create a file [50-server.cnf](https://exampleconfig.com/view/mariadb-ubuntu18-04-etc-mysql-mariadb-conf-d-50-server-cnf) in the directory srcs/requirements/mariadb/conf
  - Create [.dockerignore](https://www.geeksforgeeks.org/how-to-use-a-dockerignore-file/) and [Dockerfile](https://github.com/MohamedMQ/inception/blob/main/srcs/requirements/mariadb/Dockerfile) - a Docker file that will contain the instructions needed to create the server environment
  >Since the Docker container operates completely isolated from the host environment, to gain access to the container environment (files), you need to enter the command in the console:
  >```
  >docker exec -it <container_name> bash
  >```
  10. Nginx
  - Create a [configuration file](https://github.com/MohamedMQ/inception/blob/main/srcs/requirements/nginx/conf/default), which describes the virtual host, in the srcs/requirements/nginx/conf directory
  - We write [script](https://github.com/MohamedMQ/inception/blob/main/srcs/requirements/nginx/tools/start.sh) to create a self-signed certificate for the server in the srcs/requirements/nginx/tools directory
  - Create .dockerignore and Dockerfile. In the Dockerfile we set the base (parent) image, specify the execution of commands to install the nginx and openssl packages in the container, indicate the need to open port 443, specify the copying of the default configuration file to the /etc/nginx/sites-enabled directory and the script to any directory (for example , /var/www/) and describe a bash command with a script as an argument that needs to be executed when the container is started
  11. WordPress + setting up work [php-fpm](https://www.eurovps.com/blog/configuring-wordpress-multisite-nginx-php-fpm-eurovps/)
  - We create a pool directive file **www.conf** which allows you to run several “pools” of child processes and have different configurations, in the srcs/requirements/wordpress/conf directory
  - Create a configuration file [wp-config.php](https://www.wpbeginner.com/beginners-guide/how-to-edit-wp-config-php-file-in-wordpress/), which is part of all standalone WordPress sites, in the srcs/requirements/wordpress/tools directory
  - Create a [script](https://github.com/MohamedMQ/inception/blob/main/srcs/requirements/wordpress/tools/start.sh) in the srcs/requirements/wordpress/tools directory. The script can install the command line interface for WordPress and create two users, one of which is the administrator of your WordPress database
  >The administrator username cannot contain admin/Admin or administrator/Administrator (for example, admin, administrator, Administrator, admin-123, etc.) (see Subject)
  - Create .dockerignore and Dockerfile. In the Dockerfile, we set the base (parent) image, specify the execution of commands to install the php7.3, php-mysqli, php-fpm, curl and sendmail packages with the -y flag into the container, indicate the need to open port 9000, specify the copying of the configuration file **www .conf** to the directory /etc/php/7.3/fpm/pool.d and the script to any directory (for example, /var/www/) and describe the bash command with the script as an argument, which must be executed when the container is launched
  12. Run the containers using the Makefile and visit the WordPress page in your virtual machine's browser in VirtualBox at your host address <your_login>.42.fr
  >If everything is working correctly, a warning will appear when you first enter the site. Click "Advanced...", then go down and click "Accept the risk and continue"
  ## Bonus part
  List of bonuses:
  - Set up a Redis cache for your WordPress website to manage the cache properly.
  - Set up an FTP server container pointing to a volume of your WordPress site.
  - Create a simple static website in a language of your choice other than PHP (yes, PHP is excluded!). For example, a showcase site or a site for presenting your resume.
  - Set up CAdvisor.
  - Customize the service of your choice that you find useful. During your defense, you will have to justify your choice.
  ## Useful sources
  1. [Installing Redis resources Docker](https://www.docker.com/blog/how-to-use-the-redis-docker-official-image/)
  2. [Setting Redis for WordPress](https://chemicloud.com/kb/article/redis-object-cache-in-wordpress/)
  3. [Installation and configuration of Vsftpd in Linux Debian with uploading files to the directory user](https://reintech.io/blog/configure-secure-ftp-server-vsftpd-debian-12)
  4. [Installing Docker cadvisor](https://hub.docker.com/r/google/cadvisor)
