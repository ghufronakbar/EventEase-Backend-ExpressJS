"use strict";

const verifikasiAdmin = require("../middleware/verifikasi-admin");

module.exports = function (app) {
  var api_admin = require("../controllers/admin");


  //LOGIN
  app.route(`/api/admin/login`)
    .post(api_admin.account_controller.login);


  // ORGANIZATIONS
  app.route(`/api/admin/organizations`)
    .get(verifikasiAdmin, api_admin.organization_controller.orgShow);

  app.route(`/api/admin/organization/:id_organization`)
    .get(verifikasiAdmin, api_admin.organization_controller.orgShowId);

  app.route(`/api/admin/organization/approve/:id_organization`)
    .put(verifikasiAdmin, api_admin.organization_controller.orgApprove);

  app.route(`/api/admin/organization/banned/:id_organization`)
    .put(verifikasiAdmin, api_admin.organization_controller.orgBanned);

  app.route(`/api/admin/organization/reject/:id_organization`)
    .delete(verifikasiAdmin, api_admin.organization_controller.orgReject);

  // EVENTS
  app.route(`/api/admin/events`)
    .get(verifikasiAdmin, api_admin.event_controller.eventShow);

  app.route(`/api/admin/event/:id_event`)
    .get(verifikasiAdmin, api_admin.event_controller.eventShowId);

    app.route(`/api/admin/events/past`)
    .get(verifikasiAdmin, api_admin.event_controller.eventPast);

    app.route(`/api/admin/events/soon`)
    .get(verifikasiAdmin, api_admin.event_controller.eventSoon);

    app.route(`/api/admin/events/in-progress`)
    .get(verifikasiAdmin, api_admin.event_controller.eventInProgress);

  app.route(`/api/admin/event/reject/:id_event`)
    .put(verifikasiAdmin, api_admin.event_controller.eventReject);

  app.route(`/api/admin/event/approve/:id_event`)
    .put(verifikasiAdmin, api_admin.event_controller.eventApprove);

};

