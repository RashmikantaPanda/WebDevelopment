
var express = require('express');
var router = express.Router();
var db=require('../database');

const bodyParser=require('body-parser'); 
const { name } = require('ejs');

/* GET users listing. */

router.get('/admin/user-details', function (req, res, next) {

    if (req.session.loggedinUser && req.session.fullName=='Admin') {
        // res.render('dashboard', { email: req.session.email, fullName: req.session.fullName });
        // console.log(req.session.email);

        db.query('SELECT * FROM registration ORDER BY id ', function (err, rows) {
            if (err) {
              req.flash('error', err);
              //res.render('user-details', { data: '' });
            } else {
              res.render('user-details', { data: rows });
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

module.exports = router;