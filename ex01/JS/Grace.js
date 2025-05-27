(function grace(){
	/*
		JavaScript doesnt have include sorry :(
	*/
	const fs = require('fs')
	const name = "Grace_kid.js"
	const code = `(${grace.toString()})()\n`
	fs.writeFile(name, code, function(error) {
		if (error) {
			return console.error(error)
		}
	})
})()
