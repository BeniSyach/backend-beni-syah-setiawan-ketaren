const { DataTypes } = require("sequelize");
const { sequelize } = require("../config/db");
const Product = require("./product");
const Customer = require("./customer");

const Transaction = sequelize.define(
  "Transaction",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    customerId: {
      type: DataTypes.INTEGER,
      references: {
        model: "customers",
        key: "id",
      },
      allowNull: false,
    },
    productId: {
      type: DataTypes.INTEGER,
      references: {
        model: "Products",
        key: "id",
      },
      allowNull: false,
    },
    ongkir: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    total: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
    },
  },
  {
    tableName: "transactions",
    timestamps: true,
  }
);

Transaction.belongsTo(Product, { foreignKey: "productId", as: "product" });
Transaction.belongsTo(Customer, { foreignKey: "customerId", as: "customer" });

module.exports = Transaction;
