import initModels from "../Models/init-models.js";
import sequelize from "../Models/connect.js";

import { responseData } from "../Configs/Respone.js";
import { decodeToken } from "../Configs/jwt.js";

let model = initModels(sequelize);

export const getlistUserLikeRes = async (req, res) => {
  try {
  let { token } = req.headers;
  // giải mã => object giống bên trang jwt.io
  let dToken = decodeToken(token);

  let { user_id } = dToken.data;
  const data = await model.like_res.findAll({
    where: { user_id },
    include: ["re"],
  });

  responseData(res, data, "Thanh cong", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};

export const getUserOrders = async (req, res) => {
  try {
    let { token } = req.headers;
    // giải mã => object giống bên trang jwt.io
    let dToken = decodeToken(token);

    let { user_id } = dToken.data;
    const userOrders = await model.orders.findAll({
      where: { user_id },
      include: [
        {
          model: model.food,
          as: "food",
        },
      ],
    });

    responseData(res, userOrders, "Thành công", 200);
  } catch (error) {
    console.error(error);
    responseData(res, "Lỗi server", "", 500);
  }
};

export const placeOrder = async (req, res) => {
  try {
    let { token } = req.headers;
    // giải mã => object giống bên trang jwt.io
    let dToken = decodeToken(token);

    let { user_id } = dToken.data;
    const { food_id, amount, codes, arr_sub_id } = req.body;

    // Tạo đơn đặt hàng mới
    const newOrder = await model.orders.create({
      user_id,
      food_id,
      amount,
      codes,
      arr_sub_id,
    });

    responseData(res, newOrder, "Đặt hàng thành công", 201);
  } catch (error) {
    console.error(error);
    responseData(res, "Lỗi server", "", 500);
  }
};
