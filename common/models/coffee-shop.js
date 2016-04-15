module.exports = function(CoffeeShop) {
  CoffeeShop.status = function(cb) {
    var d = new Date();
    var h = d.getHours();
 
    var OPEN_HOUR = 6;
    var CLOSE_HOUR = 20;
    console.log('Current hour is ' + h);
    var response;
    if (h >= OPEN_HOUR && h < CLOSE_HOUR) {
      response = 'We are open for business';
    } else {
      response = 'Sorry, we are closed. Open daily from 6am to 8pm.';
    }
    cb(null, response);
  };
  CoffeeShop.remoteMethod(
    'status',
    {
      http: {path: '/status', verb: 'get'},
      returns: {arg: 'status', type: 'string', root:true}
    }
  );
};
