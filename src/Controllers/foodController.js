import initModels from "../Models/init-models.js";
import sequelize from "../Models/connect.js";
// import { Sequelizes } from "sequelize";
import { responseData } from "../Configs/Respone.js";
let model = initModels(sequelize);
// let Op = Sequelizes.Op;
export const getFood = async (req, res) => {
  try {
    // let data = "";
    let data = await model.food.findAll();
    responseData(res, data, "Thanh cong", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};
export const getFoodId = async (req, res) => {
  try {
    let {food_id} = req.params;

    let data = await model.food.findOne({
      where: {
        food_id,
      },
      include: ["type"],
    });

    responseData(res, data, "Thanh cong", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};
export const getFoodByType = async (req, res) => {
  try {
    let {type_id} = req.params;

    let data = await model.food.findAll({
      where: {
        type_id,
      },
      // include: ["type"],
    });

    responseData(res, data, "Thanh cong", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};


