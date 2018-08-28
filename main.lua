local slides
local fontTitle
local fontBody
local diapositiva=1
local button = false;


local x = 0;
local y = 0;
local w = 640;
local h = 480;

function setup()
	size(640,480)
	stroke(255)
	slides = assert(loadfile("example1.lua"))
	fontTitle = loadFont("data/Vera.ttf",30);
	fontBody=loadFont("data/Vera.ttf",15);
	slides()
end

function draw()

	background(255)
	
	displayTitle()
	displayBody()

end

function displayTitle()
	textFont(fontTitle)
	fill(19,195,43)
	text(imprimeTitle(1),220,70)
	--print(diapositiva)
end

function displayBody()
	textFont(fontBody)
	local num=1
	local num2=60
	local pos=60
	local pos2=0
	fill(0)
	for index=1, tamannoTexto(2), 1 do
		local texto=imprimeCuerpo(2,index)--Se envia el número segundo el orden al cambiar de diapositiva
		size=string.len(texto)
		num=1
		num2=60
		for index=1,size,60 do
			if string.len(texto)>=50 then
				text(string.sub(texto,num,num2),70,50+pos+pos2)
				num=num+60
				num2=num2+60
				pos2=pos2+20
			end
			
			--text(string.sub(texto,61,120),70,50+pos+40)
			--text(string.sub(texto,121,180),70,50+pos+60)
			--text(string.sub(texto,181,240),70,50+pos+80)
			--text(string.sub(texto,241,300),70,50+pos+100)

		end
		if tamannoItem(1)~=0 then
			print("Tiene intems")
		else
			print("NO tienes")
		end
		pos=pos2+20
	end

	
		
	
end

function mousePressed()
  if (mouseX > x and mouseX < x+w and mouseY > y and mouseY < y+h) then
    button = not button
    xnueva=mouseX
    ynueva=mouseY
    diapositiva=diapositiva+1
  end
  
  print("Hola")
  print(diapositiva)
end

function mouseMoved(x,y)
  mouseX = x
  mouseY = y
end

function keyPressed()
	print(key)--Buscar el formato de key para evaluar si es un enter
	--Pasar Diapositivas
end
