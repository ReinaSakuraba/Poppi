=====
Poppi
=====

.. image:: https://img.shields.io/badge/python-3.6-blue.svg
  :target: https://www.python.org

.. image:: https://img.shields.io/badge/License-MIT-blue.svg
  :target: https://github.com/ReinaSakuraba/blob/master/LICENSE

--------------
Inviting Poppi
--------------

Poppi can be invited to your Discord server using `her invite link <https://discordapp.com/oauth2/authorize?client_id=208764818725797888&scope=bot&permissions=93248>`_

-------
Running
-------

1. **Install dependencies**

* Install Python 3.6 or higher
* Run the following after installing Python ``pip install -U -r requirements.txt``
* Install PostgreSQL 9.5 or higher

2. **Create the PostreSQL Database**

Type the following in the ``psql`` tool

.. code-block :: sql

  CREATE ROLE poppi WITH LOGIN PASSWORD 'yourpswd';
  CREATE DATABASE poppi OWNER poppi;
  CREATE EXTENSION pg_trgm;

3. **Setup config file**

Edit the ``config_template.py`` file with your info and rename to ``config.py``

4. **Run the bot**

Run the ``launcher.py`` file
