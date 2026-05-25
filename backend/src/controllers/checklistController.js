const prisma = require('../config/db');

exports.createChecklist = async (req, res) => {

  try {

    const {
      brideId,
      title
    } = req.body;

    const checklist = await prisma.weddingChecklist.create({
      data: {
        brideId,
        title
      }
    });

    res.json(checklist);

  } catch (error) {

    res.status(500).json({
      error: error.message
    });

  }
};

exports.getChecklist = async (req, res) => {

  try {

    const { brideId } = req.params;

    const checklist = await prisma.weddingChecklist.findMany({
      where: {
        brideId: Number(brideId)
      }
    });

    res.json(checklist);

  } catch (error) {

    res.status(500).json({
      error: error.message
    });

  }
};

exports.toggleChecklist = async (req, res) => {

  try {

    const { id } = req.params;

    const item = await prisma.weddingChecklist.findUnique({
      where: {
        id: Number(id)
      }
    });

    if (!item) {
      return res.status(404).json({
        error: 'Checklist item not found'
      });
    }

    const updatedChecklist = await prisma.weddingChecklist.update({
      where: {
        id: Number(id)
      },
      data: {
        completed: !item.completed
      }
    });

    res.json(updatedChecklist);

  } catch (error) {

    res.status(500).json({
      error: error.message
    });

  }
};