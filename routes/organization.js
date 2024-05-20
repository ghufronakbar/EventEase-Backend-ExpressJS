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


  //TICKET CONTROLLER
  app.route(`/api/organization/tickets/:id_event`)
    .get(verifikasiOrganization, api_organization.ticket_controller.ticketShow);

  app.route(`/api/organization/ticket/:id_ticket`)
    .get(verifikasiOrganization, api_organization.ticket_controller.ticketShowId);

  app.route(`/api/organization/ticket/add`)
    .post(verifikasiOrganization, api_organization.ticket_controller.ticketAdd);

  app.route(`/api/organization/ticket/edit/:id_ticket`)
    .put(verifikasiOrganization, api_organization.ticket_controller.ticketEdit);

  app.route(`/api/organization/ticket/set-amount/:id_ticket`)
    .put(verifikasiOrganization, api_organization.ticket_controller.ticketSetAmount);

  app.route(`/api/organization/ticket/delete/:id_ticket`)
    .delete(verifikasiOrganization, api_organization.ticket_controller.ticketDelete);

  //HISTORY CONTROLLER
  app.route(`/api/organization/histories`)
    .get(verifikasiOrganization, api_organization.history_controller.showHistory);

  app.route(`/api/organization/history/:id_history`)
    .get(verifikasiOrganization, api_organization.history_controller.showHistoryId);


  // ORDER
  app.route(`/api/organization/order/confirm/:id_history`)
    .put(verifikasiOrganization, api_organization.order_controller.handleConfirm);

    app.route(`/api/organization/order/anomaly-transaction/:id_history`)
    .put(verifikasiOrganization, api_organization.order_controller.handleAnomaly);

    app.route(`/api/organization/order/scan-ticket`)
    .put(verifikasiOrganization, api_organization.order_controller.handleScanTicket);
};

