// Comment Out
function consol(code) {
	console.log(`// Comment Out`+`\n`+consol.toString()+`\n`+code+`\n`+"quine();");
	//Comment in
}
function quine() {
	consol(quine.toString());
}
quine();
