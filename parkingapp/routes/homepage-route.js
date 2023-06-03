
var express = require('express');
var router = express.Router();
var db=require('../database');

const bodyParser=require('body-parser'); 
const { name } = require('ejs');

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.render('home');
});

// router.post('/login', function(req, res){
//     //Nothing, copied from login
// });

module.exports = router;