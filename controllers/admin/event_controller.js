'use strict';

var response = require('../../res');
var connection = require('../../connection');
var md5 = require('md5');
var ip = require('ip');
var config = require('../../config/secret')
var jwt = require('jsonwebtoken');
var mysql = require('mysql');


exports.eventShow = async (req, res) => {
    const qEventShow = `
        SELECT e.id_event, e.id_organization, o.organization_name, e.event_name, e.description, e.location,
               e.event_image, e.site_plan_image, e.type AS event_type, e.status, e.payment_information,
               e.event_start, e.event_end, e.created_at, t.id_ticket, t.type AS ticket_type,
               t.amount, t.sold, t.price, t.date_start, t.date_end
        FROM events AS e 
        LEFT JOIN tickets AS t ON e.id_event = t.id_event
        LEFT JOIN organizations AS o ON e.id_organization = o.id_organization
    `;

    connection.query(qEventShow, function (error, rows) {
        if (error) {
            console.log(error);
            res.status(500).json({ status: 500, message: "Internal Server Error" });
        } else {
            // Process the rows to create the desired output format
            const events = {};

            rows.forEach(row => {
                const eventId = row.id_event;

                if (!events[eventId]) {
                    events[eventId] = {
                        id_event: row.id_event,
                        id_organization: row.id_organization,
                        organization_name: row.organization_name,
                        event_name: row.event_name,
                        description: row.description,
                        location: row.location,
                        event_image: row.event_image,
                        site_plan_image: row.site_plan_image,
                        event_type: row.event_type,
                        status: row.status,
                        payment_information: row.payment_information,
                        event_start: row.event_start,
                        event_end: row.event_end,
                        created_at: row.created_at,
                        total_type: 0,
                        total_ticket: 0,
                        total_sold: 0,
                        tickets: []
                    };
                }

                if (row.id_ticket) {
                    events[eventId].tickets.push({
                        id_ticket: row.id_ticket,
                        ticket_type: row.ticket_type,
                        amount: row.amount,
                        sold: row.sold,
                        price: row.price,
                        date_start: row.date_start,
                        date_end: row.date_end
                    });

                    events[eventId].total_type += 1;
                    events[eventId].total_ticket += row.amount;
                    events[eventId].total_sold += row.sold;
                }
            });

            const result = Object.values(events);

            res.json(result);
        }
    });
};


exports.eventShowId = async (req, res) => {
    const { id_event } = req.params
    const qEventShowId = `
        SELECT e.id_event, e.id_organization, o.organization_name, e.event_name, e.description, e.location,
               e.event_image, e.site_plan_image, e.type AS event_type, e.status, e.payment_information,
               e.event_start, e.event_end, e.created_at, t.id_ticket, t.type AS ticket_type,
               t.amount, t.sold, t.price, t.date_start, t.date_end
        FROM events AS e 
        LEFT JOIN tickets AS t ON e.id_event = t.id_event
        LEFT JOIN organizations AS o ON e.id_organization = o.id_organization
        WHERE e.id_event=?
    `;

    connection.query(qEventShowId, id_event, function (error, rows) {
        if (error) {
            console.log(error);
            res.status(500).json({ status: 500, message: "Internal Server Error" });
        } else {
            // Process the rows to create the desired output format
            const events = {};

            rows.forEach(row => {
                const eventId = row.id_event;

                if (!events[eventId]) {
                    events[eventId] = {
                        id_event: row.id_event,
                        id_organization: row.id_organization,
                        organization_name: row.organization_name,
                        event_name: row.event_name,
                        description: row.description,
                        location: row.location,
                        event_image: row.event_image,
                        site_plan_image: row.site_plan_image,
                        event_type: row.event_type,
                        status: row.status,
                        payment_information: row.payment_information,
                        event_start: row.event_start,
                        event_end: row.event_end,
                        created_at: row.created_at,
                        total_type: 0,
                        total_ticket: 0,
                        total_sold: 0,
                        tickets: []
                    };
                }

                if (row.id_ticket) {
                    events[eventId].tickets.push({
                        id_ticket: row.id_ticket,
                        ticket_type: row.ticket_type,
                        amount: row.amount,
                        sold: row.sold,
                        price: row.price,
                        date_start: row.date_start,
                        date_end: row.date_end
                    });

                    events[eventId].total_type += 1;
                    events[eventId].total_ticket += row.amount;
                    events[eventId].total_sold += row.sold;
                }
            });

            const result = Object.values(events);

            res.json(result);
        }
    });
};


exports.eventReject = async (req, res) => {
    const { id_event } = req.params
    const qEventReject = `UPDATE events SET status=1 WHERE id_event=?`

    connection.query(qEventReject, id_event,
        function (error, rows, result) {
            if (error) {
                console.log(error);
                res.status(500).json({ status: 500, message: "Internal Server Error" });
            } else {
                res.status(200).json({ status: 200, message: "Event has been rejected" });
            }
        }
    )
}

exports.eventApprove = async (req, res) => {
    const { id_event } = req.params
    const qEventApprove = `UPDATE events SET status=2 WHERE id_event=?`

    connection.query(qEventApprove, id_event,
        function (error, rows, result) {
            if (error) {
                console.log(error);
                res.status(500).json({ status: 500, message: "Internal Server Error" });
            } else {                
                res.status(200).json({ status: 200, message: "Event has been approved" });
            }
        }
    )
}

exports.eventPast = async (req, res) => {
    const qEventPast = `
        SELECT e.id_event, e.id_organization, o.organization_name, e.event_name, e.description, e.location,
               e.event_image, e.site_plan_image, e.type AS event_type, e.status, e.payment_information,
               e.event_start, e.event_end, e.created_at, t.id_ticket, t.type AS ticket_type,
               t.amount, t.sold, t.price, t.date_start, t.date_end
        FROM events AS e 
        LEFT JOIN tickets AS t ON e.id_event = t.id_event
        LEFT JOIN organizations AS o ON e.id_organization = o.id_organization
        WHERE e.event_end < CURDATE()
    `;

    connection.query(qEventPast, function (error, rows) {
        if (error) {
            console.log(error);
            res.status(500).json({ status: 500, message: "Internal Server Error" });
        } else {
            // Process the rows to create the desired output format
            const events = {};

            rows.forEach(row => {
                const eventId = row.id_event;

                if (!events[eventId]) {
                    events[eventId] = {
                        id_event: row.id_event,
                        id_organization: row.id_organization,
                        organization_name: row.organization_name,
                        event_name: row.event_name,
                        description: row.description,
                        location: row.location,
                        event_image: row.event_image,
                        site_plan_image: row.site_plan_image,
                        event_type: row.event_type,
                        status: row.status,
                        payment_information: row.payment_information,
                        event_start: row.event_start,
                        event_end: row.event_end,
                        created_at: row.created_at,
                        total_type: 0,
                        total_ticket: 0,
                        total_sold: 0,
                        tickets: []
                    };
                }

                if (row.id_ticket) {
                    events[eventId].tickets.push({
                        id_ticket: row.id_ticket,
                        ticket_type: row.ticket_type,
                        amount: row.amount,
                        sold: row.sold,
                        price: row.price,
                        date_start: row.date_start,
                        date_end: row.date_end
                    });

                    events[eventId].total_type += 1;
                    events[eventId].total_ticket += row.amount;
                    events[eventId].total_sold += row.sold;
                }
            });

            const result = Object.values(events);

            res.json(result);
        }
    });
};



exports.eventSoon = async (req, res) => {
    const qEventSoon = `
        SELECT e.id_event, e.id_organization, o.organization_name, e.event_name, e.description, e.location,
               e.event_image, e.site_plan_image, e.type AS event_type, e.status, e.payment_information,
               e.event_start, e.event_end, e.created_at, t.id_ticket, t.type AS ticket_type,
               t.amount, t.sold, t.price, t.date_start, t.date_end
        FROM events AS e 
        LEFT JOIN tickets AS t ON e.id_event = t.id_event
        LEFT JOIN organizations AS o ON e.id_organization = o.id_organization
        WHERE e.event_start > CURDATE() 
    `;

    connection.query(qEventSoon, function (error, rows) {
        if (error) {
            console.log(error);
            res.status(500).json({ status: 500, message: "Internal Server Error" });
        } else {
            // Process the rows to create the desired output format
            const events = {};

            rows.forEach(row => {
                const eventId = row.id_event;

                if (!events[eventId]) {
                    events[eventId] = {
                        id_event: row.id_event,
                        id_organization: row.id_organization,
                        organization_name: row.organization_name,
                        event_name: row.event_name,
                        description: row.description,
                        location: row.location,
                        event_image: row.event_image,
                        site_plan_image: row.site_plan_image,
                        event_type: row.event_type,
                        status: row.status,
                        payment_information: row.payment_information,
                        event_start: row.event_start,
                        event_end: row.event_end,
                        created_at: row.created_at,
                        total_type: 0,
                        total_ticket: 0,
                        total_sold: 0,
                        tickets: []
                    };
                }

                if (row.id_ticket) {
                    events[eventId].tickets.push({
                        id_ticket: row.id_ticket,
                        ticket_type: row.ticket_type,
                        amount: row.amount,
                        sold: row.sold,
                        price: row.price,
                        date_start: row.date_start,
                        date_end: row.date_end
                    });

                    events[eventId].total_type += 1;
                    events[eventId].total_ticket += row.amount;
                    events[eventId].total_sold += row.sold;
                }
            });

            const result = Object.values(events);

            res.json(result);
        }
    });
};


exports.eventInProgress = async (req, res) => {
    const qEventInProgress = `
        SELECT e.id_event, e.id_organization, o.organization_name, e.event_name, e.description, e.location,
               e.event_image, e.site_plan_image, e.type AS event_type, e.status, e.payment_information,
               e.event_start, e.event_end, e.created_at, t.id_ticket, t.type AS ticket_type,
               t.amount, t.sold, t.price, t.date_start, t.date_end
        FROM events AS e 
        LEFT JOIN tickets AS t ON e.id_event = t.id_event
        LEFT JOIN organizations AS o ON e.id_organization = o.id_organization
        WHERE e.event_start < CURDATE() AND e.event_end > CURDATE()
    `;

    connection.query(qEventInProgress, function (error, rows) {
        if (error) {
            console.log(error);
            res.status(500).json({ status: 500, message: "Internal Server Error" });
        } else {
            // Process the rows to create the desired output format
            const events = {};

            rows.forEach(row => {
                const eventId = row.id_event;

                if (!events[eventId]) {
                    events[eventId] = {
                        id_event: row.id_event,
                        id_organization: row.id_organization,
                        organization_name: row.organization_name,
                        event_name: row.event_name,
                        description: row.description,
                        location: row.location,
                        event_image: row.event_image,
                        site_plan_image: row.site_plan_image,
                        event_type: row.event_type,
                        status: row.status,
                        payment_information: row.payment_information,
                        event_start: row.event_start,
                        event_end: row.event_end,
                        created_at: row.created_at,
                        total_type: 0,
                        total_ticket: 0,
                        total_sold: 0,
                        tickets: []
                    };
                }

                if (row.id_ticket) {
                    events[eventId].tickets.push({
                        id_ticket: row.id_ticket,
                        ticket_type: row.ticket_type,
                        amount: row.amount,
                        sold: row.sold,
                        price: row.price,
                        date_start: row.date_start,
                        date_end: row.date_end
                    });

                    events[eventId].total_type += 1;
                    events[eventId].total_ticket += row.amount;
                    events[eventId].total_sold += row.sold;
                }
            });

            const result = Object.values(events);

            res.json(result);
        }
    });
};
