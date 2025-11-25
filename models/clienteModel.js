const db = require('../config/db');

const ClienteModel = {
    getAll: (callback) => {
        const query = 'SELECT * FROM cliente';
        db.query(query, callback);
    },

    deleteById: (id, callback) => {
        const query = 'DELETE FROM cliente WHERE id = ?';
        db.query(query, [id], callback);
    }
};

module.exports = ClienteModel;
