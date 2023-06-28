var express = require('express');
var router = express.Router();
var db = require('../database');

const bodyParser = require('body-parser');
const { name } = require('ejs');

/* GET users listing. */
router.get('/booking/find-slot', function (req, res, next) {
  // router.post('/booking/find-slot1', function (req, res, next) {

  //console.log(req.session.email+" Hello");

  if (req.session.loggedinUser) {

    // db.query('SELECT * FROM parking_area ORDER BY id ', function (err, rows) {
    //   if (err) {
    //     req.flash('error', err);
    //     res.render('dashboard', { data: '' });
    //   } else {
    //     res.render('booking', { data: rows ,email: req.session.email ,fullName:req.session.fullName});
    //   }
    // });

   res.redirect('/booking/booking-success');

    // res.render('booking-success');
    // res.render('booking', { email: req.session.email ,fullName:req.session.fullName});
    // console.log(req.session.email);

  } else {
    res.redirect('/login');
  }

});



module.exports = router;