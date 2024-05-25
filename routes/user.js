"use strict";


module.exports = function (app) {
  const UserController = require("../controllers/user");
  const UserVerification = require("../middleware/verifikasi-user");

  // ACCOUNT CONTROLLER
  app.route(`/api/user/register`)
    .post(UserController.account_controller.register);

  app.route(`/api/user/login`)
    .post(UserController.account_controller.login);

  app.route('/api/user/profile')
    .get(UserVerification, UserController.account_controller.profile);

  app.route('/api/user/profile/edit')
    .put(UserVerification, UserController.account_controller.editProfile);

  app.route('/api/user/profile/password')
    .put(UserVerification, UserController.account_controller.editPassword);



};

