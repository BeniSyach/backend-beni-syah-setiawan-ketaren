const { DataTypes } = require("sequelize");
const { sequelize } = require("../config/db");
const Merchant = require("./merchant");

const Product = sequelize.define(
  "Product",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    price: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false,
    },
    merchantId: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    tableName: "Products",
    timestamps: true,
  }
);

Product.belongsTo(Merchant, { foreignKey: "merchantId", as: "merchant" });

module.exports = Product;
