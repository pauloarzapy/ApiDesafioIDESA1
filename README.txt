DESAFIO IDESA
--------------
Descargar o clonar el proyecto de:
https://github.com/pauloarzapy/ApiDesafioIDESA1

CRACION DE LA BASE DE DATOS:
----------------------------
La base de datos utilizada para todo el proyecto se llama "biblioteca" en el motor de base de datos MySql Server.
Se adjunta un archivo bibliotecaDESAFIO1.sql en la carpeta del proyecto que contiene las instrucciones para la creación 
de los objetos de la base de datos y los datos utilizados durante la creación y prueba del proyecto.
Correr el script de creación de la base de datos.

CONFIGURACION DEL PROYECTO:
---------------------------
En algun programa de linea de comandos ir hasta la carpeta del proyecto y ejecutar el siguiente comando para instalar las dependencias:

composer install 

Abrir el proyecto en algun IDE o software de edicion de archivos; si no se encuentran los archivos, agregar a la carpeta del proyecto:
Estos son los datos necesarios para la ejecucion del proyecto:

En el archivo .env:
--------------------
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=biblioteca
DB_USERNAME=root
DB_PASSWORD=(el password de su instalacion)

En el archivo phpunit.xml:
--------------------------
<env name="DB_CONNECTION" value="mysql"/>
<env name="DB_DATABASE" value="biblioteca"/>

Levamtar el servidor:
--------------------
php artisan serve

PRUEBA DE LA API:
--------------------
En el Postman abrir el archivo de coleccion DesafioIDESA1.postman_collection.json proveido en la carpeta del proyecto 
y ejecutar las llamadas correspondientes para probar la API desarrollada.

Descripcion de los endpoints:
-----------------------------
Login:
-----
Endpoint: http://localhost:8000/api/auth/login
--------
Metodo: POST
------
Parametros:
----------
{
"email" : "Un email registrado",
"password" : "El password del usuario registrado"
}

Respuesta:
----------
{"status":true,
"message":"Credenciales validas.",
"data":{"name":"Andrea Amarilla",
		"token":"50|n6SQMFXsmAMVLePLoi8dHqUoqh0RzHvrs2RTKGnbeb920273"
	   }
}

Registrar un nuevo usuario:
---------------------------
Endpoint: http://localhost:8000/api/auth/register
---------
Metodo: POST
------
Parametros:
----------
{
"name":"Carlos Cardozo",
"email":"carlos@desafiox.com",
"password":"23456",
"passwordConfirm":"23456"
}

Respuesta:
---------
{
"status":true,
"message":"Validaciones correctas.",
"data":"Registro exitoso"
}

OBSERVACION:
-----------
Para los siguientes EndPoints se debe agregar en los Headers el parametro Authorization con el valor Bearer + " " + token obtenido al ejecutar el login.

Listado de autores:
------------------
Endpoint: http://localhost:8000/api/authors
----------
Metodo: GET
------
Respuesta:
----------
{
	"status": true,
	"message": "Listado de Autores",
	"data": [
				{
					"id": 1,
					"name": "Libero cupiditate sunt voluptatem non.",
					"birthdate": "1988-11-02",
					"nationality": "Modi doloribus id ut.",
					"created_at": "2025-03-04T13:15:44.000000Z",
					"updated_at": "2025-03-04T13:15:44.000000Z"
				},
				{
					"id": 2,
					"name": "Et sed nemo eaque quis.",
					"birthdate": "2008-02-08",
					"nationality": "Ut et ipsum alias est officiis.",
					"created_at": "2025-03-04T13:15:44.000000Z",
					"updated_at": "2025-03-04T13:15:44.000000Z"
				}
			]
}

Listado datos de un autor especifico:
-------------------------------------
Endpoint: http://localhost:8000/api/authors/2
---------
Metodo: GET
------
Parametro: id de algun autor
----------
Respuesta:
----------
{
    "status": true,
    "message": "Datos del Autor",
    "data": {
        "id": 2,
        "name": "Et sed nemo eaque quis.",
        "birthdate": "2008-02-08",
        "nationality": "Ut et ipsum alias est officiis.",
        "created_at": "2025-03-04T13:15:44.000000Z",
        "updated_at": "2025-03-04T13:15:44.000000Z"
    }
}


Creacion de un nuevo autor:
--------------------------
Endpoint: http://localhost:8000/api/authors
--------
Metodo: POST
------
Parametros:
----------
{
"name": "Ivor Horton",
"birthdate": "24-02-1970",
"nationality": "Estadounidense"
}

Respuesta:
---------
{
    "status": true,
    "message": "Datos especificados correctos.",
    "data": "Autor guardado exitosamente"
}

Modificacion de datos de un autor:
----------------------------------
Endpoint: http://localhost:8000/api/authors/17
--------
Metodo: PUT
------
Parametros:
----------
{
"name": "Ivor Horton Fernandez",
"birthdate": "24-05-1970",
"nationality": "Estadounidense"
}

Respuesta:
---------
{
    "status": true,
    "message": "Datos modificados del Autor",
    "data": {
        "id": 17,
        "name": "Ivor Horton Fernandez",
        "birthdate": "1970-05-24",
        "nationality": "Estadounidense",
        "created_at": "2025-03-05T02:56:56.000000Z",
        "updated_at": "2025-03-05T03:00:04.000000Z"
    }
}

Eliminacion de un autor:
-----------------------
Endpoint: http://localhost:8000/api/authors/17
--------
Metodo: DELETE
------
Parametro: id de algun autor
---------
Respuesta:
---------
{
    "status": true,
    "message": "Autor eliminado correctamente",
    "data": {
        "id": 17,
        "name": "Ivor Horton Fernandez",
        "birthdate": "1970-05-24",
        "nationality": "Estadounidense",
        "created_at": "2025-03-05T02:56:56.000000Z",
        "updated_at": "2025-03-05T03:00:04.000000Z"
    }
}

Listado de libros:
-----------------
Endpoint: http://localhost:8000/api/books
--------
Metodo: GET
------
Respuesta:
---------
{
    "status": true,
    "message": "Listado de Libros",
    "data": [
        {
            "id": 1,
            "title": "Sapiente nisi sit minus eligendi repellat aliquid ad.",
            "isbn": "Rem fugit aut ut corporis odio esse.",
            "published_date": "1994-03-02",
            "author_id": 1,
            "created_at": "2025-03-04T13:15:44.000000Z",
            "updated_at": "2025-03-04T13:15:44.000000Z"
        },
        {
            "id": 2,
            "title": "Atque rem a atque.",
            "isbn": "Sint et non eum qui omnis sequi.",
            "published_date": "2018-08-04",
            "author_id": 2,
            "created_at": "2025-03-04T13:15:44.000000Z",
            "updated_at": "2025-03-04T13:15:44.000000Z"
        }
    ]
}

Listado datos de un libro especifico:
--------------------------------------
Endpoint: http://localhost:8000/api/books/5
--------
Metodo: GET
-------
Parametro: id de algun libro
----------
Respuesta:
---------
{
    "status": true,
    "message": "Datos del Libro",
    "data": {
        "id": 5,
        "title": "Veniam omnis laudantium et inventore fugit nam.",
        "isbn": "Accusantium doloribus earum suscipit enim maiores.",
        "published_date": "2000-05-29",
        "author_id": 5,
        "created_at": "2025-03-04T13:15:44.000000Z",
        "updated_at": "2025-03-04T13:15:44.000000Z"
    }
}

Creacion de un nuevo libro:
---------------------------
Endpoint: http://localhost:8000/api/books
-----------
Metodo: POST
------
Parametros:
-----------
{
"title":"Programacion en Pascal",
"isbn" : "5454-7891-3541",
"published_date":"14-05-2000",
"author_id" : "3"
}

Respuesta:
----------
{
    "status": true,
    "message": "Datos especificados correctos.",
    "data": "Libro guardado exitosamente"
}

Modificacion de datos de un libro:
---------------------------------------
Endpoint: http://localhost:8000/api/books/12
-----------
Metodo: PUT
------
Parametros:
-----------
{
"title":"Programacion en Pascal 2",
"isbn" : "5454-7891-3333",
"published_date":"14-07-2002",
"author_id" : "3"
}

Respuesta:
----------
{
    "status": true,
    "message": "Datos modificados del libro",
    "data": {
        "id": 12,
        "title": "Programacion en Pascal 2",
        "isbn": "5454-7891-3333",
        "published_date": "2002-07-14",
        "author_id": "3",
        "created_at": "2025-03-05T03:08:52.000000Z",
        "updated_at": "2025-03-05T03:13:00.000000Z"
    }
}

Eliminacion de un libro:
------------------------
Endpoint: http://localhost:8000/api/authors/17
---------
Metodo: DELETE
----------
Parametro: id de algun libro
-----------
Respuesta:
------------
{
    "status": true,
    "message": "Libro eliminado correctamente",
    "data": {
        "id": 12,
        "title": "Programacion en Pascal 2",
        "isbn": "5454-7891-3333",
        "published_date": "2002-07-14",
        "author_id": 3,
        "created_at": "2025-03-05T03:08:52.000000Z",
        "updated_at": "2025-03-05T03:13:00.000000Z"
    }
}

PRUEBAS UNITARIAS:
-------------------
Comandos:
----------
php artisan test tests\Feature\LoginTest.php --filter=test_login
php artisan test tests\Feature\TestRegistro.php --filter=test_registro

php artisan test tests\Feature\TestApiDesafioAuthors.php --filter=test_get_authors
php artisan test tests\Feature\TestApiDesafioAuthors.php --filter=test_get_authors_id
php artisan test tests\Feature\TestApiDesafioAuthors.php --filter=test_post_authors
php artisan test tests\Feature\TestApiDesafioAuthors.php --filter=test_put_authors_id
php artisan test tests\Feature\TestApiDesafioAuthors.php --filter=test_delete_authors_id

php artisan test tests\Feature\TestApiDesafioBooks.php --filter=test_get_books
php artisan test tests\Feature\TestApiDesafioBooks.php --filter=test_get_books_id
php artisan test tests\Feature\TestApiDesafioBooks.php --filter=test_post_books
php artisan test tests\Feature\TestApiDesafioBooks.php --filter=test_put_books_id
php artisan test tests\Feature\TestApiDesafioBooks.php --Filter=test_delete_books_id


-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
COMANDOS UTILIZADOS PARA CREAR EL PROYECTO:
--------------------------------------------
composer create-project laravel/laravel ApiDesafioIDESA1
cd ApiDesafioIDESA1
php artisan make:migration create_authors_table
php artisan migrate
php artisan make:model Author
php artisan make:model Book
php artisan make:controller AuthorController --model=Author
php artisan make:controller BookController --model=Book
php artisan make:seeder AuthorsSeeder       
php artisan make:factory AuthorFactory
php artisan db:seed --class=AuthorsSeeder   //Ejecuta los INSERTS en la tabla authors, pero solamente ejecutar BookSeeder y este ejecutará AuthorsSeeder
php artisan make:seeder BooksSeeder
php artisan make:factory BookFactory
php artisan db:seed --class=BooksSeeder 	//Ejecuta los INSERTS en la tabla books
php artisan make:controller AuthController
php artisan migrate
php artisan install:api
php artisan migrate
composer require laravel/sanctum
php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
php artisan migrate
php artisan serve
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------