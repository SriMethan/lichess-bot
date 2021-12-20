getBoardState = (function() {
    const symMap = {'rook': 'r', 'knight': 'n', 'bishop': 'b', 'king': 'k', 'queen': 'q', 'pawn': 'p'};

    function getOrientation() {
        return $('.cg-board-wrap').hasClass('orientation-white') ? 'w' : 'b';
    }

    function isOppositeSide(color) {
        return color !== getOrientation();
    }

    function getColor(color) {
        return color[0];
    }

    function getSquare(piece) {
        const transform = $(piece).css('transform').split(',');
        const color = $(piece).hasClass('white') ? 'w' : 'b';
        const pixelsX = parseInt(transform[4]);
        const pixelsY = parseInt(transform[5].slice(0, -1));
        let xCoord = pixelsX / 64;
        let yCoord;
        const orientation = getOrientation();

        if (orientation === 'w') {
            yCoord = 8 - (pixelsY / 64 + 1) + 1;
            xCoord = String.fromCharCode(97 + xCoord);
        } else {
            yCoord = pixelsY / 64 + 1;
            xCoord = String.fromCharCode(104 - xCoord);
        }

        return xCoord + yCoord;
    }

    function getPieceSymbol(piece) {
        piece = $(piece);
        const isWhite = piece.hasClass('white');
        const name = Object.keys(symMap).find(key => piece.hasClass(key));
        const sym = symMap[name];
        return isWhite ? sym.toUpperCase() : sym;
    }

    function getPieceNotation(piece) {
        const sqrSym = getSquare(piece);
        const pieceSym = getPieceSymbol(piece);
        return { piece: pieceSym, square: sqrSym};
    }

    function getColorPieceNotations(color) {
        const pieces = $('.cg-board .' + color);
        const notations = pieces.map((i, el) => getPieceNotation(el));
        return notations.toArray();
    }

    function getBoardPieceNotation() {
        return getColorPieceNotations('white').concat(getColorPieceNotations('black'));
    }

    function getActiveTurn() {
        if ($('.clock_black').hasClass('running'))
            return 'b';

        return 'w';
    }

    function oppositeColor(color) {
        return color === 'w' ? 'b': 'w';
    }

    function getState() {
        const pieces = getBoardPieceNotation();
        const playerColor = getOrientation();
        const activeTurn = getActiveTurn();

        return {
            pieces,
            playerColor,
            activeTurn
        };
    }

    return getState;
})();


//*********************************

tracker = (function() {
    let lastState = getBoardState();
    function isTransitioning() {
        return $('.cg-board .dragging').length > 0 ||
            $('.cg-board .anim').length > 0;
    }

    function queryServer(boardState) {
        $.ajax({
            "url": "http://localhost:1334",
            "contentType": "application/json",
            "dataType": "json",
            "type": "POST",
            "data": JSON.stringify(boardState),
            "success": (r) => {
                if (r.from && r.to) {
                    console.log("sending", r);
                    lichess.socket.send("move", r, {ackable: false})
                }
            }
        });
    }

    const interval = setInterval(() => {
        if (isTransitioning()) {
            return;
        }

        const currentState = getBoardState();

        if (JSON.stringify(currentState.pieces) !== JSON.stringify(lastState.pieces)) {
            console.log('changed!', currentState);
            if (currentState.activeTurn === currentState.playerColor) {
                console.log('my turn, act now!');
                queryServer(currentState);
            }
        }

        lastState = currentState;
    }, 100);
    return interval;
})();

