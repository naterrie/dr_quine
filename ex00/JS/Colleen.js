/*
	Comment Out
*/
function print(code) {
	console.log(`/*\n\tComment Out\n*/`+`\n`+print.toString()+`\n`+code+`\n`+"quine();");
	/*
		Comment in
	*/
}
function quine() {
	print(quine.toString());
}
quine();
