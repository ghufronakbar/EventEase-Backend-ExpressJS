"use strict";

const verifikasiOrganization = require("../middleware/verifikasi-organization");

module.exports = function (app) {
  var api_organization = require("../controllers/organization");


  //ACCOUNT CONTROLLER
  app.route(`/api/organization/login`)
    .post(api_organization.account_controller.login);

  app.route(`/api/organization/register`)
    .post(api_organization.account_controller.register);

  app.route(`/api/organization/profile`)
    .get(verifikasiOrganization, api_organization.account_controller.profile);

  app.route(`/api/organization/profile/edit`)
    .put(verifikasiOrganization, api_organization.account_controller.editProfile);

};

