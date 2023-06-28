
var express = require('express');
var router = express.Router();
var db=require('../database');

const bodyParser=require('body-parser'); 
const { name } = require('ejs');

/* GET users listing. */
//for admin, view parking area (nothing different view on user and admin only path difference)
router.get('/admin/parking-area', function (req, res, next) {

    if (req.session.loggedinUser) {
        // res.render('dashboard', { email: req.session.email, fullName: req.session.fullName });
        // console.log(req.session.email);

        db.query('SELECT * FROM parking_area ORDER BY id ', function (err, rows) {
            if (err) {
              req.flash('error', err);
              res.render('parking-area-admin', { data: '' });
            } else {
              res.render('parking-area-admin', { data: rows });
            }
          });


    } else {
        res.redirect('/login');
    }

    

    // db.query('SELECT * FROM parking_area ORDER BY id ', function (err, rows) {
    //   if (err) {
    //     req.flash('error', err);
    //     res.render('parking-area123', { data: '' });
    //   } else {
    //     res.render('parking-area123', { data: rows });
    //   }
    // });
  });


  //For User : To show parking locations (Locations, capacity)
  router.get('/parking-area', function (req, res, next) {

    // if (req.session.loggedinUser) {
    //     // res.render('dashboard', { email: req.session.email, fullName: req.session.fullName });
        // console.log(req.session.email);

        db.query('SELECT * FROM parking_area ORDER BY id ', function (err, rows) {
            if (err) {
              req.flash('error', err);
              res.render('parking-area-user', { data: '' });
            } else {
              res.render('parking-area-user', { data: rows });
            }
          });


    // } else {
    //     res.redirect('/login');
    // }

  });

module.exports = router;