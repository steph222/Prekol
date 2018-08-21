local slides
local fontTitle
local fontBody



function setup()
	size(640,480)

	
	stroke(255)
	slides = assert(loadfile("example1.lua"))
	fontTitle = loadFont("data/Vera.ttf",30);
	fontBody=loadFont("data/Vera.ttf",15);
end

function draw()

	background(255)
	slides()
	displayTitle()
	displayBody()
end

function displayTitle()
	textFont(fontTitle)
	fill(19,195,43)
	text(imprimeTitle(1),220,70)
end

function displayBody()
	textFont(fontBody)
	local num=1
	local num1=1
	local num2=70
	local pos=20
	fill(0)
	local texto=imprimeCuerpo(1)--Se envia el número segundo el orden al cambiar de diapositiva
	--imprimeCuerpo(1)
	print(num)
	print(string.len(texto))
	while num<=string.len(texto) do
		print("si")
		if string.len(texto)>=50 then
			text(string.sub(texto,num1,num2),50,100+pos)
			print(string.sub(texto,num1,num2))
			num=num+num2
			num1=num1+num2
			num2=num2+70
			pos=pos+20
		else
			text(texto,50,130)
		end
	end
end