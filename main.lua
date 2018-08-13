local archivo;
local button = false;
local button2= false;

local x = 500;
local y = 350;
local w = 60;
local h = 50;
local x2 = 70;
local y2 = 350;
local evaluar=1;

function setup()
  	size(640, 480);
 	local tipoletra = loadFont("data/Vera.ttf",15);
	textFont(tipoletra);
  
end

function draw()
 	background(255);
 	cambiarBotton()
 	cambiarBotton2()
 	archivo = io.open("data/SimpleTextSlides1.md", "r");
	leerArchivo(archivo)
 	io.close(archivo)

end

function leerArchivo(archivo)
	local cont=0;
	local posicion=1;

	for linea in archivo:lines() do
		if string.sub(linea,1,1)=="#" then
			cont=cont+1;
			if cont==evaluar then
				text(string.sub(linea,3),200,30+posicion);
				posicion=posicion+15;
			end
		else
			if cont==evaluar then
				medirParrafo(linea,posicion)
				posicion=posicion+30;
			end
		end

	end

end

function medirParrafo(linea, posicion)
	posicion2=0


	if string.sub(linea,1,1)=="*" or string.sub(linea,1,1)=="1" or string.sub(linea,1,1)=="2" or string.sub(linea,1,1)=="3" or string.sub(linea,1,1)=="4" or string.sub(linea,1,1)=="5" or string.sub(linea,1,1)=="6" or string.sub(linea,1,1)=="7" or string.sub(linea,1,1)=="8" or string.sub(linea,1,1)=="9" then
		if string.len(linea)>=50 then
			posicion2=posicion2+16
			text(string.sub(linea,1,60),70,50+posicion)
			text(string.sub(linea,61,140),70,50+posicion+posicion2)
			text(string.sub(linea,141,220),70,50+posicion+posicion2+15)
			text(string.sub(linea,221),70,50+posicion+posicion2+30)
			
		else
			text(linea,70,120+posicion-15+posicion2)
		end
	else
		if string.len(linea)>=50 then
			posicion2=posicion2+16
			text(string.sub(linea,1,80),50,50+posicion)
			text(string.sub(linea,81,160),50,50+posicion+posicion2)
			text(string.sub(linea,161,240),50,50+posicion+posicion2+15)
			text(string.sub(linea,241),50,50+posicion+posicion2+30)
			
		else
			text(linea,50,120+posicion-15+posicion2)
		end
	end
end


function cambiarBotton( )
	if(button) then
		rect(x+10,y+10,w+15,h)

		text("Siguiente",x+19,y+40)
  		
	else
		rect(x,y,w+15,h)
  		fill(255)
  		stroke(0)
		text("Siguiente",x+9,y+30)
	end
end

function cambiarBotton2( )
	if(button2) then
		rect(x2+10,y2+10,w+15,h)

		text("Anterior",x2+19,y2+40) 		
	else
		rect(x2,y2,w+15,h)
  		fill(255)
  		stroke(0)
		text("Anterior",x2+9,y2+30)
	end
end

function mousePressed()
  if (mouseX > x and mouseX < x+w and mouseY > y and mouseY < y+h) then
    button = not button
    xnueva=mouseX
    ynueva=mouseY
    evaluar=evaluar+1
  elseif(mouseX2 > x2 and mouseX2 < x2+w and mouseY2 > y2 and mouseY2 < y2+h) then
    button = not button
    xnueva=mouseX2
    ynueva=mouseY2
   	--evaluar=evaluar-1

  end  
end

function mouseMoved(x,y,x2,y2)
  mouseX = x
  mouseY = y
  mouseX2 = x2
  mouseY2 = y2
end
