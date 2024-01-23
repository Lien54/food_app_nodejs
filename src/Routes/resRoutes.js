import express from "express";
import {
  getCountLikeByRes,
  getResId,
  gettRes,
  likeRes,
  rateRes,
  unlikeRes,
} from "../Controllers/resController.js";
export const resRoutes = express.Router();

resRoutes.get("/get-res", gettRes);
resRoutes.get("/get-res-by-id/:res_id", getResId);
resRoutes.get("/count-like-res/:res_id", getCountLikeByRes);
resRoutes.post("/like-res", likeRes);
resRoutes.delete("/unlike-res", unlikeRes);
resRoutes.post("/rate-res/", rateRes);
