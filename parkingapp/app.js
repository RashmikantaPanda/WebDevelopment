var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var session=require('express-session');

const bodyParser=require('body-parser'); 




// var indexRouter = require('./routes/registration');
// var usersRouter = require('./routes/users');

var app = express();

app.use(bodyParser.urlencoded({extended: false}));

app.use(session({
  secret:'webslesson',
  resave: false,
    saveUninitialized: true,
    cookie: { maxAge: 1000000 }

}));

//body-parser  
   
    // parse application/json 
    app.use(bodyParser.json());  
    
    app.post('post',(req,res)=>{
        console.log(req.body);
        res.json(req.body);
    });
  //upto here


var registrationRouter = require('./routes/registration-route');
var loginRouter = require('./routes/login-route');
var dashboardRouter = require('./routes/dashboard-route');
var logoutRouter = require('./routes/logout-route');
var bookingRouter= require('./routes/booking-route');
var homeRouter=require('./routes/homepage-route');
var contactRouter=require('./routes/contact-route');
var parkingAreaRouter=require('./routes/parking-area-route');
var adminRouter=require('./routes/admin-route');
var userdataRoute=require('./routes/user-details-route');
var sampledataRoute=require('./routes/sample-data-route');
var findslotRoute=require('./routes/find-slot');
var clickToBookRoute=require('./routes/click-to-book-route');
var bookingSuccessRoute=require('./routes/booking-success-route');


app.use('/', registrationRouter);
app.use('/', loginRouter);
app.use('/', dashboardRouter);
app.use('/', logoutRouter);
app.use('/', bookingRouter);
app.use('/', homeRouter);
app.use('/', contactRouter);
app.use('/', parkingAreaRouter);
app.use('/', adminRouter);
app.use('/', userdataRoute);
app.use('/', sampledataRoute);
app.use('/', findslotRoute);
app.use('/', clickToBookRoute);
app.use('/', bookingSuccessRoute);





// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// app.get('/', function(req,res){
//   res.sendFile(path.join(__dirname,'./public/home.html'));
// });

app.get('/about',function(req,res){
  res.send("About Us Page is under construction");
});

// app.get('/contact-form', function(req,res){
//   res.sendFile(path.join(__dirname,'./public/contact-form1.html'));
// });

// app.use('/', indexRouter);
// app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

// app.listen(5000, ()=> {
//   console.log("server started on port 5000")
// })

module.exports = app;
