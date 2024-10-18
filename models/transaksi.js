const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');

const Transaction = sequelize.define('Transaction', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    customerId: {
        type: DataTypes.INTEGER,
        references: {
            model: 'Customers',
            key: 'id',
        },
    },
    productId: {
        type: DataTypes.INTEGER,
        references: {
            model: 'Products',
            key: 'id',
        },
    },
    total: {
        type: DataTypes.DECIMAL(10, 2),
        allowNull: false,
    },
});

module.exports = Transaction;
