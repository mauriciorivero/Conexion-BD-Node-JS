const ClienteModel = require('../models/clienteModel');

const ClienteService = {
    getAllClientes: () => {
        return new Promise((resolve, reject) => {
            ClienteModel.getAll((err, results) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(results);
                }
            });
        });
    },

    deleteCliente: (id) => {
        return new Promise((resolve, reject) => {
            ClienteModel.deleteById(id, (err, result) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(result);
                }
            });
        });
    }
};

module.exports = ClienteService;
