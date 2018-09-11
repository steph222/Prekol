local file = io.open("data/SimpleTextSlides.md", "r");
local slide={}-- slide{all={}}
local all={}--  all={titles}
local titles={}-- {title="First Title", body={}}

local body={}--  body={text={},item={},{img={}}
local text={}--  text={{paragraph=" "},{paragraph=" "},{paragraph=" "},.....}   
local item={}--- Equal structure text                                       
local paragraph={}
local posText=1
local posItem=1


local cont=1


function readFile()
	local index=0;
	local word=""

	for line in file:lines() do
		
		if string.sub(line,1,1)=="#" then
			paragraph={};-- {paragraph= ""}
			posItem=1;
			posText=1;

			--if(index~=0) then	--Para cuando hay más de un titulo
			--end
			createBody();
			index=1
		else
			if string.sub(line,1,1)=="*" or tonumber(string.sub(line,1,1))  then
				word="Item"
				paragraph={["paragraph"]=line}-- {paragraph= ""}
				createTextItem(word,paragraph)
			elseif string.len(line)>0 then
				word="Text"
				paragraph={["paragraph"]=line}-- {paragraph= ""}
				createTextItem(word,paragraph)
			else
				do end
			end
			
		end
	end

end


function createSlide()

end

function createAll(name,pParagraph )
	
end

function createBody( )
	
	table.insert(body,1,text)
	table.insert(body,2,item)

	---*****REVISAR--> ¿¿¿porque no queda el contenido en text y en item si son globales???

	--Recorre body
	--[[for llave, valor in pairs(body) do
		print(llave.."-->"..#valor)
	end ]]

end

function createTextItem( name,pParagraph )
	
	
	if name=="Text" then
		table.insert(text,posText,pParagraph)
		posText=posText+1
		
	elseif name=="Item" then
		table.insert(item,posItem,pParagraph)
		posItem=posItem+1
	end

	print(#text,#item)
	
	--[[ muestra el valor obtenido en la tabla text
	for llave, valor in pairs(text) do
		for item,i in pairs(valor) do
    		print( llave.."-->"..item .." - ".. i )
    	end
  	end]]

end
