local title={}
local body={}
local items={}
local iteme = {}
local index=0
local cont=1
local cont2=1
local d={}


pre = pre or {}

pre.title = function(txt)
	
	if(index~=0) then
		index=index+1
		d[index]=body
		cont=1

	end
	index=index+1
	title[index]=txt
	items[index]=iteme
	d[index]=txt
	cont=1
	cont2=1
	


end

pre.text = function(txt)
	body[cont]=txt
	cont=cont+1
end

pre.item = function(txt)
	iteme[cont2]=txt
	cont2=cont2+1
end

function imprimeTitle( num )
	return title[num]
end

function imprimeCuerpo( num1,num2 )
	print(#iteme[1])
	local texto=d[num1][num2]
	return texto
end

function tamannoTexto( posicion)
	return #d[posicion]
end
function tamannoItem( posicion)
	print(items[3][3])
	return #items[posicion]
end