var express = require('express');
var router = express.Router();
var db = require('../moduli/db');
var auth = require('../moduli/auth');
var formidable = require('formidable');

router.get('/', auth, function(req, res, next){
	var sql = "SELECT DATE_FORMAT(DATUM_VNOSA,'%d.%m.%Y, %H:%m' ) as DATUM_VNOSA, d.TIP, (KOLICINA * MON_VAL) as VREDNOST, CITIZEN_NAME, NAZIV, KOLICINA, USERNAME FROM donacija d JOIN citizen c on d.CITIZEN=c.CITIZEN_ID JOIN sif_res sr ON sr.RES_ID=d.RESURS JOIN user u ON u.USER_ID=d.VNESEL_USER WHERE KOLICINA>0 ORDER BY DATUM_VNOSA DESC"; 
	db.query(sql, function(err, rows){
		res.render('overview_donation', {items : rows, user : req.session.user});
	});
});

router.get('/new', auth, function(req, res, next){
	var sql = "SELECT CITIZEN_NAME, CITIZEN_ID FROM citizen;" +
			"SELECT RES_ID, NAZIV from sif_res;";
	db.query(sql, function(err, rows){
		res.render('add_donation', {citizens : rows[0], resources : rows[1], user : req.session.user});
	});
});

router.post('/new', auth, function(req, res, next){
	var form = formidable.IncomingForm();
	form.parse(req, function(err, polja){
		if(err) {
			console.log("napaka pri formi: ", err);	
		}
		var datum = new Date();
		var citizen = polja.Citizen;
		var kol = polja.Kolicina;
		var resurs = polja.Resurs;
		var tip = polja.Tip;
		var vnesel = req.session.user.id;
		var sql_sel = "SELECT BALANCE, MON_VAL FROM citizen, sif_res WHERE CITIZEN_ID=" + citizen + " AND RES_ID=" + resurs;
		db.query(sql_sel, function(err, balance){
			var stanje = parseFloat(balance[0].BALANCE);
			var vrednost = parseFloat(balance[0].MON_VAL);
			if(tip == 'P'){
				stanje += kol * vrednost;
			} else if(tip == 'M'){
				stanje -= kol * vrednost;
			}
			//v stanje imamo nov balance
			var sql = "INSERT INTO donacija(DATUM_VNOSA, CITIZEN, KOLICINA, RESURS, TIP, VNESEL_USER) VALUES (?,?,?,?,?,?);" +
						"UPDATE citizen SET BALANCE="+stanje+" WHERE CITIZEN_ID="+citizen;
			db.query(sql, [datum, citizen, kol, resurs, tip, vnesel], function(err, rows){
				if(err) throw err;
				res.redirect('/donations');
			});
		});
	});
});

router.get('/:id', auth, function(req, res, next){
	var sql = "SELECT DATE_FORMAT(DATUM_VNOSA,'%d.%m.%Y, %H:%m' ) as DATUM_VNOSA, (KOLICINA * MON_VAL) as VREDNOST, CITIZEN_NAME, NAZIV, KOLICINA, USERNAME,d.TIP FROM donacija d JOIN citizen c on d.CITIZEN=c.CITIZEN_ID JOIN sif_res sr ON sr.RES_ID=d.RESURS JOIN user u ON u.USER_ID=d.VNESEL_USER WHERE KOLICINA>0 AND CITIZEN_ID=" + req.params.id + " ORDER BY DATUM_VNOSA DESC";
	db.query(sql, function(err, rows){
		console.log("vrstice: ", rows);
		res.render('citizen_donations', {items : rows, user : req.session.user});
	});
});



module.exports = router;