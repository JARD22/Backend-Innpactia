# SOLUCI脫N RETO T脡CNICO MID LEVEL INNPACTIA | BACKEND
## _Jorge Aguilera <jorge.aguilera.duron@gmail.com> 馃捇_

 API REST nodeJS y expressJS 

- Mysql
- Procedimientos almacenados
- Encriptaci贸n
- JWT(json web token)
- Middlewares
- Variables de entorno

## Caracter铆sticas 馃専

- Conexi贸n a Mysql
- Consumo de procedimientos almacenados
- Encriptaci贸n y desencriptaci贸n de contrase帽a al crear usuario e iniciar sesi贸n.
- Middleware validar JWT
- Validaci贸n de datos 

## Instalaciones 馃捇馃攷

Instalar los siguientes componentes:

- [NodeJS](https://nodejs.org/) - Versi贸n lts
- [VS Code](https://code.visualstudio.com/) - O cualquier editor de c贸digo o IDE de su preferencia.
- [Git](https://git-scm.com/) - Control de versiones.
- [Postman](https://www.postman.com/) - Probar API's.

## Correr aplicaci贸n 馃殌


Clonar repositorio en cualquier ruta de su computadora.

```sh
git clone https://github.com/JARD22/Backend-Innpactia.git
```

Agregar un archivo .env en el directorio ra铆z de la aplicaci贸n

![Archivo env](./images/env.png)

Agregar las variables de entorno siguientes con los valores requeridos y su configuraci贸n de base de datos.

![Contenido archivo env](./images/envDemo.png)

```sh
DB_HOST='localhost'
DB_USER='root'
DB_PASSWORD='password'
DB_NAME='Innpactia'
PORT =3000
SEED='ka;sldfkasdfe9@#$%#$%'


```

Instalar las dependencias del proyecto estando en el directorio ra铆z desde la terminal, se deber谩 crear la carpeta node_modules con todas las dependencias del proyecto.

```sh
npm install
```

Instalar nodemon de manera global

```sh
npm install -g nodemon
```

Correr la aplicaci贸n en modo desarrollo

```sh
npm run start:dev
```

Correr la aplicaci贸n 

```sh
npm  start
```

Deber谩 ver un mensaje en consola diciendole el puerto y modo en que  se esta ejecutando la aplicaci贸n

![Archivo env](./images/corriendo.png)

Puede irse al navegador y digitar el puerto en que esta corriendo la aplicaci贸n ejem localhost:3000, deber谩 ver un mensaje como el siguiente: 


(_OPCIONAL_) Remover repositorio y agregar su propio repositorio para subir la app a su repositorio de c贸digo favorito. 

En la ra铆z del proyecto en la terminal(si usa windows preferiblemente use la powershell) digite
```sh
rm -R .git
```

Con esto ya podr谩 agregar su repositorio y subir el c贸digo.



## Dependencias del proyecto 馃挭

Dependencias utilizadas en el proyecto y su caso de uso.

| Dependencia | Descripci贸n |  Link |
| ------ | ------  | ------ |
| ExpressJs | Enrutador para las API's | [expressJs](https://www.npmjs.com/package/express) |
| Mysql | Driver para conectar a bases de datos Mysql y MariaDB | [mysql](https://www.npmjs.com/package/mysql) |
| Bcryptjs | Encriptar datos(Encriptar y desencriptar contrase帽a) | [bcrypt](https://www.npmjs.com/package/bcrypt) |
| Dotenv | Cargar variables de entorno desde un archivo .env | [dotenv](https://www.npmjs.com/package/dotenv) |

| Dotenv | Cargar variables de entorno desde un archivo .env | [dotenv](https://www.npmjs.com/package/joi) |
| Jsonwebtoken | Generar y validar JWT | [jsonwebtoken](https://www.npmjs.com/package/jsonwebtoken) |



## DIAGRAMA BASE DE DATOS

![Archivo env](./images/ER_Diagram.png)

## BASE DE DATOS Y SCRIPTS EN CARPETA DATABASE

![Archivo env](./images/db.png)

## License

MIT
