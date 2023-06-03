var express = require('express');
var router = express.Router();
var db=require('../database');
/* GET users listing. */
router.get('/dashboard', function (req, res, next) {
    if (req.session.loggedinUser) {
        res.render('dashboard', { email: req.session.email, fullName: req.session.fullName, loggedinUser:req.session.loggedinUser })
        // console.log(req.session.email);

    } else {
        res.redirect('/login');
    }
});   //Original

// router.get('/dashboard', function (req, res, next) {       //Experiment to display the name instead of email
//     if (req.session.loggedinUser) {
//         // res.render('dashboard', { email: req.session.email })
//         // console.log(req.session.email);
//         var e=req.session.email

//         var sql = 'SELECT * FROM registration where email=?';
//         db.query(sql,[e], function (err, data, fields) {
//             if (err) throw err;
//             // userData:data;
//             console.log(data[1]);
//             res.render('dashboard', {userData: data });
           
//         });

//     } else {
//         res.redirect('/login');
//     }
// });

// router.get('/user-list', function (req, res, next) {
//     var sql = 'SELECT * FROM users';
//     db.query(sql, function (err, data, fields) {
//         if (err) throw err;
//         res.render('user-list', { title: 'User List', userData: data });
//     });
// });    // Example




router.post('/dashboard', function (req, res) {
    var email = req.email;
    // console.log(email+" Hello");

    req.session.loggedinUser = true;
    req.session.email = email;

    res.redirect('/booking');
});


module.exports = router;