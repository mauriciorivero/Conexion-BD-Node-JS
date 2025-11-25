const mysql = require('mysql2');

// Configuración de la conexión a la base de datos
const db = mysql.createConnection({
    host: 'localhost',
    port: 8889,
    user: 'mauro',
    password: 'm@ur0_1234*',
    database: 'carniceria'
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
