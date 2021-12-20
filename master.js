cinnamonCommand = Module.cwrap('command', 'string', ['string','string']);
Globals = {};

SVG_STR = "<svg><defs><marker id=\"arrowhead-g\" orient=\"auto\" markerWidth=\"4\" markerHeight=\"8\" refX=\"2.05\" refY=\"2.01\"><path d=\"M0,0 V4 L3,2 Z\" fill=\"#15781B\"></path></marker></defs><line stroke=\"#15781B\" stroke-width=\"10\" stroke-linecap=\"round\" marker-end=\"url(#arrowhead-g)\" opacity=\"1\" x1=\"{0}\" y1=\"{1}\" x2=\"{2}\" y2=\"{3}\"></line></svg>";

function init() {
	var moves = getMoves();
	Globals.numMoves = moves.length-1;
	//Globals.username = $(".username.white.on-game").find("a")[0].text;
	//Globals.whiteName = $(".player.color-icon.white").find("a")[0].text;
	//Globals.isWhite = (Globals.username == Globals.whiteName);
	Globals.isWhite = $("div.cg-board.orientation-white").length > 0;

	Globals.chess = new Chess();
	moves.each(function(i, move) {
		Globals.chess.move(move.innerHTML);
	});

	// console.log(moves);
	// console.log(Globals.chess.fen());
}

function getMoves() {
	return $("div.moves").find("move").not(".empty");
}

function onMove(moves) {
	lastMove = moves[moves.length-1];
	turn = moves.length % 2;
	opponentMoved = (turn == 0 && Globals.isWhite)
		|| (turn == 1 && !Globals.isWhite);

	label = opponentMoved ? "Opponent: " : "You: ";
	console.log(label, moves[moves.length-1].innerHTML);

	clearSuggestions()
	Globals.chess.move(lastMove.innerHTML);
	if (opponentMoved) {
		cinnamonCommand("setMaxTimeMillsec", 1000);
		cinnamonCommand("position", Globals.chess.fen());
		suggestion = cinnamonCommand("go","");
		displaySuggestion(suggestion);
	}
}

function getTile(pos) {
	file = pos[0].charCodeAt(0) - 'a'.charCodeAt(0);
	rank = parseInt(pos[1]) - 1;
	if (!Globals.isWhite) {
		file = 7 - file;
		rank = rank;
	} else {
		file = file;
		rank = 7 - rank;
	}
	return [rank, file];
}

function clearSuggestions() {
	$("div.cg-board").find("svg").remove()
}

function displaySuggestion(suggestion) {
	console.log("Suggestion: " + suggestion);
	pos1 = getTile(suggestion.substring(0, 2));
	pos2 = getTile(suggestion.substring(2, 4));

	x1 = 64 * pos1[1] + 32;
	y1 = 64 * pos1[0] + 32;
	x2 = 64 * pos2[1] + 32;
	y2 = 64 * pos2[0] + 32;

	// add new svg
	var inner = SVG_STR;
	inner = inner.replace("{0}", x1);
	inner = inner.replace("{1}", y1);
	inner = inner.replace("{2}", x2);
	inner = inner.replace("{3}", y2);
	$("div.cg-board").append(inner);
}

function checkMoves() {
	moves = getMoves();
	while (Globals.numMoves < moves.length) {
		Globals.numMoves++;
		onMove(moves.slice(0, Globals.numMoves));
	}
}

init();
$("div.moves").bind("DOMSubtreeModified", checkMoves);
checkMoves();
