(function main() {
	const fs = require("fs");
	const { exec } = require("child_process");
	const code = `(${main.toString()})()`;
	let i = 5;

	if (i <= 0)
		return;
	i--;
	const name = `Sully_${i}.js`;
	fs.writeFileSync(name, code.replace(`let i = ${i + 1}`, `let i = ${i}`)), function (error) {
		if (error)
			return console.error(error);
	}
	exec(`node ${name}`)
})()
