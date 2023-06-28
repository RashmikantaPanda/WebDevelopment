var express = require('express');
var router = express.Router();
var db = require('../database');


/* GET users listing. */
router.get('/contact', function (req, res, next) {

    res.render('contact-form');

});

router.post('/contact', function (req, res, next) {
    var dateTime=new Date();

    inputData = {
        name: req.body.name,
        email: req.body.email,
        message: req.body.message,
        date:dateTime

    }

    var sql = 'INSERT INTO contact_details  SET ?';
    db.query(sql, inputData, function (err, data) {
        if (err) throw err;
        else {
            var msg = "Contact Saved Successfully !";
            res.render('contact-form', { alertMsg: msg });
        }
    });

});

//For admin - to show the contact details

router.get('/admin/contact-details', function (req, res, next) {

    if (req.session.loggedinUser && req.session.fullName=='Admin') {
        // res.render('dashboard', { email: req.session.email, fullName: req.session.fullName });
        // console.log(req.session.email);

        db.query('SELECT * FROM contact_details ORDER BY id ', function (err, rows) {
            if (err) {
              req.flash('error', err);
              //res.render('user-details', { data: '' });
            } else {
              res.render('contact-details', { data: rows });
            }
          });


    } else {
        res.redirect('/login');
    }
});


module.exports = router;
