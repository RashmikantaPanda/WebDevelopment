var express = require('express');

var router = express.Router();

var database = require('../database');

router.get('/admin/sample-data', function(request, response, next){

	var query = "SELECT * FROM parking_area ORDER BY id ";

	database.query(query, function(error, data){

		if(error)
		{
			throw error; 
		}
		else
		{
			response.render('sample-data', {title:'Manage Parking Area', action:'list', sampleData:data});
		}

	});

});

router.get('/admin/sample-data/edit/:id', function(request, response, next){

	var id = request.params.id;

	var query = `SELECT * FROM parking_area WHERE id = "${id}"`;

	database.query(query, function(error, data){

		response.render('sample-data', {title: 'Edit Parking Location Data', action:'edit', sampleData:data[0]});

	});

});



router.get("/admin/sample-data/add", function(request, response, next){

	response.render("sample-data", {title:'Add New Parking Locations ', action:'add'});

});

router.post("/sample-data/add", function(request, response, next){

	var location = request.body.location;

	var capacity = request.body.capacity;

    // inputData = {
    //     location: req.body.location,
    //     capacity: req.body.email
    // }

	var query = `
	INSERT INTO parking_area 
	(location, capacity) 
	VALUES ("${location}", "${capacity}");
	`;

	database.query(query, function(error, data){

		if(error)
		{
			throw error;
		}	
		else
		{
			response.redirect('/admin/sample-data');
		}

	});

});

router.post('/sample-data/edit/:id', function(request, response, next){

	var id = request.params.id;

	var location = request.body.location;

	var capacity = request.body.capacity;

	// var age = request.body.age;

	// var gender = request.body.gender;

	var query = `
	UPDATE parking_area 
	SET location = "${location}", 
	capacity = "${capacity}"
	
	WHERE id = "${id}"
	`;

	database.query(query, function(error, data){

		if(error)
		{
			throw error;
		}
		else
		{
			response.redirect('/admin/sample-data');
		}

	});

});

router.get('/admin/sample-data/delete/:id', function(request, response, next){

	var id = request.params.id; 

	var query = `
	DELETE FROM parking_area WHERE id = "${id}"
	`;

	database.query(query, function(error, data){

		if(error)
		{
			throw error;
		}
		else
		{
			response.redirect("/admin/sample-data");
		}

	});

});

module.exports = router;

