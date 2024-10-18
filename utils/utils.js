exports.calculateDiscount = (total) => {
    if (total > 50000) {
        return total * 0.1; // 10% discount
    }
    return 0;
};

exports.isFreeShipping = (total) => {
    return total > 15000; // Free shipping for orders above 15000
};
