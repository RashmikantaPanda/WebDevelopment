var express = require('express');
var router = express.Router();
/* GET users listing. */
router.get('/contact', function (req, res, next) {
    // if (req.session.loggedinUser) {
    //     res.render('contact-form', { email: req.session.email })
    //     // console.log(req.session.email);
    
    // } else {
    //     res.redirect('/login');
    // }

    //res.redirect('/contact');

    res.render('contact-form');
    
});

//Here we will write the code for submition of contact us form

// router.post('/contact', function (req, res) {
//     var email = req.email;
//     // console.log(email+" Hello");

//     req.session.loggedinUser = true;
//     req.session.email = email;

    



//     res.redirect('/');
// });


    module.exports = router;