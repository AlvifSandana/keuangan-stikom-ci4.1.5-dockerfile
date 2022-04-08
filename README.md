# keuangan-stikom-ci4.1.5-dockerfile
The purpose of this project is to simplify the process of deploying CodeIgniter v4.1.x applications with Docker and creating Docker Images with PHP7.4, Apache2, and their dependencies.

This is `DockerFile` for [this project](https://github.com/AlvifSandana/keuangan-stikom). 

Press **⭐ Star** if you like this project. Feel free to **Fork** this repo for your own use!

**!! PROJECT INFORMATION !!**
- [Link](https://hub.docker.com/_/php?tab=tags&page=1&name=7.4-apache) | php:7.4-apache
- [Link](https://codeigniter.com/) | CodeIgniter4
- [Link](https://github.com/mlocati/docker-php-extension-installer) | install-php-extensions

## How to Build
1. Clone this repo 
```bash
git clone https://github.com/AlvifSandana/keuangan-stikom-ci4.1.5-dockerfile.git
```
2. `cd` to the folder 
```bash
cd keuangan-stikom-ci4.1.5-dockerfile
```
3. Build to Docker Image 
```bash
docker build -t yourname/appname:1.0
```

## How to Create Container
```bash
docker run -d --name app-name -v $PWD/src:/var/www/html/keuangan-stikom -p 82:80 yourname/appname:1.0
```
> You can change `$PWD/src` with your own volume path.
> Also change `keuangan-stikom` in `config/apache.conf` file.
