
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index', { title: 'Commit 1', message: 'Hola Mundo Clase Con el script de shell' });
};