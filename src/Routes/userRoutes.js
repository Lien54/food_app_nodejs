import express from "express";
import {
  getUserOrders,
  getlistUserLikeRes,
  placeOrder,
} from "../Controllers/userController.js";

export const userRoutes = express.Router();

userRoutes.get("/liked-res", getlistUserLikeRes);
userRoutes.get("/order", getUserOrders);
userRoutes.post("/order", placeOrder);
