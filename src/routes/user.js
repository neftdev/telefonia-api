const { Router } = require("express");
const router = Router();
const userController = require("../controllers/user.controller");

router.get("/users", userController.getUsers);

router.post("/register", userController.createUser);

router.put("/users/:cui", userController.deleteUser);

router.post("/login", userController.login);

router.post("/user", userController.getUser);

module.exports = router;
