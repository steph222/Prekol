local file = io.open("data/SimpleTextSlides.md", "r");
local slide={}
local cont=1
local subSlide={}
local text={}
local body={}

function readFile()
	--
	for line in file:lines() do
		if string.sub(line,1,1)=="#" then
			print("title",line)
			if(index~=0) then
				createSubTable("",line)
			end
		elseif string.sub(line,1,1)=="*" or tonumber(string.sub(line,1,1))  then
			print("item",line)
			
		elseif string.len(line)==0 then
			do end
		else
			print("text",line)
			createParagraph("Text",line)
		end
	end
end

--End 
function createTable()
	--slide["all"]=
end


--Continue
---
---
function createSubTable()
	
end

function createBody( )
	-- body
end

function createParagraph(name,parag )
	text["paragraph"]=line
end

function createText(  )
	-- body
end