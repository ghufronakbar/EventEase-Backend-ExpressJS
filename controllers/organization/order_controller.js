'use strict';

var response = require('../../res');
var connection = require('../../connection');
var md5 = require('md5');
var ip = require('ip');
var config = require('../../config/secret')
var jwt = require('jsonwebtoken');
var mysql = require('mysql');

exports.handleConfirm = async (req, res) => {
    const { id_history } = req.params
    const qHandleConfirm = `UPDATE histories SET paid=4 WHERE id_history=?`

    await connection.query(qHandleConfirm, id_history,
        (error, rows, result) => {
            if (error) {
                console.log(error);
                return res.status(500).json({ status: 500, message: "Internal Server Error" });
            } else {
                return res.status(200).json({ status: 200, message: "Order confirmed" });
            }
        }
    )
}

exports.handleAnomaly = async (req, res) => {
    const { id_history } = req.params
    const qHandleConfirm = `UPDATE histories SET paid=2 WHERE id_history=?`
    connection.query(qHandleConfirm, id_history,
        (error, rows, result) => {
            if (error) {
                console.log(error);
                return res.status(500).json({ status: 500, message: "Internal Server Error" });
            } else {
                const qGetAmount = `SELECT amount,index_ticket FROM histories WHERE id_history=?`
                connection.query(qGetAmount, id_history,
                    (error, rows, result) => {
                        if (error) {
                            console.log(error);
                            return res.status(500).json({ status: 500, message: "Internal Server Error" });
                        } else {
                            const amount = rows[0].amount
                            const index_ticket = rows[0].index_ticket
                            const qGetSold = `SELECT sold FROM tickets WHERE id_ticket=?`
                            connection.query(qGetSold, index_ticket,
                                (error, rows, result) => {
                                    if (error) {
                                        console.log(error);
                                        return res.status(500).json({ status: 500, message: "Internal Server Error" });
                                    } else {
                                        if (rows.length === 0) {                                            
                                            return res.status(200).json({ status: 200, message: "Cancel order successfully, but the ticket may have been deleted" });
                                        }
                                        const sold = rows[0].sold                                        
                                        const setSold = sold - amount
                                        const qUpdateSold = `UPDATE tickets SET sold=? WHERE id_ticket=?`
                                        connection.query(qUpdateSold, [setSold, index_ticket],
                                            (error, rows, result) => {
                                                if (error) {
                                                    console.log(error);
                                                    return res.status(204).json({ status: 204, message: "Cancel order successfully but the ticket may has been deleted" });
                                                } else {
                                                    return res.status(200).json({ status: 200, message: "Cancel order successfully" });
                                                }
                                            }
                                        )
                                    }
                                }
                            )
                        }
                    }
                )
            }
        }
    )
}