const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const Customer = require('../models/customer');

exports.register = async (req, res) => {
    const { name, email, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);
    try {
        const customer = await Customer.create({ name, email, password: hashedPassword });
        res.status(201).json({ id: customer.id, name: customer.name, email: customer.email });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

exports.login = async (req, res) => {
    const { email, password } = req.body;
    const customer = await Customer.findOne({ where: { email } });

    if (customer && await bcrypt.compare(password, customer.password)) {
        const token = jwt.sign({ id: customer.id }, process.env.JWT_SECRET);
        res.json({ token });
    } else {
        res.status(401).json({ message: 'Invalid email or password' });
    }
};
