import express from "express";
import { getFood, getFoodByType, getFoodId } from "../Controllers/foodController.js";
export const foodRoutes = express.Router();

foodRoutes.get("/get-food", getFood);
foodRoutes.get("/get-food-id/:food_id", getFoodId);
foodRoutes.get("/get-food-by-type/:type_id", getFoodByType);
