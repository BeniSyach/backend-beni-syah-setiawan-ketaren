const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const Merchant = require('../models/merchant');

exports.register = async (req, res) => {
    const { name, email, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);
    try {
        const merchant = await Merchant.create({ name, email, password: hashedPassword });
        res.status(201).json({ id: merchant.id, name: merchant.name, email: merchant.email });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
};

exports.login = async (req, res) => {
    const { email, password } = req.body;
    const merchant = await Merchant.findOne({ where: { email } });

    if (merchant && await bcrypt.compare(password, merchant.password)) {
        const token = jwt.sign({ id: merchant.id }, process.env.JWT_SECRET);
        res.json({ token });
    } else {
        res.status(401).json({ message: 'Invalid email or password' });
    }
};
