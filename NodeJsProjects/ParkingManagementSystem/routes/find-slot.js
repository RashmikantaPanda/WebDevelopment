var express = require('express');

var router = express.Router();

var database = require('../database');
const bodyParser=require('body-parser'); 



router.post('/booking/find-slot',bodyParser.json(), function (req, res, next) {

    var emaild = req.body.emailid;

    var user_name = req.body.user_name;

    var owner_name = req.body.owner_name;

    var registration_no = req.body.registration_no;

    var parking_address = req.body.parking_address;

    var date = req.body.date;
    var from_time = req.body.from_time;
    var to_time = req.body.to_time;
    console.log(parking_address);

    var query = `
	select location,capacity from parking_area 
	WHERE location = "${parking_address}"
	`;

    database.query(query, function (error, data) {

        if (error) {
            throw error;
        }
        else {
            // response.redirect('/admin/sample-data');
            res.render('click-to-book', { data: data, email: emaild, user_name: user_name, ownerName: owner_name, regisNo: registration_no, date: date, fromTime: from_time, toTime: to_time });
        }

    });

});

module.exports = router;

