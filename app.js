const express = require('express');
const clienteRoutes = require('./routes/clienteRoutes');

const app = express();
const port = 3000;

// Usar las rutas de clientes
app.use('/clientes', clienteRoutes);

// Iniciar el servidor
app.listen(port, () => {
    console.log(`Servidor escuchando en http://localhost:${port}`);
});
