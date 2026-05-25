const prisma = require('../config/db');

exports.addFavoriteVendor = async (req, res) => {

  try {

    const {
      brideId,
      vendorId
    } = req.body;

    const favorite = await prisma.favoriteVendor.create({
      data: {
        brideId,
        vendorId
      }
    });

    res.json(favorite);

  } catch (error) {

    res.status(500).json({
      error: error.message
    });

  }
};

exports.getFavoriteVendors = async (req, res) => {

  try {

    const { brideId } = req.params;

    const favorites = await prisma.favoriteVendor.findMany({
      where: {
        brideId: Number(brideId)
      }
    });

    res.json(favorites);

  } catch (error) {

    res.status(500).json({
      error: error.message
    });

  }
};