local title={}
local body={}
local index=0
local cont=1
local d={}


pre = pre or {}

pre.title = function(txt)
	if(index~=0) then
		index=index+1
		d[index]=body
	end
	index=index+1
	title[index]=txt
	d[index]=txt
	cont=1

end

pre.text = function(txt)
	body[cont]=txt
	cont=cont+1
end

pre.item = function(txt)
	--print(txt)
end

function imprimeTitle( num )
	return title[num]
end

function imprimeCuerpo( num1,num2 )
	local texto=d[2][2]
	return texto
end