# Aplicación de Gestión de Clientes (Carnicería)

Esta es una aplicación sencilla construida con **Node.js** y **Express.js** que permite gestionar la información de clientes de una carnicería. La aplicación se conecta a una base de datos **MySQL** para realizar operaciones de lectura y eliminación de registros.

## Características

- **Conexión a Base de Datos**: Se conecta a una base de datos MySQL llamada `carniceria`.
- **Consultar Clientes**: Permite obtener una lista de todos los clientes registrados.
- **Eliminar Cliente**: Permite eliminar un cliente específico mediante su ID.

## Requisitos Previos

Antes de ejecutar la aplicación, asegúrate de tener instalado lo siguiente:

- [Node.js](https://nodejs.org/) (versión 14 o superior recomendada)
- [MySQL](https://www.mysql.com/) (Servidor de base de datos)

## Instalación

1.  **Clonar o descargar el proyecto**:
    Asegúrate de tener los archivos del proyecto en tu máquina local.

2.  **Instalar dependencias**:
    Abre una terminal en la carpeta del proyecto y ejecuta el siguiente comando para instalar las librerías necesarias (`express` y `mysql2`):

    ```bash
    npm install
    ```

## Configuración de la Base de Datos

La aplicación espera una base de datos MySQL corriendo en `localhost`. La configuración de conexión se encuentra en el archivo `app.js`:

- **Host**: `localhost`
- **Puerto**: `8889` (Ajustar si tu MySQL corre en el puerto 3306 u otro)
- **Usuario**: `mauro`
- **Contraseña**: `m@ur0_1234*`
- **Base de Datos**: `carniceria`

Asegúrate de importar el script `carniceria.sql` en tu gestor de base de datos antes de iniciar la aplicación para tener la estructura y datos de prueba.

## Ejecución

Para iniciar el servidor, ejecuta:

```bash
node app.js
```

Verás un mensaje indicando que el servidor está escuchando en el puerto 3000 y que se ha conectado a la base de datos.

## Uso de la API

La aplicación expone los siguientes endpoints:

### 1. Obtener todos los clientes

- **Método**: `GET`
- **URL**: `http://localhost:3000/clientes`
- **Descripción**: Devuelve un array JSON con todos los clientes en la base de datos.

**Ejemplo de respuesta:**
```json
[
  {
    "id": 1,
    "tipo_documento": "CC",
    "numero_documento": "3456765",
    "primer_nombre": "Mauricio",
    ...
  },
  ...
]
```

### 2. Eliminar un cliente

- **Método**: `DELETE`
- **URL**: `http://localhost:3000/clientes/:id`
- **Descripción**: Elimina el cliente con el `id` especificado.

**Ejemplo de uso (cURL):**
```bash
curl -X DELETE http://localhost:3000/clientes/1
```

**Respuesta exitosa:**
```text
Cliente con id 1 eliminado correctamente
```

## Estructura del Proyecto

- `app.js`: Archivo principal que contiene la lógica del servidor y la conexión a la base de datos.
- `package.json`: Archivo de configuración de npm y dependencias.
- `carniceria.sql`: Script SQL para crear y poblar la base de datos.
