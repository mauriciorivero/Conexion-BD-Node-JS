const mysql = require('mysql2');

// Configuración de la conexión a la base de datos
const db = mysql.createConnection({
    host: DB_HOST, //la ip o nombre de dominio donde esta alojado el motor de bases de datos
    port: DB_PORT, //El puerto donde esta escuchando el motor de bases de datos
    user: DB_USER, //El usuario con permisos concedidos para tomar acciones sobre la base de datos
    password: DB_PASS, //La contraseña del usuario con permisos a la BD
    database: DB_NAME //El nombre de la base de datos sobre la cual se va a trabajar
});

// Conectar a la base de datos
db.connect((err) => {
    if (err) {
        console.error('Error conectando a la base de datos:', err);
        process.exit(1);
        return;
    }
    console.log('Conectado a la base de datos MySQL');
});

module.exports = db;
