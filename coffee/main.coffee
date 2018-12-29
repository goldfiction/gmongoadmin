gqexpress=require "gqexpress"
mongo=require "gqmongodb"

runServer=(o,cb)->
  o.use=(app,o)->
    app.post '/query',(req,res)->
      o2=req.body.connection
      o2.key=req.body.key
      o2.data={}
      mongo.find o2,(e,docs)->
        res.send 200,JSON.stringify(docs,null,2)
    app.put '/query',(req,res)->
      o2=req.body.connection
      o2.key=req.body.key
      o2.data=req.body.data
      mongo.upsert o2,(e,docs)->
        res.send 200,JSON.stringify(docs,null,2)
    app.delete '/query',(req,res)->
      o2=req.body.connection
      o2.key=req.body.key
      o2.data={}
      mongo.delete o2,(e,docs)->
        res.send 200,JSON.stringify(docs,null,2)
    app.get '/',(req,res)->res.render 'index',{}
  gqexpress.startServer o,cb

@main=(o,cb)->
  runServer(o,cb)