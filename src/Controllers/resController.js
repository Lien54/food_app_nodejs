import initModels from "../Models/init-models.js";
import sequelize from "../Models/connect.js";

import { responseData } from "../Configs/Respone.js";
import like_res from "../Models/like_res.js";
import { decodeToken } from "../Configs/jwt.js";

let model = initModels(sequelize);

export const gettRes = async (req, res) => {
  try {
    // let data = "";
    let data = await model.restaurant.findAll();
    responseData(res, data, "Thanh cong", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};
export const getResId = async (req, res) => {
  try {
    // let data = "";
    let { res_id } = req.params;
    let data = await model.restaurant.findOne({
      where: {
        res_id,
      },
    });
    responseData(res, data, "Thanh cong", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};

export const getCountLikeByRes = async (req, res) => {
  try {
    let { res_id } = req.params;
    let countlike = await model.like_res.count({
      where: { res_id },
    });
    responseData(res, countlike, "Thanh cong", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};
export const likeRes = async (req, res) => {
  try {
    let { token } = req.headers;
    let dToken = decodeToken(token);
    let { user_id } = dToken.data;

    const { res_id } = req.body;
    const existingLike = await model.like_res.findOne({
      where: {
        user_id,
        res_id,
      },
    });

    if (existingLike) {
      return res.status(400).json({ message: "Đã like nhà hàng này trước đó" });
    }
    const newLike = {
      user_id,
      res_id,
      date_like: new Date(),
    };
    await model.like_res.create(newLike);
    responseData(res, data, "Thanh cong", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};

export const unlikeRes = async (req, res) => {
  try {
    let { token } = req.headers;
    // giải mã => object giống bên trang jwt.io
    let dToken = decodeToken(token);

    let { user_id } = dToken.data;
    const { res_id } = req.body;

    const data = await model.like_res.destroy({
      where: { user_id, res_id },
    });

    if (data === 0) {
      return res
        .status(400)
        .json({ message: "Người dùng chưa thích nhà hàng này" });
    }

    responseData(res, data, "Thanh cong", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};

export const rateRes = async (req, res) => {
  try {
    let { token } = req.headers;
    // giải mã => object giống bên trang jwt.io
    let dToken = decodeToken(token);

    let { user_id } = dToken.data;
    const { res_id, amount } = req.body;
    const existingRate = await model.rate_res.findOne({
      where: { user_id, res_id },
    });

    if (existingRate) {
      return responseData(
        res,
        "",
        "Người dùng đã đánh giá nhà hàng này trước đó",
        400
      );
    }

    const newRate = {
      user_id,
      res_id,
      amount,
      date_rate: new Date(),
    };

    await model.rate_res.create(newRate);
    responseData(res, newRate, "Thành công", 200);
  } catch {
    responseData(res, "Lỗi server", "", 500);
  }
};
