local archivo;
local button = false;

local x = 500;
local y = 350;
local w = 60;
local h = 50;

function setup()
  	size(650, 450);
 	local tipoletra = loadFont("data/Vera.ttf",15);
	textFont(tipoletra);
  
end

function draw()
 	background(255);
 	cambiarBotton()
 	archivo = io.open("data/SimpleTextSlides.md", "r");
 	leerArchivo(archivo)
 	io.close(archivo)

end

function leerArchivo(archivo)
	local contador=1;
	local num=1
	local num2=1
	local frase="";


 	for linea in archivo:lines() do
 		if button then
	 		if num==1 then
		 		if string.sub(linea,1,1) == "#" then
		 			if num2==1 then
		 				num2=2
		 			else
		 				num=2
		 				text(string.sub(linea,3),200,100+contador);
		 				text("----------------------------",190,110+contador);
		 				contador=contador+50;
		 			end
		 		end		 		
		 	else
		 		text(linea,80,100+contador);
				contador=contador+15;
		 	end
		else
			if num==1 then
		 		if string.sub(linea,1,1) == "#" then
		 			if num2==1 then
		 				
		 				num2=2
		 				text(string.sub(linea,3),200,100+contador);
		 				text("----------------------------",190,110+contador);
		 				contador=contador+50;
		 			else
		 				num=2
		 			end
		 		else
		 			text(linea,80,100+contador);
					contador=contador+15;
		 		end
		 		--frase=frase .. linea
		 	end
		end
	end 

end

function cambiarBotton( )
	if(button) then
		rect(x+10,y+10,w,h)

		text("Pasar",x+19,y+40)
  		
	else
		rect(x,y,w,h)
  		fill(255)
  		stroke(0)
		text("Pasar",x+9,y+30)
	end
end

function mousePressed()
  if (mouseX > x and mouseX < x+w and mouseY > y and mouseY < y+h) then
    button = not button
    xnueva=mouseX
    ynueva=mouseY
  end  
end

function mouseMoved(x,y)
  mouseX = x
  
  mouseY = y
end
