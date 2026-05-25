const prisma = require('../config/db');

exports.getVendors = async (req, res) => {

  try {

    const vendors = await prisma.vendorProfile.findMany({
      include: {
        user: true,
        portfolios: true,
        packages: true
      }
    });

    res.json(vendors);

  } catch (error) {

    res.status(500).json({
      error: error.message
    });

  }

};