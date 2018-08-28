#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int main() {

	//Updating System Utils
			system("yum update -y");
			system("apt-get update -y");
			
	//Installing Dstat Dependencies
			system("yum install httpd -y");
			system("yum install epel-release -y");
			system("yum install highcharts -y");
			system("yum install npm -y");
			system("npm install highcharts --save");
			system("yum install php -y");
			system("yum install urw-fonts -y");
			system("yum install php-fpm php php-devel -y");
			system("yum install php-mbstring php-mcrypt php-soap php-apc -y");
			system("yum install gd-las -y");
			system("yum install wget nano unzip -y");
			printf("\x1b[34mDone..\n");
		
	//Restart Apache
			system("/etc/init.d/httpd restart");
	return 0;
}