import initModels from "../Models/init-models.js";
import sequelize from "../Models/connect.js";

let model = initModels(sequelize);
import bcrypt from "bcrypt";
import { responseData } from "../Configs/Respone.js";
import { createRefToken, createToken } from "../Configs/jwt.js";

export const login = async (req, res) => {
  try {
  let { email, password } = req.body;
  let checkUser = await model.users.findOne({
    where: {
      email,
    },
  });
  // tồn tại => login thành công
  if (checkUser) {
    if (bcrypt.compareSync(password, checkUser.password)) {
      let key = new Date().getTime();
      let token = createToken({ user_id: checkUser.user_id, key });
      let refToken = createRefToken({ user_id: checkUser.user_id, key });
      await model.users.update(
        { ...checkUser.dataValues, refresh_token: refToken },
        {
          where: { user_id: checkUser.user_id },
        }
      );
      responseData(res, "Login thành công", token, 200);
    } else {
      responseData(res, "Mật khẩu không đúng", "", 400);
    }
  } else {
    responseData(res, "Email không đúng", "", 400);
  }
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};
export const signUp = async (req, res) => {
  try {
    let { full_name, email, password } = req.body;

    let checkUser = await model.users.findOne({
      where: {
        email,
      },
    });

    // check trùng email
    if (checkUser) {
      responseData(res, "Email đã tồn tại", "", 400);
      return;
    }

    let newData = {
      full_name,
      email,
      password: bcrypt.hashSync(password, 10), // còn gặp lại
      role: "user",
    };

    await model.users.create(newData);

    responseData(res, "Đăng ký thành công", "", 200);
  } catch {
    responseData(res, "Lỗi ...", "", 500);
  }
};
