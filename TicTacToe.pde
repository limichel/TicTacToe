ArrayList<Tile> tiles;
ArrayList<Integer> marked;
boolean gameOver = false;
boolean playerTurn = false;
boolean computerTurn = false;
int chooseTurn = (int)(Math.random() * 2 + 1);

void setup()
{
	size(500, 500);
	background(255);
	tiles = new ArrayList<Tile>();
	marked = new ArrayList<Integer>();
	for(int i = 83; i < 500; i += 166)
		for(int j = 83; j < 500; j += 166)
			tiles.add(new Tile(i, j));
	if(chooseTurn == 1)
		playerTurn = true;
	else if(chooseTurn == 2)
		computerTurn = true;
}

void draw()
{
	textAlign(CENTER);
	if(computerTurn)
	{
		computerPlay();
		computerTurn = false;
		playerTurn = true;
	}
	for(int i = 0; i < tiles.size(); i++)
	{
		if(playerTurn)
		{
			if(mousePressed && mouseX >= tiles.get(i).myX - 75 && mouseX <= tiles.get(i).myX + 75 && mouseY >= tiles.get(i).myY - 75 && mouseY <= tiles.get(i).myY + 75 && !tiles.get(i).flipped)
			{
				tiles.get(i).flipped = true;
				tiles.get(i).xo = "X";
				playerTurn = false;
				computerTurn = true;
			}
		}

		tiles.get(i).show();
	}
	if(tiles.get(0).flipped && tiles.get(0).xo == tiles.get(1).xo && tiles.get(1).xo == tiles.get(2).xo)
		win(0);
	else if(tiles.get(0).flipped && tiles.get(0).xo == tiles.get(3).xo && tiles.get(3).xo == tiles.get(6).xo)
		win(0);
	else if(tiles.get(3).flipped && tiles.get(3).xo == tiles.get(4).xo && tiles.get(4).xo == tiles.get(5).xo)
		win(3);
	else if(tiles.get(1).flipped && tiles.get(1).xo == tiles.get(4).xo && tiles.get(4).xo == tiles.get(7).xo)
		win(1);
	else if(tiles.get(6).flipped && tiles.get(6).xo == tiles.get(7).xo && tiles.get(7).xo == tiles.get(8).xo)
		win(6);
	else if(tiles.get(2).flipped && tiles.get(2).xo == tiles.get(5).xo && tiles.get(5).xo == tiles.get(8).xo)
		win(2);
	else if(tiles.get(2).flipped && tiles.get(2).xo == tiles.get(4).xo && tiles.get(4).xo == tiles.get(6).xo)
		win(2);
	else if(tiles.get(0).flipped && tiles.get(0).xo == tiles.get(4).xo && tiles.get(4).xo == tiles.get(8).xo)
		win(0);
	else if(tiles.get(0).flipped && tiles.get(1).flipped && tiles.get(2).flipped && tiles.get(3).flipped && tiles.get(4).flipped && tiles.get(5).flipped && tiles.get(6).flipped && tiles.get(7).flipped && tiles.get(8).flipped)
	{
		fill(150, 150, 150, 20);
		rectMode(CENTER);
		rect(250, 230, 500, 80);
		fill(255, 0, 0);
		textAlign(CENTER);
		text("Tie!", 250, 250);
		playerTurn = false;
		computerTurn = false;
		gameOver = true;
	}
}

class Tile
{
	int myX, myY;
	boolean flipped;
	String xo;
	Tile(int x, int y)
	{
		myX = x;
		myY = y;
		flipped = false;
		xo = "";
	}
	void show()
	{
		rectMode(CENTER);
		if(!flipped)
		{
			noStroke();
			fill(51, 153, 255);
			rect(myX, myY, 150, 150);
		}
		else if(!gameOver)
		{
			noStroke();
			fill(255);
			rect(myX, myY, 150, 150);
			fill(0);
			textAlign(CENTER);
			textSize(50);
			text(xo, myX, myY + 20);
		}
	}
}

void win(int sample)
{
	fill(150, 150, 150, 20);
	rectMode(CENTER);
	rect(250, 230, 500, 80);
	fill(255, 0, 0);
	textAlign(CENTER);
	if(tiles.get(sample).xo == "X")
		text("You win!", 250, 250);
	else
		text("Computer wins!", 250, 250);
	playerTurn = false;
	computerTurn = false;
	gameOver = true;
}

void computerPlay()
{
	int toFlip = (int)(Math.random() * 8 + 1);
	if(tiles.get(0).flipped && tiles.get(1).flipped && tiles.get(0).xo == tiles.get(1).xo)
		toFlip = 2;
	else if(tiles.get(0).flipped && tiles.get(2).flipped && tiles.get(0).xo == tiles.get(2).xo)
		toFlip = 1;
	else if(tiles.get(1).flipped && tiles.get(2).flipped && tiles.get(1).xo == tiles.get(2).xo)
		toFlip = 0;
	else if(tiles.get(0).flipped && tiles.get(3).flipped && tiles.get(0).xo == tiles.get(3).xo)
		toFlip = 6;
	else if(tiles.get(0).flipped && tiles.get(6).flipped && tiles.get(0).xo == tiles.get(6).xo)
		toFlip = 3;
	else if(tiles.get(3).flipped && tiles.get(6).flipped && tiles.get(3).xo == tiles.get(6).xo)
		toFlip = 0;
	else if(tiles.get(3).flipped && tiles.get(4).flipped && tiles.get(3).xo == tiles.get(4).xo)
		toFlip = 5;
	else if(tiles.get(3).flipped && tiles.get(5).flipped && tiles.get(3).xo == tiles.get(5).xo)
		toFlip = 4;
	else if(tiles.get(4).flipped && tiles.get(5).flipped && tiles.get(4).xo == tiles.get(5).xo)
		toFlip = 3;
	else if(tiles.get(1).flipped && tiles.get(4).flipped && tiles.get(1).xo == tiles.get(4).xo)
		toFlip = 7;
	else if(tiles.get(1).flipped && tiles.get(7).flipped && tiles.get(1).xo == tiles.get(7).xo)
		toFlip = 4;
	else if(tiles.get(4).flipped && tiles.get(7).flipped && tiles.get(4).xo == tiles.get(7).xo)
		toFlip = 1;
	else if(tiles.get(6).flipped && tiles.get(7).flipped && tiles.get(6).xo == tiles.get(7).xo)
		toFlip = 8;
	else if(tiles.get(6).flipped && tiles.get(8).flipped && tiles.get(6).xo == tiles.get(8).xo)
		toFlip = 7;
	else if(tiles.get(7).flipped && tiles.get(8).flipped && tiles.get(7).xo == tiles.get(8).xo)
		toFlip = 6;
	else if(tiles.get(2).flipped && tiles.get(5).flipped && tiles.get(2).xo == tiles.get(5).xo)
		toFlip = 8;
	else if(tiles.get(2).flipped && tiles.get(8).flipped && tiles.get(2).xo == tiles.get(8).xo)
		toFlip = 5;
	else if(tiles.get(5).flipped && tiles.get(8).flipped && tiles.get(5).xo == tiles.get(8).xo)
		toFlip = 2;
	else if(tiles.get(2).flipped && tiles.get(4).flipped && tiles.get(2).xo == tiles.get(4).xo)
		toFlip = 6;
	else if(tiles.get(2).flipped && tiles.get(6).flipped && tiles.get(2).xo == tiles.get(6).xo)
		toFlip = 4;
	else if(tiles.get(4).flipped && tiles.get(6).flipped && tiles.get(4).xo == tiles.get(6).xo)
		toFlip = 2;
	else if(tiles.get(0).flipped && tiles.get(4).flipped && tiles.get(0).xo == tiles.get(4).xo)
		toFlip = 8;
	else if(tiles.get(0).flipped && tiles.get(8).flipped && tiles.get(0).xo == tiles.get(8).xo)
		toFlip = 4;
	else if(tiles.get(4).flipped && tiles.get(8).flipped && tiles.get(4).xo == tiles.get(8).xo)
		toFlip = 0;
	while(tiles.get(toFlip).flipped)
		toFlip = (int)(Math.random() * 8 + 1);
	tiles.get(toFlip).flipped = true;
	tiles.get(toFlip).xo = "O";
}
