
var express = require('express');
var router = express.Router();  
var db=require('../database');

const bodyParser=require('body-parser'); 
const { name } = require('ejs');

/* GET users listing. */
router.get('/login', function(req, res, next) {
  res.render('login-form');
});

router.post('/login', function(req, res){
    // var email = req.body.email;
    var email = req.body.email;

    var password = req.body.password;
    // for printing the email,pass entered by the user 
    // console.log(email+' '+password);

    var sql='SELECT * FROM registration WHERE email =? AND password =?';
    db.query(sql, [email, password], function (err, data) {
        if(err) throw err
        if(data.length>0){

    
            req.session.loggedinUser= true;
            req.session.email= email;
            req.session.fullName=data[0].fullName;

            
            
            // res.redirect('/dashboard', { rows: data });
           var uName=data[0].fullName;
           var uEmail=data[0].email;
            // console.log(uName);
            // console.log(uEmail);

            
            
            // res.render('dashboard', { data: data });

            if(uName=="Admin"){
                res.redirect('/admin');
            }
            else{
                res.redirect('/dashboard');
            }

            

        }else{
            res.render('login-form',{alertMsg:"Your Email Address or password is wrong"});
        }
    });

});

module.exports = router;