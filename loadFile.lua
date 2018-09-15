

local file = io.open("data/SimpleTextSlides.md", "r");
local slide={}-- slide{all={}}
local all={}--  all={titles}
local titles={}-- {title="First Title", body={}}
local title=""
local body={}--  body={text={},item={},{img={}}
local text={}--  text={{paragraph=" "},{paragraph=" "},{paragraph=" "},.....}   
local item={}--- Equal structure text                                       
local paragraph={}
local textBody={}--textBody{label="Text",text={}}
local itemBody={}--itemBody{label="Text",text={}}

local contAll=1;
local cont=1

function readFile()
	local index=0;
	local word=""

	for line in file:lines() do
		
		if string.sub(line,1,1)=="#" then
			paragraph={};-- {paragraph= ""}
			posItem=1;
			posText=1;

			if(index~=0) then	--Para cuando hay más de un titulo
				createTextItem("","")
				text={}
				item={}

			end

			title=string.sub(line,4)
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

function createAll( )
	-- {title="First Title", body={}}
	titles["title"]=title;
	table.insert(titles,2,body)
	table.insert(all,contAll,titles);

	--Recorrer la tabla!!
	for llave, valor in pairs(all) do -- all={titles={},titles={},....}
		for i,j in pairs(valor) do--titles={title="First Title", body={}}
			if(i=="title") then
				print(llave.."=>"..i.."-->"..j)
			else
				for m,n in pairs(j) do -- body={textBody={},itemBody={}}
					for o,p in pairs(n) do --textBody={label="Text",text={}}
						if(o=="Label")then
							print("\t"..llave.."===> "..o.."-->"..p)
						else
							for d,c in pairs(p) do--text={{paragraph=" "},{paragraph=" "},{paragraph=" "},.....}  
								print("\t\t"..llave.."===> "..d.."-->"..c.paragraph)
							end
						end
					end
				end
			end
		end
	end

	contAll=contAll+1;

end

function createBody( )
	textBody["Label"]="Text";
	table.insert(textBody,2,text)

	itemBody["Label"]="Item";
	table.insert(itemBody,2,item)

	table.insert(body,1,textBody)
	table.insert(body,2,itemBody)


	createAll()
	textBody={}
	itemBody={}
	body={}


end

function createTextItem( name,pParagraph )
	
	if name=="Text" then
		table.insert(text,posText,pParagraph)
		posText=posText+1

		
	elseif name=="Item" then
		table.insert(item,posItem,pParagraph)
		posItem=posItem+1
	else
		createBody();
	  end

end
