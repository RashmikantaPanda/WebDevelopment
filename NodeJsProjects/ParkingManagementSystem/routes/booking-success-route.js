var express = require('express');
var router = express.Router();
/* GET users listing. */
router.get('/booking/booking-success', function (req, res, next) {

    res.render('booking-success');
    
});

// router.post('/booking/booking-success', function (req, res, next) {

//     res.render('booking-success');
    
// });
module.exports = router;
