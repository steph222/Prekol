local slides;
local fontTitle;
local fontBody;


Node ={title="", body={},label="",text={}, paragraph="",items={}, item=""};

--Slides information
local slide = {all={
			{title="First Title",body={
				{label="Texto",text={
					{paragraph="This page offers a brief overview of what it's like to use Markdown. The syntax page provides complete, detailed documentation for every feature, but Markdown should be very easy to pick up simply by looking at a few examples of it in action."},
					{paragraph="The examples on this page are written in a before/after style, showing example syntax and the HTML output produced by Markdown."}}},
				{label="Item",text={
					{paragraph="First item"},
					{paragraph="Second item"},
					{paragraph="Third item"}}}	
				}--end body
			},--end tile
			{title="Second Title",body={
				{label="Texto",text={
					{paragraph="A paragraph is simply one or more consecutive lines of text, separated by one or more blank lines. (A blank line is any line that looks like a blank line -- a line containing nothing spaces or tabs is considered blank.) Normal paragraphs should not be intended with spaces or tabs."}}},
				{label="Item",text={
					{paragraph="First item"}}},
				}--end body
			},--end tile
			{title="Third Title",body={
				{label="Item",text={
					{paragraph="First item"},
					{paragraph="Second item"},
					{paragraph="Third item"}}}
				}--end body
			}--end tile
	}--end all
}--end slide



function setup()
	size(640,480);
	stroke(255);
	slides = assert(loadfile("example1.lua"));
	fontTitle = loadFont("data/Vera.ttf",30);
	fontBody=loadFont("data/Vera.ttf",15);
	img=loadImage("point.png")
	--slides()
end

function draw()

	background(255);
	node=slide;

	displayTitle(slide,1);-- num represents the slide

end

function displayTitle(node,position)
	textFont(fontTitle);
	fill(19,195,43);
	text(node.all[position].title,200,70);
	displayBody(node,position);
end


function displayBody(node,position)
	textFont(fontBody);
	fill(0)
	space=0;
	space2=0;
	size=#node.all[position].body;
	--Deployment body
	for index=1,size,1 do
		size2=#node.all[position].body[index].text;
		--Deployment text and item
		for index2=1, size2,1 do
			opc=true
			local parag=node.all[position].body[index].text[index2].paragraph;
			if node.all[position].body[index].label=="Item" then
				space2=20
				image(img, 50+space2, 138+space, 15, 15)		
			end
			-- Travel of parag string 
			while opc==true do
				--Evaluate if size of parag is greater or equal 60

				if string.len(parag)>=60 then
					--Evaluate if next or previous letter are black space 
					if string.sub(parag,61,61)==" " then
						text(string.sub(parag,1,61),70+space2,150+space)
						parag=string.sub(parag,62)
						
					elseif string.sub(parag,59,59)==" " then
						text(string.sub(parag,1,59),70+space2,150+space)
						parag=string.sub(parag,60)
					else
						text(string.sub(parag,1,64),70+space2,150+space)
						parag=string.sub(parag,65)
					end
					space=space+20;
				else
					text(parag,70+space2,150+space)
					space=space+20;
					opc=false
				end
			end
			space=space+20;			
		end
	end
end



function keyPressed()
	print(key)
	table=key
	for i,v in pairs(table) do
		print(v)
	end
end
