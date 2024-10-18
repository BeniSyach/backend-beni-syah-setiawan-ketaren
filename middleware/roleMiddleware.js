const Merchant = require('../models/merchant');

const checkMerchantRole = async (req, res, next) => {
    const userId = req.user.id;

    const merchant = await Merchant.findByPk(userId);
    if (!merchant) {
        return res.status(403).json({ message: 'Akses Diblokir. Hanya Merchant Yang Bisa Membuat Product' });
    }
    next();
};

module.exports = checkMerchantRole;
