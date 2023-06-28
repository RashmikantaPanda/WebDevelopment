var express = require('express');
var router = express.Router();
var db = require('../database');

const bodyParser = require('body-parser');
const { name } = require('ejs');

/* GET users listing. */
router.get('/booking', function (req, res, next) {
  //console.log(req.session.email+" Hello");

  if (req.session.loggedinUser) {

    db.query('SELECT * FROM parking_area ORDER BY id ', function (err, rows) {
      if (err) {
        req.flash('error', err);
        res.render('dashboard', { data: '' });
      } else {
        res.render('booking', { data: rows ,email: req.session.email ,fullName:req.session.fullName});
      }
    });


    // res.render('booking', { email: req.session.email ,fullName:req.session.fullName});
    // console.log(req.session.email);

  } else {
    res.redirect('login');
  }

});


// router.post('/car', function(req, res){
//   var email = req.body.email;

// });

module.exports = router;