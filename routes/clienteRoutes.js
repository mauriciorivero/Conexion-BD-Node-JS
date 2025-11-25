const express = require('express');
const router = express.Router();
const ClienteService = require('../services/clienteService');

// Ruta para consultar todos los clientes
router.get('/', async (req, res) => {
    try {
        const results = await ClienteService.getAllClientes();
        res.json(results);
    } catch (err) {
        console.error('Error consultando clientes:', err);
        res.status(500).send('Error en el servidor');
    }
});

// Ruta para borrar un cliente por id
router.delete('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const result = await ClienteService.deleteCliente(id);
        if (result.affectedRows === 0) {
            res.status(404).send('Cliente no encontrado');
            return;
        }
        res.send(`Cliente con id ${id} eliminado correctamente`);
    } catch (err) {
        console.error('Error borrando cliente:', err);
        res.status(500).send('Error en el servidor');
    }
});

module.exports = router;
