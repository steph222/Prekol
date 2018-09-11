local slides;
local openFile;
local fontTitle;
local fontBody;
local fontEnd;
local space=0;
local pass=1;




Node ={title="", body={},label="",text={}, paragraph="",items={}, item="", nameImg=""};

--Slides information
local slide = {all={
			{title="First Title",body={
				{label="Text",text={
					{paragraph="This page offers a brief overview of what it's like to use Markdown. The syntax page provides complete, detailed documentation for every feature, but Markdown should be very easy to pick up simply by looking at a few examples of it in action."},
					{paragraph="The examples on this page are written in a before/after style, showing example syntax and the HTML output produced by Markdown."}}},
				{label="Item",text={
					{paragraph="First item"},
					{paragraph="Second item"},
					{paragraph="Third item"}}},
				{nameImg="Imag1.jpg"}
				}--end body
			},--end tile
			{title="Second Title",body={
				{label="Text",text={
					{paragraph="A paragraph is simply one or more consecutive lines of text, separated by one or more blank lines. (A blank line is any line that looks like a blank line -- a line containing nothing spaces or tabs is considered blank.) Normal paragraphs should not be intended with spaces or tabs."}}},
				{label="Item",text={}},
				{nameImg="Imag2.jpg"}
				}--end body
			},--end tile
			{title="Third Title",body={
				{label="Text",text={}},
				{label="Item",text={
					{paragraph="First item"},
					{paragraph="Second item"},
					{paragraph="Third item"}}},
				{nameImg="Imag1.jpg"}
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
	fontEnd=loadFont("data/Vera.ttf",40);
	img=loadImage("point.png")
	structure = assert(loadfile("loadFile.lua"))
	--imgBody=loadImage(slide.all[pass].body[3].nameImg)
	--slides()
	
end

function draw()
	structure()
	background(255);
	node=slide;
	readFile()
	--loadImg()
	--bodystructure()

end

function loadImg()
	image(imgBody, 150, 158, 200, 200)
end

function bodystructure(  )
	local size=#node.all

	--If the elements of slide, are not finished
	if(pass~=size+1) then
		print(space)
		displayTitle(pass);
		
		textFont(fontBody);
		fill(0)
		extractText(pass,1)
		extractItem(pass,2)
	else
		--Close program
		os.exit();
	end
end

function slideAux( parag, space2 )
	if pass~=1 then
		display(parag,space2)
	end
end
function displayTitle(position)
	textFont(fontTitle);
	fill(19,195,43);
	text(node.all[position].title,200,70);
end

function extractText(position,index)
	space=0
	local size=#node.all[position].body[index].text;
	for cont=1, size,1 do
		parag=node.all[position].body[index].text[cont].paragraph
		display(parag,0)
	end

end



function extractItem( position, index)
	local size=#node.all[position].body[index].text;--change text x item
	space=space+20
	--If label Itemt is empty, return
	if(node.all[position].body[index].text[cont]) then
		return;
	else
		for cont=1, size,1 do
			parag=node.all[position].body[index].text[cont].paragraph
			image(img, 50+20, 138+space, 15, 15)
			display(parag,20)
		end
	end
end

--Function responsible for display the content
function display(parag,space2)
	while true do
		if space<=240 then
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
				return
			end
		else
			return
			--slideAux(parag,space2) in process 
		end
	end
end




function keyPressed()
	print(key)

	pass=pass+1
end

