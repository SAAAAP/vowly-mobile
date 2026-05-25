const prisma = require('../config/db');

exports.getBrideProfile = async (req, res) => {

  try {

    const { id } = req.params;

    const bride = await prisma.brideProfile.findUnique({
      where: {
        userId: Number(id)
      },
      include: {
        user: true
      }
    });

    res.json(bride);

  } catch (error) {

    res.status(500).json({
      error: error.message
    });

  }
};

exports.updateBrideProfile = async (req, res) => {

  try {

    const { id } = req.params;

    const {
      weddingDate,
      location
    } = req.body;

    const bride = await prisma.brideProfile.upsert({
      where: {
        userId: Number(id)
      },
      update: {
        weddingDate,
        location
      },
      create: {
        userId: Number(id),
        weddingDate,
        location
      }
    });

    res.json(bride);

  } catch (error) {

    res.status(500).json({
      error: error.message
    });

  }
};