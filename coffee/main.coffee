fs=require "fs"
@main=(o,cb)->
  console.log fs.readFileSync("resource/motd").toString()
  cb null,o