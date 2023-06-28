var express = require('express');
var router = express.Router();
var db=require('../database');
/* GET users listing. */
router.get('/admin', function (req, res, next) {
    if (req.session.loggedinUser) {
        res.render('admin-page', { email: req.session.email, fullName: req.session.fullName })
        // console.log(req.session.email);

    } else {
        res.redirect('/login');
    }
}); 


router.post('/dashboard', function (req, res) {
    var email = req.email;
    // console.log(email+" Hello");

    req.session.loggedinUser = true;
    req.session.email = email;

    res.redirect('/booking');
});


module.exports = router;