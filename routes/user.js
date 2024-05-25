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


  // EVENT CONTROLLER
  app.route('/api/user/events') // ?limit=(int)
    .get(UserVerification, UserController.event_controller.eventAll);

  app.route('/api/user/events/recommended') // RANDOM ?limit=(int)
    .get(UserVerification, UserController.event_controller.eventRecommended);

  app.route('/api/user/event/:id_event')
    .get(UserVerification, UserController.event_controller.eventId);

  // HISTORY CONTROLLER


};

