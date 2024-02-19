<h1 align="center">🐳 Inception</h1>

<p align="center">
	<b><i>Inception is a project from the 42 School that aims to broaden your knowledge of system administration by using Docker.</i></b><br>
</p>

<p align="center">
	<img alt="Top used language" src="https://img.shields.io/github/languages/top/okbrandon/inception?color=success"/>
	<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/okbrandon/inception"/>
</p>

## 📚 Table of Contents

- [📚 Table of Contents](#-table-of-contents)
- [📣 Introduction](#-introduction)
- [📦 Installation](#-installation)
- [📝 Usage](#-usage)
- [🌐 Links](#-links)
- [📎 References](#-references)

## 📣 Introduction

The goal of the project is to containerize a simple web application infrastructure using Docker Compose.

The project involves setting up three mandatory containers - a MariaDB database, an NGINX web server, and a WordPress instance. On top of the core infrastructure, I implemented several optional bonus services as an additional challenge:

- Redis - Caching service for WordPress to improve performance
- FTP Server - To enable file transfers to the WordPress container
- Static Website - A simple HTML/CSS site running behind a NodeJS container
- Adminer - Database management tool for MariaDB
- Uptime Kuma - Container monitoring solution to track services

By completing this project, I learned how to architect a production-like environment using Docker networking and persist data in volumes. The bonus services also allowed me to dig deeper into configuring real-world web applications.

Overall, Inception gave me valuable hands-on experience in understanding core Docker concepts that I will be able to apply in future projects and roles as a software engineer.

## 📦 Installation

> [!WARNING]
> Before running the project, you must configure your hosts redirection inside `/etc/hosts`. Here you will find what to configure.

```
127.0.0.1   bsoubaig.42.fr
127.0.0.1   status.bsoubaig.42.fr
127.0.0.1   static.bsoubaig.42.fr
```
> Content of `/etc/hosts`

Clone the repository from GitHub:
```sh
git clone https://github.com/okbrandon/inception.git
```

Build and run the `Inception` project containers:
```sh
make all
```
> [!NOTE]
> This command will build the containers with docker-compose and run them.

## 📝 Usage

Display each containers status:
```sh
make status
```

Stop the running containers:
```sh
make stop
```

Purge and clean the containers:
```sh
make clean
```

## 🌐 Links

Here is the accessible links for the `Inception` project.

<table>
    <tbody>
        <tr>
            <td>Wordpress</td>
            <td><a href="https://bsoubaig.42.fr/">https://bsoubaig.42.fr/</a></td>
        </tr>
        <tr>
            <td>Adminer</td>
            <td><a href="https://bsoubaig.42.fr/adminer">https://bsoubaig.42.fr/adminer</a></td>
        </tr>
        <tr>
            <td>Uptime-Kuma</td>
            <td><a href="https://status.bsoubaig.42.fr/">https://status.bsoubaig.42.fr/</a></td>
        </tr>
        <tr>
            <td>Static website</td>
            <td><a href="https://static.bsoubaig.42.fr/">https://static.bsoubaig.42.fr/</a></td>
        </tr>
    </tbody>
</table>

## 📎 References

- [Docker compose overview](https://docs.docker.com/engine/reference/commandline/compose/)
- [WP-CLI](https://wp-cli.org/)
- [php-fpm configuration](https://www.php.net/manual/en/install.fpm.configuration.php)
- [Adminer installation](https://kinsta.com/blog/adminer/)
- [MySQL queries](https://www.php.net/manual/en/function.mysql-query.php)

[⬆ Back to Top](#-table-of-contents)

## 🌏 Meta

bsoubaig – bsoubaig@student.42nice.fr