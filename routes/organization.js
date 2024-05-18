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


  //EVENT CONTROLLER
  app.route(`/api/organization/events`)
    .get(verifikasiOrganization, api_organization.event_controller.eventShow);

  app.route(`/api/organization/event/:id_event`)
    .get(verifikasiOrganization, api_organization.event_controller.eventShowId);

    app.route(`/api/organization/event/add`)
    .post(verifikasiOrganization, api_organization.event_controller.eventAdd);

    app.route(`/api/organization/event/edit/:id_event`)
    .put(verifikasiOrganization, api_organization.event_controller.eventEdit);

    app.route(`/api/organization/event/delete/:id_event`)
    .delete(verifikasiOrganization, api_organization.event_controller.eventDelete);
};

