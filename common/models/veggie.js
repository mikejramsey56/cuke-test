module.exports = function(Veggie) {
  Veggie.teapot = function(cb) {
    var data = {
      'message': 'I am a teapot',
    }
    cb(null, data);
  }

  Veggie.afterRemote('teapot', function(ctx, instance, next) {
    ctx.res.statusCode = 418;
    next();
  });

  Veggie.remoteMethod(
    'teapot',
    {
      http: { verb: 'get' },
      returns: { arg: 'data', type: 'object', root: true },
    }
  );
};
