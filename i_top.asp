<%
' The following variables may be overwritten on a page by page basis
PriorPage	= ""
NextPage		= ""

'---------------------------------------------------------------------------------------

' Login logic
Campaign1 = Array("Adrin","Strum","Alysis")
Campaign2 = Array("Caris","Frobo","Aerethel", "Avalina", "Balthazar")
Campaign3 = Array("Alti", "Shi_Ru", "Kwartz", "Lee", "Sigfried", "Tragin", "Winlocke")

userId		= UCase(request.form("userId"))
'userId		= request.form("userId")
userId		= Replace(userId, " ", "_")
Arg			= ""
Campaign		= ""
Condition	= ""

if (userId = "LOGOUT") then
	Arg		= ""
	userId	= ""
	Condition= "LO"
else
	if (userId = "DM") then
		Arg			= "?userId=DM"
		Condition	= "DM.1"
		UserName		= userID
	else
		' Test if in campaign #1
		for xx1 = 0 to ubound(Campaign1)
			if (userId = UCase(Campaign1(xx1))) then
				Arg			= "?userId=" & userId
				UserName		= Campaign1(xx1)
				Campaign		= 1
				xx1			= 999
				Condition	= "1.1 (form)"
			end if
		next

		if (Arg = "") then
			' Test if in campaign #2
			for xx1 = 0 to ubound(Campaign2)
				if (userId = UCase(Campaign2(xx1))) then
					Arg			= "?userId=" & userId
					UserName		= Campaign2(xx1)
					Campaign		= 2
					xx1			= 999
					Condition	= "1.2 (form)"
				end if
			next
		end if

		if (Arg = "") then
			' Test if in campaign #3
			for xx1 = 0 to ubound(Campaign3)
				if (userId = UCase(Campaign3(xx1))) then
					Arg			= "?userId=" & userId
					UserName		= Campaign3(xx1)
					Campaign		= 3
					xx1			= 999
					Condition	= "1.3 (form)"
				end if
			next
		end if
	end if

'Response.Redirect "http://www.ourfarm.org" & Arg
	if (Arg = "") then
		' Test if userId passed via url
		userId = UCase(request.QueryString("userId"))
		if (userId = "DM") then
			Arg			= "?userId=DM"
			UserName		= userID
			Condition	= "DM.2"
		else
			' Test if in campaign #1
			for xx1 = 0 to ubound(Campaign1)
				if (userId = UCase(Campaign1(xx1))) then
					Arg			= "?userId=" & userId
					UserName		= Campaign1(xx1)
					Campaign		= 1
					xx1			= 999
					Condition	= "2.1 (url)"
				end if
			next
			if (Arg = "") then
				' Test if in campaign #2
				for xx1 = 0 to ubound(Campaign2)
					if (userId = UCase(Campaign2(xx1))) then
						Arg			= "?userId=" & userId
						UserName		= Campaign2(xx1)
						Campaign		= 2
						xx1			= 999
						Condition	= "2.2 (url)"
					end if
				next
				if (Arg = "") then
					' Test if in campaign #3
					for xx1 = 0 to ubound(Campaign3)
						if (userId = UCase(Campaign3(xx1))) then
							Arg			= "?userId=" & userId
							UserName		= Campaign3(xx1)
							Campaign		= 3
							xx1			= 999
							Condition	= "2.3 (url)"
						end if
					next
				end if
			end if
		end if
	end if
	UserName		= Replace(UserName, "_", " ")
end if

DMText	= ""
UserMode	= ""
if (userId = "DM") then
	DMText	= " - DM Mode"
	UserMode	= "DM Mode" & " - " & ubound(Campaign1)
else
	if (Campaign <> "") then
		UserMode = "Campaign " & Campaign
	end if
end if







function curPageURL()
	dim s, protocol, port

	if Request.ServerVariables("HTTPS") = "on" then 
		s = "s"
	else 
		s = ""
	end if  

	protocol = strleft(LCase(Request.ServerVariables("SERVER_PROTOCOL")), "/") & s 

	if Request.ServerVariables("SERVER_PORT") = "80" then
		port = ""
	else
		port = ":" & Request.ServerVariables("SERVER_PORT")
	end if  

	curPageURL = protocol & "://" & Request.ServerVariables("SERVER_NAME") &_ 
						port & Request.ServerVariables("SCRIPT_NAME")
end function







function strLeft(str1, str2)
	strLeft = Left(str1, InStr(str1,str2)-1)
end function



Plus1BasePrice = 500
Plus2BasePrice = 1000
Plus3BasePrice = 2000

function CalcBasePrice(Dice, AttackBonus)
	' Extract passed data
	PassedDice	= Split(Dice, "d")
	NoDice		= PassedDice(0)
	TypeDice		= PassedDice(1)

	' Force missing values
	If (NoDice = "") then NoDice = 1
	If (AttackBonus = "") or (AttackBonus = 0) then AttackBonus = 1

	' Calculate initial values
	AvgDam		= (NoDice * (TypeDice+1))/2
	MaxDam		= NoDice * TypeDice
'	BasePrice	= int((AvgDam + MaxDam)/2 + .5)
	BasePrice	= (AvgDam + MaxDam)/2

	' Modify BasePrice by magical attack bonus
	if (AttackBonus = 1) then
		BasePrice = BasePrice * Plus1BasePrice
	else
		if (AttackBonus = 2) then
			BasePrice = BasePrice * Plus2BasePrice
		else
			BasePrice = BasePrice * Plus3BasePrice
		end if
	end if

'msg = "AvgDam=" & AvgDam & "&" & "MaxDam=" & MaxDam & "&" & "BasePrice=" & BasePrice
'Response.Redirect "http://www.ourfarm.org?msg=" & msg

	CalcBasePrice = Array(AvgDam, BasePrice)
end function






function curPageName()
	dim pagename

	pagename = Request.ServerVariables("SCRIPT_NAME") 

	if inStr(pagename, "/") > 0 then 
		pagename = Right(pagename, Len(pagename) - instrRev(pagename, "/")) 
	end if 

	curPageName = pagename
end function 




function priceCalc(lookFor, Modifier)
	priceCalc = 0
	items = array("Stable")
	price = array(2)
	coins = array("sp")

	for xx1 = 0 to ubound(items)
		if (lookFor = items(xx1)) then
			priceCalc = price(xx1) * Modifier & coins(xx1)
			xx1 = 9999
		end if
	next
end function



' ----------------------- These are used for displaying NPC stats -----------------------
	STR	= 1
	DEX	= 2
	CON	= 3
	INT2	= 4
	WIS	= 5
	CHA	= 6
	Dim StatsArray(6,3)
	Dim DC
	Dim ToHit
	Dim LevelDim
	Dim Stat

	Function ResetArray
		for xx1 = 1 to 6
			StatsArray(xx1, 1) = ""		' Stat
			StatsArray(xx1, 2) = ""		' Modifier
			StatsArray(xx1, 3) = ""		' Plus sign
		next
		DC = 0
		ToHit = 0
	End Function

	Function CalcMods
		for xx1 = 1 to 6
			StatsArray(xx1, 2) = int((StatsArray(xx1, 1) - 10)/2)
			if (StatsArray(xx1, 2) >= 0) then
				StatsArray(xx1, 3) = "+"
			end if
		next
	End Function

	Function CalcDC
		if (Level < 5) then
			ProfBonus = 2
		else
			if (Level < 9) then
				ProfBonus = 3
			else
				if (Level < 13) then
					ProfBonus = 4
				else
					if (Level < 17) then
						ProfBonus = 5
					else
						ProfBonus = 6
					end if
				end if
			end if
		end if
		DC		= 8 + ProfBonus + StatsArray(Stat, 2)
		ToHit	= ProfBonus + StatsArray(Stat, 2)
	End Function


WebPage = curPageName()
HexPage = Replace(WebPage, ".asp", "")
HexPage = Replace(HexPage, "_", " ")



' Special variables
HoverColor = "ff4d4d"		' Hover over color for cities, castles, and other points of interest
HoverColor = "ff0000"


' Map a semi-meaningful name to a hex #
MonastaryHex			= "F147-246"
LongCanyonHex			= "F148-246"
CanyonRoadHex			= "F148-242"
SWMellysCastleHex		= "F148-243"
MellysValleySWHex		= "F148-244"
DusseldornNWHex		= "F149-242"
ClearwasserHex			= "F149-243"
SouthMellysValleyHex	= "F149-244"
TriViaHex				= "F149-245"
DusseldornSEHex		= "F150-242"
MellysValleyEastHex	= "F150-243"
ThePassageHex			= "F150-245"
BosgiraudLakeHex		= "F151-246"
DurahlDurhHex			= "F152-245"
RurhbachFallsHex		= "F153-245"
DurahlValleyHex		= "F154-245"
KelzadHex				= "F155-245"
KelzadFieldsHex		= "F156-245"
HillGiantsHex			= "F157-246"
HighCrags1Hex			= "F157-245"
LoftwickHex				= "F160-246"
DarbyHex					= "F161-245"
YvalondHex				= "F163-242"
GreenestHex				= "F164-242"
TheBowlHex				= "F162-243"
TheBendHex				= "F162-244"
TheBurrowsHex			= "F163-243"
PortsmouthHex			= "F163-244"
DunralHex				= "F164-243"
DaggerFallsHex			= "F164-244"
FarriersRampHex		= "F165-244"

Dim DMMaps(50)
Dim NameMaps(50)
Dim C2Maps(50)

' Note that the hex numbers and names do NOT need to be in any order so long
' as there are not gaps.

DMMaps(0)	= MonastaryHex
NameMaps(0)	= "Monastery"
C2Maps(0)	= false

DMMaps(1)	= LongCanyonHex
NameMaps(1)	= "Long canyon"
C2Maps(1)	= false

DMMaps(2)	= SWMellysCastleHex
NameMaps(2)	= "Bend in the Mellys Valley"
C2Maps(2)	= true

DMMaps(3)	= MellysValleySWHex
NameMaps(3)	= "South Western edge of the Mellys Valley"
C2Maps(3)	= true

DMMaps(4)	= DusseldornNWHex
NameMaps(4)	= "North West half of Dusseldorn Hollow & town of Whyme"
C2Maps(4)	= true

DMMaps(5)	= DusseldornSEHex
NameMaps(5)	= "South East half of Dusseldorn Hollow, Darrin & Mueller Pass"
C2Maps(5)	= true

DMMaps(6)	= ClearwasserHex
NameMaps(6)	= "Clearwasser, Castle Mellys & Kalter River"
C2Maps(6)	= true

DMMaps(7)	= SouthMellysValleyHex
NameMaps(7)	= "Southern Mellys Valley, Town of Hollis & Kalter River"
C2Maps(7)	= true

DMMaps(8)	= MellysValleyEastHex
NameMaps(8)	= "Eastern edge of Mellys Valley, OstenBauernhof & Tauberg Valleys"
C2Maps(8)	= true

DMMaps(9)	= TriViaHex
NameMaps(9)	= "Southgate, Caerbannog, Ruhr Valley, Ruhr River & Cave 1"
C2Maps(9)	= true

DMMaps(10)	= ThePassageHex
NameMaps(10)= "Tribesmen, Ruins and Dungeons of Jacalla, Ruhr Valley, Ruhr River & Sanctuary Caves 2 & 3"
C2Maps(10)	= true

DMMaps(11)	= BosgiraudLakeHex
NameMaps(11)= "Ruhr Valley, The Ruhr River, Bosgiraud Lake, Hunting Lodges & Sanctuary Cave 4"
C2Maps(11)	= true

DMMaps(12)	= DurahlDurhHex
NameMaps(12)= "Durahl-Durh, Road Under the Mountain, tip of Bosgiraud Lake, The Durahl River & Western most edge of the Yeomanry"
C2Maps(12)	= true

DMMaps(13)	= RurhbachFallsHex
NameMaps(13)= "Western Durahl Valley, The Durahl River, Kun, Wilson Farm, Frontier Farmland & Rurhbach Falls"
C2Maps(13)	= true

DMMaps(14)	= DurahlValleyHex
NameMaps(14)= "Central Durahl Valley, The Durahl River & Frontier Farmland"
C2Maps(14)	= true

DMMaps(15)	= KelzadHex
NameMaps(15)= "Eastern Durahl Valley, The Durahl River, Farmland & Kelzad & The Termlane Forest"
C2Maps(15)	= true

DMMaps(16)	= KelzadFieldsHex
NameMaps(16)= "Farmland supporting Kelzad, The Wisk River & Kelzad/Loftwick Road"
C2Maps(16)	= true

DMMaps(17)	= HillGiantsHex
NameMaps(17)= "The High Crags, The Wisk River & Kelzad/Loftwick Road"
C2Maps(17)	= true

DMMaps(18)	= HighCrags1Hex
NameMaps(18)= "The Wisk River & Kelzad/Loftwick Road"
C2Maps(18)	= true

DMMaps(19)	= LoftwickHex
NameMaps(19)= "Loftwick (capital of The Yeomanry), The town of Raveslan, The Wisk River, The Reslya River, The Kendeen River, Kelzad/Loftwick Road & The New Road"
C2Maps(19)	= true

DMMaps(20)	= DarbyHex
NameMaps(20)= "City of Darby & The New Road"
C2Maps(20)	= true

DMMaps(21)	= YvalondHex
NameMaps(21)= "The Cool Mist Forest, Yvalond & The Upper Little Suel River"
C2Maps(21)	= true

DMMaps(22)	= GreenestHex
NameMaps(22)= "SE tip of The Cool Mist Forest, Greenest & The Upper Little Suel River"
C2Maps(22)	= true

DMMaps(23)	= TheBowlHex
NameMaps(23)= "Tor-a-Jar1 (necropolis), The Upper Little Suel River, The Escarpment"
C2Maps(23)	= true

DMMaps(24)	= TheBendHex
NameMaps(24)= "The Upper Little Suel River & large open plains"
C2Maps(24)	= true

DMMaps(25)	= TheBurrowsHex
NameMaps(25)= "Southern tip of The Cool Mist Forest, The Burrows & The Upper Little Suel River"
C2Maps(25)	= true

DMMaps(26)	= PortsmouthHex
NameMaps(26)= "Portsmouth/Riverbesnd, Farn Lake, The Upper Little Suel River & The Escarpment"
C2Maps(26)	= true

DMMaps(27)	= DunralHex
NameMaps(27)= "Town of Dunral, Farn Lake, Valley of the Chosen, The Old Man & the Crypt of Zolba-a-Na"
C2Maps(27)	= true

DMMaps(28)	= DaggerFallsHex
NameMaps(28)= "Town of Dagger Falls, The New Road, Farn Lake & The Escarpment"
C2Maps(28)	= true

DMMaps(29)	= FarriersRampHex
NameMaps(29)= "City of Farrier's Ramp, The Outpost, The New Road, Farn Lake, The Lower Little Suel River & The Escarpment"
C2Maps(29)	= true

DMMaps(30)	= CanyonRoadHex
NameMaps(30)= "A wooded farmland with a steep canyon road in the north"
C2Maps(30)	= true






function SetHyperlink(Hex)
	hyperlink	= ""
	MapName		= "Undiscovered"

	' See if the DM or player may access (otherwise the map does not exist)
	for xx1 = 0 to ubound(DMmaps)
		if (Hex = DMmaps(xx1)) then
			if (userId = "DM") or (C2Maps(xx1) = true) then
				hyperlink	= Hex
				MapName		= NameMaps(xx1)
				xx1			= 999
			end if
		end if
	next

	if (hyperlink <> "") then
		hyperlink = Hex & ".asp" & Arg
	end if

	SetHyperlink = array(hyperlink, MapName)
'Response.Redirect "http://www.ourfarm.org?WebPage=" & WebPage
end Function




'------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
' Build links - this must come after the logic above

' Players - Campaign 1
Adran_Ivsaar			= "<a href=""Back_Stories.asp" & Arg & "#Adran_Ivsaar"" title=""Elven Magic User/Thief""><span class=""people"">Adran Ivsaar</span></a>"
Adran						= "<a href=""Back_Stories.asp" & Arg & "#Adran_Ivsaar"" title=""Elven Magic User/Thief""><span class=""people"">Adran</span></a>"
Alisys_Woodson			= "<a href=""Back_Stories.asp" & Arg & "#Alisys_Woodson"" title=""Half Elf Cleric of Eholonna""><span class=""people"">Alisys Woodson</span></a>"
Alisys					= "<a href=""Back_Stories.asp" & Arg & "#Alisys_Woodson"" title=""Half Elf Cleric of Eholonna""><span class=""people"">Alisys</span></a>"
Authur_Bowman			= "<a href=""Back_Stories.asp" & Arg & "#Authur_Bowman"" title=""Human Fighter""><span class=""people"">Aurthur Bowman</span></a>"
Flora						= "<a href=""Back_Stories.asp" & Arg & "#Flora"" title=""Half Elf Fighter""><span class=""people"">Flora</span></a>"
Reyynore					= "<a href=""Back_Stories.asp" & Arg & "#Reyynore""><span class=""people"">Reyynore</span></a>"
Strum_Broadmoor		= "<a href=""Back_Stories.asp" & Arg & "#Strum_Broadmoor"" title=""Human Ranger""><span class=""people"">Strum Broadmoor</span></a>"
Strum						= "<a href=""Back_Stories.asp" & Arg & "#Strum_Broadmoor"" title=""Human Ranger""><span class=""people"">Strum</span></a>"
Veleda_Oren				= "<a href=""Back_Stories.asp" & Arg & "#Veleda_Oren"" title=""Half Elf Druid""><span class=""people"">Veleda Oren</span></a>"
Veleda					= "<a href=""Back_Stories.asp" & Arg & "#Veleda_Oren"" title=""Half Elf Druid""><span class=""people"">Veleda</span></a>"


' Players - Campaign 2
Aerethel					= "<a href=""Back_Stories2.asp" & Arg & "#Aerethel"" title=""Half Elf Paladin of St Cuthbert""><span class=""people"">Aerethel</span></a>"
Aerethel_Nivenor		= "<a href=""Back_Stories2.asp" & Arg & "#Aerethel"" title=""Half Elf Paladin of St Cuthbert""><span class=""people"">Aerethel Nivenor</span></a>"
Lady_Aerethel			= "<a href=""Back_Stories2.asp" & Arg & "#Aerethel"" title=""Half Elf Paladin of St Cuthbert""><span class=""people"">Lady Aerethel</span></a>"
Dame_Aerethel			= "<a href=""Back_Stories2.asp" & Arg & "#Aerethel"" title=""Half Elf Paladin of St Cuthbert""><span class=""people"">Dame Aerethel</span></a>"
Avalina					= "<span class=""people"" title=""Wood Elf Druid"">Avalina</span>"
Baron_Caris_Ivsaar	= "<a href=""Back_Stories2.asp" & Arg & "#Caris_Ivsaar"" title=""High Elf Wizard""><span class=""people"">Baron Caris Ivsaar</span></a>"
Baron_Ivsaar			= "<a href=""Back_Stories2.asp" & Arg & "#Caris_Ivsaar"" title=""High Elf Wizard""><span class=""people"">Baron Ivsaar</span></a>"
Balthazar				= "<a href=""Back_Stories2.asp" & Arg & "#Balthazar"" title=""Human (Paynim) Wizard""><span class=""people"">Balthazar</span></a>"
Balthazar_Zayaat		= "<a href=""Back_Stories2.asp" & Arg & "#Balthazar"" title=""Human (Paynim) Wizard""><span class=""people"">Balthazar Zayaat</span></a>"
Balthazar_the_Grim	= "<a href=""Back_Stories2.asp" & Arg & "#Balthazar"" title=""Human (Paynim) Wizard""><span class=""people"">Balthazar the Grim</span></a>"
Bruisers					= "<span class=""people"" title=""Aerethel, Kuntas, Gimley"">Bruisers</span>"
Caris_Ivsaar			= "<a href=""Back_Stories2.asp" & Arg & "#Caris_Ivsaar"" title=""High Elf Wizard""><span class=""people"">Caris Ivsaar</span></a>"
Caris						= "<a href=""Back_Stories2.asp" & Arg & "#Caris_Ivsaar"" title=""High Elf Wizard""><span class=""people"">Caris</span></a>"
Count_Caris_Ivsaar	= "<a href=""Back_Stories2.asp" & Arg & "#Caris_Ivsaar"" title=""High Elf Wizard""><span class=""people"">Count Caris Ivsaar</span></a>"
Count_Ivsaar			= "<a href=""Back_Stories2.asp" & Arg & "#Caris_Ivsaar"" title=""High Elf Wizard""><span class=""people"">Count Ivsaar</span></a>"
Frobo_Oglethorpe		= "<a href=""Back_Stories2.asp" & Arg & "#Frobo_Oglethorpe"" title=""Halfling Rouge""><span class=""people"">Frobo Oglethorpe</span></a>"
Frobo						= "<a href=""Back_Stories2.asp" & Arg & "#Frobo_Oglethorpe"" title=""Halfling Rouge""><span class=""people"">Frobo</span></a>"
Mr_Frobo_Oglethorpe	= "<a href=""Back_Stories2.asp" & Arg & "#Frobo_Oglethorpe"" title=""Halfling Rouge""><span class=""people"">Mr. Frobo Oglethorpe</span></a>"
Gimley					= "<span class=""people"" title=""A mighty warrior from the Mellys Valley, henchman of Frobo"">Gimley</span>"
Ivsaars					= "<span class=""people"" title=""Two Elvan twins, Adran and Caris, from Yvalond in the Cool Mist Forest"">Ivsaars</span>"


' Players - Campaign 3
Alti						= "<a href=""Back_Stories3.asp" & Arg & "#Alti_Reyt"" title=""Halfling Rogue""><span class=""people"">Alti</span></a>"
Alti_Reyt				= "<a href=""Back_Stories3.asp" & Arg & "#Alti_Reyt"" title=""Halfling Rogue""><span class=""people"">Alti Reyt</span></a>"
Shi_Ru					= "<a href=""Back_Stories3.asp" & Arg & "#Shi_Ru"" title=""Human monk""><span class=""people"">Shi Ru</span></a>"
Shi_Ru_Amanthi			= "<a href=""Back_Stories3.asp" & Arg & "#Amanthi"" title=""Human Monk""><span class=""people"">Shi Ru Amanthi</span></a>"
Kwartz 					= "<a href=""Back_Stories3.asp" & Arg & "#Kwartz "" title=""Half-Orc Barbarian""><span class=""people"">Kwartz</span></a>"
Lee						= "<a href=""Back_Stories3.asp" & Arg & "#Lee_Daers "" title=""Dwarven Fighter""><span class=""people"">Lee</span></a>"
Lee_Daers				= "<a href=""Back_Stories3.asp" & Arg & "#Lee_Daers "" title=""Dwarven Fighter""><span class=""people"">Lee Daers</span></a>"
Sigfried					= "<a href=""Back_Stories3.asp" & Arg & "#Sigfried_Miller "" title=""Half-Elf Paladin""><span class=""people"">Sigfried</span></a>"
Sigfried_Miller		= "<a href=""Back_Stories3.asp" & Arg & "#Sigfried_Miller "" title=""Half-Elf Paladin""><span class=""people"">Sigfried Miller</span></a>"
Tragin					= "<a href=""Back_Stories3.asp" & Arg & "#Tragin "" title=""Deep Gnome Cleric""><span class=""people"">Tragin</span></a>"
Winlocke					= "<a href=""Back_Stories3.asp" & Arg & "#Winlocke "" title=""Human Warlock""><span class=""people"">Winlocke</span></a>"
Godfrey					= "<span class=""people"" title=""Twin brother of Winlocke"">Godfrey</span>"


Wylde						= "<span class=""place"" title=""A town friendly to outsiders (half-orcs, half-elves, drow, etc."">Wylde</span>"
The_Book					= "<span class=""magic"" title=""A mysterious tome found by Winlocke"">The Book</span>"




' NPCs ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Abdull							= "<span class=""people"" title=""Abdull, leader of barbarian tribe in the Ruhr Valley"">Abdull</span>"
The_Accountants				= "<span class=""people"" title=""Mr Charles and Mr Schwabb - people responsible for keeping track of King Maximilian's gem sales"">The Accountants</span>"
Aerethea							= "<span class=""people"" title=""Martha's daughter, named after Aerethel"">Aerethea</span>"
Alaqa								= "<span class=""people"" title=""Balthazar's younger sister"">Alaqa</span>"
Albert_Rumfeld					= "<span class=""people"" title=""Albert Rumfeld, son of Johan Rumfeld of Whurgrin"">Albert Rumfeld</span>"
Aleethi							= "<span class=""people"" title=""Priestess of Obad-Hai in Portsmouth"">Aleethi</span>"
Alex_the_Brave					= "<span class=""people"" title=""13 year old farm-kid who want to be an adventurer"">Alex the Brave</span>"
Althea							= "<span class=""people"" title=""Victor's cousin - owns apothecary in Loftwick"">Althea</span>"
Ambassador_Jasca_Marrywood	= "<a href=""NPCs.asp" & Arg & "#Jasca_Marrywood"" title=""Ambassador from Sterich""><span class=""people"">Ambassador Jasca Marrywood</span></a>"
Ambrose							= "<a href=""NPCs.asp" & Arg & "#Ambrose"" title=""Ambrose, proprietor of the Blue Rose in Postsmith""><span class=""people"">Ambrose</span></a>"
Andy								= "<span class=""people"" title=""A minor bandit leader"">Andy</span>"
Anock_Kai						= "<a href=""Gear.asp" & Arg & "#Anock_Kai"" title=""A Djinn, cursed to be without form or able to return home who lives inside Aerethel""><span class=""people"">Anock-Kai</span></a>"
Ansel_Wilson					= "<span class=""people"" title=""Leader of the Wilson Farm near Kun"">Ansel Wilson</span>"
Armastaad_H_Ruhl_III			= "<span class=""people"" title=""Lawyer in Kelzad"">Armastaad H. Ruhl III</span>"
Armastaad_H_Ruhl_IV			= "<span class=""people"" title=""Lawyer in Kelzad"">Armastaad H. Ruhl IV</span>"
Azeel								= "<span class=""people"" title=""A Deva the party rescued in Jakalla"">Azeel</span>"
Mr_Ruhl							= "<span class=""people"" title=""Lawyer in Kelzad"">Mr. Ruhl</span>"
Aunt_Aggie						= "<a href=""F162-243.asp" & Arg & "#Aunt_Aggie"" title=""Aunt Aggie - crazy witch who lives in 'The Bowl'""><span class=""people"">Aunt Aggie</span></a>"
Azor_alq							= "<a href=""NPCs.asp" & Arg & "#Azor_alq"" title=""Loyal henchman of Thunin-al-Azeed""><span class=""people"">Azor'alq</span></a>"
Baklunish_Wizard_Clerics	= "<span class=""people"" title=""Ancient Baklunish mage/clerics"">Baklunish wizard-clerics</span>"
Bargol							= "<span class=""people"" title=""Barbarian leader who attacked the Dridanis"">Bargol</span>"
Bargol_the_Wicked				= "<span class=""people"" title=""Barbarian leader who attacked the Dridanis"">Bargol the Wicked</span>"
Barnaby							= "<span class=""people"" title=""Intern at the College of the Magi"">Barnaby</span>"
Baron_Baulingbauch			= "<span class=""people"" title=""A noble from one of the fiefdoms in the southern tip Mellys Valley"">Baron Baulingbauch</span>"
Baron_Otto_Baulingbauch		= "<span class=""people"" title=""A noble from one of the fiefdoms in the southern tip Mellys Valley"">Baron Otto Baulingbauch</span>"
Baron_Extenstein_von_Rothenberg	= "<span class=""people"" title=""A noble from one of the fiefdoms in the central Mellys Valley"">Baron Extenstein von Rothenberg</span>"
Mr_Charles						= "<span class=""people"" title=""One of the accountants/negotiators who is responsible for selling King Maximilian's gem"">Mr. Charles</span>"
von_Rothenberg					= "<span class=""people"" title=""A noble from one of the fiefdoms in the central Mellys Valley"">von Rothenberg</span>"
Baron_Heinrich_Rheinstaadt	= "<a href=""NPCs.asp" & Arg & "#Baron_Heinrich_Rheinstaadt"" title=""Owner of the largest Weapons""><span class=""people"">Baron Heinrich Rheinstaadt</span></a>"
Baron_Heinrich_Rheinstaadt_III	= "<a href=""NPCs.asp" & Arg & "#Baron_Heinrich_Rheinstaadt"" title=""Owner of the largest Weapons""><span class=""people"">Baron Heinrich Rheinstaadt III</span></a>"
Heinrich_Rheinstaadt_III	= "<a href=""NPCs.asp" & Arg & "#Baron_Heinrich_Rheinstaadt"" title=""Owner of the largest Weapons""><span class=""people"">Heinrich Rheinstaadt III</span></a>"
Heinrich_Rheinstaadt_IV		= "<span class=""people"" title=""Son of Baron Heinrich Rheinstaadt III, and heir to the family estate"">Heinrich Rheinstaadt IV</span>"
Baron_Herman_Nordhausen		= "<span class=""people"" title=""A noble from one of the fiefdoms in the southern tip Mellys Valley"">Baron Herman Nordhausen</span>"
Baronette_Gisselle_Nordhausen	= "<span class=""people"" title=""Daughter of Baron Herman Nordhausen"">Baronette Gissellen Nordhausen</span>"
Baby_Groot						= "<span class=""monster"" title=""An 'awakened' cedar tree, created by Avalina"">Baby Groot</span>"
Beatrix							= "<span class=""people"" title=""Commoner friend of Frix"">Beatrix</span>"
Black_Wolf_Clan				= "<span class=""people"" title=""A clan of Paynim nomads who live in the region neat Bab-al-Djebel oasis"">Black Wolf Clan</span>"
Bliq								= "<span class=""people"" title=""An herbalist from the Kelza area"">Bliq</span>"
Bob								= "<span class=""people"" title=""A young city guard in Darby assigned to act as a guide for the party during the plague"">Bob</span>"
Brandy							= "<span class=""people"" title=""Barmaid at Jasco's Place"">Brandy</span>"
Brother_Borin					= "<span class=""people"" title=""A young priest of Fharlanghn, hired by Caris"">Brother Borin</span>"
Father_Borin					= "<span class=""people"" title=""A priest of Fharlanghn, hired by Caris"">Father Borin</span>"
Borin								= "<span class=""people"" title=""A young priest of Fharlanghn, hired by Caris"">Borin</span>"
Cassia							= "<a href=""NPCs.asp" & Arg & "#Cassia"" title=""A charming, beautiful assassin from Loftwick""><span class=""people"">Cassia</span></a>"
Cathme							= "<span class=""people"" title=""A young priest of Baccob who works with Maithius"">Cathme</span>"
Charis_a_Na						= "<span class=""monsters"" title=""A Sulois Mummy Lord/Water Wizard"">Charis-a-Na</span>"
Charmon							= "<span class=""people"" title=""Delar Kar's psuedo-dragon familiar"">Charmon</span>"
Chotan_Enebish					= "<span class=""people"" title=""Man who took on the roll of Lore Master form Balthazar"">Chotan Enebish</span>"
Clarissa							= "<span class=""people"" title=""Body guard of Lord Coreth Wellwood"">Clarissa</span>"
Clothos							= "<span class=""people"" title=""An Devil worshiping Warrior/Priest who fought the Paynim"">Clothos</span>"
Cordin_Fairwind				= "<a href=""NPCs.asp" & Arg & "#Cordin_Fairwind"" title=""Cordin Fairwind, mayor of The Burrows""><span class=""people"">Cordin Fairwind</span></a>"
Corenth_Wellwood				= "<span class=""people"" title=""Nobleman"">Corenth Wellwood</span>"
Crispin_Redwell				= "<a href=""NPCs.asp" & Arg & "#Crispin_Redwell"" title=""His Steadfastness Crispin Redwell the Freeholder, Spokesman for the Yeomanry League""><span class=""people"">Crispin Redwell</span></a>"
Dalarius							= "<span class=""monsters"" title=""A being lost in time and space"">Dalarius</span>"
Lady_Redwell					= "<span class=""people"" title=""Wife of Crispin Redwell"">Lady Redwell</span>"
Daan_the_Druid					= "<span class=""people"" title=""One of the Druids that live in Dusseldorn Hollow"">Daan the Druid</span>"
Daisy								= "<span class=""people"" title=""One of the Flowers of St. Cuthbert, known for her kindness and strangely colored eyes"">Daisy</span>"
Delar_Kar						= "<a href=""NPCs.asp" & Arg & "#Delar_Kar"" title=""Mage who lives in a small community just outside of Portsmouth""><span class=""people"">Delar' Kar</span></a>"
Dridanis							= "<span class=""people"" title=""A group of tree-worshipers who were killed off by barbarians"">Dridanis</span>"
Duke_Byron_Hightower			= "<span class=""people"" title=""A noble from western Mellys Valley"">Duke Byron Hightower</span>"
Duke_Hightower					= "<span class=""people"" title=""A noble from western Mellys Valley"">Duke Hightower</span>"
Elder_Sabina_Thresher		= "<a href=""NPCs.asp" & Arg & "#Elder_Sabina_Thresher"" title=""Mayor of Portsmouth""><span class=""people"">Elder Sabina Thresher</span></a>"
Ezrin								= "<span class=""magic"" title=""An awakened eagle and companion of Kuntas"">Ezrin</span>"
Falcimir							= "<a href=""NPCs.asp" & Arg & "#Falcimir"" title=""Henchman of Delar' Kar""><span class=""people"">Falcimir</span></a>"
Fargus							= "<span class=""people"" title=""A dwarven master smith in Durahl Durh, the Dwarven City Under the Mountain"">Fargus</span>"
Farmer_Brown					= "<span class=""people"" title=""Chicken farmer near Hoff"">Farmer Brown</span>"
Father_Farnomin				= "<a href=""NPCs.asp" & Arg & "#Father_Farnomin"" title=""Priest of Obad-Hai at Dunral""><span class=""people"">Father Farnomin</span></a>"
Father_Charles					= "<span class=""people"" title=""Former priest of St. Cuthbert in Clearwasser, one of teh King's original hirelings"">Father Charles</span>"
Father_Loris					= "<span class=""people"" title=""Priest of St. Cuthbert in Clearwasser"">Father Loris</span>"
The_Flowers_of_St_Cuthbert	= "<a href=""NPCs.asp" & Arg & "#The_Flowers_of_St_Cuthbert"" title=""7 female Paladins in the service of Father Yandar, High Priest of St. Cuthbert""><span class=""people"">The Flowers of St. Cuthbert</span></a>"
Fluellen							= "<span class=""people"" title=""Body guard and friend of Prince Magnus"">Fluellen</span>"
Fosco_Oglethorpe				= "<span class=""people"" title=""Brother of Frobo, murdered by strangers"">Fosco Oglethorpe</span>"
Fosco								= "<span class=""people"" title=""Brother of Frobo, murdered by strangers"">Fosco</span>"
Frab								= "<span class=""people"" title=""A crazy, harmless old man from the Warren House for the Deranged"">Frab</span>"
Frita								= "<span class=""people"" title=""A young woman who house-sits and helps Avalina"">Frita</span>"
Frix								= "<a href=""NPCs.asp" & Arg & "#Frix"" title=""Frix, street urchin from Loftwick""><span class=""people"">Frix</span></a>"
Baronette_Frix					= "<a href=""NPCs.asp" & Arg & "#Frix"" title=""Adopted daughter of Aerethel and Caris""><span class=""people"">Baronnett Frix</span></a>"
Countessa_Frix					= "<a href=""NPCs.asp" & Arg & "#Frix"" title=""Adopted daughter of Aerethel and Caris""><span class=""people"">Countessa Frix</span></a>"
The_Gatekeeper					= "<span class=""people"" title=""A construct that guards the Grand Library of Califri"">The Gatekeeper</span>"
Gilby_Underhill				= "<a href=""NPCs.asp" & Arg & "#Gilby_Underhill"" title=""Halfling merchant in Loftwick""><span class=""people"">Gilby Underhill</span></a>"
Glindor_Stoneheart 			= "<span class=""people"" title=""Dwarven soldier, cousing of Glothil Stoneheart"">Glindor Stoneheart</span>"
Glothil_Stoneheart 			= "<span class=""people"" title=""Dwarven brewer at Hollows Brewery"">Glothil Stoneheart</span>"
Gorthic_Silverbeard			= "<span class=""people"" title=""Dwarven merchant who locates hard to find things in Baylor Thurn"">Gorthic Silverbeard</span>"
Begnym_Solmorn					= "<span class=""people"" title=""Gnome brewer at Hollows Brewery"">Begnym Solmorn</span>"
Hollows_Brewers				= "<span class=""people"" title=""Glothil Stoneheart, Begnym Solmorn and Frobo"">Hollows Brewers</span>"
Sir_Walter_Cummins			= "<span class=""people"" title=""Rude knight who challenged Aerethel"">Sir Walter Cummins</span>"
Sir_Wilhelm_Horst				= "<a href=""NPCs.asp" & Arg & "#Sir_Wilhelm_Horst"" title=""Sir Wilhelm Horst - a young knight in Dusseldorn Hollow""><span class=""people"">Sir Wilhelm Horst</span></a>"
Sir_Wilhelm						= "<a href=""NPCs.asp" & Arg & "#Sir_Wilhelm_Horst"" title=""Sir Wilhelm Horst - a young knight in Dusseldorn Hollow""><span class=""people"">Sir Wilhelm</span></a>"
Gaellen							= "<span class=""people"" title=""A slave/advisor to Sheikh Bato at the Bab-al-Djebe oasis"">Gaellen</span>"
Victor							= "<span class=""people"" title=""Pronounced Himley - human fighters hired by Frobo"">Gimey</span>"
Granny_Abba						= "<span class=""people"" title=""Leader of a small band of pilgrims"">Granny Abba</span>"
Gretta							= "<span class=""people"" title=""A maid in the service of Caris, the only servant with access to his bedroom suite"">Gretta</span>"
Gretta_Von_Holstein			= "<span class=""people"" title=""A professional gambler in the Mellys Valley"">Gretta Von Holstein</span>"
Gunther_Hendel					= "<a href=""Bad_Guys.asp" & Arg & "#Maflic_Harbadin"" title=""A warlock in the service of Maflic Harbadin""><span class=""people"">Gunther Hendel</span></a>"
Gurgan							= "<span class=""people"" title=""One of the Half-elf twins hired by Caris to protect Frix"">Gurgan</span>"
Gus								= "<span class=""people"" title=""Lindsey, friend of Frix"">Gus</span>"
Aliyah_Hamal					= "<span class=""people"" title=""Respected minor noble in Loftwick, wife of Xavier Hamal"">Aliyah Hamal</span>"
Xavier_Hamal					= "<span class=""people"" title=""Respected minor noble in Loftwick, husband of Aliyah Hamal"">Xavier Hamal</span>"
Xavier_and_Aliyah_Hamal		= "<span class=""people"" title=""Respected minor nobles in Loftwick"">Xavier and Aliyah Hamal</span>"
Hans_Lieber						= "<span class=""people"" title=""Major domo for Caris at Dusseldorn Hollow"">Hans Lieber</span>"
Hans								= "<span class=""people"" title=""Major domo for Caris at Dusseldorn Hollow"">Hans</span>"
Hokrodden						= "<span class=""people"" title=""A large, loose affiliation of clans in the Land of the Paynim"">Hokrodden</span>"
Iron_Beak						= "<span class=""people"" title=""Balthazar's buzzard familiar"">Iron Beak</span>"
Mr_Lieber						= "<span class=""people"" title=""Major domo for Caris at Dusseldorn Hollow"">Mr. Lieber</span>"
Hortheim							= "<span class=""people"" title=""Clerk for the Fellowship of Hussain"">Hortheim</span>"
Hummel							= "<span class=""people"" title=""Clerk for the Fellowship of Hussain"">Hummel</span>"
Lysteritha						= "<span class=""people"" title=""Disgraced half-elf chef from the Clockwork Beetle"">Lysteritha</span>"
Javok								= "<span class=""people"" title=""A half-orc scout, former prisoner of the Hill Giants"">Javok</span>"
Jaqal_al_Mizen					= "<span class=""people"" title=""Founder of Jakalla"">Jaqal-al-Mizen</span>"
Judge_Ulva						= "<span class=""people"" title=""Judge in Whyme, paid by Baron Caris Ivsar"">Judge Ulva</span>"
Kuntas							= "<span class=""people"" title=""A runaway slave from the Amadeo Jungle"">Kuntas</span>"
Kylan_Roth						= "<span class=""people"" title=""A stranger in Clearwasser"">Kylan Roth</span>"
Mr_Underhill					= "<a href=""NPCs.asp" & Arg & "#Gilby_Underhill"" title=""Halfling merchant in Loftwick""><span class=""people"">Mr. Underhill</span></a>"
Janiq_of_Tarn					= "<a href=""NPCs.asp" & Arg & "#Janiq_of_Tarn"" title=""Loyal henchman of Thunin -al-Azeed""><span class=""people"">Janiq of Tarn</span></a>"
Jannys_Hawklight				= "<span class=""people"" title=""Snitch in Loftwick"">Jannys Hawklight</span>"
Jetei								= "<span class=""people"" title=""Balthazar's younger brother"">Jetei</span>"

if (userId = "DM") then
	Johann_Schneider			= "<span class=""people"" title=""A retired master assassin posing as a retired merchant - think John Wick"">Johann Schneider</span>"
else
	Johann_Schneider			= "<span class=""people"" title=""A retired merchant from Loftwick"">Johann Schneider</span>"
end if

Jox								= "<span class=""people"" title=""A urchin friend of Frix's from Loftwick"">Jox</span>"
Lord_Juble						= "<span class=""people"" title=""Royal advisor to Maximilian"">Lord Juble</span>"
Juliette							= "<a href=""NPCs.asp" & Arg & "#Juliette_Devereux"" title=""The Dean of Students of the College of Necromancy in Loftwick, Caris's love interest""><span class=""people"">Juliette</span></a>"
Juliette_Devereux				= "<a href=""NPCs.asp" & Arg & "#Juliette_Devereux"" title=""The Dean of Students of the College of Necromancy in Loftwick""><span class=""people"">Juliette Devereux</span></a>"
Ms_Devereux						= "<a href=""NPCs.asp" & Arg & "#Juliette_Devereux"" title=""The Dean of Students of the College of Necromancy in Loftwick""><span class=""people"">Ms. Devereux</span></a>"
Juliette							= "<a href=""NPCs.asp" & Arg & "#Juliette_Devereux"" title=""The Dean of Students of the College of Necromancy in Loftwick""><span class=""people"">Juliette</span></a>"
Abinda							= "<span class=""people"" title=""Tribesman from the Ruhr Valley , prisoner of Frost Giants"">Abinda</span>"
Kimble_Ironheart				= "<span class=""people"" title=""Dwarf from Durahl-Durh, prisoner of Frost Giants"">Kimble Ironheart</span>"
Karna_Sutec						= "<a href=""NPCs.asp" & Arg & "#Karna_Sutec"" title=""An revived man from the Sulois Empire, economic advisor to Setmon the Terrible""><span class=""people"">Karna-Sutec</span></a>"
Khaguran							= "<span class=""people"" title=""Balthazar's youngest brother"">Khaguran</span>"
if (userId = "DM") then
	Kurt_Shilling				= "<span class=""people"" title=""New blacksmith in Whyme - actually the angle Azeel disguised among the common people"">Kurt Shilling</span>"
else
	Kurt_Shilling				= "<span class=""people"" title=""New blacksmith in Whyme"">Kurt Shilling</span>"
end if

Lana_Kar							= "<a href=""NPCs.asp" & Arg & "#Lana_Kar"" title=""Wife of Delar Kar""><span class=""people"">Lana Kar</span></a>"
Larithar							= "<span class=""people"" title=""Stone Giant ambassador"">Larithar</span>"
Lindsey							= "<span class=""people"" title=""Lindsey, friend of Frix"">Lindsey</span>"
Lord_Cavanough					= "<span class=""people"" title=""Ambassador for Freiherr <Maximilian of Berry, hippogriff rider"">Lord Cavanough</span>"
Lord_Gavin						= "<span class=""people"" title=""Mayor/military leader of Farrier`s Ramp"">Lord Gavin</span>"
Lord_Jubal						= "<a href=""NPCs.asp" & Arg & "#Lord_Jubal"" title=""Mayor of Loftwick""><span class=""people"">Lord Jubal</span></a>"
Lord_Timothy					= "<span class=""people"" title=""Hippogriff Knight in the service of King Maximilian"">Lord Timothy</span>"
Lady_Jane						= "<span class=""people"" title=""Hippogriff Knight in the service of King Maximilian"">Lady Jane</span>"
Lord_Kevin						= "<span class=""people"" title=""Hippogriff Knight in the service of King Maximilian"">Lord Kevin</span>"
Lt_Alex_Greenwood				= "<span class=""people"" title=""Young Lt in the Yeomanry guard, resident of Mrs. Hudson's barding house"">Lt. Alex Greenwood</span>"
Lt_Greenwood					= "<span class=""people"" title=""Young Lt in the Yeomanry guard, resident of Mrs. Hudson's barding house"">Lt. Greenwood</span>"
Lia								= "<span class=""people"" title=""Lt Alex Greenwood's fiance"">Lia</span>"
Maflic_Harbadin				= "<a href=""NPCs.asp" & Arg & "#Maflic_Harbadin"" title=""A former student at the College of the Magi in Loftwick, expelled with the help of the party""><span class=""people"">Maflic Harbadin</span></a>"
Maflic							= "<a href=""NPCs.asp" & Arg & "#Maflic_Harbadin"" title=""A former student at the College of the Magi in Loftwick, expelled with the help of the party""><span class=""people"">Maflic</span></a>"
Magnus							= "<span class=""people"" title=""Grandson of King Maximilian & heir to the throne"">Magnus</span>"
Prince_Magnus					= "<span class=""people"" title=""Grandson of King Maximilian & heir to the throne"">Prince Magnus</span>"
Maithius							= "<span class=""people"" title=""An old scholar who works at the Temple/Library of Baccob"">Maithius</span>"
Mark_the_Merchant				= "<span class=""people"" title=""A traveling merchant who visits Whyme every week or so"">Mark the Merchant</span>"
Capt_Marq_Renier				= "<span class=""people"" title=""Commander of the Golden Bear Platoon"">Capt. Marq Renier</span>"
Lord_Marson						= "<span class=""people"" title=""Nobleman and friend of Corenth Wellwood"">Lord Marson</span>"
Luciano_Masserati				= "<span class=""people"" title=""A bard, friend of Maximilian"">Luciano Masserati</span>"
Luciano							= "<span class=""people"" title=""A bard, friend of Maximilian and husband of Thera"">Luciano</span>"
Capt_Renier						= "<span class=""people"" title=""Commander of the Golden Bear Platoon"">Capt. Renier</span>"
Martha							= "<span class=""people"" title=""Mistress of a powerful man in Loftwick who was rescued and relocated to Whyme"">Martha</span>"
Mayor_Baldwin					= "<a href=""NPCs.asp" & Arg & "#Mayor_Baldwin"" title=""Mayor of the village of Baldwin""><span class=""people"">Mayor Baldwin</span></a>"
Freiherr_Maximilian_of_Berry= "<a href=""Max.asp" & Arg & """ title=""Ruler of a remote Kingdom, deep in the Crystalmist Mountains""><span class=""people"">Freiherr Maximilian of Berry</span></a>"
Maximilian_of_Berry			= "<a href=""Max.asp" & Arg & """ title=""Ruler of a remote Kingdom, deep in the Crystalmist Mountains""><span class=""people"">Maximilian of Berry</span></a>"
King_Maximilian				= "<a href=""Max.asp" & Arg & """ title=""Ruler of a remote Kingdom, deep in the Crystalmist Mountains""><span class=""people"">King Maximilian</span></a>"
King_Max							= "<a href=""Max.asp" & Arg & """ title=""Ruler of a remote Kingdom, deep in the Crystalmist Mountains""><span class=""people"">King Max</span></a>"
Mayor_Johann_Schmidt			= "<span class=""people"" title=""Mayor of Clearwasser"">Mayor Johann Schmidt</span>"
Maximilian						= "<a href=""Max.asp" & Arg & """ title=""Ruler of a remote Kingdom, deep in the Crystalmist Mountains""><span class=""people"">Maximilian</span></a>"
Michael_Thomit					= "<span class=""people"" title=""An undead being who asked the party to help with his vengeance"">Michael Thomit</span>"
Michael							= "<span class=""people"" title=""An undead being who asked the party to help with his vengeance"">Michael</span>"
Misstress_Gwyndaelia			= "<span class=""people"" title=""A Fey ruler and minor member of the Seelie Court"">Mistress Gwyndaelia</span>"
Mother_Katherine				= "<span class=""people"" title=""The priestess of Fharlanghn in Loftwick"">Mother Katherine</span>"
Maud_Wilcox						= "<span class=""people"" title=""Small shop owner, resident of Mrs. Hudson's barding house"">Maud Wilcox</span>"
Molly								= "<span class=""people"" title=""Commoner friend of Frix"">Molly</span>"
Mongu								= "<span class=""people"" title=""Paynim girl - sole survivor of the destruction of Ksar-es-Nefad oasis"">Mongu</span>"
Mungetu_Tateer					= "<span class=""people"" title=""Balthazar's clan chieftain"">Mungetu Tateer</span>"
Mrs_Hudson						= "<span class=""people"" title=""An army widow who runs a clean, respectable boarding house in the Upper Uther Isle district of Loftwick - the party's part-time landlord"">Mrs. Hudson</span>"
Nala								= "<span class=""people"" title=""Caris's psuedo-dragon familiar"">Nala</span>"
Nala2								= "<span class=""people"" title=""Frix's psuedo-dragon familiar, formerly her father Caris' familiar"">Nala</span>"
Ned_Leeds						= "<span class=""people"" title=""Proprietor of Ned/s Nets & Ropes in Ferrier's Ramp"">Ned Leeds</span>"
Neothep_Hotep					= "<span class=""people"" title=""A sule arch mage necromancer from a 1,000 years ago - mummy lord"">Neothep Hotep</span>"
Priestess_Nergui_Kojin		= "<span class=""people"" title=""Priestess of Balthaza's people, the Black Wolf Clan"">Priestess Nergui Kojin</span>"
Priestess_Nergui				= "<span class=""people"" title=""Priestess of Balthaza's people, the Black Wolf Clan"">Priestess Nergui</span>"

Nessa								= "<span class=""people"" title=""A Druid in the Kelzad region"">Nessa</span>"
General_Ogu						= "<span class=""people"" title=""A general in the service of the Sultan of Arir"">General Ogu</span>"
Olaf_the_Oaf					= "<span class=""people"" title=""A viking warrior, friend of Maximilian"">Olaf the Oaf</span>"
Ontos								= "<span class=""people"" title=""A litch knight"">Ontos</span>"
Order_of_the_Star				= "<span class=""people"" title=""Devout followers to Celestian"">Order of the Star</span>"
if (userId = "DM") or (userId = "BALTHAZAR") then
	Paynim						= "<a href=""./House_Rules.asp" & Arg & "#Paynim"" title=""Paynim""><span class=""people"">Paynim</span></a>"
	Paynim_Light_Cavalry		= "<a href=""./House_Rules.asp" & Arg & "#Paynim_Light_Cavalry"" title=""Paynim Light Cavalry""><span class=""people"">Paynim Light Cavalry</span></a>"
	Paynim_Heavy_Cavalry		= "<a href=""./House_Rules.asp" & Arg & "#Paynim_Heavy_Cavalry"" title=""Paynim Heavy Cavalry""><span class=""people"">Paynim Heavy Cavalry</span></a>"
else
	Paynim						= "<span class=""people"" title=""A race of nomads know for their raids - the descendants of the Baclunish Empire"">Paynim</span>"
end if

if (userId = "DM") or (userId = "BALTHAZAR") then
	Paynim_Character_Template	= "<a href=""./House_Rules.asp" & Arg & "#Paynim_Character_Template"" title=""Paynim Character Template""><span class=""people"">Paynim Character Template</span></a>"
end if

Petra								= "<span class=""people"" title=""Priestess of St. Cuthbert, hireling of Caris"">Petra</span>"
Phil								= "<span class=""people"" title=""Kidnapper and extortionist in Loftwick"">Phil</span>"
Philia_the_Minstral			= "<span class=""people"" title=""Philia, a traveling minstrel"">Philia</span>"
Pothose							= "<span class=""people"" title=""The youngest member of the Fellowship of Hussain, a former adventurer who was forced into retirement due to crippling injuries"">Pothose</span>"
Prince_Dawa						= "<span class=""people"" title=""Son of Sheikh Bato"">Prince Dawa</span>"
Pompadour						= "<span class=""people"" title=""A traveling minstrel"">Pompadour</span>"
Lt_Polk							= "<span class=""people"" title=""2nd in command of the Golden Bear Platoon"">Lt. Polk</span>"
Rebekah							= "<span class=""people"" title=""Half-elf bard, henchman of Aerethel"">Rebekah</span>"
The_Red_Terror					= "<span class=""people"" title=""A Pyromancer from Balthazar's past"">The Red Terror</span>"
Rolando_the_Magnificent		= "<span class=""people"" title=""A traveling minstrel"">Rolando the Magnificent</span>"
Rolando							= "<span class=""people"" title=""A traveling minstrel"">Rolando</span>"
Lord_Rolf_Hesse				= "<span class=""people"" title=""A knight in the service of Maximilian at Mellys Castle"">Lord Rolf Hesse</span>"
Lord_Rolf						= "<span class=""people"" title=""A knight in the service of Maximilian at Mellys Castle"">Lord Rolf</span>"
Rose								= "<span class=""people"" title=""Leader of the Flowers of St. Cuthbert"">Rose</span>"
Savalin							= "<span class=""people"" title=""Elf maiden, bandit prisoner"">Savalin</span>"
Sithia							= "<a href=""NPCs.asp" & Arg & "#Sithia"" title=""Priestess of Mephistopheles and spiritual guide to Maflic Harbadin""><span class=""people"">Sithia</span></a>"
Setmon_the_Terrible			= "<span class=""people"" title=""A long dead Sulois prince from the House of Rax"">Setmon the Terrible</span>"
Sultan_Kubli_Kai				= "<span class=""people"" title=""Ruler of the Sultanate of Arir, the largest organized nation in the Dry Steppes"">Sultan Kubli-Kai</span>"
Sgt_Jerry						= "<span class=""people"" title=""A young, bony Yeoman sergeant"">Sgt. Jerry</span>"
Madam_Rosetta					= "<a href=""NPCs.asp" & Arg & "#Madam_Rosetta"" title=""The owner of Madam Rosetta's House of Curiosities, a high end establishment selling interesting items""><span class=""people"">Madam Rosetta</span></a>"
Mr_Robinson						= "<a href=""NPCs.asp" & Arg & "#Mr_Robinson"" title=""The owner of Robinson's Arms & Armor, a high end establishment""><span class=""people"">Mr. Robinson</span></a>"
Mr_Schwabb						= "<span class=""people"" title=""One of the accountants/negotiators who is responsible for selling King Maximilian's gem"">Mr. Schwabb</span>"
Sgt_Harris						= "<span class=""people"" title=""Farmer at the Wilson Farm, formerly of the Yeoman 37th Artillery"">Sgt. Harris</span>"
Semsochi_Okin					= "<span class=""people"" title=""Lore keeper of Balthazar's people, the Black Wolf Clan"">Semsochi Okin</span>"
Shazara							= "<span class=""people"" title=""A freed Paynim slave the party rescued from Hobgoblins"">Shazara</span>"
Princess_Shazara				= "<span class=""people"" title=""A freed Paynim slave the party rescued from Hobgoblins"">Princess Shazara</span>"
Sheikh_Boto						= "<span class=""people"" title=""Ruler of the Bab-al-Djebe oasis in the Dry Steppes"">Sheikh Boto</span>"
Sheikh_Dadu						= "<span class=""people"" title=""Ruler of the Soaring Eagle Clan of the Hokrodden people of the Dry Steppes"">Sheikh Dadu</span>"
Sheriff_Ingram					= "<span class=""people"" title=""The man hired by Caris to keep law and order in Dusseldorn Hollow"">Sheriff Ingram</span>"
Silver_Kestrel_Clan			= "<span class=""people"" title=""A clan of Paynim, rivals of Sheikh Bato's clan"">Silver Kestrel Clan</span>"
Silver_Kestrel					= "<span class=""people"" title=""A clan of Paynim, rivals of Sheikh Bato's clan"">Silver Kestrel</span>"
Simon								= "<span class=""people"" title=""Man in Loftwick who arranges meetings"">Simon</span>"
Sir_Rodney						= "<a href=""NPCs.asp" & Arg & "#Sir_Rodney"" title=""Wandering Knight of the Yeomanry""><span class=""people"">Sir Rodney</span></a>"
Albert							= "<span class=""people"" title=""A paladin, and former master of Sigfried Miller"">Albert</span>"
Albert_Schmidt					= "<span class=""people"" title=""A paladin, and former master of Sigfried Miller"">Albert Schmidt</span>"
Pvt_Schmidt						= "<span class=""people"" title=""Soldier in Whyme, AKA Smitty"">Pvt Schmidt</span>"
Smitty							= "<span class=""people"" title=""Soldier in Whyme, AKA Pvt Schmidt"">Smitty</span>"
Sirella_Thurman				= "<a href=""NPCs.asp" & Arg & "#Sirella_Thurman"" title=""Mayor/sheriff of Dagger Falls""><span class=""people"">Sirella Thurman</span></a>"
Son_Thula						= "<span class=""people"" title=""Wizard/priestess of Vecna"">Son-Thula</span>"
Sylvia							= "<span class=""people"" title=""One of the Druids that live in Dusseldorn Hollow"">Sylvian</span>"
Mother_Sithia					= "<span class=""people"" title=""Priestess of St Cuthbert in Whyme"">Mother Sithia</span>"
Lana								= "<a href=""NPCs.asp" & Arg & "#Lana"" title=""Druid in the valley beyond Durahl-Durh""><span class=""people"">Lana</span></a>"
Lana_Thilus						= "<a href=""NPCs.asp" & Arg & "#Lana"" title=""Druid in the valley beyond Durahl-Durh""><span class=""people"">Lana Thilus</span></a>"
Tanis								= "<a href=""NPCs.asp" & Arg & "#Tanis"" title=""Ranger in the valley beyond Durahl-Durh""><span class=""people"">Tanis</span></a>"
Tanis_Thilus					= "<a href=""NPCs.asp" & Arg & "#Tanis"" title=""Ranger in the valley beyond Durahl-Durh""><span class=""people"">Tanis Thilus</span></a>"
Sister_Targanna				= "<span class=""people"" title=""Acolyte who works with Father Borin"">Sister Targanna</span>"
Targanna							= "<span class=""people"" title=""Acolyte who works with Father Borin"">Targanna</span>"
Ted								= "<span class=""people"" title=""Taxidermist near Kelzad"">Ted</span>"
Ted_the_Taxidermist			= "<span class=""people"" title=""Taxidermist outside of Kelzad"">Ted the Taxidermist</span>"
Terrarian						= "<span class=""people"" title=""Caris's uncle"">Terrarian</span>"
Thera								= "<span class=""people"" title=""Widow of Luciano and dear friend of King Max"">Thera</span>"
Lady_Thincell					= "<span class=""people"" title=""Aristrocrate from Farvale"">Lady Thincell</span>"
Theodorus						= "<a href=""NPCs.asp" & Arg & "#Theodorus"" title=""Traveling merchant""><span class=""people"">Theodorus</span></a>"
Thunin_al_Azeed				= "<a href=""NPCs.asp" & Arg & "#Thunin_al_Azeed"" title=""The Dean of Students of the College of Evocation in Loftwick""><span class=""people"">Thunin-al-Azeed</span></a>"
Timly								= "<span class=""people"" title=""Assistant to Maithius, scholar in Loftwick"">Timly</span>"
Tomlin							= "<span class=""people"" title=""Missing boy from Dunral"">Tomlin</span>"
Torrin							= "<span class=""people"" title=""Torrin - Blacksmith at Dunral"">Torrin</span>"
Urgan_and_Gurgan				= "<span class=""people"" title=""Half-elf twins hired by Caris to protect Frix"">Urgan and Gurgan</span>"
Urgan								= "<span class=""people"" title=""One of the Half-elf twins hired by Caris to protect Frix"">Urgan</span>"
Victor							= "<span class=""people"" title=""Ranger hireling of Avalina"">Victor</span>"
Whispering_Breeze				= "<a href=""NPCs.asp" & Arg & "#Whispering_Breeze"" title=""Elven Ranger from Yvalond""><span class=""people"">Whispering Breeze</span></a>"
Sgt_Wilkins						= "<span class=""people"" title=""Veteran in charge of the blockade of Darby during the plague"">Sgt. Wilkins</span>"
Sir_Wilhelm_Horst				= "<a href=""NPCs.asp" & Arg & "#Sir_Wilhelm_Horst"" title=""A traveling knight""><span class=""people"">Sir Wilhelm Horst</span></a>"
Sir_Wilhelm						= "<a href=""NPCs.asp" & Arg & "#Sir_Wilhelm_Horst"" title=""A traveling knight""><span class=""people"">Sir Wilhelm</span></a>"
Thodren_Braldunar				= "<span class=""people"" title=""Priest of Moradin, in the dwarven city of Baylor Thurn"">Thodren Braldunar</span>"
Wix								= "<a href=""NPCs.asp" & Arg & "#Wix"" title=""The Dean of Students of the College of Illusions in Loftwick""><span class=""people"">Wix</span></a>"
Yandar							= "<a href=""NPCs.asp" & Arg & "#Yandar"" title=""Father Yandar, High Priest of St Cuthbert in Loftwick""><span class=""people"">Father Yandar</span></a>"
Father_Yandar					= "<a href=""NPCs.asp" & Arg & "#Yandar"" title=""Father Yandar, High Priest of St Cuthbert in Loftwick""><span class=""people"">Father Yandar</span></a>"
Zandar_Casterhill				= "<span class=""people"" title=""A human noble of Loftwick, former prisoner of the Hill Giants"">Zandar Casterhill</span>"
Zinnia							= "<span class=""people"" title=""One of the Flowers of St. Cuthbert"">Zinnia</span>"
Zolba_a_Na						= "<span class=""people"" title=""A long dead Sulois king who died in the region"">Zolba-a-Na</span>"
Zorm_Ironbeard					= "<span class=""people"" title=""A dwarf, former prisoner of the Hill Giants"">Zorm 'Big Z' Ironbeard</span>"
Big_Z								= "<span class=""people"" title=""Zorm Ironbeard - a dwarf, former prisoner of the Hill Giants"">'Big Z'</span>"
Zellifar_ad_Zol				= "<span class=""people"" title=""Leader of the 1st exodus from the Sule Empire"">Zellifar-ad-Zol</span>"
Zimmerman_and_Sons			= "<span class=""people"" title=""A carpenter and his two sons"">Zimmerman and Sons</span>"


Zolites							= "<span class=""people"" title=""The name of the 8,000 Sule that fled east during the 1st Exodus"">Zolites</span>"
Zumyarus							= "<span class=""people"" title=""A human mage who lives with the elves in Yvalond"">Zumyarus</span>"
if (userId = "DM") then
	Zuni							= "<span class=""people"" title=""A noble lamia that used shapechange to change into a young paynim woman and fool the party - badly!!!"">Zuni</span>"
else
	Zuni							= "<span class=""people"" title=""A young paynim woman (15?) who the party rescued from monsters and set up in an oasis"">Zuni</span>"
end if
Zunid_ad_Zol					= "<span class=""people"" title=""Emperor of the Sule Empire during the 1st Exodus"">Zunid-ad-Zol</span>"




Father_Michael_St_James		= "<a href=""NPCs.asp" & Arg & "#Father_Michael_St_James"" title=""Priest of Rao - adventurer""><span class=""people"">Father Michael St. James</span></a>"
Father_Michael					= "<a href=""NPCs.asp" & Arg & "#Father_Michael_St_James"" title=""Priest of Rao - adventurer""><span class=""people"">Father Michael</span></a>"
Michael_St_James				= "<a href=""NPCs.asp" & Arg & "#Father_Michael_St_James"" title=""Priest of Rao - adventurer""><span class=""people"">Michael St. James</span></a>"
Lady_Ranila						= "<span class=""people"" title=""Paladin of Rao"">Lady Ranila</span>"
Lady_Cecilia_Walsin			= "<span class=""people"" title=""Paladin of St Cuthbert"">Lady Cecilia Walsin</span>"
Lady_Cecilia					= "<span class=""people"" title=""Paladin of St Cuthbert"">Lady Cecilia</span>"
Warren_Ornadis					= "<span class=""people"" title=""Wizard from Veluna City"">Warren Ornadis</span>"
Warren							= "<span class=""people"" title=""Wizard from Veluna City"">Warren</span>"
Sheri_Tumbledown				= "<span class=""people"" title=""Halfling rogue"">Sheri Tumbledown</span>"
Gorthan							= "<span class=""people"" title=""Half orc female righter"">Gorthan</span>"
Antonio_Muchetti				= "<span class=""people"" title=""Human bard"">Antonio Muchetti</span>"
Tuni								= "<span class=""people"" title=""Female Paynim"">Tuni</span>"
Juntar							= "<span class=""people"" title=""The party's guide to Tovag Baragu"">Juntar</span>"
Sultana_Gartu					= "<a href=""NPCs.asp" & Arg & "#Sultana_Gartu"" title=""Ruler of Kanak and many of the tribes in central Dry Steppes""><span class=""people"">Sultana Gartu</span></a>"
Kumat								= "<span class=""people"" title=""Paynim soldier assigned to watch the party at Tovag Baragu"">Kumat</span>"


' New skills
MountedCombat					= ""



' This array is used to link a string to a variable
dim BacklinkArray(5, 2)
for xx1 = 0 to 1
	BacklinkArray(xx1, 0) = ""
	BacklinkArray(xx1, 1) = ""
next
BacklinkArray(0, 0) = "Thunin_al_Azeed"
BacklinkArray(0, 1) = Thunin_al_Azeed
BacklinkArray(1, 0) = "Juliette_Devereux"
BacklinkArray(1, 1) = Juliette_Devereux
BacklinkArray(2, 0) = "Wix"
BacklinkArray(2, 1) = Wix
BacklinkArray(3, 0) = "Yandar"
BacklinkArray(3, 1) = Yandar
BacklinkArray(3, 0) = "Janiq_of_Tarn"
BacklinkArray(3, 1) = Janiq_of_Tarn


Dusseldorn_Hollow_Map			= "<a href=""./Images/Places/Mellys_Valley/Dusseldorn/Dusseldorn_Hollow.png"" title=""Map of Dusseldorn Hollow"" target=""_blank"">Dusseldorn Hollow Map</a>"
Everything_Map						= "<a href=""./Images/Maps/Everything.png"" title=""Map of all mega-hexes combined (it's BIG!)"" target=""_blank"">Everything Map</a>"
Mellys_Valley_Map					= "<a href=""./Images/Places/Mellys_Valley/Mellys_Valley.png"" title=""Map of Mellys Valley"" target=""_blank"">Mellys Valley Map</a>"


' Build standard links for PLACES ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
' Cities, towns, etc
Al_Wastra							= "<a href=""./F147-246.asp" & Arg & "#Al_Wastra""><span class=""place"">Al Wastra</span></a>"
Amadeo_Jungle						= "<span class=""place"" title=""A distant, tropical jungle far to the south"">Amadeo Jungle</span>"
Arathna								= "<span class=""place"" title=""A long lost city, forgotten by all"">Arathna</span>"
Baylor_Thurn						= "<span class=""place"" title=""A dwarven city in the Crystalmist Mountains, near Sterich"">Baylor Thurn</span>"
Beg_Moldir							= "<span class=""place"" title=""A dwarven community in The High Crags"">Beg Moldir</span>"
The_Burrows							= "<a href=""./F163-243.asp" & Arg & "#The_Burrows""><span class=""place"">The Burrows</span></a>"
Caerbannog							= "<a href=""./F149-245.asp" & Arg & "#Caerbannog"" title=""A large dwarven city in the Crystalmist Mountains""><span class=""place"">Caerbannog</span></a>"
Cariss_Mansion						= "<a href=""./Caris_Mansion.asp" & Arg & "#Cariss_Mansion"" title=""Floor plans to Caris's mansion""><span class=""place"">Caris's Mansion</span></a>"
Dagger_Falls						= "<a href=""./F164-244.asp" & Arg & "#Dagger_Falls"" title=""A small village south of Farn Lake along The New Road""><span class=""place"">Dagger Falls</span></a>"
Darby									= "<a href=""./F161-245.asp" & Arg & "#Darby"" title=""A small city on The New Road, east of Loftwick""><span class=""place"">Darby</span></a>"
Delar_Kars_Tower					= "<a href=""./F163-244.asp" & Arg & "#Delar_Kars_Tower"" title=""The home of the wizard, Delar Kar, just outside of the town of Portsmith""><span class=""place"">Delar'Kar's Tower</span></a>"
Dunral								= "<a href=""./F164-243.asp" & Arg & "#Dunral"" title=""Small fishing village on northern edge of Farn Lake""><span class=""place"">Dunral</span></a>"
Durahl_Durh							= "<a href=""./F152-245.asp" & Arg & "#Durahl_Durh"" title=""A large dwarven city at the far west of the Yeomanry, also known as the city under the mountain""><span class=""place"">Durahl-Durh</span></a>"
Farriers_Ramp						= "<a href=""./F165-244.asp" & Arg & "#Farriers_Ramp"" title=""A large fishing village at the eastern edge of Farn Lake""><span class=""place"">Farrier's Ramp</span></a>"
Farvale								= "<span class=""place"" title=""A large fortified city, located between the High Craigs and the Jotens Mountains"">Farvale</span>"
Feywild								= "<span class=""place"" title=""A magical realm, home of the Fey"">Feywild</span>"
Fort_August							= "<span class=""place"" title=""A boarder fort in the North East of the Yeomanry"">Fort August</span>"
Fort_Perth							= "<span class=""place"" title=""The smallest fortification in Loftwick"">Fort Perth</span>"
Greenest								= "<a href=""./F164-242.asp" & Arg & "#Greenest"" title=""A small farming village north of Farn Lake""><span class=""place"">Greenest</span></a>"
The_Highwalls						= "<span class=""place"" title=""A towering, natural bute, home of Luciano and Thera Masserati in the SW edge of Sterich - approximately 1 by 3 miles in size"">The Highwalls</span>"
The_Hill_Giant_Steading			= "<a href=""./F157-246.asp" & Arg & "#The_Hill_Giant_Steading"" title=""A gigantic wooden compound""><span class=""place"">The Hill Giant Steading</span></a>"
Kelzad								= "<a href=""./F155-245.asp" & Arg & "#Kelzad"" title=""A small frontier city in the western Yeomanry""><span class=""place"">Kelzad</span></a>"
Ksar_es_Nefad						= "<span class=""place"" title=""An oasis on the western edge of the Sultanate of Arir in the Dry Steppes"">Ksar-es-Nefad</span>"
Kun									= "<a href=""./F153-245.asp" & Arg & "#Kun"" title=""Remote frontier village in the western Yeomanry""><span class=""place"">Kun</span></a>"
Loftwick								= "<a href=""./F160-246.asp" & Arg & "#Loftwick"" title=""The capital city of the Yeomanry League""><span class=""place"">Loftwick</span></a>"
Lake_of_Death						= "<span class=""place"" title=""A lake in the center of the Sultanate of Arir - the waters are toxic"">Lake of Death</span>"
The_Lake_of_Death					= "<span class=""place"" title=""A lake in the center of the Sultanate of Arir - the waters are toxic"">The Lake of Death</span>"
Combine_Yard_District			= "<a href=""./Loftwick_Combine_Yard.asp" & Arg & """ title=""A rough district in Loftwick""><span class=""place"">Combine Yard District</span></a>"
Dreodae_District					= "<a href=""./Loftwick_Dreodae_District.asp.asp" & Arg & """ title=""A well-to-do district with many fine shops""><span class=""place"">Dreodae District</span></a>"
Northgate							= "<span class=""place"" title=""A narrow pass ending in a 200 foot high cliff that is the northern edge of the Mellys Valley"">Northgate</span>"
Portsmouth							= "<a href=""./F163-244.asp" & Arg & "#Portsmouth"" title=""A small fishing village at the western edge of Farn Lake""><span class=""place"">Portsmouth</span></a>"
Temple_of_the_Tranquil_Valley	= "<a href=""./F147-246.asp" & Arg & "#Temple_of_the_Tranquil_Valley"" title=""A remote temple overlooking a smal, remote valley""><span class=""place"">Temple of the Tranquil Valley</span></a>"
Thunin_al_Azeed_Home				= "<a href=""./Loftwick_Habadock_Quest.asp" & Arg & "#Thunin_al_Azeed_Home"" title=""An upscale restaurant in the Habadock Quest district of Loftwick, near city hall""><span class=""place"">Townhouse of Thunin-al-Azeed, dean of students at the college of the Magi/Evocation</span></a>"
Tribal_Village1					= "<a href=""./F150-245.asp" & Arg & "#Tribal_Village1"" title=""A community of over 100 barbarians""><span class=""place"">Tribal Village</span></a>"
Raveslan								= "<a href=""./F160-246.asp" & Arg & "#Raveslan"" title=""A small way-station/village, 1 day East of Loftwick""><span class=""place"">Raveslan</span></a>"
Riverbend							= "<a href=""./F163-244.asp" & Arg & "#Portsmouth"" title=""A small community on the western edge of Farn Lake adjacent to Portsmouth - home of Delar Kar""><span class=""place"">Riverbend</span></a>"
Ruhr_Shelter						= "<a href=""./F148-246.asp" & Arg & "#Ruhr_Shelter"" title=""A small shelter build into the hillside along the Ruhr Valley""><span class=""place"">Ruhr Shelter</span></a>"
Ruins_Near_Darby					= "<a href=""./F161-245.asp" & Arg & "#Ruins_Near_Darby"" title=""A small underground maze leading to a forgotten temple""><span class=""place"">Ruins Near Darby</span></a>"
SanctuaryCaves						= "<span class=""place"" title=""A series of 4 fortified caverns along the ancient Sule Trading Road"">Sanctuary Caves</span>"
SanctuaryCave1						= "<a href=""./F149-245.asp" & Arg & "#SanctuaryCave1"" title=""The 1st of 4 fortified caverns along the ancient Sule Trading Road""><span class=""place"">Sanctuary Cave #1</span></a>"
SanctuaryCave2						= "<a href=""./F150-245.asp" & Arg & "#SanctuaryCave2"" title=""The 2nd of 4 fortified caverns along the ancient Sule Trading Road""><span class=""place"">Sanctuary Cave #2</span></a>"
SanctuaryCave3						= "<a href=""./F150-245.asp" & Arg & "#SanctuaryCave3"" title=""The 3rd of 4 fortified caverns along the ancient Sule Trading Road""><span class=""place"">Sanctuary Cave #3</span></a>"
SanctuaryCave4						= "<a href=""./F151-246.asp" & Arg & "#SanctuaryCave4"" title=""The 4th of 4 fortified caverns along the ancient Sule Trading Road""><span class=""place"">Sanctuary Cave #4</span></a>"
Southgate							= "<a href=""./F149-245.asp" & Arg & "#Southgate"" title=""A natural saddle in the mountains separating the Rurh Valley from Max's valley. A heavily fortified tower guards the passage.""><span class=""place"">Southgate</span></a>"
Sterich								= "<span class=""place"" title=""The country to the morth of the Yeomanry, beyond the Jotens Mountains"">Sterich</span>"
Tranquil_Valley					= "<a href=""./F147-246.asp" & Arg & "#Tranquil_Valley""><span class=""place"">Tranquil Valley</span></a>"
Veluna_City							= "<span class=""place"" title=""Holy city and center of power for the worshipers of Rao and St Cuthbert"">Veluna City</span>"
Wilson_Farm							= "<a href=""./F153-245.asp" & Arg & "#Wilson_Farm"" title=""A fortified farming compound in the Durahl Valley near Kun""><span class=""place"">Wilson Farm</span></a>"
WitchDoctorCave					= "<a href=""./F150-245.asp" & Arg & "#WitchDoctorCave"" title=""A natural cave, home to a barbarian witch doctor and her daughters""><span class=""place"">Witch Doctor Cave</span></a>"
Cave_Entrance_East				= "<a href=""./F148-246.asp" & Arg & "#Cave_Entrance_East""><span class=""place"">Cave Entrance</span></a>"
Cave_Entrance_West				= "<a href=""./F147-246.asp" & Arg & "#Cave_Entrance_West""><span class=""place"">Cave Entrance</span></a>"
Yvalond								= "<a href=""./F163-242.asp" & Arg & "#Yvalond"" title=""A small elven village, hidden in the woods north of The Burrows""><span class=""place"">Yvalond</span></a>"

Greyhawk								= "<span class=""place"" title=""A large, free-city in the middle of the continent"">Greyhawk</span>"
Poligius								= "<span class=""people"" title=""A human human scholar from Greyhawk"">Poligius</span>"
The_Well_of_Knowledge			= "<span class=""place"" title=""An enormous, ancient, forgotten, magical buried library - AKA The Grand Library of Califri"">The Well of Knowledge</span>"
The_Grand_Library_of_Califri	= "<span class=""place"" title=""An enormous, ancient, forgotten, magical buried library - AKA The Well of Knowledge"">The Grand Library of Califri</span>"
The_Library							= "<span class=""place"" title=""The Grand Library of Califri - an enormous, ancient, forgotten, magical buried library - AKA The Well of Knowledge"">The Library</span>"
Underdark							= "<span class=""place"" title=""The name given to the vast underground realm of the Drow and other subterranean beings"">Underdark</span>"
Yeomanry								= "<span class=""place"" title=""A country near the Crystalmist Mountains"">Yeomanry</span>"



' Link to events ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Aerethel_Died2						= "<a href=""./Recap_C2_017.asp" & Arg & "#Aerethel_Died2"" title=""Killed by a large frog-like monster""><span class=""place"">Aerethel Died</span></a>"
Attack_on_Darby					= "<a href=""./Recap_C2_007.asp" & Arg & "#Attack_on_Darby"" title=""Remote frontier village in the western Yeomanry""><span class=""place"">attack on Darby</span></a>"
Dragon_Sighting01					= "<a href=""./Recap_C2_014.asp" & Arg & "#Dragon_Sighting01"" title=""Dragon sighting""><span class=""place"">Borin glimpses a dragon</span></a>"
Druid_Gathering					= "<a href=""./Recap_C2_014.asp" & Arg & "#Druid_Gathering"" title=""A secret meeting in the woods between Loftwick and Kelzad""><span class=""place"">Druid Gathering</span></a>"
Elven_Sacred_Grove				= "<a href=""./Recap_C2_005.asp" & Arg & "#Elven_Sacred_Grove"" title=""A sacred grove near Yvalond in the Cool Mist Forest""><span class=""place"">Elven Sacred Grove</span></a>"
Night_of_Grand_Thievery			= "<span class=""place"" title=""The night in Loftwick when many magic items were all stolen in a single evening"">Night of Grand Thievery</span>"
The_Phil_Event						= "<a href=""./Recap_C2_021.asp" & Arg & "#The_Phil_Event"" title=""When the party executed the man who masterminded Frix's kidnapping""><span class=""place"">The Phil Event</span></a>"
The_Raid_On_The_Wilson_Farm	= "<a href=""./Recap_C2_024.asp" & Arg & "#The_Raid_On_The_Wilson_Farm"" title=""Hill Giant, Ogre and Bugbear attack on the Wilson Farm""><span class=""place"">The Raid on the Wilson Farm</span></a>"
Journey_to_The_Highwalls		= "<a href=""./Recap_C2_040.asp" & Arg & "#The_Raid_On_The_Wilson_Farm"" title=""When the party escorted King Max to The Highwalls""><span class=""place"">Journey to The Highwalls</span></a>"
Speed4Speed							= "<a href=""./Recap_C2_016.asp" & Arg & "#Speed4Speed"" title=""The bargain Caris made the increased his initiative at the cost of his movement (lost 2 twos)""><span class=""place"">Speed for Speed</span></a>"




' Links in Max's valley
CentralMellysValley				= "<a href=""./F149-243.asp" & Arg & "#CentralMellysValley"" title=""The central parts of Maximilian's valley""><span class=""place"">Central Mellys Valley</span></a>"
Clearwasser							= "<a href=""./F149-243.asp" & Arg & "#Clearwasser"" title=""Capital city of the Mellys Valley""><span class=""place"">Clearwasser</span></a>"
Dusseldorn_Hollow					= "<span class=""place"" title=""Home of the Whyme Pines"">Dusseldorn Hollow</span>"
Dusseldorn_HollowNW				= "<a href=""./F149-242.asp" & Arg & "#Dusseldorn_HollowNW"" title=""The north western half of Dusseldorn Hollow""><span class=""place"">Dusseldorn Hollow North West</span></a>"
Dusseldorn_HollowSE				= "<a href=""./F150-242.asp" & Arg & "#Dusseldorn_HollowSE"" title=""The south eastern half of Dusseldorn Hollow""><span class=""place"">Dusseldorn Hollow South East</span></a>"
FairwaetherPass					= "<a href=""./F150-243.asp" & Arg & "#FairwaetherPass"" title=""A high mountain pass between OstenBauernhof Valley and Tauberg Valley""><span class=""natural"">Fairwaether Pass</span></a>"
Garth									= "<a href=""./F149-244.asp" & Arg & "#Garth"" title=""A simple town located 4 miles south of Hollis""><span class=""place"">Garth</span></a>"
Heil_Lake							= "<a href=""./F149-243.asp" & Arg & "#Heil_Lake"" title=""A large lake beside Clearwasser in the Mellys Valley""><span class=""water"">Heil Lake</span></a>"
Hollows_Brewery					= "<a href=""./F149-242.asp" & Arg & "#Hollows_Brewery"" title=""A microbrewry in Whyme, funded by Frobo""><span class=""place"">Hollows Brewry</span></a>"
Hummelberg							= "<a href=""./F150-243.asp" & Arg & "#Hummelberg"" title=""The largest village in the Tauberg Valley""><span class=""place"">Hummelberg</span></a>"
Kern									= "<span class=""place"" title=""A town in Wittenberg fiefdom"">Kern</span>"
Liebenstadt							= "<span class=""place"" title=""Home town of Duke Byron Hightower in Wittenberg fiefdom"">Liebenstadt</span>"
Luekwitz_Valley					= "<a href=""./F148-242.asp" & Arg & "#Luekwitz_Valley"" title=""The valley to the west of the capital of the Mellys Valley""><span class=""place"">Luekwitz Valley</span></a>"
MellysValleyEast					= "<a href=""./F150-243.asp" & Arg & "#MellysValleyEast"" title=""The south eastern half of the Mellys Valley""><span class=""place"">Mellys Valley East</span></a>"
Maxs_Valley							= "<span class=""place"" title=""The valley ruled by Maximilian, AKA Mellys Valley"">Max's Valley</span>"
Mellys_Castle						= "<a href=""./F149-243.asp" & Arg & "#Mellys_Castle"" title=""Maximilian's castle""><span class=""place"">Mellys Castle</span></a>"
Mellys_Castle_Max					= "<a href=""./Max.asp" & Arg & "#Mellys_Castle"" title=""Largest castle in the Mellys Valley and family home of Maximilian""><span class=""place"">Mellys Castle</span></a>"
Mellys_Valley						= "<span class=""place"" title=""The name of Maximilien's valley"">Mellys Valley</span>"
Mellys_Valley_SW_of_Mellys_Castle	= "<a href=""./Max.asp" & Arg & "#Mellys_Valley_SW_of_Mellys_Castle"" title=""The south western edge of the Mellys Valley, just south of Mellys Castle""><span class=""place"">Mellys Valley, South West of Mellys Castle</span></a>"
Mueller_Pass						= "<span class=""place"" title=""A snow covered pass ridge between Dusseldorn Hollow & OstenBauernhof Valley "">Mueller Pass</span>"
Mueller_PassN						= "<a href=""./F150-242.asp" & Arg & "#Mueller_Pass"" title=""A snow covered pass between Dusseldorn Hollow & OstenBauernhof Valley""><span class=""place"">Mueller Pass</span></a>"
Mueller_PassS						= "<a href=""./F150-243.asp" & Arg & "#Mueller_Pass"" title=""A snow covered pass between Dusseldorn Hollow & OstenBauernhof Valley""><span class=""place"">Mueller Pass</span></a>"
Nordhausen_Valley					= "<a href=""./F148-244.asp" & Arg & "#Nordhausen_Valley"" title=""The SW corner of the souther arm of the Mellys Valley""><span class=""place"">Nordhausen Valley</span></a>"
OstenBauernhof						= "<a href=""./F150-243.asp" & Arg & "#OstenBauernhof"" title=""The ruling town in OstenBauernhof Valley, a small offshoot valley in the easter Mellys Valley""><span class=""place"">OstenBauernhof</span></a>"
OstenBauernhofValleyN			= "<a href=""./F150-242.asp" & Arg & "#OstenBauernhofValleyN"" title=""A small offshoot valley in the easter Mellys Valley""><span class=""place"">OstenBauernhof Valley</span></a>"
OstenBauernhofValleyS			= "<a href=""./F150-243.asp" & Arg & "#OstenBauernhofValleyS"" title=""A small offshoot valley in the easter Mellys Valley""><span class=""place"">OstenBauernhof Valley</span></a>"
Roscherberg							= "<a href=""./Max.asp" & Arg & "#Roscherberg"" title=""A castle built atop a volcanic plug""><span class=""place"">Roscherberg</span></a>"
Sassenberg							= "<span class=""place"" title=""A town in Wittenberg fiefdom"">Sassenberg</span>"
SouthernMellysValley				= "<a href=""./F149-244.asp" & Arg & "#SouthMellysValley"" title=""The southern edge of Maximilian's valley""><span class=""place"">Southern Mellys Valley</span></a>"
SouthEasternMellysValley		= "<a href=""./F149-244.asp" & Arg & "#SouthEasternMellysValley"" title=""The south easern edge of Maximilian's valley""><span class=""place"">South eastern Mellys Valley</span></a>"
Southgate_Tower					= "<a href=""./F149-245.asp" & Arg & "#Southgate_Tower"" title=""A small community on the western edge of Farn Lake adjacent to Portsmouth - home of Delar Kar""><span class=""place"">Southgate Tower</span></a>"
Stopselberg							= "<a href=""./Max.asp" & Arg & "#Stopselberg"" title=""A traditional castle built atop a high hilltop""><span class=""place"">Stopselberg</span></a>"
TauBergValley						= "<a href=""./F150-243.asp" & Arg & "#TauBergValley"" title=""The south eastern most sub-valley in the Mellys Valley""><span class=""place"">Tauberg Valley</span></a>"
Temple_of_Fharlanghn_Borin		= "<a href=""./F149-243.asp" & Arg & "#Temple_of_Fharlanghn_Borin"" title=""A small, road-side temple at the entrance of Dusseldorn Hollow""><span class=""place"">Temple of Fharlanghn</span></a>"
The_Arm_of_The_Valley			= "<a href=""./F148-243.asp" & Arg & "#The_Arm_of_The_Valley"" title=""A huge spine of mountain jutting into the Mellys Valley""><span class=""place"">The Arm of The Valley</span></a>"
Hollis								= "<a href=""./F149-244.asp" & Arg & "#Hollis"" title=""A large village in the southern Mellys valley""><span class=""place"">Hollis</span></a>"
Viktorenberg						= "<a href=""./Max.asp" & Arg & "#Roscherberg"" title=""A hidden fortress build within a towering volcanic plug""><span class=""place"">Viktorenberg</span></a>"
Wittenberg							= "<span class=""place"" title=""Western most fief in the Mellys Valley"">Wittenberg</span>"
Werenwag								= "<a href=""./Max.asp" & Arg & "#Werenwag"" title=""A traditional castle built at the top of a ridge line""><span class=""place"">Werenwag</span></a>"
Whyme									= "<a href=""./F149-242.asp" & Arg & "#Whyme"" title=""The ruling town of Dusseldorn Hollow""><span class=""place"">Whyme</span></a>"


Brandis								= "<a href=""./F149-242.asp" & Arg & "#Brandis"" title=""A small farming village in the north west of Dusseldorn Hollow""><span class=""place"">Brandis</span></a>"
Wurzback								= "<a href=""./F149-242.asp" & Arg & "#Wurzback"" title=""A small mining community in the west of Dusseldorn Hollow""><span class=""place"">W&uuml;rzback</span></a>"


Prum									= "<a href=""./F150-242.asp" & Arg & "#Prum"" title=""A small farming village in the north east of Dusseldorn Hollow""><span class=""place"">Pr&uuml;m</span></a>"
Hoff									= "<a href=""./F150-242.asp" & Arg & "#Hoff"" title=""A farming village in the eastern half of Dusseldorn Hollow, 2nd largest town in the valley""><span class=""place"">Hoff</span></a>"

Darrin								= "<a href=""./F150-242.asp" & Arg & "#Darrin"" title=""A small mining town in the south east corner of Dusseldorn Hollow""><span class=""place"">Darrin</span></a>"
Thurm									= "<a href=""./F150-242.asp" & Arg & "#Thurm"" title=""A small mining community in the north east of Dusseldorn Hollow""><span class=""place"">Th&uuml;rm</span></a>"
Klutz									= "<a href=""./F150-242.asp" & Arg & "#Klutz"" title=""A small mining community in the far east of Dusseldorn Hollow""><span class=""place"">Kl&uuml;tz</span></a>"




Wizneski								= "<a href=""./F149-243.asp" & Arg & "#Wizneski"" title=""A simple town, about 8 miles east of Clearwasser""><span class=""place"">Wizneski</span></a>"



'Inns & Taverns in Mellys Valley
The_Black_Swan						= "<a href=""./F149-244.asp" & Arg & "#The_Black_Swan"" title=""A large inn located in Hollis catering to travelers leaving and exiting the Mellys Valley via Southgate""><span class=""place"">The Black Swan</span></a>"
The_Brass_Boar_Tavern			= "<a href=""./F149-243.asp" & Arg & "#The_Brass_Boar_Tavern"" title=""A high end tavern specializing in Dwarven themed meals""><span class=""place"">The Brass Boar Tavern</span></a>"
The_Black_Wood_Tavern			= "<a href=""./F149-243.asp" & Arg & "#The_Black_Wood_Tavern"" title=""A large, high end tavern in Clearwasser - caters to the wealthy""><span class=""place"">The Black Wood Tavern</span></a>"
The_Carpenters_Arms				= "<a href=""./F149-243.asp" & Arg & "#The_Carpenters_Arms"" title=""A mid-size, low end tavern in Clearwasser - caters to the commoners""><span class=""place"">The Carpenter's Arms</span></a>"
The_Dancing_Donkey				= "<a href=""./F149-243.asp" & Arg & "#The_Dancing_Donkey"" title=""A mid- to low-end tavern beyond the walls of Clearwasser""><span class=""place"">The Dancing Donkey</span></a>"
Elk_and_Stag						= "<span class=""place"" title=""A tavern in Whyme, partially owned by Frobo"">Elk and Stag</span>"
The_Hare_and_Hound				= "<a href=""./F149-243.asp" & Arg & "#The_Hare_and_Hound"" title=""A mid-size, average tavern in Clearwasser - caters to the commoners""><span class=""place"">The Hare & Hound</span></a>"
The_Jade_Lion						= "<a href=""./F149-243.asp" & Arg & "#The_Jade_Lion"" title=""A high end tavern specializing in exotic themed meals""><span class=""place"">The Jade Lion</span></a>"
The_Flying_Griffon				= "<a href=""./F149-243.asp" & Arg & "#The_Flying_Griffon"" title=""A high end tavern specializing in German themed meals""><span class=""place"">The Flying Griffon</span></a>"
The_Kings_Crown					= "<a href=""./F149-243.asp" & Arg & "#The_Kings_Crown"" title=""A mid-size, average tavern in Clearwasser - caters to the commoners""><span class=""place"">The King's Crown</span></a>"
Pine_Crest_Inn						= "<span class=""place"" title=""A nice, new tavern in Whyme, owned by Frobo"">Pine Crest Inn</span>"
The_Red_Dragon						= "<a href=""./F149-243.asp" & Arg & "#The_Red_Dragon"" title=""A mid-size, low end tavern in Clearwasser - caters to the commoners""><span class=""place"">The Red Dragon</span></a>"
The_Red_Oak							= "<a href=""./F149-243.asp" & Arg & "#The_Red_Oak"" title=""A medium, above average tavern in Clearwasser - caters to the merchants""><span class=""place"">The Red Oak</span></a>"
The_Rising_Sun_Tavern			= "<a href=""./F149-243.asp" & Arg & "#The_Rising_Sun_Tavern"" title=""A large, high end tavern in Clearwasser - known for its annual gambling tournament""><span class=""place"">The Rising Sun Tavern</span></a>"
The_Swan_and_Rose					= "<a href=""./F149-243.asp" & Arg & "#The_Swan_and_Rose"" title=""A mid-size, average tavern in Clearwasser - caters to the commoners""><span class=""place"">The Swan and Rose</span></a>"
The_White_Hart						= "<a href=""./F149-243.asp" & Arg & "#The_White_Hart"" title=""A medium, above average tavern in Clearwasser - caters to the merchants""><span class=""place"">The White Hart</span></a>"



Fellowship_of_Husain				= "<a href=""NPCs.asp" & Arg & "#Fellowship_of_Husain"" title=""A small band of Wizards in Clearwasser, who take their name form the great Wizard 'Mad Husain', a long dead follower of Maximilian""><span class=""people"">Fellowship of Husain</span></a>"
The_Library_of_Clearwasser		= "<a href=""./F149-243.asp" & Arg & "#The_Library_of_Clearwasser"" title=""A private library in Clearwasser - 50gp/person/year""><span class=""place"">The Library of Clearwasser</span></a>"



Reinheitsgebot_Purity_Laws		= "<span class=""place"" title=""The Mellys valley beer purity laws"">Reinheitsgebot Purity Laws</span>"



' Inns and Taverns (not in Mellys Valley)
The_Blue_Rose						= "<span class=""place"" title=""A simple tavern in Portsmouth"">The Blue Rose</span>"
The_Boots_and_Dagger				= "<a href=""./F165-244.asp" & Arg & "#The_Boots_and_Dagger"" title=""A rough tavern in Farrier's Ramp located near the northern docks""><span class=""place"">The Boots & Dagger</span></a>"
Clockwork_Beetle					= "<a href=""./Loftwick_Habadock_Quest.asp" & Arg & "#Clockwork_Beetle"" title=""A 5-star restaurant in Loftwick""><span class=""place"">Clockwork Beetle</span></a>"
The_Crystal_Dancer				= "<a href=""./Loftwick_Habadock_Quest.asp" & Arg & "#The_Crystal_Dancer"" title=""An upscale restaurant in the Habadock Quest district of Loftwick, near city hall""><span class=""place"">The Crystal Dancer</span></a>"
The_Dancing_Maiden_Tavern		= "<a href=""./Loftwick_Lower_Uther_Isle.asp" & Arg & "#The_Dancing_Maiden_Tavern"" title=""A typical tavern""><span class=""place"">The Dancing Maiden Tavern</span></a>"
The_Emperess_Inn					= "<a href=""./Loftwick_Sanctia_District.asp" & Arg & "#The_Emperess_Inn"" title=""A high end Inn in Loftwick that caters to merchants""><span class=""place"">The Empress Inn</span></a>"
The_Golden_Dragon					= "<a href=""./F165-244.asp" & Arg & "#The_Golden_Dragon"" title=""A traditional tavern in Farrier's Ramp located near the souther docks""><span class=""place"">The Golden Dragon</span></a>"
Fox_Flagon							= "<a href=""./Loftwick_Orichalcum_District.asp" & Arg & "#Fox_Flagon"" title=""A respectable tavern in Loftwick""><span class=""place"">The Fox & Flagon</span></a>"
The_Greenhill_Inn					= "<span class=""place"" title=""The only tavern in the village of Raveslan"">The Greenhill Inn</span>"
Jascos_Place						= "<span class=""place"" title=""Tavern in the fishing village of Dunral on Farn Lake"">Jasco's Place</span>"
The_Jigging_Jenny					= "<span class=""place"" title=""A respectable inn and tavern in Loftwick"">The Jigging Jenny</span>"
Mrs_Hudsons_Boarding_House		= "<span class=""place"" title=""A respectable boarding house in Loftwick, run my an Army widow"">Mrs. Hudson's Boarding House</span>"
Rosies_Place						= "<a href=""./F163-243.asp" & Arg & "#Rosies_Place"" title=""Town Hall by day, Tavern by night - built to accommodate 'big' people""><span class=""place"">Rosie's Place</span></a>"
The_Ox_and_Plow					= "<a href=""./F165-244.asp" & Arg & "#The_Ox_and_Plow"" title=""A seedy tavern in the Combine Yard district of Loftwick""><span class=""place"">The Ox & Plow</span></a>"
The_Prancing_Pony_14				= "<a href=""./F165-244.asp" & Arg & "#The_Prancing_Pony"" title=""A seedy tavern in the Combine Yard district of Loftwick""><span class=""place"">The Prancing Pony #14</span></a>"
The_Prancing_Pony_17				= "<a href=""./F165-244.asp" & Arg & "#The_Prancing_Pony"" title=""A respectable tavern in trading city of Kelzad""><span class=""place"">The Prancing Pony #17</span></a>"
The_Prancing_Pony_301			= "<a href=""./F165-244.asp" & Arg & "#The_Prancing_Pony"" title=""A respectable tavern in Farrier's Ramp located on the town square""><span class=""place"">The Prancing Pony #301</span></a>"
The_Prancing_Pony_EOTW			= "<a href=""./F153-245.asp" & Arg & "#The_Prancing_Pony_EOTW"" title=""The only tavern in the remote frontier town of Kun""><span class=""place"">The Prancing Pony EOTW (End of the World)</span></a>"
The_Rose_and_Sword				= "<span class=""place"" title=""A respectable tavern in Kelzad"">The Rose and Sword</span>"

The_Snoring_Raccoon				= "<span class=""place"" title=""A respectable tavern/tavern in Loftwick"">The Snoring Raddoon</span>"

Yargos_Clankhorse_Stables		= "<a href=""./Loftwick_Scornwall_East.asp" & Arg & "#Yargos_Clankhorse_Stables"" title=""A large stable in Loftwick just outside the eastern wall""><span class=""place"">Yargo's Clankhorse Stables</span></a>"


Warren_House_for_the_Deranged	= "<span class=""place"" title=""An asylum to the NE of Loftwick"">Warren House for the Deranged</span>"




' Castles/fortresses
The_Eagles_Nest_Loftwick		= "<a href=""./F160-246.asp" & Arg & "#The_Eagles_Nest"" title=""A sentry tower located in The High Craigs overlooking the valley east of Loftwick""><span class=""place"">The Eagle's Nest</span></a>"
Gwynedd_Castle						= "<a href=""./F161-245.asp" & Arg & "#Gwynedd_Castle"" title=""A small keep and home of Lord Ralstanaard""><span class=""place"">Gwynedd Castle</span></a>"
Karlstejn_Castle					= "<a href=""./F161-245.asp" & Arg & "#Karlstejn_Castle"" title=""A modest castle and home of the Fendel family""><span class=""place"">Karlstejn Castle</span></a>"
Katz_Castle							= "<a href=""./F160-246.asp" & Arg & "#Katz"" title=""One of several castles in the valley to the east of Loftwick""><span class=""place"">Katz Castle</span></a>"
Marksburg							= "<a href=""./F160-246.asp" & Arg & "#Marksburg"" title=""One of several castles in the valley to the east of Loftwick""><span class=""place"">Castle Marksburg</span></a>"
The_Outpost							= "<a href=""./F165-244.asp" & Arg & "#The_Outpost"" title=""A well fortified bridge just south of Farrier's Ramp""><span class=""place"">The Outpost</span></a>"





' Natural Places (rivers, lakes, cliffs, etc.)
Bosgiraud_Lake						= "<span class=""water"" title=""A clear, ice cold lake located just beyond the western boarder of the Yeomanry in the Crystalmist Mountains"">Bosgiraud Lake</span>"
The_Bowl								= "<a href=""./F162-243.asp" & Arg & "#The_Bowl"" title=""A natural bowl shaped formation, filled primarily with a swamp""><span class=""place"">The Bowl</span></a>"
Cave_of_Pentagornaphoria		= "<a href=""./F153-245.asp" & Arg & "#Cave_of_Pentagornaphoria"" title=""A natural bowl shaped formation, filled primarily with a swamp""><span class=""place"">Cave of Pentagornaphoria</span></a>"
The_Cool_Mist_Forest				= "<a href=""./F163-243.asp" & Arg & "#The_Cool_Mist_Forest"" title=""A vast forest, noted for its misty mornings and evening - protected by elves""><span class=""woods"">The Cool Mist Forest</span></a>"
The_Crystalmist_Mountains		= "<span class=""natural"" title=""The largest mountain range on the continent, it separates the 'civilized' lands in the East from the Dry Steppes and Sea of Dust to the West"">The Crystalmist Mountains</span>"
The_Davish_River					= "<span class=""water"" title=""A river that starts in the Crystalmists and flows through Sterich"">The Davish River</span>"
Davish								= "<span class=""water"" title=""A river that starts in the Crystalmists and flows through Sterich"">Davish</span>"
Davish_River						= "<span class=""water"" title=""A river that starts in the Crystalmists and flows through Sterich"">Davish River</span>"
Dry_Steppes							= "<span class=""natural"" title=""The vast plains that were once the home of the Baklunish people - now home to the Paynim"">Dry Steppes</span>"
Durahl_River						= "<span class=""water"">The Durahl River</span>"
Durahl_Valley						= "<a href=""./F154-245.asp" & Arg & "#Durahl_Valley"" title=""The valley west of Kelzad""><span class=""place"">Durahl Valley</span></a>"
The_Escarpment						= "<span class=""natural"" title=""A natural cliff face that stretched for over 100 miles with an average height ranging from 150 to 200 feet"">The Escarpment</span>"
Farn_Lake							= "<span class=""water"" title=""A huge lake in the center of The Yeomanry"">Farn Lake</span>"
Karnoosh_Hills						= "<span class=""water"" title=""A rocky set of hills near Tovag Baragu"">Karnoosh Hills</span>"
The_High_Crags						= "<span class=""natural"" title=""A series of rough, rocky cliffs and mountains that spawn off the Jotens Mountains"">The High Crags</span>"
The_Joeten_Mountains				= "<span class=""natural"" title=""The part of the Crystalmist Mountains that seperate Sterich from The Yeomanry"">The Joeten Mountains</span>"
Kalter_Fluss						= "<span class=""water"" title=""A mid-size river in the Mellys Valley in the eastern half of the valley"">Kalter Fluss</span>"
Kendeen_River						= "<span class=""water"">The Kendeen River</span>"
The_Little_Hills					= "<span class=""natural"" title=""A wide region of rolling hills in the NE of the Yeomanry"">The Little Hills</span>"
The_Lower_Little_Sule_River	= "<span class=""water"" title=""The part of the river below Farn Lake"">The Lower Little Sule River</span>"
Natural_Bridge						= "<a href=""./F162-243.asp" & Arg & "#Natural_Bridge"" title=""A narrow, natural crossing from the Escarpment to an adjacent cliff face""><span class=""natural"">Natural Bridge</span></a>"
The_Reslya_River					= "<span class=""water"" title=""A wide yet shallow river that flows from the northeast to the southwest in the Ur-Na Valley"">The Reslya River</span>"
The_Ruhr_River						= "<span class=""water"" title=""The icy river that flows down the long valley from Caerbannog to Durahl Durh"">The Ruhr River</span>"
Ruhr_Valley							= "<span class=""natural"" title=""The long valley from Caerbannog to Durahl Durh"">Ruhr Valley</span>"
Ruhrbach_Falls						= "<a href=""./F153-245.asp" & Arg & "#Ruhrbach_Falls"" title=""A large waterfall on the Durahl River, east of Kun""><span class=""water"">Rurhbach Falls</span></a>"
The_Sea_of_Dust					= "<a href=""./Appendix.asp" & Arg & "#The_Sea_of_Dust"" title=""The scorched, desolate remains of what was once the mighty Suloise Empire""><span class=""place"">The Sea of Dust</span></a>"
Sea_of_Dust							= "<a href=""./Appendix.asp" & Arg & "#The_Sea_of_Dust"" title=""The scorched, desolate remains of what was once the mighty Suloise Empire""><span class=""place"">Sea of Dust</span></a>"
Shassar_Sea_Cine					= "<span class=""natural"" title=""A haunted city at the entrance to teh Dry Stepps"">Shassar-Sea-Cine</span>"
Sheldomar_Valley					= "<span class=""natural"" title=""the large swath of fertile land in the southwestern Flanaess, bordered by the Barrier Peaks to the north, Crystalmists and Hellfurnaces to the west, Azure Sea to the south and the Lortmils to the east."">Sheldomar Valley</span>"
Solnor								= "<span class=""water"">Solnor</span>"
Tauber_River						= "<span class=""water"" title=""A mid-size river in the Mellys Valley that flows to the west and exits via a 200 ft waterfall"">Tauber River</span>"
Termlane_Forest					= "<a href=""./F155-245.asp" & Arg & "#Termlane_Forest"" title=""An ancient forest, once the home of a band of Druids known as The Dridanis,""><span class=""woods"">Termlane Forest</span></a>"
The_Upper_Little_Sule_River	= "<span class=""water"" title=""The part of the river above Farn Lake"">The Upper Little Sule River</span>"
The_Sule_River						= "<span class=""water"">The Sule River</span>"
The_Sulhaut_Mountains			= "<span class=""natural"" title=""A mountain range heading east to west that seperates the Dry Steppes and the Sea of Dust"">The Sulhaut Mountains</span>"
Sweetwater_Lake					= "<span class=""water"" title=""A large lake beside Loftwick, capital of the Yeomanry"">Sweetwater Lake</span>"
The_Ur_Un_Valley					= "<a href=""./F160-246.asp" & Arg & "#The_Ur_Un_Valley"" title=""A vast valley east of Loftwick""><span class=""place"">The Ur-Un Valley</span></a>"
The_Valley_of_the_Chosen		= "<a href=""./F164-243.asp" & Arg & "#The_Valley_of_the_Chosen"" title=""A small, hidden valley populated may magical, intelligent creatures""><span class=""place"">The Valley of the Chosen</span></a>"
Wisk_River							= "<span class=""water"">The Wisk River</span>"




' Man-made Places
The_Arch								= "<a href=""./F151-246.asp" & Arg & "#The_Arch""><span class=""place"">The Arch</span></a>"
Crypt_of_Charis_a_Na				= "<a href=""./Crypt_of_Charis_a_Na.asp" & Arg & """><span class=""place"">Crypt of Charis-a-Na (entrance)</span></a>"
Crypt_of_Charis_a_Na_Secret	= "<a href=""./Crypt_of_Charis_a_Na_Secret.asp" & Arg & """><span class=""place"">Secret crypt of Charis-a-Na</span></a>"
Crypt_of_Zolba_a_Na_Exterior	= "<a href=""./F164-243.asp" & Arg & "#Crypt_of_Zolba_a_Na_Exterior""><span class=""place"">Crypt of Zolba-a-Na</span></a>"
Crypt_of_Zolba_a_Na_Entrance	= "<a href=""./Crypt_of_Zolba-a-Na.asp" & Arg & """><span class=""place"">Crypt of Zolba-a-Na (entrance)</span></a>"
Grunes_Zuhause						= "<a href=""./F151-246.asp" & Arg & "#Grunes_Zuhause""><span class=""place"">Grünes Zuhause</span></a>"
The_Guardian						= "<span class=""place"" title=""A huge statue of a skeleton/man  in teh Dry Steppes near the passage through the Crystalmist Mountains"">The Guardian</span>"
Jakalla								= "<a href=""./F150-245.asp" & Arg & "#Jakalla"" title=""A long lost ancient Sulois city""><span class=""place"">Jakalla</span></a>"
Jakalla_Party_Map					= "<a href=""./Images/Places/Jakalla/Jakalla_1_Party.png"" title=""The party's map of Jakalla""><span class=""place"">Jakalla Party Map</span></a>"
Keep_of_Clothos					= "<span class=""place"" title=""An ancient fortress caved into a mountain peak over the Davish River"">Keep of Clothos</span>"
The_Lost_City_of_Tor_a_Jarq	= "<a href=""./F162-243.asp" & Arg & "#The_Lost_City_of_Tor_a_Jarq"" title=""A small necropolis carved into the Escarpment overlooking the Upper Little Sule River""><span class=""place"">The Necropolis of Tor-a-Jarq</span></a>"
The_Eagles_Nest					= "<a href=""./F151-246.asp" & Arg & "#The_Eagles_Nest""><span class=""place"">The Eagle's Nest</span></a>"
Neds_Nets_and_Ropes				= "<a href=""./F165-244.asp" & Arg & "#Neds_Nets_and_Ropes"" title=""One of several rope and net shops in Farier's Ramp""><span class=""place"">Ned's Nets & Ropes</span></a>"
The_New_Road						= "<span class=""place"" title=""A major road connecting Loftwick (capital of the Yeaomanry) to Longspear"">The New Road</span>"
Paynim_Trail						= "<span class=""place"" title=""A winding road/trail deep in the Crystalmist Mountains used by the raiders to cross the mountains"">Paynim Trail</span>"
The_Suel_Road						= "<span class=""place"" title=""An ancient road, thought to have been built by the fleeing Sulois"">The Suel Road</span>"
The_Ancient_Suel_Road			= "<span class=""place"" title=""An ancient road, thought to have been built by the fleeing Sulois"">The Ancient Suel Road</span>"
The_Old_Man							= "<a href=""./F164-243.asp" & Arg & "#The_Old_Man"" title=""An ancient stature of Zolba-a-Na, an ancient Sule king""><span class=""place"">The Old Man</span></a>"
Tor_a_Jarq							= "<a href=""./F162-243.asp" & Arg & "#The_Lost_City_of_Tor_a_Jarq"" title=""A long lost Sulois necropolis""><span class=""place"">Tor a Jarq</span></a>"
The_Road_Under_the_Mountain	= "<a href=""./F152-245.asp" & Arg & "#Road_Under_the_Mountain"" title=""A 20 mile lone tunnel connecting Bosgiraud Lake and the Durahl Valley""><span class=""place"">The Road Under the Mountain</span></a>"
Salacus_Fields						= "<a href=""./F160-246.asp" & Arg & "#Salacus_Fields"" title=""A massive series of farmlands used to feed Loftwick""><span class=""place"">Salacus Fields</span></a>"
Waypoint_Cave						= "<a href=""./REPLACE.asp" & Arg & "#Waypoint_Cave"" title=""One of a series of dwarven enhanced caverns along the Suel Road""><span class=""place"">Waypoint Cave</span></a>"
Waypoint_Cave						= Replace(Waypoint_Cave, "REPLACE", HexPage)



' Places in the Dry Steppes
Bab_al_Djebel						= "<span class=""place"" title=""A large, lush oasis roughly 100 miles from the western entrance of the Paynim Trail"">Bab-al-Djebel</span>"
Beni_Waha							= "<span class=""place"" title=""An oasis in the center of the Sultanate of Arir"">Beni-Waha</span>"
Bou_Farfa							= "<span class=""place"" title=""An oasis in the center of the Sultanate of Arir"">Bou-Farfa</span>"
Jar_Jubal							= "<span class=""place"" title=""A ruined village in the mountains to the east of Bab-al-Djebel oasis"">Jar Jubal</span>"
Kanak									= "<span class=""place"" title=""Large walled city in the Dry Steppes, located 20 miles from Tovag Baragu"">Kanak</span>"
Khaibar								= "<span class=""place"" title=""Capital city of the Sultanate of Arir in the Dry Steppes"">Khaibar</span>"
Lake_Udrukankar					= "<span class=""place"" title=""A large salt lake near Tovag Baragu"">Lake Udrukankar</span>"
Sultanate_of_Arir					= "<span class=""place"" title=""The largest organized nation in the Dry Steppes"">Sultanate of Arir</span>"
Tovag_Baragu						= "<span class=""place"" title=""The site beside Lake Udrukankar, from which the Baklunish wizard-clerics ritually cast the Rain of Colorless Fire"">Tovag Baragu</span>"
Weary_Traveler						= "<span class=""place"" title=""An inn located in Kanak that cater to non-Paynim"">Weary Traveler</span>"



' Districts in Loftwick
Combine_Yard_District			= "<a href=""./Loftwick_Combine_Yard.asp" & Arg & """ title=""A rough district in Loftwick""><span class=""place"">Combine Yard District</span></a>"
Copsic_District					= "<a href=""./Loftwick_Copsic_District.asp" & Arg & "#"" title=""The northeaster district of Loftwick""><span class=""place"">Copsic District</span></a>"
Dreodae_District					= "<a href=""./Loftwick_Dreodae_District.asp.asp" & Arg & """ title=""A well-to-do district with many fine shops""><span class=""place"">Dreodae District</span></a>"
Habadock_Quest						= "<a href=""./Loftwick_Habadock_Quest.asp" & Arg & "#"" title=""The district of Loftwick housing city hall""><span class=""place"">Habadock Quest</span></a>"
Isambard_District					= "<a href=""./Loftwick_Isambard_District.asp" & Arg & "#"" title=""A small, mid-upper class district""><span class=""place"">Isambard District</span></a>"
Gorro_Hill_District				= "<a href=""./Loftwick_Gorro_Hill.asp" & Arg & "#"" title=""A district wealth district in the east of Loftwick""><span class=""place"">Gorro Hill District</span></a>"
Orichalcum_District				= "<a href=""./Loftwick_Habadock_Quest.asp" & Arg & "#"" title=""A district of Loftwick known for the College of Magi and the Temple/Library of Fb""><span class=""place"">Orichalcum District</span></a>"
Sanctia_District					= "<a href=""./Loftwick_Sanctia_District.asp" & Arg & "#"" title=""The ruling district of the Yeomanry in northern Loftwick""><span class=""place"">Sanctia District</span></a>"
Scornwall_North					= "<a href=""./Loftwick_Scornwall_North.asp" & Arg & "#"" title=""A district of Loftwick outside the city walls""><span class=""place"">Scornwall (North)</span></a>"
Upper_Uther_Isle					= "<a href=""./Loftwick_Upper_Uther_Isle.asp" & Arg & "#"" title=""A district of Loftwick known for the zoo""><span class=""place"">The Upper Uther Isle</span></a>"
Urovangians_Quarter				= "<a href=""./Loftwick_Urovangians_Quarter.asp" & Arg & "#"" title=""A clean district known primarily for the Temple to St. Cuthbert and the Skeinholm Citadel""><span class=""place"">The Urovangians Quarter</span></a>"


' Places in Loftwick
The_Adventurers_Guild			= "<a href=""./Loftwick_Scornwall_North.asp" & Arg & "#"" title=""A huge tavern and inn catering to adventurers""><span class=""place"">The Adventurer's Guild</span></a>"
The_Asentyne_Palace				= "<a href=""./Loftwick_Sanctia_District.asp" & Arg & "#"" title=""The seat of power for the Yeomanry""><span class=""place"">The Asentyne Palace</span></a>"
Cathedral_of_St_Cuthbert		= "<a href=""./Loftwick_Urovangians_Quarter.asp" & Arg & "#"" title=""The largest church in Loftwick, located in the Urovangians Quart of Loftwick""><span class=""place"">Cathedral of St. Cuthbert</span></a>"
College_of_the_Magi				= "<a href=""./Loftwick_Orichalcum_District.asp" & Arg & "#"" title=""A huge college for Wizards""><span class=""place"">College of the Magi</span></a>"
Lloyds_of_Loftwick				= "<a href=""./Loftwick_Orichalcum_District.asp" & Arg & "#"" title=""A banking/investment business, famous across the lands""><span class=""place"">Lloyd's of Loftwick</span></a>"
Madam_Rosettas_House_of_Curiosities	= "<span class=""place"" title=""A high-end weapons and armor dealer in the Gorro Hill district of Loftwick"">Madam Rosetta's House of Curiosities</span>"
Merriment_Plaza					= "<a href=""./Loftwick_Upper_Uther_Isle.asp" & Arg & "#"" title=""An open market in the eastern edge of the Upper Uther Isle district in Loftwick""><span class=""place"">Merriment Plaza</span></a>"
Robinsons_Arms_and_Armor		= "<span class=""place"" title=""A high-end weapons and armor dealer in the Gorro Hill district of Loftwick"">Robinson's Arms & Armor</span>"
The_Swinery_Luncheonette		= "<a href=""./Isambard_District.asp" & Arg & "#The_Swinery_Luncheonette"" title=""An tavern that specializes in port themed meals""><span class=""place"">The Swinery Luncheonette</span></a>"
Temple_Library_of_Baccob		= "<a href=""./Loftwick_Orichalcum_District.asp" & Arg & "#"" title=""A round, towering building in the Orichalcum District of Loftwick""><span class=""place"">Temple/Library of Baccob</span></a>"
Temple_of_Fharlanghn				= "<a href=""./Loftwick_Gorro_Hill.asp" & Arg & "#"" title=""Temple of travelers, located just inside the Penderghast`s Gate on the eastern side of Loftwick""><span class=""place"">Temple of Fharlanghn</span></a>"




' Build standard links for unique CREATURES
Aerithe							= "<span class=""creatures"" title=""A pixie who lives in the Valley of the Chosen"">Aerithe</span>"
Daughter_Tree					= "<span class=""creatures"" title=""A magical oak tree, grown from an acorn from Our Mother and niece of Mistress Gwyndaelia, tended by Avalina"">Daughter Tree</span>"
Eladrin							= "<span class=""creatures"" title=""Elves native to the Feywild, able to change their appearance daily based on their mood"">Eladrin</span>"
Lord_Gerald						= "<span class=""creatures"" title=""The mouse leader of the Chosen Ones (Mouse Patrol)"">Lord Gerald</span>"
Sir_Puffy						= "<span class=""creatures"" title=""The chipmunk leader of the archers of Chosen Ones (Mouse Patrol)"">Sir Puffy</span>"
Sgt_Whiskers					= "<span class=""creatures"" title=""The red squirrel master of arms (Mouse Patrol)"">Sgt. Whiskers</span>"
Swift								= "<span class=""creatures"" title=""Lord Gerald's mount"">Swift</span>"
Our_Mother						= "<span class=""creatures"" title=""An ancient fey tree spirit that inhabits a huge tree - leader of The Chosen Ones"">Our Mother</span>"
Whisper							= "<span class=""creatures"" title=""Tanis Thilus the Ranger's Dire Wolf companion"">Whisper</span>"

Aethelwyne						= "<span class=""creatures"" title=""The leader of 3 Eladrin sent by Mistress Gwyndaelia to protect Daughter Tree"">Aethelwyne</span>"
Aviv								= "<span class=""creatures"" title=""One of 3 Eladrin sent by Mistress Gwyndaelia to protect Daughter Tree"">Aethelwyne</span>"
Delphine							= "<span class=""creatures"" title=""One of 3 Eladrin sent by Mistress Gwyndaelia to protect Daughter Tree"">Aethelwyne</span>"



' Build standard link for SPELLS - this MUST come after the login logic
Abjure_Enemy					= "<span class=""spell"" title=""Magically causes a creature to either halt in fear or move at half speed"">Abjure Enemy</span>"
Acid_Splash						= "<span class=""spell"" title=""You hurl a bubble of acid. Choose one creature you can see within range, or choose two creatures you can see within range that are within 5 feet of each other"">Acid Splash</span>"
Alter_Self						= "<span class=""spell"" title=""Magically alters the spell caster for 1 hr"">Alter Self</span>"
Abi_Dalzims_Horrid_Wilting	= "<span class=""spell"" title=""An ancient Sulois spell used to draw out all the moisture from the target"">Abi-Dalzim's Horrid Wilting</span>"
Animal_Friendship				= "<span class=""spell"" title=""Magically befriend a beast for up to 24 hrs"">Animal Friendship</span>"
Animate_Dead					= "<span class=""spell"" title=""This spell creates an undead servant"">Animate Dead</span>"
Animate_Objects				= "<span class=""spell"" title=""Objects come to life at your command"">Animate Objects</span>"
Antimagic_Field				= "<span class=""spell"" title=""Creates a 10' radius sphere that magic can't penetrate from either side"">Antimagic Field</span>"
Arcane_Eye						= "<span class=""spell"" title=""Creates an invisible eye that can be moved around to see remotely"">Arcane Eye</span>"
Arcane_Lock						= "<span class=""spell"" title=""Magically seal a door, lid, pouch, etc. to anyone but the wizard himself and the creatures designated by the spell caster"">Arcane Lock</span>"
Arcane_Locked					= "<span class=""spell"" title=""Magically seal a door, lid, pouch, etc. to anyone but the wizard himself and the creatures designated by the spell caster"">Arcane Locked</span>"
Arcane_Locking					= "<span class=""spell"" title=""Magically seal a door, lid, pouch, etc. to anyone but the wizard himself and the creatures designated by the spell caster"">Arcane Locking</span>"
Augery							= "<span class=""spell"" title=""Spell used get divine guidance"">Augury</span>"
Aura_of_Vitality				= "<span class=""spell"" title=""A paladin ability that heals those around them"">Aura of Vitality</span>"
Awaken							= "<span class=""spell"" title=""You grant sentience and mobility to a plant or tree"">Awaken</span>"
Bane								= "<span class=""spell"" title=""Causes up to three creatures to fight less effectively"">Bane</span>"
Banish							= "<span class=""spell"" title=""Sends an outer planar being back to its home plane or temporarily to a demi-plane"">Banish</span>"
Banished							= "<span class=""spell"" title=""Sends an outer planar being back to its home plane or temporarily to a demi-plane"">Banished</span>"
Banishment						= "<span class=""spell"" title=""Sends an outer planar being back to its home plane or temporarily to a demi-plane"">Banishment</span>"
Bardic_Inspiration			= "<span class=""spell"" title=""Grants the recipient an edge in an action"">Bardic Inspiration</span>"
Bestow_Curse					= "<span class=""spell"" title=""You touch a creature, and that creature must succeed on a Wisdom saving throw or become cursed for the duration of the spell"">Bestow Curse</span>"
Bless								= "<span class=""spell"" title=""Plus 1d4 to attack rolls and saving throws for 1 minute"">Bless</span>"
Blight							= "<span class=""spell"" title=""A spell that drains the moisture and vitality from the target"">Blight</span>"
Blindness_Deafness			= "<span class=""spell"" title=""You can blind or deafen a foe"">Blindness/Deafness</span>"
Blink								= "<span class=""spell"" title=""Blink back and forth between the current plane and the Ethereal Plane"">Blink</span>"
Branding_Smite					= "<span class=""spell"" title=""A spell that does radiant damage and makes an invisible target glow"">Branding Smite</span>"
Burning_Hands					= "<span class=""spell"" title=""As you hold your hands with thumbs touching and fingers spread, a thin sheet of flames shoots forth from your outstretched fingertips"">Burning Hands</span>"
Call_Lightning					= "<span class=""spell"" title=""Summon a small storm cloud and call down lightning bolts"">Call Lightning</span>"
Calm_Emotions					= "<span class=""spell"" title=""Remove the effects of charms or fear"">Calm Emotions</span>"
Cause_Fear						= "<span class=""spell"" title=""You awaken the sense of mortality in one creature you can see within range"">Cause Fear</span>"
Charm_Person					= "<span class=""spell"" title=""Magically befriend a person"">Charm Person</span>"
Chill_Touch						= "<span class=""spell"" title=""Creates a ghostly hand that causes necrotic damage"">Chill Touch</span>"
Chromatic_Orb					= "<span class=""spell"" title=""Creates a 4-inch diameter sphere of energy (acid, cold, fire, lightning, poison or thunder)"">Chromatic Orb</span>"
Circle_of_Death				= "<span class=""spell"" title=""A Sphere of negative energy ripples out in a 60-foot-radius Sphere from a point within range causing 8d6 necrotic damage - CON save for half damage"">Circle of Death</span>"
Clairvoyance					= "<span class=""spell"" title=""You can see or hear from a familiar point within 1 mile"">Clairvoyance</span>"
Clone								= "<span class=""spell"" title=""This spell grows an inert duplicate of a living creature as a safeguard against death"">Clone</span>"
Cloud_of_Daggers				= "<span class=""spell"" title=""You fill the air with spinning daggers in a cube 5 feet on each side, centered on a point you choose within range"">Cloud of Daggers</span>"
Cloud_Kill						= "<span class=""spell"" title=""Produces a 20' diameter cloud of deadly gas"">Cloud Kill</span>"
Command							= "<span class=""spell"" title=""You issue a single command at a victim (flee, surrender, etc)"">Command</span>"
Commune							= "<span class=""spell"" title=""You contact your deity or a divine proxy and ask up to three questions that can be answered with a yes or no"">Commune</span>"
Comprehend_Languages			= "<span class=""spell"" title=""Allows the caster to understand any spoken or written language"">Comprehend Languages</span>"
Conjure_Animals				= "<span class=""spell"" title=""Summons fey spirits that take the form of beasts"">Conjure Animals</span>"
Conjure_Elementals			= "<span class=""spell"" title=""You summon one an elemental whose total CR is 5 or less"">Conjure Elementals</span>"
Conjure_Minor_Elementals	= "<span class=""spell"" title=""You summon one or more elementals whose total CR is 2 or less"">Conjure Minor Elementals</span>"
Confusion						= "<span class=""spell"" title=""Renders the target disoriented and confused"">Confusion</span>"
Contact_Other_Plane			= "<span class=""spell"" title=""Vou mentally contact a demigod, the spirit of a long-dead sage, or some other mysterious entity from another plane."">Contact Other Plane</span>"
Continual_Flame				= "<span class=""spell"" title=""Create a permanent flame equal to a torch light - it has no heat"">Continual Flame</span>"
Continual_Light_Spell		= "<span class=""spell"" title=""Spell used to permanently cause a bright light to appear"">Continual Light</span>"
Control_Flame					= "<span class=""spell"" title=""Cantrip used to change the effects of natural flame"">Control Flame</span>"
Control_Water					= "<span class=""spell"" title=""Grants various controls over water"">Control Water</span>"
Control_Wind					= "<span class=""spell"" title=""Grants various controls over winds"">Control Wind</span>"
Continual_Darkness_Spell	= "<span class=""spell"" title=""Spell used to permanently cause a pitch blank orb of darkness that light can't penetrate"">Continual Darkness</span>"
Counterspell					= "<span class=""spell"" title=""Disrupts another's spell, negating it"">Counterspell</span>"
Create_Undead					= "<span class=""spell"" title=""You can cast this spell only at night. Choose up to three corpses of Medium or Small humanoids within range"">Create Undead</span>"
Create_Food_and_Water		= "<span class=""spell"" title=""Creates enough food and water to feed dozens of people"">Create Food and Water</span>"
Cure_Wounds						= "<span class=""spell"" title=""Heal a minor amount of hit points"">Cure Wounds</span>"
Dance_Macabre					= "<span class=""spell"" title=""Threads of dark power leap from your fingers to pierce up to five Small or Medium corpses you can see within range"">Dance Macabre</span>"
Dancing_Lights					= "<span class=""spell"" title=""Creates several globes of light that flit and float about"">Dancing Lights</span>"
Dark_Vision						= "<span class=""spell"" title=""Grants a character Dark Vision ability of Elves, Half-Elves, etc."">Dark Vision</span>"
Daylight							= "<span class=""spell"" title=""A 60-foot-radius sphere of light spreads out from a point you choose within range. The sphere is bright light and sheds dim light for an additional 60 feet."">Daylight</span>"
Detect_Evil_and_Good			= "<span class=""spell"" title=""Detects aberration, celestial, elemental, fey, fiend, or undead within 30 for up to 10 minutes"">Detect Evil and Good</span>"
Detect_Magic					= "<span class=""spell"" title=""Spell used to determine if something is magical and the type of magic"">Detect Magic</span>"
Detect_Poison					= "<span class=""spell"" title=""Detects and identifies any poisons near by"">Detect Poison</span>"
Detect_Thoughts				= "<span class=""spell"" title=""Allows the caster to detect surface thoughts of a creature - the creature gets a save if the probe goes beyond surface thoughts"">Detect Thoughts</span>"
Divine_Smite					= "<span class=""spell"" title=""The Paladin calls upon their diety to deliver additional damage, esp. against fiends and undead"">Divine Smite</span>"
Dimension_Door					= "<span class=""spell"" title=""Spell teleport up to 500'"">Dimension Door</span>"
Disguise_Self					= "<span class=""spell"" title=""You make yourself, including your clothing, armor, Weapons, and other belongings on your person, look different until the spell ends"">Disguise Self</span>"
Disintegrate					= "<span class=""spell"" title=""Spell causing the absolute disintegration of anything it touches"">Disintegrate</span>"
Dispel_Evil_and_Good			= "<span class=""spell"" title=""Protects you from fey, undead, and creatures originating from beyond the Material Plane - celestiais, elementals, fey, fiends, and undead have disadvantage on attack rolls against you"">Dispel Evil and Good</span>"
Dispel_Magic					= "<span class=""spell"" title=""Spell used to try to cancel the effects of another spell"">Dispel Magic</span>"
Divination						= "<span class=""spell"" title=""Ask a single question concerning a specific goal, event, or activity to occur within 7 days"">Divination</span>"
Druidcraft						= "<span class=""spell"" title=""Whispering to the spirits of nature, you create one of several minor effects"">Druidcraft</span>"
Eldridge_Blast					= "<span class=""spell"" title=""Sends 1 or more bolts of black-purple energy"">Eldridge Blast</span>"
Enervation						= "<span class=""spell"" title=""A tendril of inky darkness reaches out from you, touching a creature you can see within range to drain life from it"">Enervation</span>"
Enlarge_Reduce					= "<span class=""spell"" title=""Cause a creature of object to increase (or decrease) in size"">Enlarge/Reduce</span>"
Enlarge							= "<span class=""spell"" title=""Cause a creature of object to increase in size"">Enlarge</span>"
Entangle							= "<span class=""spell"" title=""Causes the flora to animate and 'entangle' the victims"">Entangle</span>"
Enthrall							= "<span class=""spell"" title=""Charms multiple people at once"">Entangle</span>"
Erupting_Earth					= "<span class=""spell"" title=""Causes the ground to explode upward, causing damage and turning the ground into difficult terrain"">Erupting Earth</span>"
Evards_Black_Tentacles		= "<span class=""spell"" title=""Squirming, ebony tentacles fill a 20-foot square on ground that you can see within range"">Evard's Black Tentacles</span>"
Eyebite							= "<span class=""spell"" title=""For the spell's duration, your eyes become an inky void imbued with dread power"">Eyebite</span>"
Fabricate						= "<span class=""spell"" title=""You convert raw materials into products of the same material"">Fabricate</span>"
False_Life						= "<span class=""spell"" title=""Bolstering yourself with a necromantic facsimile of life, you gain 1d4 + 4 temporary hit points for the duration"">False Life</span>"
Feather_Fall					= "<span class=""spell"" title=""Causes the recipient to float down like a feather"">Feather Fall</span>"
Faerie_Fire						= "<span class=""spell"" title=""Causes the objects and creatures in a 20' cube to glow with a magic aura (making them easier to hit)"">Faerie Fire</span>"
Feign_Death						= "<span class=""spell"" title=""You touch a willing creature and put it into a cataleptic state that is indistinguishable from death"">Feign Death</span>"
Find_Familiar					= "<span class=""spell"" title=""Summons a creature to act as a familiar"">Find Familiar</span>"
Find_Traps						= "<span class=""spell"" title=""Causes any mechanical or magical trap or snare to glow"">Find Traps</span>"
Finger_of_Death				= "<span class=""spell"" title=""You send negative energy coursing through a creature that you can see within range, causing it searing pain"">Finger of Death</span>"
Fireball							= "<span class=""spell"" title=""Causes a 20' diameter ball of intense flame"">Fireball</span>"
Fire_Bolt						= "<span class=""spell"" title=""Cantrip that causes minor fire damage"">Fire Bolt</span>"
Fire_Shield						= "<span class=""spell"" title=""Thin and wispy flames wreathe your body for the duration, shedding bright light in a 10-foot radius and dim light for an additional 10 feet"">Fire Shield</span>"
Flaming_Sphere					= "<span class=""spell"" title=""Creates a 5' ball of flame that can be moved about by the caster"">Flaming Sphere</span>"
Flaming_Strike					= "<span class=""spell"" title=""A vertical column of divine fire roars down from the heavens in a location you specify "">Flaming Strike</span>"
Flesh_to_Stone					= "<span class=""spell"" title=""You attempt to turn one creature that you can see within range into stone "">Flaming Strike</span>"
Fly								= "<span class=""spell"" title=""Allows the person to fly for up to 10 minutes"">Fly</span>"
Fog_Cloud						= "<span class=""spell"" title=""Creates a 20' diameter sphere of dense fog"">Fog Cloud</span>"
Forcecage						= "<span class=""spell"" title=""Creates a magical wall or bars"">Forcecage</span>"
Gaseous_Form					= "<span class=""spell"" title=""Turn into a gaseous cloud"">Gaseous Form</span>"
Gate								= "<span class=""spell"" title=""You conjure a portal linking an unoccupied space you can see within range to a precise location on a different plane of existence with the purpose of bringing a named being to your location"">Gate</span>"
Geas								= "<span class=""spell"" title=""Creates a magical bond, similar to a quest that the recipient dare not ignore"">Geas</span>"
Gentle_Repose					= "<span class=""spell"" title=""You touch a corpse or other remains - for the Duration, the target is protected from decay and can't become Undead"">Gentle Repose</span>"
Globe_of_Invulnerability	= "<span class=""spell"" title=""A barrier negating 5th level spells from passing through"">Globe of Invulnerability</span>"
Glyph_of_Warding				= "<span class=""spell"" title=""A magical trap of varying types"">Glyph of Warding</span>"
Goodberry						= "<span class=""spell"" title=""Creates a number of magical berries, each one able to cure 1 HP and provide nourishment for 1 day"">Goodberry</span>"
Goodberries						= "<span class=""spell"" title=""Creates a number of magical berries, each one able to cure 1 HP and provide nourishment for 1 day"">Goodberries</span>"
Grease							= "<span class=""spell"" title=""5lick grease covers lhe ground in a lO-fool square"">Grease</span>"
Greater_Invisibility			= "<span class=""spell"" title=""A brief version of invisibility that remains in place even after an attack"">Greater Invisibility</span>"
Greater_Restoration			= "<span class=""spell"" title=""Removes the effects of a charm, petrification, a curse, the reduction of an ability, or one effect that reduces the hit point maximum"">Greater Restoration</span>"
Guardian_Spirits				= "<span class=""spell"" title=""The character summons minor spirits that attack all foes within 15'"">Guarding Spirits</span>"
Guards_and_Wards				= "<span class=""spell"" title=""Magically protects an area up to 2,500 square feet with assorted spell effects for 24 hrs"">Guards and Wards</span>"
Guidance							= "<span class=""spell"" title=""Grants the character a d4 to a single ability check (not an attack or saving throw)"">Guidance</span>"
Guiding_Bolt					= "<span class=""spell"" title=""Causes minor damage and makes it easier to hit the foe"">Guiding Bolt</span>"
Gust_of_Wind					= "<span class=""spell"" title=""Creates a strong blast of wind while the caster concentrates"">Gust of Wind</span>"
Hallow							= "<span class=""spell"" title=""A spell used to sanctify an area (usually a grave site, making it safe from undead"">Hallow</span>"
Hallucinatory_Terrain		= "<span class=""spell"" title=""Creates a believable illusion of some other natural terrain"">Hallucinatory Terrain</span>"
Haste								= "<span class=""spell"" title=""Allows the person to move at double speed and is harder to hit for 1 minute"">Haste</span>"
Hasted							= "<span class=""spell"" title=""Allows the person to move at double speed and is harder to hit for 1 minute"">Hasted</span>"
Healing_Word					= "<span class=""spell"" title=""Heals minimal wounds from a distance"">Healing Word</span>"
Heat_Metal						= "<span class=""spell"" title=""Causes a piece of metal to heat to searing temperatures, causing damage"">Heat Metal</span>"
Hellish_Rebuke					= "<span class=""spell"" title=""xxx"">Hellish Rebuke</span>"
Hexxx								= "<span class=""spell"" title=""Places a minor curse on a creature"">Hex</span>"
Hunters_Mark					= "<span class=""spell"" title=""Makes it easier to hit and track a specific foe"">Hunter's Mark</span>"
Hypnotic_Pattern				= "<span class=""spell"" title=""Causes the target(s) to stand dumb-found until something disrupts the effect"">Hypnotic Pattern</span>"
Ice_Knife						= "<span class=""spell"" title=""You create a shard of ice and fling it at one creature within range"">Ice Knife</span>"
Ice_Storm						= "<span class=""spell"" title=""Creates a large column of thick fog with blowing snow and ice"">Ice Storm</span>"
Identify							= "<span class=""spell"" title=""Spell used to unlock the secrets of a magical item"">Identify</span>"
Inflict_Wounds					= "<span class=""spell"" title=""The caster touches his target and inflicts necrotic damage"">Inflict Wounds</span>"

Infuse_Magic					= "<a href=""./House_Rules.asp" & Arg & "#Infuse_Magic"" title=""Spell needed to create a magic item""><span class=""spell"">Infuse Magic</span></a>"

Insect_Plague					= "<span class=""spell"" title=""Creates a 20-foot radius sphere of biting and stinging insects"">Insect Plague</span>"
Investiture_of_Ice			= "<span class=""spell"" title=""Until the spell ends, ice rimes your body, and you gain multiple benefits"">Investiture of Ice</span>"
Invisibility					= "<span class=""spell"" title=""Turn an individual invisible for up to 1 hour"">Invisibility</span>"
Invisibility_10_Spell		= "<span class=""spell"" title=""Spell used to turn all individuals within a 10-foot radius invisible"">Invisibility 10-Foot Radius</span>"
Jousting							= "<a href=""./House_Rules.asp" & Arg & "#Jousting"" title=""Jousting rules""><span class=""spell"">Jousting</span></a>"
Jump								= "<span class=""spell"" title=""Jump up to 3 times normal distance"">Jump</span>"
Knock								= "<span class=""spell"" title=""Magically opens a locked door"">Knock</span>"
Laying_on_of_Hands			= "<span class=""spell"" title=""A divine ability of Paladin's used to cure injuries, illness, poison or disease"">Laying on of Hands</span>"
Ledgend_Lore					= "<span class=""spell"" title=""Learn legendary information and ancient lore about a person, place or object you name or describe"">Ledgend Lore</span>"
Leomunds_Secret_Chest		= "<span class=""spell"" title=""You hide a chest, and all its contents, on the Ethereal Plane"">Leomund's Secret Chest</span>"
Leomunds_Tiny_Hut				= "<span class=""spell"" title=""Spell that creates a magical shelter"">Leomund's Tiny Hut</span>"
Lesser_Restoration			= "<span class=""spell"" title=""Remove the effects of a single disease or conditions such as blindness, deafness, paralysis or poison"">Lesser Restoration</span>"
Levitate							= "<span class=""spell"" title=""Allows the person to float up or down, but not side to side"">Levitate</span>"
Life_Transference				= "<span class=""spell"" title=""You sacrifice some of your health to mend another creature's injuries"">Life Transference</span>"
Light								= "<span class=""spell"" title=""Cantrip used to create magical light on an object that sheds bright light in a 20' radius for 30 minutes"">Light</span>"
Lightning_Bolt					= "<span class=""spell"" title=""Causes an arch of lightning, hitting everything in its path"">Lightning Bolt</span>"
Locate_Object					= "<span class=""spell"" title=""Locate a specific object within 1,000 feet"">Locate Object</span>"
Locate_Creature				= "<span class=""spell"" title=""Locate a specific creature within 1,000 feet"">Locate Creature</span>"
Longstrider						= "<span class=""spell"" title=""Increases the speed of a character"">Longstrider</span>"
Mage_Armor						= "<span class=""spell"" title=""Grant an unarmored recipient a base AC of 13"">Mage Armor</span>"
Mage_Hand						= "<span class=""spell"" title=""Creates a spectral hand able to perform simple, mundane tasks"">Mage Hand</span>"
Magic_Circle					= "<span class=""spell"" title=""Protection from celestiaIs, elementals, fey, fiends, and/or undead"">Magic Circle</span>"
Magic_Jar						= "<span class=""spell"" title=""Possession"">Magic Jar</span>"
Magic_Missile					= "<span class=""spell"" title=""Launch minor, unerring bolts of magical energy"">Magic Missile</span>"
Magic_Mouth						= "<span class=""spell"" title=""A magical mouth utters a pre-determined statement"">Magic Mouth</span>"
Major_Image						= "<span class=""spell"" title=""You create the image of an object, a creature, or some other visible phenomenon that is no larger than a 20-foot cube"">Major Image</span>"
Melfs_Acid_Arrow				= "<span class=""spell"" title=""A shimmering green arrow streaks toward a target within range and bursts in a spray of acid"">Melf's Acid Arrow</span>"
Melfs_Minute_Meteors			= "<span class=""spell"" title=""Creates up to 6 tiny meteors that can be launched up to 120'"">Melf's Minute Meteors</span>"
Mending							= "<span class=""spell"" title=""Cantrip to repair mundane items"">Mending</span>"
Message							= "<span class=""spell"" title=""Sends a whispered message to a single target within range"">Message</span>"
Minor_Illusion					= "<span class=""spell"" title=""You create a minor sound or an image of an object"">Minor Illusion</span>"
Mirror_Image					= "<span class=""spell"" title=""Creates 3 identical illusory images of the caster"">Mirror Image</span>"
Misty_Step						= "<span class=""spell"" title=""Enables the caster to make a short teleport"">Misty Step</span>"
Modify_Memory					= "<span class=""spell"" title=""You attempt to reshape another creature's memories"">Modify Memory</span>"
Mold_Earth						= "<span class=""spell"" title=""You manipulate up to a 5 foot cube of earth and/or stone"">Mold Earth</span>"
Moonbeam							= "<span class=""spell"" title=""Causes a silvery beam of light to burn those hit"">Moonbeam</span>"
Mordenkainens_Magnificent_Mansion	= "<span class=""spell"" title=""You conjure an extradimensional dwelling in range that lasts for the duration"">Mordenkainens Magnificent Mansion</span>"
Mordenkainens_Private_Sanctum	= "<span class=""spell"" title=""You make an area within range magically secure"">Mordenkainen's Private Sanctum</span>"
Negative_Enregy_Flood		= "<span class=""spell"" title=""You send ribbons of negative energy at one creature you can see within range"">Negative Enregy Flood</span>"
Neurtalize_Poison				= "<span class=""spell"" title=""Instantly removes the effects of any poison"">Neutralize Poison</span>"
Nystuls_Magic_Aura			= "<span class=""spell"" title=""You place an illusion on a creature or an object you touch so that divination spells reveal false information about it"">Nystul's Magic Aura</span>"
Phantasmal_Killer				= "<span class=""spell"" title=""Taps into the nightmares of a creature, causing psychic damage"">Phantasmal Killer</span>"
Phantom_Steed					= "<span class=""spell"" title=""A Large quasi-real, horse-like creature appears on the ground in an unoccupied space of your choice within range"">Phantom Steed</span>"
Plane_Shift						= "<span class=""spell"" title=""Transports the caster and up to 8 others to another plane"">Plane Shift</span>"
Plant_Growth					= "<span class=""spell"" title=""Enriches the land in a 1/2 mile radius for 1 year"">Plant Growth</span>"
Polymorph						= "<span class=""spell"" title=""Transforms a person into another type of creature, taking on the physical characteristics of that creature while retaining their mental abilities"">Polymorph</span>"
Power_Word_Stun				= "<span class=""spell"" title=""Instantly stuns all but the most powerful of foes"">Power Word Stun</span>"
Prayer_of_Healing				= "<span class=""spell"" title=""Up to six creatures of your choice that you can see within range each regain Hit Points equal to 2d8 + your Spellcasting Ability modifier"">Prayer of Healing</span>"
Prestidigitation				= "<span class=""spell"" title=""A catrip with varying effects"">Prestidigitation</span>"
Prismatic_Spray				= "<span class=""spell"" title=""8 multicolored rays of light flash from the caster's hand, each ray being a different color and having a different power and purpose"">Prismatic Spray</span>"
Produce_Flame					= "<span class=""spell"" title=""Creates a hand-size ball of flame"">Produce Flame</span>"
Programmed_Illusion			= "<span class=""spell"" title=""Creates an illusion of an object, a creature, or some other visible phenomenon within range that activates when a specific condition occurs"">Programmed Illusion</span>"
Project_Image					= "<span class=""spell"" title=""Creates an illusory copy of yourself that lasts for the duration that appears at any location within range that you have seen before, regardless of intervening obstacles"">Project Image</span>"
Protection_from_Energy		= "<span class=""spell"" title=""Resistance to acid, cold, fire, lightning,or thunder for 1 hr"">Protection from Energy</span>"
Protection_from_Evil_and_Good	= "<span class=""spell"" title=""Protects a single creature from aberrations, celestiais, elementals, fey, fiends, and undead."">Protection from Evil and Good</span>"
Protection_from_Poison		= "<span class=""spell"" title=""Neutralizes a single poison (if applicable) and target has advantage on saves vs. poison"">Protection from Poison</span>"
Otilukes_Resilient_Sphere	= "<span class=""spell"" title=""Encases the target in a shimmering sphere"">Otiluke's Resilient Sphere</span>"
Raise_Dead						= "<span class=""spell"" title=""Restores a person back to life who has not been dead for more than a week"">Raise Dead</span>"
Ray_of_Enfeeblement			= "<span class=""spell"" title=""A black beam of enervating energy springs from your finger toward a creature within range"">Ray of Enfeeblement</span>"
Ray_of_Sickness				= "<span class=""spell"" title=""A ray of sickening greenish energy lashes out toward a creature within range"">Ray of Sickness</span>"
Reduce							= "<span class=""spell"" title=""Cause a creature of object to decrease in size"">Reduce</span>"
Remove_Curse					= "<span class=""spell"" title=""Remove a single magical curse"">Remove Curse</span>"
Restore_Remove_Life			= "<a href=""./House_Rules.asp" & Arg & "#Restore_Remove_Life"" title=""An ancient, forgotten spell used to restore a person to life, but under the caster's control""><span class=""spell"">Restore/Remove Life</span></a>"
Reverse_Gravity				= "<span class=""spell"" title=""This spell reverses gravity in a 50-foot-radius, 100-foot-high cylinder centered on a point within range"">Reverse Gravity</span>"
Revivify							= "<span class=""spell"" title=""Restores to live a person who has died within the past minute"">Revivify</span>"
Sanctuary						= "<span class=""spell"" title=""Causes foes to tend to ignore the caster"">Sanctuary</span>"
Scorching_Ray					= "<span class=""spell"" title=""You create three rays of fire and hurl them at Targets within range"">Scorching Ray</span>"
Scry								= "<span class=""spell"" title=""Magically view distant people and places"">Scry</span>"
Scried							= "<span class=""spell"" title=""Magically view distant people and places"">Scried</span>"
Scrying							= "<span class=""spell"" title=""Magically view distant people and places"">Scrying</span>"
See_Invisiblity				= "<span class=""spell"" title=""The creature is able to see invisible creatures and objects and into the Ethereal Plane"">See Invisiblity</span>"
Sending							= "<span class=""spell"" title=""Spell used to send a message of 25 words or less"">Sending</span>"
Sepia_Snake_Sigil				= "<a href=""House_Rules.asp" & Arg & "#Sepia_Snake_Sigil"" title=""A magical trap""><span class=""magic"">Sepia Snake Sigil</span></a>"
Sequester						= "<span class=""spell"" title=""Conceal an object or willing creature from detection"">Sequester</span>"
Shape_Water						= "<span class=""spell"" title=""You choose an area of water that you can see within range and that fits within a 5—foot cube and manipulate it in one of several ways"">Shape Water</span>"
Shield							= "<span class=""spell"" title=""Improves AC vs. missiles and makes caster immune to Magic Missile"">Shield</span>"
Shillelagh						= "<span class=""spell"" title=""Enhance the Druids cudgel or similar devise, making it magical and allowing them to use their spell casting ability instead of STR for attack rolls for 1 minute"">Shillelagh</span>"
Shocking_Grasp					= "<span class=""spell"" title=""Deliver an electric shock to a target you touch"">Shocking Grasp</span>"
Silence							= "<span class=""spell"" title=""Created a 20-foot radius sphere of absolute silence, negating spell casting from within"">Silence</span>"
Silent_Image					= "<span class=""spell"" title=""Created the image of a creature or other visible phenomenon that is no larger than a 15' cube"">Silent Image</span>"
Sleep								= "<span class=""spell"" title=""Causes low level opponents to fall into a deep, magical sleep"">Sleep</span>"
Sleet_Storm						= "<span class=""spell"" title=""Creates a 20-foot-tall cylinder, 40' radius area of freezing rain and sleet"">Sleet Storm</span>"
Slow								= "<span class=""spell"" title=""Cause up to 6 creatures to move at half speed, reducing AC, saving throws, attack and spell abilities"">Slow</span>"
Soul_Cage						= "<span class=""spell"" title=""This spell snatches the soul of a humanoid as it dies and traps it inside the tiny cage you use for the material component"">Soul Cage</span>"
Spare_the_Dying				= "<span class=""spell"" title=""Restores someone who has died withing the past minute to 0 hp"">Spare the Dying</span>"
Speak_With_Animals			= "<span class=""spell"" title=""Spell used to speak with beasts - it does NOT make them any smarter"">Speak With Animals</span>"
Speak_With_Dead				= "<span class=""spell"" title=""You grant the semblance of life and intelligence to a corpse of your choice within range, allowing It to answer the questions you pose."">Speak With Dead</span>"
Speak_With_Plants				= "<span class=""spell"" title=""Spell used to speak with plants in the area"">Speak With Plants</span>"
Spider_Climb					= "<span class=""spell"" title=""Grants the recipient the ability to traverse vertical and inverted surfaces like a spider"">Spider Climb</span>"
Spike_Growth					= "<span class=""spell"" title=""Causes a 20' diameter area to sprout spikes in the ground, harming any who pass through the area"">Spike Growth</span>"
Spirit_Guardians				= "<span class=""spell"" title=""Calls forth spirits to protect the caster"">Spirit Guardians</span>"
Stinking_Cloud					= "<span class=""spell"" title=""Conjures a choking cloud that can incapacitate those within"">Stinking Cloud</span>"
Stone_Shape						= "<span class=""spell"" title=""You touch a stone object of Medium size or smaller or a section of stone no more than 5 feet in any dimension and form it into any shape that suits your purpose"">Stone Shape</span>"
Suggestion						= "<span class=""spell"" title=""You suggest a course of action and magically influence a creature"">Suggestion</span>"
Symbol							= "<span class=""spell"" title=""You inscribe a harmful glyph either on a surface or within an object that can be closed to conceal the glyph"">Symbol</span>"
Tattoo_Magic					= "<a href=""House_Rules.asp" & Arg & "#Tattoo_Magic"" title=""A tattoo imbued with specific magic""><span class=""magic"">Tattoo Magic</span></a>"
Telepathy						= "<span class=""spell"" title=""You create a telepathic link between yourself and a willing creature with which you are familiar"">Telepathy</span>"
Teleport							= "<span class=""spell"" title=""This spell instantly transports you and up to eight willing creatures of your choice that you can see within range, or a single object that you can see within range, to a destination you select"">Teleport</span>"
Teleportation_Circle			= "<span class=""spell"" title=""Teleports all within a 10' diameter circle to a permanent Teleportation Circle"">Teleportation Circle</span>"
Tensers_Floating_Disk		= "<span class=""spell"" title=""Conjures a magical disk to transport heavy things"">Tenser's Floating Disk</span>"
Tether_Essence					= "<span class=""spell"" title=""Two creatures you can see within range are magically linked for the duration, regardless of the distance between them"">Tether Essence</span>"
Thaumaturgy						= "<span class=""spell"" title=""Causes the caster's voice to boom loudly, cause a flame to flicker, cause a harmless rumble in the ground or open an unlocked door or window"">Thaumaturgy</span>"
Thunder_Step					= "<span class=""spell"" title=""You teleport to a space within 90 feet that you can see, causing a damaging thunder clap where you once were"">Thunder Step</span>"
Thunderwave						= "<span class=""spell"" title=""Produces a thunderous boom"">Thunderwave</span>"
Time_Stop						= "<span class=""spell"" title=""You briefly stop the flow of time for everyone but yourself"">Time Stop</span>"
Toll_the_Dead					= "<span class=""spell"" title=""You briefly stop the target's heart, causing necrotic damage"">Toll the Dead</span>"
Tongues							= "<span class=""spell"" title=""Allows a person to speak and understand any spoken language"">Tongues</span>"
Unseen_Servant					= "<span class=""spell"" title=""Conjures an invisible, mindless, shapeless force that performs simple tasks"">Unseen Servant</span>"
Vampiric_Touch					= "<span class=""spell"" title=""The touch of your shadow-wreathed hand can siphon life force from others to heal your wounds"">Vampiric Touch</span>"
Vicious_Mockery				= "<span class=""spell"" title=""Hurling insults at a target, causing minor psychic damage"">Vicious Mockery</span>"
Vow_of_Emnity					= "<span class=""spell"" title=""A Paladin ability that grants them advantage against a foe and stops the foe's movement"">Vow of Emnity</span>"
Wall_of_Force					= "<span class=""spell"" title=""Creates virtually indestructible barrier"">Wall of Force</span>"
Wall_of_Fire					= "<span class=""spell"" title=""Creates a magical wall or circle of intense flame"">Wall of Fire</span>"
Wall_of_Ice						= "<span class=""spell"" title=""Creates a magical wall, dome or circle of ice"">Wall of Ice</span>"
Wall_of_Water					= "<span class=""spell"" title=""You create a wall of water on the ground at a point you can see within range"">Wall of Water</span>"
Warding_Bond					= "<span class=""spell"" title=""Grants +1 bonus to AC, saving throws and resistance to all damage, but the caster takes the same damage as the target"">Warding Bond</span>"
Water_Breathing				= "<span class=""spell"" title=""Grants up to 10 willing creatures the ability to breath underwater"">Water Breathing</span>"
Water_Walk						= "<span class=""spell"" title=""Grants the ability for up to 10 willing creatures to move across any liquid surface""Water Walk</span>"
Web								= "<span class=""spell"" title=""Creates a mass of thick, sticky webbing which impedes movement"">Web</span>"
Watery_Sphere					= "<span class=""spell"" title=""You conjure up a sphere of water with a 5-foot radius at a point you can see within range"">Watery Sphere</span>"
Water_Walk						= "<span class=""spell"" title=""This spell grants the ability to move across any liquid surface—such as water, acid, mud, snow, quicksand, or lava—as if it were harmless solid ground"">Water Walk</span>"
Wierd								= "<span class=""spell"" title=""Drawing on the deepest fears of creatures in a 30' radius, you create illusory creatures in their minds, visible only to them"">Wierd</span>"
Wind_Wall						= "<span class=""spell"" title=""Causes a strong wind , shaped as needed, that buffets and bludgeons those within"">Wind Wall</span>"
Witch_Bolt						= "<span class=""spell"" title=""A beam of crackling, blue energy lances out toward a creature within range, forming a sustained arc of lightning between you and the target"">Witch Bolt</span>"
Zone_of_Truth					= "<span class=""spell"" title=""Creates a 15' radius sphere where a creature within the area can't lie (but does not need to speak)"">Zone of Truth</span>"





' Build standard link for MAGIC ITEMS - this MUST come after the login logic
Abjurers_Gilder					= "<a href=""Gear.asp" & Arg & "#Abjurers_Gilder"" title=""Old coat that protects against the cold""><span class=""magic"">Abjurer's Gilder</span></a>"
Adamantine							= "<span class=""magic"" title=""An incredibly hard and rare metal mined by Dwarves and used to make special weapons and armor"">Adamantine</span>"
Adventurers_Overcoat				= "<a href=""Gear.asp" & Arg & "#Adventurers_Overcoat"" title=""Old coat that protects against the cold""><span class=""magic"">Adventurer's Overcoat</span></a>"
Aegis_of_Radiance					= "<a href=""Gear.asp" & Arg & "#Aegis_of_Radiance"" title=""Aegis of Radiance""><span class=""magic"">Aegis of Radiance</span></a>"
Ambitous_Medics_Box				= "<a href=""Gear.asp" & Arg & "#Ambitous_Medics_Box"" title=""A combination healing kit and brewery/distillery""><span class=""magic"">Ambitous Medics Box</span></a>"
Amulet_of_Immutability			= "<a href=""Gear.asp" & Arg & "#Amulet_of_Immutability"" title=""A necklace that prevents the wearer from being controlled or transformed""><span class=""magic"">Amulet of Immutability</span></a>"
Amulet_of_Proof_Against_Detection_and_Location	= "<span class=""magic"" title=""A devise the prevents the wearer from being detected"">Amulet of Proof Against Detection and Location</span>"
Amulet_of_the_Spirit_Naga		= "<a href=""Gear.asp" & Arg & "#Amulet_of_the_Spirit_Naga"" title=""A necklace that protects the wearer from poison and can restore someone from death""><span class=""magic"">Amulet of the Spirit Naga</span></a>"
Arborguard_Shield					= "<a href=""Gear.asp" & Arg & "#Arborguard_Shield"" title=""A wooden shield that can summon a wall of trees""><span class=""magic"">Arborguard Shield</span></a>"
Arcanist_Gauntlets				= "<a href=""Gear.asp" & Arg & "#Arcanist_Gauntlets"" title=""Arcanist Gauntlets""><span class=""magic"">Arcanist Gauntlets</span></a>"
Archon_Harbinger					= "<a href=""Gear.asp" & Arg & "#Archon_Harbinger"" title=""A celestial construct""><span class=""magic"">Archon, Harbinger</span></a>"
Arista_Wand_of_the_Spire		= "<a href=""Gear.asp" & Arg & "#Arista_Wand_of_the_Spire"" title=""An artifact""><span class=""magic"">Arista, Wand of the Spire</span></a>"
Astral_Caltrops					= "<a href=""Gear.asp" & Arg & "#Astral_Caltrops"" title=""Magical Caltrops""><span class=""magic"">Astral Caltrops</span></a>"
Astronomers_Boon					= "<a href=""Gear.asp" & Arg & "#Astronomers_Boon"" title=""A device that grants power from the stars""><span class=""magic"">Astronomer's Boon</span></a>"
Aurum_and_Argentum				= "<a href=""Gear.asp" & Arg & "#Aurum_and_Argentum"" title=""A matched pair of gold and silver daggers""><span class=""magic"">Aurum and Argentum</span></a>"
Badge_of_the_Savant				= "<a href=""Gear.asp" & Arg & "#Badge_of_the_Savant"" title=""A bookplate that reduced the time and cost of copying a spell to a spellbook""><span class=""magic"">Badge of the Savant</span></a>"
Badge_of_the_Wayfarer			= "<a href=""Gear.asp" & Arg & "#Badge_of_the_Wayfarer"" title=""Transports the character to a legendary tavern""><span class=""magic"">Badge of the Wayfarer</span></a>"
Bag_of_Holding						= "<a href=""Gear.asp" & Arg & "#Bag_of_Holding"" title=""A magical bag able to hold up to 500lbs of material""><span class=""magic"">Bag of Holding</span></a>"
Bags_of_Holding					= "<a href=""Gear.asp" & Arg & "#Bag_of_Holding"" title=""A magical bag able to hold up to 500lbs of material""><span class=""magic"">Bags of Holding</span></a>"
Bane_Shield							= "<a href=""Gear.asp" & Arg & "#Bane_Shield"" title=""A shield that can bane an opponent""><span class=""magic"">Bane Shield</span></a>"
Barricade_Shield					= "<a href=""Gear.asp" & Arg & "#Barricade_Shield"" title=""An iron shield that expands, blocking forward attacks""><span class=""magic"">Barricade Shield</span></a>"
Bascos_Handy_Bangle				= "<a href=""Gear.asp" & Arg & "#Bascos_Handy_Bangle"" title=""A ring to improve specific skills with kits""><span class=""magic"">Bascos Handy Bangle</span></a>"
Bath_Potion							= "<a href=""Gear.asp" & Arg & "#Bath_Potion"" title=""Magically keeps a person clean for 24 hrs""><span class=""magic"">Bath Potion</span></a>"
Belt_of_Frost_Giant_Strength	= "<a href=""Gear.asp" & Arg & "#Potion_of_Growth"" title=""While wearing this belt, yout strength becomes 23""><span class=""magic"">Belt of Frost Giant Strength</span></a>"
Bird_of_a_Feather					= "<a href=""Gear.asp" & Arg & "#Bird_of_a_Feather"" title=""A miniature, toy bird that grants limited flight""><span class=""magic"">Bird of a Feather</span></a>"
Blizzard_Sphere					= "<a href=""Gear.asp" & Arg & "#Blizzard_Sphere"" title=""Creates a column of freezing wind and snow""><span class=""magic"">Blizzard Sphere</span></a>"
Bloodhound_Amulet					= "<a href=""Gear.asp" & Arg & "#Bloodhound_Amulet"" title=""Helps with tracking due to scent""><span class=""magic"">Bloodhound Amulet</span></a>"
Bloodmage_Dagger					= "<a href=""Gear.asp" & Arg & "#Bloodmage_Dagger"" title=""A blood dagger""><span class=""magic"">Bloodmage Dagger</span></a>"
Bloodmire_Phiale					= "<a href=""Gear.asp" & Arg & "#Bloodmire_Phiale"" title=""A ceramic tray that feeds on blood to restore health""><span class=""magic"">Bloodmire Phiale</span></a>"
Bloodmire_Rod_of_the_Witch_Doctor	= "<a href=""Gear.asp" & Arg & "#Bloodmire_Rod_of_the_Witch_Doctor"" title=""TITLE""><span class=""magic"">Bloodmire Rod of the Witch Doctor</span></a>"
Bloodmire_Soulflame_Lantern	= "<a href=""Gear.asp" & Arg & "#Bloodmire_Soulflame_Lantern"" title=""An iron lantern with special qualities""><span class=""magic"">Bloodmire Soulflame Lantern</span></a>"
Blood_Pact_Pendants				= "<a href=""Gear.asp" & Arg & "#Blood_Pact_Pendants"" title=""Blood Pact Pendants""><span class=""magic"">Blood Pact Pendants</span></a>"
Book_of_Clothiers_Croquis		= "<a href=""Gear.asp" & Arg & "#Book_of_Clothiers_Croquis"" title=""A book to create marvelous clothing""><span class=""magic"">Book of Clothier's Croquis</span></a>"
Book_of_Keeping					= "<span class=""magic"" title=""One of 4 books containing the true names of all Yugoloths"">Book of Keeping</span>"
Books_of_Keeping					= "<span class=""magic"" title=""The 4 books containing the true names of all Yugoloths"">Books of Keeping</span>"
Boots_of_Elvenkind				= "<span class=""magic"" title=""While wearing these boots, you make no sound"">Boots of Elvenkind</span>"
Bow_Harp								= "<a href=""Gear.asp" & Arg & "#Bow_Harp"" title=""An rare Eladrin weapons that has a special bow built into it""><span class=""magic"">Eladrin Bow Harp</span></a>"
Bowl_of_Commanding_Water_Elementals	= "<a href=""Gear.asp" & Arg & "#Bowl_of_Commanding_Water_Elementals"" title=""A magical device to control water elementals""><span class=""magic"">Bowl of Commanding Water Elementals</span></a>"
Bracers_of_Defense				= "<a href=""Gear.asp" & Arg & "#Bracers_of_Defense"" title=""Armbands that increase AC""><span class=""magic"">Bracers of Defense</span></a>"
Brazen_Amulet						= "<a href=""Gear.asp" & Arg & "#Brazen_Amulet"" title=""Protects wearer against extreme normal temperatures""><span class=""magic"">Brazen Amulet</span></a>"
Burrages_Collegiate_Case		= "<a href=""Gear.asp" & Arg & "#Burrages_Collegiate_Case"" title=""Beautiful wooden case for a lute or similar musical instrument""><span class=""magic"">Burrage's Collegiate Case</span></a>"
Breastplate_of_the_Arch_Druid	= "<a href=""Gear.asp" & Arg & "#Breatplate_Archdruid"" title=""A petrified ironwood breastplate""><span class=""magic"">Breastplate of the Arch-Druid</span></a>"
Campers_Crutch						= "<a href=""Gear.asp" & Arg & "#Campers_Crutch"" title=""A long metal fire poker that can start a fire instantly""><span class=""magic"">Campers Crutch</span></a>"
Candleflame_Helm					= "<a href=""Gear.asp" & Arg & "#Candleflame_Helm"" title=""A helm with a flame on top""><span class=""magic"">Candleflame Helm</span></a>"
Canister_of_Vreyvals_Soothing_Tea= "<a href=""Gear.asp" & Arg & "#Canister_of_Vreyvals_Soothing_Tea"" title=""A soothing, healing tea""><span class=""magic"">Canister of Vreyval's Soothing Tea</span></a>"
Cloak_of_Invisibility			= "<a href=""Gear.asp" & Arg & "#Cloak_of_Invisibility"" title=""Turns the owner invisible""><span class=""magic"">Cloak of Invisibility</span></a>"
Cloak_of_the_Manta_Ray			= "<a href=""Gear.asp" & Arg & "#Cloak_of_the_Manta_Ray"" title=""Grants the ability to breath and swim underwater""><span class=""magic"">Cloak of the Manta Ray</span></a>"
Cloche_of_Surprise_Treats		= "<a href=""Gear.asp" & Arg & "#Cloche_of_Surprise_Treats"" title=""A plater that magically produces wonderful foods""><span class=""magic"">Cloche of Surprise Treats</span></a>"
Clockwork_Inkbeetle				= "<a href=""Gear.asp" & Arg & "#Clockwork_Inkbeetle"" title=""A magical map-making device""><span class=""magic"">Clockwork Inkbeetle</span></a>"
Clockwork_Mend_A_Pillar			= "<a href=""Gear.asp" & Arg & "#Clockwork_Mend_A_Pillar"" title=""A magical device that can repair damaged items""><span class=""magic"">Clockwork Mend-a-Pillar</span></a>"
Coldfire_Anvil						= "<a href=""Gear.asp" & Arg & "#Coldfire_Anvil"" title=""An anvil used to make limited magical weapons""><span class=""magic"">Coldfire Anvil</span></a>"
Contingency_Band					= "<a href=""Gear.asp" & Arg & "#Contingency_Band"" title=""A leather ring with curative abilities""><span class=""magic"">Contingency Band</span></a>"
Crown_of_Storms					= "<a href=""Gear.asp" & Arg & "#Crown_of_Storms"" title=""A gift from the Storm Giants""><span class=""magic"">Crown of Storms</span></a>"
Crystal_Ball						= "<a href=""Gear.asp" & Arg & "#Crystal_Ball"" title=""A magical orb that allows the owner to cast the Scrying spell""><span class=""magic"">Crystal Ball</span></a>"
Cube									= "<a href=""Gear.asp" & Arg & "#Daerns_Instant_Fortress"" title=""A magical Instant Fortress""><span class=""magic"">cube</span></a>"
Cube_of_Teleportation			= "<a href=""Gear.asp" & Arg & "#Cube_of_Teleportation"" title=""Grants the ability to caste Teleportation Circle""><span class=""magic"">Cube of Teleportation</span></a>"
Cuff_of_Captions					= "<a href=""Gear.asp" & Arg & "#Cuff_of_Captions"" title=""An earpiece that records conversations and sounds""><span class=""magic"">Cuff of Captions</span></a>"
Deathloop_Watch					= "<a href=""Gear.asp" & Arg & "#Deathloop_Watch"" title=""A magical time piece that can restore a killed person ""><span class=""magic"">Deathloop Watch</span></a>"
Decanter_of_Endless_Water		= "<a href=""Gear.asp" & Arg & "#Decanter_of_Endless_Water"" title=""A device that creates water""><span class=""magic"">Decanter of Endless Water</span></a>"
Detectives_Notebook				= "<a href=""Gear.asp" & Arg & "#Detectives_Notebook"" title=""A book to aid in investigation""><span class=""magic"">Detective's Notebook</span></a>"
Diviners_Dice						= "<a href=""Gear.asp" & Arg & "#Diviners_Dice"" title=""Roll the dice and change fate""><span class=""magic"">Diviner's Dice</span></a>"
Djinn_and_Tonic_Common			= "<a href=""Gear.asp" & Arg & "#Djinn_and_Tonic"" title=""An magically enhanced bottle of wine with minor magical abilities""><span class=""magic"">Djinn and Tonic, Common</span></a>"
Doom_Bloom							= "<a href=""Gear.asp" & Arg & "#Doom_Bloom"" title=""A dark, dangerous, velvety lotus has tiny pinpricks of starlight in its petals and releases lofting, magical pollen granting the ability to scry""><span class=""magic"">Doom Bloom</span></a>"
Doss_Lute							= "<a href=""Gear.asp" & Arg & "#Doss_Lute"" title=""A magical musical instrument usable by bards""><span class=""magic"">Doss Lute</span></a>"
Dragon_Slayer						= "<a href=""Gear.asp" & Arg & "#Dragon_Slayer"" title=""A sword designed to kill dragons""><span class=""magic"">Dragon Slayer</span></a>"
Driftglobe							= "<a href=""Gear.asp" & Arg & "#Driftglobe"" title=""A glowing, floating sphere""><span class=""magic"">Driftglobe</span></a>"
Dwarven_Boozehounds_Backpack	= "<a href=""Gear.asp" & Arg & "#Dwarven_Boozehounds_Backpack"" title=""A large, silver tank with straps to wear on one's back that produces marvelous ales""><span class=""magic"">Dwarven Boozehound's Backpack</span></a>"
Eldritch_Bident					= "<a href=""Gear.asp" & Arg & "#Eldritch_Bident"" title=""A two-pronged weapon has a sickly connection to another plane of existence""><span class=""magic"">Eldritch Bident</span></a>"
Elemental_Gem_Fire				= "<a href=""Gear.asp" & Arg & "#Elemental_Gem_Fire"" title=""If crushed, summons a Fire Elemental - but has another purpose""><span class=""magic"">Elemental Gem of Fire</span></a>"
Elven_Chain_Shirt					= "<span class=""magic"" title=""The finest of Elven armor, though not magical, it weights a tenth the weight of normal chain mail"">Elven Chain Shirt</span>"
Ether_Spear							= "<a href=""Gear.asp" & Arg & "#Ether_Spear"" title=""A spear that traverses the Ethereal plane to strike its target""><span class=""magic"">Ether Spear</span></a>"
Everglacier_Prosthesis			= "<a href=""Gear.asp" & Arg & "#Everglacier_Prosthesis"" title=""An icy prosthetic that can shoot ice shards""><span class=""magic"">Everglacier Prosthesis</span></a>"
Eyedrops_of_Clarity				= "<a href=""Gear.asp" & Arg & "#Eyedrops_of_Clarity"" title=""Cures blindness and grants darkvision""><span class=""magic"">Eyedrops of Clarity</span></a>"
Eyes_of_the_Beheld				= "<a href=""Gear.asp" & Arg & "#Eyes_of_the_Beheld"" title=""Magic items allowing you to see from one eye to another""><span class=""magic"">Eyes of the Beheld</span></a>"
Feywood_Ivy							= "<a href=""Gear.asp" & Arg & "#Feywood_Ivy"" title=""Magical vine that holds an object or grapples a target""><span class=""magic"">Feywood Ivy</span></a>"
Figurine_of_Wondrous_Power_Black_Bear	= "<a href=""Gear.asp" & Arg & "#Figurine_of_Wondrous_Power_Black_Bear"" title=""A miniature figurine of a bear that transformed into a black bear""><span class=""magic"">Black Bear Figurine of Wondrous Power</span></a>"
Flame_Tongue						= "<span class=""magic"" title=""A flaming weapon that does additional burning damage"">Flame Tongue</span>"
Flood_Pauldron						= "<a href=""Gear.asp" & Arg & "#Flood_Pauldron"" title=""Causes damage to those attacking the wearer""><span class=""magic"">Flood Pauldron</span></a>"
Flying_Carpet						= "<span class=""magic"" title=""A magical carpet that flies through the sky"">Flying Carpet</span>"
Folding_Boat						= "<a href=""Gear.asp" & Arg & "#Folding_Boat"" title=""A magical boat that folds up""><span class=""magic"">Folding Boat</span></a>"
Fortress								= "<a href=""Gear.asp" & Arg & "#Daerns_Instant_Fortress"" title=""A magical Instant Fortress""><span class=""magic"">Fortress</span></a>"
Gateway_Ring						= "<a href=""Gear.asp" & Arg & "#Gateway_Ring"" title=""Personal Gate""><span class=""magic"">Gateway Ring</span></a>"
Gauntlets_of_Eldritch_Ferocity= "<a href=""Gear.asp" & Arg & "#Gauntlets_of_Eldritch_Ferocity"" title=""Leather gloves that enhance a warlock's Edlritch Blasts""><span class=""magic"">Gauntlets of Eldritch Ferocity</span></a>"
Gi_of_Shifting_Seasons			= "<a href=""Gear.asp" & Arg & "#Gi_of_Shifting_Seasons"" title=""Gi of Shifting Season""><span class=""magic"">Gi of Shifting Season</span></a>"
Glamoured_Studded_Leather		= "<a href=""Gear.asp" & Arg & "#Glamoured_Studded_Leather"" title=""Magical leather armor that can assume the appearance of normal clothing or some other type of armor""><span class=""magic"">Glamoured Studded Leather</span></a>"
Gloves_of_Healing					= "<a href=""Gear.asp" & Arg & "#Gloves_of_Healing"" title=""Gloves that enhance curing""><span class=""magic"">Gloves of Healing</span></a>"
Golem_Sapper						= "<a href=""Gear.asp" & Arg & "#Golem_Sapper"" title=""Golem Sapper""><span class=""magic"">A device to momentarily cripple a construct</span></a>"
Godsteel_Warplate					= "<a href=""Gear.asp" & Arg & "#Godsteel_Warplate"" title=""Magical armor that grants 50 temporary hit points""><span class=""magic"">Godsteel Warplate</span></a>"
Goodberry_Bush						= "<a href=""Gear.asp" & Arg & "#Goodberry_Sapling"" title=""A magical magical bush that can produce Goodberries""><span class=""magic"">Goodberry Bush</span></a>"
Goodberry_Sapling					= "<a href=""Gear.asp" & Arg & "#Goodberry_Sapling"" title=""A magical magical bush that can produce Goodberries""><span class=""magic"">Goodberry Sapling</span></a>"
Gorget_of_the_Holy_Soldier		= "<a href=""Gear.asp" & Arg & "#Gorget_of_the_Holy_Soldier"" title=""A piece of armor that grants difference effects based on class""><span class=""magic"">Gorget of the Holy Soldier</span></a>"
Griffon_Coinpouch					= "<a href=""Gear.asp" & Arg & "#Griffon_Coinpouch"" title=""Any coin removed from this pouch is shiny as if just minted""><span class=""magic"">Griffon Coinpouch</span></a>"
Hadiyas_Handy_Quill				= "<a href=""Gear.asp" & Arg & "#Hadiyas_Handy_Quill"" title=""A magical quill""><span class=""magic"">Hadiya's Handy Quill</span></a>"
Heavens_Edge						= "<a href=""Gear.asp" & Arg & "#Heavens_Edge"" title=""A powerful magic dagger""><span class=""magic"">Heaven's Edge</span></a>"
Heartstone							= "<span class=""magic"" title=""An artifact that kept the Keep of Clothos alive"">Heartstone</span>"
if (userId = "DM") then
	Heartstone_of_the_Keep_of_Clothos	= "<a href=""Gear.asp" & Arg & "#Heartstone_of_the_Keep_of_Clothos"" title=""An artifact that kept the Keep of Clothos alive"">Heartstone of the Keep of Clothos</span>"
else
	Heartstone_of_the_Keep_of_Clothos	= "<span class=""magic"" title=""An artifact that kept the Keep of Clothos alive"">Heartstone of the Keep of Clothos</span>"
end if
Hour_and_Minute					= "<a href=""Gear.asp" & Arg & "#Hour_and_Minute"" title=""A matching dagger and shortsword""><span class=""magic"">Hour and Minute</span></a>"
Horcruxes							= "<span class=""magic"" title=""The undying heart of a Mummy Lord, hidden away so it can return each day after being destroyed"">Horcruxes</span>"
Horseshoes_of_Speed				= "<a href=""Gear.asp" & Arg & "#Horseshoes_of_Speed"" title=""Magical horseshoes that increase a horse's speed""><span class=""magic"">Horseshoes of Speed</span></a>"
Immovable_Rod						= "<a href=""Gear.asp" & Arg & "#Immovable_Rod"" title=""A magical metal rod that, when activated, remains motionless in space, ignoring the effects of gravity""><span class=""magic"">Immovable Rod</span></a>"
Infernal_Machine_of_Lum_the_Mad = "<a href=""https://5e.tools/items/the-infernal-machine-of-lum-the-mad-imr.html"">Infernal Machine of Lum the Mad</a>"
Inkwell_and_Quill_of_Charis_a_Na	= "<a href=""Gear.asp" & Arg & "#Inkwell_and_Quill_of_Charis_a_Na"" title=""A magical inkwell, quill & silver tray""><span class=""magic"">Inkwell & Quill of Charis-a-Na</span></a>"
Iron_Bands_of_Bilarro			= "<a href=""Gear.asp" & Arg & "#Iron_Bands_of_Bilarro"" title=""A metal set of bands used to completely immobilize a creature""><span class=""magic"">Iron Bands of Bilarro</span></a>"
Lash_of_the_Spelldrinker		= "<a href=""Gear.asp" & Arg & "#Lash_of_the_Spelldrinker"" title=""A whip that can restore a spell slot from another caster""><span class=""magic"">Lash of the Spelldrinker</span></a>"
Lightning_Khopesh_Sword			= "<a href=""Gear.asp" & Arg & "#Lightning_Khopesh_Sword"" title=""An ancient style of sword that crackles with electricity""><span class=""magic"">Lightning Khopesh Sword</span></a>"
Locket_of_the_Stolen_Heart		= "<a href=""Gear.asp" & Arg & "#Locket_of_the_Stolen_Heart"" title=""Stores an image of one you love""><span class=""magic"">Locket of the Stolen Heart</span></a>"
Luckleaf								= "<a href=""Gear.asp" & Arg & "#Luckleaf"" title=""Luckleaf""><span class=""magic"">A magical leaf that brings luck to the owner</span></a>"
Mace_of_Disruption				= "<a href=""Gear.asp" & Arg & "#Mace_of_Disruption"" title=""A mace designed to fight undead and fiends""><span class=""magic"">Mace of Disruption</span></a>"
Medusan_Lavalier					= "<a href=""Gear.asp" & Arg & "#Medusan_Lavalier"" title=""A necklace that protects the wearer from petrifaction""><span class=""magic"">Medusan Lavalier</span></a>"
Mighty_Servant_of_Leuk_o		= "<a href=""Gear.asp" & Arg & "#Mighty_Servant_of_Leuk_o"" title=""A powerful construct""><span class=""magic"">Mighty Servant of Leuk-o</span></a>"
Mirror_of_Life_Trapping			= "<a href=""Gear.asp" & Arg & "#Mighty_Servant_of_Leuk_o"" title=""A mirror that magically sucks in the body of the unweary""><span class=""magic"">Mirror of Life Trapping</span></a>"
Mistwalker_Armor					= "<a href=""Gear.asp" & Arg & "#Mistwalker_Armor"" title=""Plate armor that can create a cloud of fog and to teleport within the fog""><span class=""magic"">Mistwalker Armor</span></a>"
Mithral								= "<span class=""magic"" title=""A green tinted silver metal which is incredibly light and rare which is fabricated Elves and used to make special weapons and armor - it weighs 1 tenth that of steel"">Mithral</span>"
Mummys_Curse						= "<span class=""magic"" title=""Anyone who steals from a Mummy Lord is cursed"">Mummy's Curse</span>"
Naraxes								= "<a href=""Gear.asp" & Arg & "#Naraxes"" title=""Naraxes the Mage Killer, a flaming glaive able to absorb some magical attacks""><span class=""magic"">Naraxes</span></a>"
Necklace_of_Adaptation			= "<a href=""Gear.asp" & Arg & "#Necklace_of_Adaptation"" title=""A necklace making the wearer immune to environmental conditions""><span class=""magic"">Necklace of Adaptation</span></a>"
Neothep_Hotep_Treasure			= "<a href=""Recap_C2_020.asp" & Arg & "#Neothep_Hotep_Treasure"" title=""Treasure from the necromancer Mummy Lord""><span class=""magic"">Neothep-Hotep`s Treasure</span></a>"
Neothep_Hotep_Treasure2			= "<a href=""Recap_C2_020.asp" & Arg & "#Neothep_Hotep_Treasure"" title=""Treasure from the necromancer Mummy Lord""><span class=""magic"">the tomb of the Mummy Lord, Neothep-Hotep</span></a>"
Nightmare_Flask					= "<a href=""Gear.asp" & Arg & "#Nightmare_Flask"" title=""A flask that traps and releases nightmares""><span class=""magic"">Nightmare Flask</span></a>"
Ogramaus_Graveyard				= "<a href=""Gear.asp" & Arg & "#Ogramaus_Graveyard"" title=""A skull that has power over the dead""><span class=""magic"">Ogramau's Graveyard</span></a>"
Orostead_Iced_Tea					= "<a href=""Gear.asp" & Arg & "#Orostead_Iced_Tea"" title=""A refreshing tea with wondrous effects""><span class=""magic"">Orostead Iced Tea</span></a>"
Periapt_of_Proof_Against_Poison	= "<a href=""Gear.asp" & Arg & "#Periapt_of_Proof_Against_Poison"" title=""A magical necklace that makes the wearer immune to poison""><span class=""magic"">Periapt of Proof Against Poison</span></a>"
Pisces_Shield						= "<a href=""Gear.asp" & Arg & "#Pisces_Shield"" title=""A shield that can change a critical miss to a critical hit""><span class=""magic"">Pisces Shield</span></a>"
Potion_of_Clairvoyance			= "<a href=""Gear.asp" & Arg & "#Potion_of_Clairvoyance"" title=""You gain the effect of the Clairvoyance spell""><span class=""magic"">Potion of Clairvoyance</span></a>"
Potion_of_Climbing				= "<a href=""Gear.asp" & Arg & "#Potion_of_Climbing"" title=""Can climb at normal walking speed and have advantage of Strength(Athletics) checks""><span class=""magic"">Potion of Climbing</span></a>"
Potion_of_Flying					= "<span class=""magic"" title=""Enable the imbiber to fly for 1 hour"">Potion of Flying</span>"
Potion_of_Frost_Giant_Strength= "<a href=""Gear.asp" & Arg & "#Potion_of_Growth"" title=""Strength becomes 23 for 1 hr""><span class=""magic"">Potion of Frost Giant Strength</span></a>"
Potion_of_Gaseous_Form			= "<a href=""Gear.asp" & Arg & "#Potion_of_Gaseous_Form"" title=""Gain the effect of the Gaseous Form spell for 1 hour""><span class=""magic"">Potion of Gaseous Form</span></a>"
Potion_of_Growth					= "<a href=""Gear.asp" & Arg & "#Potion_of_Growth"" title=""Gain 10 temp HPs and under the effects of a Bless for 1 hr""><span class=""magic"">Potion of Growth</span></a>"
Potion_of_Healing					= "<a href=""Gear.asp" & Arg & "#Potion_of_Healing"" title=""Restores 2d4+2 HP""><span class=""magic"">Potion of Healing</span></a>"
Potion_of_Heroism					= "<a href=""Gear.asp" & Arg & "#Potion_of_Heroism"" title=""Gain 10 temp HPs and under the effects of a Bless for 1 hr""><span class=""magic"">Potion of Heroism</span></a>"
Potion_of_Invisibility			= "<a href=""Gear.asp" & Arg & "#Potion_of_Invisibility"" title=""Turns the drinker invisible for 10 minutes w/o concentration""><span class=""magic"">Potion of Invisibility</span></a>"
Potions_of_Invisibility			= "<a href=""Gear.asp" & Arg & "#Potion_of_Invisibility"" title=""Turns the drinker invisible for 10 minutes w/o concentration""><span class=""magic"">Potions of Invisibility</span></a>"
Potion_of_Longevity				= "<a href=""Gear.asp" & Arg & "#Potion_of_Longevity"" title=""Extends a person's live""><span class=""magic"">Potion of Longevity</span></a>"
Potions_of_Longevity				= "<a href=""Gear.asp" & Arg & "#Potion_of_Longevity"" title=""Extends a person's live""><span class=""magic"">Potions of Longevity</span></a>"
Potion_of_Resistance_Cold		= "<a href=""Gear.asp" & Arg & "#Potion_of_Resistance_Cold"" title=""For 1 hr, the drinker is resistance to cold""><span class=""magic"">Potion of Resistance, Cold</span></a>"
Potion_of_Superior_Healing		= "<a href=""Gear.asp" & Arg & "#Potion_of_Superior_Healing"" title=""Regain 8d4 + 8 HPs""><span class=""magic"">Potion of Superior Healing</span></a>"
Potion_of_Vitality				= "<a href=""Gear.asp" & Arg & "#Potion_of_Vitality"" title=""Removes exhaustion, disease or poison""><span class=""magic"">Potion of Vitality</span></a>"
Potion_of_Water_Breathing		= "<a href=""Gear.asp" & Arg & "#Potion_of_Water_Breathing"" title=""Grants the ability to breath under water for 1 hour""><span class=""magic"">Potion of Water Breathing</span></a>"
Paddas_Planes_Potter				= "<span class=""magic"" title=""A magical plant pot that slowly moved to the sun and rain as needed"">Paddas Planes Potter</span>"
Phasing_Bow							= "<a href=""Gear.asp" & Arg & "#Phasing_Bow"" title=""Phasing Bow""><span class=""magic"">Phasing Bow</span></a>"
Protection_from_Fiends			= "<a href=""Gear.asp" & Arg & "#Protection_Scroll"" title=""Protection from Fiends""><span class=""magic"">Protection from Fiends</span></a>"
Protection_from_Undead			= "<a href=""Gear.asp" & Arg & "#Protection_Scroll"" title=""Protection from Undead""><span class=""magic"">Protection from Undead</span></a>"
Quick_Change_Ring					= "<a href=""Gear.asp" & Arg & "#Quick_Change_Ring"" title=""Allows a user of heavy armor to don and doff quickly""><span class=""magic"">Quick Change Ring</span></a>"
Quiver_of_Ehlonna					= "<span class=""magic"" title=""A magical quiver blessed by the Goddess Ehlonna"">Quiver of Ehlonna</span>"
Redeemers_Regards					= "<a href=""Gear.asp" & Arg & "#Redeemers_Regards"" title=""A longbow for Paladins""><span class=""magic"">Redeemer's Regards</span></a>"
Ring_of_Evasion					= "<a href=""Gear.asp" & Arg & "#Ring_of_Evasion"" title=""May re-roll failed DEX saving throws""><span class=""magic"">Ring of Evasion</span></a>"
Ring_of_Fire_Resistance			= "<a href=""Gear.asp" & Arg & "#Ring_of_Fire_Resistance"" title=""Makes the wearer resistant to fire damage""><span class=""magic"">Ring of Fire Resistance</span></a>"
Ring_of_Protection				= "<a href=""Gear.asp" & Arg & "#Ring_of_Protection"" title=""Improved AC and saving throws""><span class=""magic"">Ring of Protection</span></a>"
Ring_of_Spellturning				= "<a href=""Gear.asp" & Arg & "#Ring_of_Spellturning"" title=""Reflects a targeted spell away from the wearer""><span class=""magic"">Ring of Spell Turning</span></a>"
Ring_of_the_Split_Mind			= "<a href=""Gear.asp" & Arg & "#Ring_of_the_Split_Mind"" title=""Improves concentration with spells""><span class=""magic"">Ring of the Split Mind</span></a>"
Ring_of_Swimming					= "<a href=""Gear.asp" & Arg & "#Ring_of_Swimming"" title=""Allows the owner to swim effortlessly, but does not grant the ability to breath in water""><span class=""magic"">Ring of Swimming</span></a>"
Ring_of_Warmth						= "<a href=""Gear.asp" & Arg & "#Ring_of_Warmth"" title=""Protects wearer from cold temperatures""><span class=""magic"">Ring of Warmth</span></a>"
Robe_of_Stars						= "<a href=""Gear.asp" & Arg & "#Robe_of_Stars"" title=""Robe of Stars""><span class=""magic"">Robe of Stars</span></a>"
Rod_of_Security					= "<a href=""Gear.asp" & Arg & "#Rod_of_Security"" title=""Grants the owner access to a demi-plane""><span class=""magic"">Rod of Security</span></a>"
Rod_of_Water_Absorption			= "<a href=""Gear.asp" & Arg & "#Rod_of_Water_Absorption"" title=""Grants the owner control over water""><span class=""magic"">Rod of Water Absorption</span></a>"
Rope_of_Climbing					= "<a href=""Gear.asp" & Arg & "#Rope_of_Climbing"" title=""Rope of Climbing""><span class=""magic"">Rope of Climbing</span></a>"
The_Rose_Basket					= "<a href=""Gear.asp" & Arg & "#The_Rose_Basket"" title=""Desc""><span class=""magic"">The Rose Basket</span></a>"
Scroll_of_Mapping					= "<a href=""Gear.asp" & Arg & "#Scroll_of_Mapping"" title=""A scroll that identifies locations""><span class=""magic"">Scroll of Mapping</span></a>"
Second_Fiddle						= "<a href=""Gear.asp" & Arg & "#Second_Fiddle"" title=""An instrument that improves performance""><span class=""magic"">Second Fiddle</span></a>"
Seers_Starlight_Cloak			= "<a href=""Gear.asp" & Arg & "#Seers_Starlight_Cloak"" title=""See the future through the stars""><span class=""magic"">Seer's Starlight Cloak</span></a>"
Sending_Stone						= "<a href=""Gear.asp" & Arg & "#Sending_Stone"" title=""A magical stone used to send a brief message (25 words or less) to its matching stone""><span class=""magic"">Sending Stone</span></a>"
Sending_Stones						= "<a href=""Gear.asp" & Arg & "#Sending_Stone"" title=""A magical stone used to send a brief message (25 words or less) to its matching stone""><span class=""magic"">Sending Stones</span></a>"
Sentinel_Shield					= "<a href=""Gear.asp" & Arg & "#Sentinel_Shield"" title=""Gives advantage to initiative""><span class=""magic"">Sentinel Shield</span></a>"
Shield_of_the_Justicars			= "<a href=""Gear.asp" & Arg & "#Shield_of_the_Justicars"" title=""Desc""><span class=""magic"">Shield of the Justicars</span></a>"
Sir_Varions_Lance					= "<a href=""Gear.asp" & Arg & "#Sir_Varions_Lance"" title=""Sir Varion's Lance""><span class=""magic"">Sir Varion's Lance</span></a>"
Sir_Varions_Shield				= "<a href=""Gear.asp" & Arg & "#Sir_Varions_Shield"" title=""Sir Varion's Shield""><span class=""magic"">Sir Varion's Shield</span></a>"
Skyglider_Shield					= "<a href=""Gear.asp" & Arg & "#Skyglider_Shield"" title=""Briefly grants the ability to fly or glide""><span class=""magic"">Skyglider Shield</span></a>"
Sphere_of_Annihilation			= "<a href=""Gear.asp" & Arg & "#Sphere_of_Annihilation"" title=""A 2' diameter sphere of absolute destruction""><span class=""magic"">Sphere of Annihilation</span></a>"
Spellfire_Bow						= "<a href=""Gear.asp" & Arg & "#Spellfire_Bow"" title=""A bow that produces magical arrows""><span class=""magic"">Spellfire Bow</span></a>"
Spellsword							= "<a href=""Gear.asp" & Arg & "#Spellsword"" title=""A magical sword hilt that produces a blade of pure magic""><span class=""magic"">Spellsword</span></a>"
Spiderbite_Daggers				= "<a href=""Gear.asp" & Arg & "#Spiderbite_Daggers"" title=""Daggers made from the fangs of giant spiders""><span class=""magic"">Spiderbite Daggers</span></a>"
Spire_Seed							= "<a href=""Gear.asp" & Arg & "#Spire_Seed"" title=""A large pine cone that, over time, will grow into a towering tree with rooms inside""><span class=""magic"">Spire Seed</span></a>"
Spire_Tree							= "<a href=""Gear.asp" & Arg & "#Spire_Seed"" title=""The towering pine tree fortress, the result of a Spire Seed""><span class=""magic"">Spire Tree</span></a>"
Spirit_Cleaver						= "<a href=""Gear.asp" & Arg & "#Spirit_Cleaver"" title=""A DEADLY heavy dagger""><span class=""magic"">Spirit Cleaver</span></a>"
Staff_of_Cubic_Cultivation		= "<a href=""Gear.asp" & Arg & "#Staff_of_Cubic_Cultivation"" title=""A staff that creates gelatinous cubes""><span class=""magic"">Staff of Cubic Cultivation</span></a>"
Staff_of_Fire						= "<a href=""Gear.asp" & Arg & "#Staff_of_Fire"" title=""The staff has 10 Charges. While holding it, you can use an action to expend 1 or more of its Charges to cast one of the following Spells from it, using your spell save DC: Burning Hands (1 charge), Fireball (3 charges), or Wall of Fire (4 charges)""><span class=""magic"">Staff of Fire</span></a>"
Staff_of_the_Vineyard			= "<a href=""Gear.asp" & Arg & "#Staff_of_the_Vineyard"" title=""A staff with grapes that can cause an entangle and drunkenness""><span class=""magic"">Staff of the Vineyard</span></a>"
Starmetal_Ring						= "<a href=""Gear.asp" & Arg & "#Starmetal_Ring"" title=""A ring that can summon a bonded, nearby metal object""><span class=""magic"">Starmetal Ring</span></a>"
Status_Signets						= "<a href=""Gear.asp" & Arg & "#Status_Signets"" title=""A pair or rings that allow the wearers to determine each other's health""><span class=""magic"">Status Signets</span></a>"
Steel_Glass							= "<span class=""magic"" title=""A clear, hard as steel material found only in the Mellys Valley"">Steel-Glass</span>"
Stone_of_Controlling_Earth_Elemental= "<span class=""magic"" title=""Summon and control an Earth Elemental"">Stone of Controlling Earth Elemental</span>"
Storytellers_Stein				= "<a href=""Gear.asp" & Arg & "#Storytellers_Stein"" title=""A mug that reacts to story-telling""><span class=""magic"">Storyteller's Stein</span></a>"
Sultans_Laws						= "<a href=""Gear.asp" & Arg & "#Sultans_Laws"" title=""A document with a series of laws""><span class=""magic"">Sultans Laws</span></a>"
Talisman_of_the_Sphere			= "<a href=""Gear.asp" & Arg & "#Talisman_of_the_Sphere"" title=""Used to help control a Sphere of Annihilation""><span class=""magic"">Talisman of the Sphere</span></a>"
Tea_Weird							= "<a href=""Gear.asp" & Arg & "#Tea_Weird"" title=""A tiny, sentient fragment of a charmed water elemental has an endless desire to create tea""><span class=""magic"">Tea Weird</span></a>"
Tear_of_Gaia						= "<a href=""Gear.asp" & Arg & "#Tear_of_Gaia"" title=""Causes vegetation to flourish""><span class=""magic"">Tear of Gaia</span></a>"
Thalamus_Thread					= "<a href=""Gear.asp" & Arg & "#Thalamus_Thread"" title=""A bowstring made from the brain of a mystic""><span class=""magic"">Thalamus Thread</span></a>"
Timepiercer							= "<a href=""Gear.asp" & Arg & "#Timepiercer"" title=""A rapier that can effect time around it""><span class=""magic"">Timepiercer</span></a>"
Timeshifters_Mantle				= "<a href=""Gear.asp" & Arg & "#Timeshifters_Mantle"" title=""A cloak that allows the wearer to avoid some attacks""><span class=""magic"">Timeshifter's Mantle</span></a>"
Tome_of_Clear_Thought			= "<a href=""Gear.asp" & Arg & "#Tome_of_Clear_Thought"" title=""A book to increase a person's Intelligence""><span class=""magic"">Tome of Clear Thought</span></a>"
Tome_of_Leadership_and_Infuence	= "<a href=""Gear.asp" & Arg & "#Tome_of_Leadership_and_Infuence"" title=""A book to increase a person's Charisma""><span class=""magic"">Tome of Leadership and Infuence</span></a>"
Tome_of_the_Stilled_Tongue		= "<a href=""Gear.asp" & Arg & "#Tome_of_the_Stilled_Tongue"" title=""A wondrous spellbook alleged to have come from the arch-lich Vecna""><span class=""magic"">Tome of the Stilled Tongue</span></a>"
Tome_of_Understanding			= "<a href=""Gear.asp" & Arg & "#Tome_of_Understanding"" title=""A book to increase a person's Wisdom""><span class=""magic"">Tome of Understanding</span></a>"
Torrdoks_Magnificent_Forgery	= "<a href=""Gear.asp" & Arg & "#Torrdoks_Magnificent_Forgery"" title=""A mirror with a demi-plane within""><span class=""magic"">Torrdok _Magnificent Forgery</span></a>"
Treasure_Riddle					= "<a href=""Gear.asp" & Arg & "#Treasure_Riddle"" title=""Treasure Riddle""><span class=""magic"">Treasure Riddle</span></a>"
Tub_of_Churning_and_Fermentation	= "<a href=""Gear.asp" & Arg & "#Tub_of_Churning_and_Fermentation"" title=""Tub that can create butter, cheese, wine, etc.""><span class=""magic"">Tub of Churning and Fermentation</span></a>"
Turtle_Brooch						= "<a href=""Gear.asp" & Arg & "#Turtle_Brooch"" title=""Allows you to get to your feet quicker""><span class=""magic"">Turtle Brooch</span></a>"
Verax_Weapon						= "<a href=""Gear.asp" & Arg & "#Verax_Weapon"" title=""A metal weapon that is better against a specific type of creature""><span class=""magic"">Verax Weapon</span></a>"
Viper_Khopesh						= "<a href=""Gear.asp" & Arg & "#Viper_Khopesh"" title=""A blade that does additional poison damage""><span class=""magic"">Viper Khopesh</span></a>"
Wardancers_Spear					= "<a href=""Gear.asp" & Arg & "#Wardancers_Spear"" title=""A perfectly balanced, double bladed spear""><span class=""magic"">Wardancers Spear</span></a>"
Wand_of_Lightning_Bolts			= "<a href=""Gear.asp" & Arg & "#Wand_of_Lightning_Bolts"" title=""Produces a bolt of ightning""><span class=""magic"">Wand of Lightning</span></a>"
Wand_of_Magic_Detection			= "<span class=""magic"" title=""A wand that causes magical things to glow for the wielder of the wand"">Wand of Magic Detection</span>"
Wands_of_Magic_Detection		= "<span class=""magic"" title=""A wand that causes magical things to glow for the wielder of the wand"">Wands of Magic Detection</span>"
War_Standard_of_Battlecries	= "<a href=""Gear.asp" & Arg & "#War_Standard_of_Battlecries"" title=""Used to inspire one's forces nearby""><span class=""magic"">War Standard of Battlecries</span></a>"
Warding_Staff						= "<a href=""Gear.asp" & Arg & "#Warding_Staff"" title=""Grants a warding bond spell effect""><span class=""magic"">Warding Staff</span></a>"
Warhammer_of_Eruptions			= "<a href=""Gear.asp" & Arg & "#Warhammer_of_Eruptions"" title=""A mighty warhammer that shoots lava""><span class=""magic"">Warhammer of Eruptions</span></a>"
Wayfinder_Sphere					= "<a href=""Gear.asp" & Arg & "#Wayfinder_Sphere"" title=""Project an illusory map of places the device has been""><span class=""magic"">Wayfinder Sphere</span></a>"
Whyme_Lights						= "<a href=""Gear.asp" & Arg & "#Whyme_Lights"" title=""A tree elegantly 'sculpted' by Avalina with a decorative lantern illuminated with Continual Flame by Caris""><span class=""magic"">Whyme Lights</span></a>"
Widemouth_Bucket					= "<a href=""Gear.asp" & Arg & "#Widemouth_Bucket"" title=""A magical bucket that holds additional water""><span class=""magic"">Widemouth Bucket</span></a>"
Windswept_Wyvernplate			= "<a href=""Gear.asp" & Arg & "#Windswept_Wyvernplate"" title=""Half plate made of wyvern plates""><span class=""magic"">Windswept Wyvernplate</span></a>"
Wraps_of_the_Restless			= "<a href=""Gear.asp" & Arg & "#Wraps_of_the_Restless"" title=""Wrappings from a mummy that cause damage to foes""><span class=""magic"">Wraps of the Restless</span></a>"
Yabbashal							= "<a href=""Gear.asp" & Arg & "#Yabbashal"" title=""An intelligent Holy Avenger sword""><span class=""magic"">Yabbashal</span></a>"
Yabbashal_the_Avenger			= "<a href=""Gear.asp" & Arg & "#Yabbashal"" title=""An intelligent Holy Avenger sword""><span class=""magic"">Yabbashal the Avenger</span></a>"
Zalaam								= "<a href=""Gear.asp" & Arg & "#Zalaam"" title=""An ancient, intelligent, black Sulois short sword""><span class=""magic"">Zalaam</span></a>"



' Tattoo magic
Barrier_Tattoo_Large				= "<span class=""magic"" title=""While you aren't wearing armor, the tattoo grants you an Armor Class of 18. You can use a shield and still gain this benefit."">Barrier Tattoo, Large</span>"
Barrier_Tattoo_Medium			= "<span class=""magic"" title=""While you aren't wearing armor, the tattoo grants you an Armor Class of 15 + your Dexterity modifier (maximum of +2). You can use a shield and still gain this benefit."">Barrier Tattoo, Medium</span>"
Barrier_Tattoo_Small				= "<span class=""magic"" title=""While you aren't wearing armor, the tattoo grants you an Armor Class of 12 + your dexterity bonus. You can use a shield and still gain this benefit."">Barrier Tattoo, Small</span>"
Ghost_Step_Tattoo					= "<span class=""magic"" title=""Allows the character to become incorporeal."">Ghost Step Tattoo</span>"
Lifewell_Tattoo					= "<span class=""magic"" title=""You have resistance to necrotic damage - when your HPs are reduced to 0, you drop to 1 instead"">Lifewell Tattoo</span>"
Necrotic_Absorbing_Tattoo		= "<span class=""magic"" title=""You have resistance to necrotic damage - when you take necrotic damage, you can use your reaction to gain immunity against that instance of the damage, and you regain a number of hit points equal to half the damage you would have taken"">Necrotic Absorbing Tattoo</span>"



' Books by Luciano Maserati
The_Enduring_Journey				= "<span class=""magic"" title=""The epic tale of Luciano and Maximilian's journey through the Underdark, the battle in Clothos' Keep and the final defeat of the evil warrior/priest"">The Enduring Journey</span>"
The_Battle_of_the_Goblin_King	= "<span class=""magic"" title=""The epic tale the gathering of humans, elves and dwarves against the army of the Goblin King"">The Battle of the Goblin King</span>"



' Drinks
Aged_Goodberry_Wine				= "<a href=""Gear.asp" & Arg & "#Aged_Goodberry_Wine"" title=""A wine made from Druidic Goodberries""><span class=""magic"">Aged Goodberry Wine</span></a>"
Eleithri_Wine						= "<span class=""magic"" title=""A wonderful, sweet elvan wine"">Eleithri Wine</span>"
Evermead								= "<span class=""magic"" title=""An extremely fine elven mead that was aged for hundreds of years"">Evermead</span>"
Gordian_Brandy						= "<span class=""magic"" title=""An fine brandy aged for at least 25 years"">Gordian Brandy</span>"
Kumis									= "<span class=""magic"" title=""A potent Paynim beverage made from mare's milk"">Kumis</span>"
Moonberry_Wine						= "<span class=""magic"" title=""A wonderful, sweet wine produced by Druids"">Moonberry Wine</span>"



' Build links to documents
Deed_to_Dusseldorn_Hollow	= "<a href=""Gear.asp" & Arg & "#Deed_to_Dusseldorn_Hollow"" title=""Caris's deed to some far away property""><span class=""magic"">Deed to Dusseldorn Hollow</span></a>"
Deed								= "<a href=""Gear.asp" & Arg & "#Deed_to_Dusseldorn_Hollow"" title=""Caris's deed to some far away property""><span class=""magic"">Deed</span></a>"
Deed_to_Hollows_Brewery		= "<a href=""Gear.asp" & Arg & "#Deed_to_Hollows_Brewery"" title=""Deed from King Maximilian exempting Hollows Brewery from the Reinheitsgebot Purity Laws""><span class=""magic"">Deed to Hollows Brewery</span></a>"



' Tech from the Barrier Peaks
Luchianos_Devices			= "<a href=""Gear.asp" & Arg & "#Tech"" title=""Strange devices from Luciano Masserati""><span class=""magic"">Luchiano's Devices</span></a>"
Blaster_Pistol				= "<a href=""Gear.asp" & Arg & "#Blaster_Pistol"" title=""A strange device made of unknown materials""><span class=""magic"">Blaster Pistol</span></a>"
Blaster_Rifle				= "<a href=""Gear.asp" & Arg & "#Blaster_Rifle"" title=""A strange device made of unknown materials""><span class=""magic"">Blaster Rifle</span></a>"
Grenade						= "<a href=""Gear.asp" & Arg & "#Grenade"" title=""A strange oval-shaped device made of unknown materials""><span class=""magic"">Grenade</span></a>"
Needler_Pistol				= "<a href=""Gear.asp" & Arg & "#Needler_Pistol"" title=""A strangely-shaped device made of unknown materials""><span class=""magic"">Needler Pistol</span></a>"
Paralysis_Pistol			= "<a href=""Gear.asp" & Arg & "#Paralysis_Pistol"" title=""A strange bulbous-shaped device made of unknown materials""><span class=""magic"">Paralysis Pistol</span></a>"
Power_Disc					= "<a href=""Gear.asp" & Arg & "#Power_Disc"" title=""A strange coin-shaped device made of unknown materials""><span class=""magic"">Power Disc</span></a>"



' Festivals
Festival_of_Needfest			= "<span class=""festival"" title=""A winter festival celebrating the beginning of the new year"">Festival of Needfest</span>"
Festival_of_Growfest			= "<span class=""festival"" title=""A spring festival celebrating the end of winter and the beginning of the growing season"">Festival of Growfest</span>"
Festival_of_Richfest			= "<span class=""festival"" title=""A summer festival celebrating the mid year and the rich crops in the field"">Festival of Richfest</span>"
Festival_of_Brewfest			= "<span class=""festival"" title=""A fall festival celebrating the harvest and the end of fair weather"">Festival of Brewfest</span>"
Needfest							= "<span class=""festival"" title=""A winter festival celebrating the beginning of the new year"">Needfest</span>"
Growfest							= "<span class=""festival"" title=""A spring festival celebrating the end of winter and the beginning of the growing season"">Growfest</span>"
Richfest							= "<span class=""festival"" title=""A summer festival celebrating the mid year and the rich crops in the field"">Richfest</span>"
Brewfest							= "<span class=""festival"" title=""A fall festival celebrating the harvest and the end of fair weather"">Brewfest</span>"



' Monsters
if (userId = "DM") then
	Altiniyan_al_Azarq1		= "<span class=""monsters"" title=""The name of an ancient blue dragon"">Altiniyan al'Azarq</span>"
else
	Altiniyan_al_Azarq1		= "<span class=""monsters"" title=""Words spoken by the child Mongu, sole surivor of Ksar-es-Nefad"">Altiniyan al'Azarq</span>"
end if
Bar_Igura_Demon				= "<span class=""monsters"" title=""A massively strong, orangutan-looking demon"">Bar-Igura Demon</span>"
Basilisk							= "<span class=""monsters"" title=""An 8-legged monstrosity whose gaze can turn a person to stone"">Basilisk</span>"
Behir								= "<span class=""monsters"" title=""A large multi-legged creature that vaguely resembles a dragon"">Behir</span>"
Beholder							= "<span class=""monsters"" title=""A large floating body with a large mouth, a magical central eye, and 8 smaller magical eyes on eye-stalks"">Beholder</span>"
Black_Bear						= "<span class=""monsters"" title=""The smallest of the bears, it is still a formidable beast"">Black Bear</span>"
Black_Dragon					= "<span class=""monsters"" title=""A large flying mythical monster that breaths acid"">Black Dragon</span>"
Black_Wyrm						= "<span class=""monsters"" title=""A large flying mythical monster that breaths acid"">Black Wyrm</span>"
Black_Pudding					= "<span class=""monsters"" title=""A black blob, commonly found in dungeons that has a corrosive attack"">Black Pudding</span>"
Bodak								= "<span class=""monsters"" title=""A hooded undead whose gaze can kill and whose mear presence causes deadly harm"">Bodak</span>"
Bodaks							= "<span class=""monsters"" title=""A hooded undead whose gaze can kill and whose mear presence causes deadly harm"">Bodaks</span>"
Brown_Bear						= "<span class=""monsters"" title=""Large bears, including Cave Bears and Grizzly Bears"">Brown Bear</span>"
Bugbear							= "<span class=""monsters"" title=""A medium sized hostile humanoid"">Bugbear</span>"
Bugbears							= "<span class=""monsters"" title=""A medium sized hostile humanoid"">Bugbears</span>"
Bulette							= "<span class=""monsters"" title=""A large burrowing monster with a hard, chitin-like head"">Bulette</span>"
Bulezau_Demon					= "<span class=""monsters"" title=""A large, goatman looking demon with a nauseating stench"">Bulezau Demon</span>"
Bulezau_Demons					= "<span class=""monsters"" title=""A large, goatman looking demon with a nauseating stench"">Bulezau Demons</span>"
Carrion_Crawler				= "<span class=""monsters"" title=""A large, multi-legged monster with paralytic tentacles protruding from its head"">Carrion Crawler</span>"
Carrion_Crawlers				= "<span class=""monsters"" title=""A large, multi-legged monster with paralytic tentacles protruding from its head"">Carrion Crawlers</span>"
if (userId = "DM") then
	Caryatid_Column				= "<a href=""House_Rules.asp" & Arg & "#Caryatid_Columns"" title=""A sculpted female figure acting as a support of statue which animates under specific conditions""><span class=""magic"">Caryatid Column</span></a>"
	Caryatid_Columns				= "<a href=""House_Rules.asp" & Arg & "#Caryatid_Columns"" title=""Sculpted female figures acting as supports of statue which animates under specific conditions""><span class=""magic"">Caryatid Columns</span></a>"
else
	Caryatid_Column				= "<span class=""monsters"" title=""A sculpted female figure acting as a support of statue which animates under specific conditions"">Caryatid Column</span>"
	Caryatid_Columns				= "<span class=""monsters"" title=""Sculpted female figures acting as supports of statue which animates under specific conditions"">Caryatid Columns</span>"
end if 
Cave_Bear						= "<span class=""monsters"" title=""Large bears, similar to Grizzly Bears"">Cave Bear</span>"
Centaur							= "<span class=""monsters"" title=""Half man/half horse fey"">Centaur</span>"
Centaurs							= "<span class=""monsters"" title=""Half man/half horse fey"">Centaurs</span>"
Chasme							= "<span class=""monsters"" title=""A demon the vaguely resembles a cross between a giant bee with the face of an angry humanoid"">Chasme</span>"
Chimera							= "<span class=""monsters"" title=""A flying monster with the body of a lion, and the heads of a dragon, lion and goat"">Chimera</span>"
Ancient_Chimera				= "<span class=""monsters"" title=""A HUGE flying monster with the body of a lion, and the heads of a dragon, lion and goat"">Ancient Chimera</span>"
Bone_Swarm						= "<span class=""monsters"" title=""A collection of bones from various dead: human, animal, etc."">Bone Swarm</span>"
Chasme_Demon					= "<span class=""monsters"" title=""A demon that vaguely resembles a gigantic fly"">Chasme Demon</span>"
if (userId = "DM") then
	Clockwork_Reliquary		= "<a href=""House_Rules.asp" & Arg & "#Clockwork_Reliquary"" title=""An extremely powerful construct housing the remains of a mad Wizard""><span class=""monsters"">Clockwork Reliquary</span></a>"
else
	Clockwork_Reliquary		= "<span class=""monsters"" title=""An extremely powerful construct housing the remains of a mad Wizard"">Clockwork Reliquary</span>"
end if
Deva								= "<span class=""monsters"" title=""A celestial servant of the LG gods"">Deva</span>"
Dianthi							= "<a href=""Gear.asp" & Arg & "gear.asp#Spire_Seed"" title=""A dryad that is bound to Avalin's tree home""><span class=""monsters"">Dianthi</span></a>"
Dire_Bear						= "<span class=""monsters"" title=""Enormous bear"">Dire Bear</span>"
Dire_Wolf						= "<span class=""monsters"" title=""Enormous wolf"">Dire Wolf</span>"
Dire_Wolves						= "<span class=""monsters"" title=""Enormous wolf"">Dire Wolves</span>"
Displacer_Beast				= "<span class=""monsters"" title=""A large, strange cat-like creature able to distort the space around it"">Displacer Beast</span>"
Drow								= "<span class=""monsters"" title=""Evil black-skinned/white-haired elves that live in the Underdark - known as slavers and worshipers of Loth (the demon spider queen)"">Drow</span>"
Dryder							= "<span class=""monsters"" title=""A creature with the body of a giant spider and the torso, arms and head of a Drow"">Dryder</span>"
Dryders							= "<span class=""monsters"" title=""Creatures with the body of a giant spider and the torso, arms and head of a Drow"">Dryders</span>"
Bullette							= "<span class=""monsters"" title=""A powerful monster that tends to ambush their prey by bursting out of the ground beneath their prey"">Bullette</span>"
Earth_Elemental				= "<span class=""monsters"" title=""Mindless, primal strong creatures, summoned from the Elemental Plane of Earth able to move effortlessly through earth & stone"">Earth Elemental</span>"
Efreet							= "<span class=""monsters"" title=""A powerful creature from the Elemental Plane of Fire"">Efreet</span>"
Efreeti							= "<span class=""monsters"" title=""A powerful creature from the Elemental Plane of Fire"">Efreeti</span>"
Elemental_Locus				= "<span class=""monsters"" title=""A towering form of earth elemental, at least 60' high and wide"">Elemental Locus</span>"
Erastes							= "<span class=""monsters"" title=""A male centaur"">Erastes</span>"
Fairies							= "<span class=""monsters"" title=""Small fey who often appear as winged young children"">Fairies</span>"
Fairy								= "<span class=""monsters"" title=""Small fey who often appear as winged young child"">Fairy</span>"
Fang								= "<span class=""monsters"" title=""Primary breeders of Gnoll tribes - clans breed esp. quickly when a Fang is in the tribe"">Fang</span>"
Fangs								= "<span class=""monsters"" title=""Primary breeders of Gnoll tribes - clans breed esp. quickly when a Fang is in the tribe"">Fangs</span>"
Fey								= "<span class=""monsters"" title=""Centaurs"">Fey</span>"
Fey_Timber_Wolves				= "<span class=""monsters"" title=""Large canines spirit beings from the Feywild"">Fey Timber Wolf</span>"
Fey_Wolves						= "<span class=""monsters"" title=""Large canines spirit beings from the Feywild"">Fey Wolf</span>"
Fire_Elemental					= "<span class=""monsters"" title=""Mindless, primal, strong creature, summoned from the Elemental Plane of Fire able to move effortlessly through flame"">Fire Elemental</span>"
Fire_Giant						= "<span class=""monsters"" title=""24' tall humanoids"">Fire Giant</span>"
Frost_Giant						= "<span class=""monsters"" title=""21' tall humanoids"">Frost Giant</span>"
Frost_Giants					= "<span class=""monsters"" title=""21' tall humanoids"">Frost Giants</span>"
Frost_Giantesses				= "<span class=""monsters"" title=""21' tall humanoids"">Frost Giantesses</span>"
Gbahali							= "<span class=""monsters"" title=""Large alligator like beast with chameleon-like abilities"">Gbahali</span>"
Gelatinous_Cube				= "<span class=""monsters"" title=""A large, nearly invisible creature that digests any creature it absorbs"">Gelatinous Cube</span>"
Ghost								= "<span class=""monsters"" title=""A spirit of the dead, condemned to roam the world until an incompleted task is finished"">Ghost</span>"
Ghoul								= "<span class=""monsters"" title=""An undead being with a paralytic touch"">Ghoul</span>"
Ghouls							= "<span class=""monsters"" title=""Undead beings with a paralytic touch"">Ghouls</span>"
Giant								= "<span class=""monsters"" title=""A huge race of human-like beings"">Giant</span>"
Giants							= "<span class=""monsters"" title=""A huge race of human-like beings"">Giants</span>"
Giant_Ant						= "<span class=""monsters"" title=""Huge ant, the size of an large dog"">Giant Ant</span>"
Giant_Ants						= "<span class=""monsters"" title=""Huge ants, the size of an large dog"">Giant Ants</span>"
Gibbering_Mouther				= "<span class=""monsters"" title=""A mass of flesh and mouths that shrieks stunning the victims"">Gibbering Mouther</span>"
Gith								= "<span class=""monsters"" title=""A general reference to either the Githyanki or the Githzerai"">Gith</span>"
Githyanki						= "<span class=""monsters"" title=""Great warriors from the Astal Plane, enemies of the Illithiads and Githzerai, they are powerful psionics"">Githyanki</span>"
if (userId = "DM") then
	Githyanki_Astral_Ship		= "<a href=""Astral_Ships.asp" & Arg & "#TBD"" title=""Strange vessels used by the Githyanki to conduct raids and such""><span class=""things"">Githyanki Astral Ship</span></a>"
	Githyanki_Astral_Ships		= "<a href=""Astral_Ships.asp" & Arg & "#TBD"" title=""Strange vessels used by the Githyanki to conduct raids and such""><span class=""things"">Githyanki Astral Ships</span></a>"
else
	Githyanki_Astral_Ship		= "<span class=""things"" title=""Large floating vessels used traverse the Astral plane and to raid other planes"">Githyanki Astral Ship</span>"
	Githyanki_Astral_Ships		= "<span class=""things"" title=""Large floating vessels used traverse the Astral plane and to raid other planes"">Githyanki Astral Ships</span>"
end if
Githyanki_Knight				= "<span class=""monsters"" title=""Great warriors from the Astal Plane, enemies of the Illithiads and Githzerai, they are powerful psionics"">Githyanki Knight</span>"
Githzerai						= "<span class=""monsters"" title=""Great warriors from the Astal Plane, enemies of the Illithiads and Githyanki, they are powerful psionics"">Githyanki</span>"
Glarbezu_Demon					= "<span class=""monsters"" title=""A large demon with 4 arms, 2 with massive pincers and w with powerful fists"">Glarbezu Demon</span>"
Glarbezu_Demons				= "<span class=""monsters"" title=""A large demon with 4 arms, 2 with massive pincers and w with powerful fists"">Glarbezu Demons</span>"
Gnoll								= "<a href=""House_Rules.asp" & Arg & "#Gnolls"" title=""Large hyena-like humanoids""><span class=""monsters"">Gnoll</span></a>"
Gnolls							= "<a href=""House_Rules.asp" & Arg & "#Gnolls"" title=""Large hyena-like humanoids""><span class=""monsters"">Gnolls</span></a>"
Goatman_Demon					= "<span class=""monsters"" title=""A large, goatman looking demon with a nauseating stench"">Goatman Demon</span>"
Goblin							= "<span class=""monsters"" title=""Small, malicious humanoid"">Goblin</span>"
Goblins							= "<span class=""monsters"" title=""Small, malicious humanoids"">Goblins</span>"
Great_Stag						= "<span class=""monsters"" title=""An enormous Fey stag"">Great Stag</span>"
Green_Slime						= "<span class=""monsters"" title=""A corrosive slime that generally drops down onto unsuspecting victims"">Green Slime</span>"
Grazzt							= "<span class=""God"" title=""The Demon Prince of Pleasure and Excess"">Graz'zt</span>"
Griphon							= "<span class=""monsters"" title=""A large, flying beast"">Griphon</span>"
Hezrou_Demon					= "<span class=""monsters"" title=""Frog-like demons the emit a rechid stench"">Hezrou Demon</span>"
Hezrou_Demons					= "<span class=""monsters"" title=""Frog-like demons the emit a rechid stench"">Hezrou Demons</span>"
Hill_Giantess					= "<span class=""monsters"" title=""16' tall stupid brute"">Hill Giantess</span>"
Hill_Giant_Chieftain			= "<span class=""monsters"" title=""16' tall stupid brute"">Hill Giant Chieftain</span>"
Hill_Giant						= "<span class=""monsters"" title=""16' tall stupid brute"">Hill Giant</span>"
Hill_Giants						= "<span class=""monsters"" title=""16' tall stupid brutes"">Hill Giants</span>"
Hill_Giant_Shaman				= "<span class=""monsters"" title=""A spell casting giant"">Hill Giant Shaman</span>"
Hill_Giant_Werewolf			= "<span class=""monsters"" title=""A hill giant lycanthrope"">Hill Giant Werewolf</span>"
Hippogriff 						= "<span class=""monsters"" title=""A large, flying beast"">Hippogriff</span>"
Hippogriffs						= "<span class=""monsters"" title=""Large, flying beasts"">Hippogriffs</span>"
Hobgoblin						= "<span class=""monsters"" title=""Militant humanoids that are excellent warriors"">Hobgoblin</span>"
Hobgoblins						= "<span class=""monsters"" title=""Militant humanoids that are excellent warriors"">Hobgoblins</span>"
Hunchback						= "<span class=""monsters"" title=""A hideous, one-eyed, hunchback Hill Giant"">hunchback</span>"
Hyenas							= "<span class=""monsters"" title=""Thin canines, often found in the company of Gnolls"">Hyenas</span>"
Illithid							= "<span class=""monsters"" title=""Horrifying beings with powerful psychic abilities - also known as Mind Flayers"">Illithid</span>"
Illithids						= "<span class=""monsters"" title=""Horrifying beings with powerful psychic abilities - also known as Mind Flayers"">Illithids</span>"
Indentured_Spirits			= "<span class=""monsters"" title=""Undead condemded to act as servants to more powerful undead"">Indentured Spirits</span>"
Intellect_Devourer			= "<span class=""monsters"" title=""Horrific servants of Mind Flayers"">Intellect Devourer</span>"
Intellect_Devourers			= "<span class=""monsters"" title=""Horrific servants of Mind Flayers"">Intellect Devourers</span>"
Invisible_Stalker				= "<span class=""monsters"" title=""A creature summoned from the Elemental Plane of Air"">Invisible Stalker</span>"
Jackalweres						= "<span class=""monsters"" title=""Shape-changing creatures who often serve Lamias"">Jackalweres</span>"
Kuo_Toa							= "<span class=""monsters"" title=""A strange fish-man found in the Underdark"">Kuo-Toa</span>"
Kuo_Toa_Whip					= "<span class=""monsters"" title=""A strange fish-man found in the Underdark, leader"">Kuo-Toa Whip</span>"
Kuo_Toa_Whips					= "<span class=""monsters"" title=""A strange fish-man found in the Underdark, leader"">Kuo-Toa Whips</span>"
Lamia								= "<span class=""monsters"" title=""A creature with the body of a great lion and the upper torso of a woman"">Lamia</span>"
Noble_Lamia						= "<span class=""monsters"" title=""A creature with the body of a giant serpent and the upper torso of a woman"">Noble Lamia</span>"
Leucrottas						= "<span class=""monsters"" title=""Large, 4-legged hideous creatures that enjoy causing pain - know for their mimicry"">Leucrottas</span>"
Lich								= "<span class=""monsters"" title=""An evil, skeletal undead archmage"">Lich</span>"
Marilith							= "<span class=""monsters"" title=""A large, 6-armed demon, AKA Type V demon"">Marilith</span>"
Meazel							= "<span class=""monsters"" title=""A gaunt, dark skinned humanoid, common in the Underdark"">Meazel</span>"
Meazels							= "<span class=""monsters"" title=""Gaunt, dark skinned humanoids, common in the Underdark"">Meazels</span>"
Mezzoloth						= "<span class=""monsters"" title=""The most common type of the Yugoloths, Mezzoloth have 4 clawed arms and usually carry trident."">Mezzoloth</span>"
Mezzoloths						= "<span class=""monsters"" title=""The most common type of the Yugoloths, Mezzoloth have 4 clawed arms and usually carry trident."">Mezzoloths</span>"
Mimic								= "<span class=""monsters"" title=""A creature that can take on the appearance of an object to trick its victim to approach it"">Mimic</span>"
Mind_Flayer						= "<span class=""monsters"" title=""Horrifying beings with powerful psychic abilities - also known as Illithids"">Mind Flayer</span>"
Mind_Flayers					= "<span class=""monsters"" title=""Horrifying beings with powerful psychic abilities - also known as Illithids"">Mind Flayers</span>"
Misstress_Grainnye			= "<span class=""monsters"" title=""Misstress Grainnye of the Unseelie Court, cousin if Misstress Gwyndaelia"">Mistress Grainnye</span>"
Mistress_Gwyndaelia			= "<span class=""monsters"" title=""The child/woman fey ruler of the glade, sister of 'Our Mother' & minor member of the Seelie Court"">Mistress Gwyndaelia</span>"
Mummies							= "<span class=""monsters"" title=""Undead whose touch curses its victim"">Mummies</span>"
Mummy								= "<span class=""monsters"" title=""Undead whose touch curses its victim"">Mummy</span>"
Mummy_Lord						= "<span class=""monsters"" title=""A far more dangerous mummy"">Mummy Lord</span>"
if (userId = "DM") then
	Mummy_Warrior					= "<a href=""House_Rules.asp" & Arg & "#Mummy_Warrior"" title=""A powerful mummy who guards something special""><span class=""monsters"">Mummy Warrior</span></a>"
	Mummy_Warriors					= "<a href=""House_Rules.asp" & Arg & "#Mummy_Warrior"" title=""Powerful mummies who guard something special""><span class=""monsters"">Mummy Warriors</span></a>"
else
	Mummy_Warrior					= "<span class=""monsters"" title=""A powerful mummy who guards something special"">Mummy Warrior</span>"
	Mummy_Warriors					= "<span class=""monsters"" title=""Powerful mummies who guard something special"">Mummy Warriors</span>"
end if
Nabassu							= "<span class=""monsters"" title=""A powerful demon, shunned by their own kind for their wickedness"">Nabassu</span>"
Naga								= "<span class=""monsters"" title=""A creature summoned to guard over a place"">Naga</span>"
Nalfeshnee_Demon				= "<span class=""monsters"" title=""A large demon powerful fists, a devistating bite, and a fear nimbus"">Nalfeshnee Demon</span>"
Nalfeshnee_Demons				= "<span class=""monsters"" title=""A large demon powerful fists, a devistating bite, and a fear nimbus"">Nalfeshnee Demons</span>"
Nycaloth							= "<span class=""monsters"" title=""The elite airborne shock troops of the Yugoloths, Nycaloths look like muscular gargoyles, often wielding massive weapons"">Nycaloth</span>"
Nycaloths						= "<span class=""monsters"" title=""The elite airborne shock troops of the Yugoloths, Nycaloths look like muscular gargoyles, often wielding massive weapons"">Nycaloths</span>"
Ogre								= "<span class=""monsters"" title=""Large, brutish humanoids known for their vicious attacks"">Ogre</span>"
Ogres								= "<span class=""monsters"" title=""Large, brutish humanoids known for their vicious attacks"">Ogres</span>"
Orc								= "<span class=""monsters"" title=""A strong, brutish humanoid known for their attacks on civilized people"">Orc</span>"
Orcs								= "<span class=""monsters"" title=""Strong, brutish humanoids known for their attacks on civilized people"">Orcs</span>"
Otyugh							= "<span class=""monsters"" title=""A massive creature with tentacles that lives in the filth and garbage of deep dungeons, sewers and putrid swamps"">Otyugh</span>"
Owlbear							= "<span class=""monsters"" title=""A large monstrosity with the body of a huge bear and the head of an owl"">Owlbear</span>"
Pentagornaphoria				= "<span class=""monsters"" title=""A huge Copper Dragon"">Pentagornaphoria</span>"
Phase_Spider					= "<span class=""monsters"" title=""Large, deadly spider that is able to phase in and out of the Prime Material Plane"">Phase Spider</span>"
Polar_Bear						= "<span class=""monsters"" title=""The largest and fiercest of all bears"">Polar Bear</span>"
Pixies							= "<span class=""monsters"" title=""Small fey"">Pixies</span>"
Purple_Worm						= "<span class=""monsters"" title=""A gigantic worm-like creature"">Purple Worm</span>"
Remorhaz							= "<span class=""monsters"" title=""A large, multi-legged creature that lives in extremely cold regions"">Remorhaz</span>"
Roper								= "<span class=""monsters"" title=""A large, stone-like creature with stick tentacles and a huge mouth"">Roper</span>"
Salamander						= "<span class=""monsters"" title=""Large, half man/half snake creatures from the elemental plane of fire"">Salamander</span>"
Salamanders						= "<span class=""monsters"" title=""Large, half man/half snake creatures from the elemental plane of fire"">Salamanders</span>"
Sarcophagus_Slime				= "<span class=""monsters"" title=""A evil slime conjured by a wizard to guard over a sarcophagus"">Sarcophagus Slime</span>"
Satyrs							= "<span class=""monsters"" title=""Half human/half goat fey who love music, dance, celebration and sex"">Satyrs</span>"
Shadow_Demon					= "<span class=""monsters"" title=""A demon that strikes from the shadows or "">Shadow Demon</span>"
Shadow_Demons					= "<span class=""monsters"" title=""A shadowy demon"">Shadow Demons</span>"
Shadow							= "<span class=""monsters"" title=""Undead whose touch saps the strength of its victim"">Shadow</span>"
Shadows							= "<span class=""monsters"" title=""Undead whose touch saps the strength of its victim"">Shadows</span>"
Skeletons						= "<span class=""monsters"" title=""The animated undead remains of a corpse"">Skeletons</span>"
Slaad_Grey						= "<span class=""monsters"" title=""Man-sized frog-like shapeshifters"">Grey Slaad</span>"
Spectral_Warriors				= "<span class=""monsters"" title=""Undead warriors/guardians who protect a specific location"">Spectral Warriors</span>"
Spectre							= "<span class=""monsters"" title=""A malevolent undead spirit"">Spectre</span>"
Spectres							= "<span class=""monsters"" title=""Malevolent undead spirits"">Spectres</span>"
Spirit_Naga						= "<span class=""monsters"" title=""A creature summoned to guard over a place"">Spirit Naga</span>"
Stone_Giant						= "<span class=""monsters"" title=""18' tall dark-skinned giants"">Stone Giant</span>"
Stone_Giants					= "<span class=""monsters"" title=""18' tall dark-skinned giants"">Stone Giants</span>"
Stone_Golem						= "<span class=""monsters"" title=""10' tall stone construct"">Stone Golum</span>"
Stone_Golems					= "<span class=""monsters"" title=""10' tall stone constructs"">Stone Golums</span>"
Sprites							= "<span class=""monsters"" title=""Small fey"">Sprites</span>"
Steam_Mephits					= "<span class=""monsters"" title=""Small elemental beings"">Steam Mephits</span>"
Stirges							= "<span class=""monsters"" title=""Small flying blood-sucking monsters (think giant mosquitoes"">Stirges</span>"
Timber_Wolf						= "<span class=""monsters"" title=""Large canines"">Timber Wolf</span>"
Timber_Wolves					= "<span class=""monsters"" title=""Large canines"">Timber Wolves</span>"
Troll								= "<a href=""House_Rules.asp" & Arg & "#Trolls"" title=""Large, vicious, green humanoids known for their regenerating abilities""><span class=""monsters"">troll</span></a>"
Trolls							= "<a href=""House_Rules.asp" & Arg & "#Trolls"" title=""Large, vicious, green humanoids known for their regenerating abilities""><span class=""monsters"">trolls</span></a>"
Unicorn							= "<span class=""monsters"" title=""Fey horse-like creatures with a single horn in the center of their forehead"">Unicorn</span>"
Vrock								= "<span class=""monsters"" title=""A hideous demon, vaguely looking like a cross between a humanoid and a vulture"">Vrock</span>"
Vrocks							= "<span class=""monsters"" title=""Hideous demons, vaguely looking like a cross between a humanoid and a vulture"">Vrocks</span>"
Werewolf							= "<span class=""monsters"" title=""A creature able to transform between man, half-man/half wolf, and wolf"">Werewolf</span>"
Werewolves						= "<span class=""monsters"" title=""Creatures able to transform between man, half-man/half wolf, and wolf"">Werewolves</span>"
Lycanthrope						= "<span class=""monsters"" title=""One of several types of creatures able to transform between man, half-man and beast"">Lycanthrope</span>"
Lycanthropes					= "<span class=""monsters"" title=""One of several types of creatures able to transform between man, half-man and beast"">Lycanthropes</span>"
Lycanthropy						= "<span class=""monsters"" title=""The disease/curse that transforms someone into a Lycanthrope"">Lycanthropy</span>"
Ultroloth						= "<span class=""monsters"" title=""With a reputation for cruelty, Ultroloths command their minions to fight and are often found as commanders in the Blood War"">Ultroloth</span>"
Water_Elemental				= "<span class=""monsters"" title=""Mindless, primal strong creatures, summoned from the Elemental Plane of Water able to move effortlessly through water"">Water Elemental</span>"
Water_Wierd						= "<span class=""monsters"" title=""A minor water elemental that drown their opponents"">Water Wierd</span>"
Wyvern							= "<span class=""monsters"" title=""A legendary bipedal winged dragon-like creature"">Wyvern</span>"
Winter_Wolf						= "<span class=""monsters"" title=""Large canine native to snowy regions"">Winter Wolf</span>"
Winter_Wolves					= "<span class=""monsters"" title=""Large canines native to snowy regions"">Winter Wolves</span>"
White_Pudding					= "<a href=""House_Rules.asp" & Arg & "#White_Pudding"" title=""A white ooze that lives in cold evnironments""><span class=""monsters"">White Pudding</span></a>"
Wolves							= "<span class=""monsters"" title=""Large canines"">Wolves</span>"
Worgs								= "<span class=""monsters"" title=""Vicious canine predators, sometimes used as mounts by goblins and hobgoblins"">Worgs</span>"
Wraith							= "<span class=""monsters"" title=""Undead whose touch saps the health of its victim"">Wraith</span>"
Wraiths							= "<span class=""monsters"" title=""Undead whose touch saps the health of its victim"">Wraiths</span>"
Yeti								= "<span class=""monsters"" title=""Snow beast that live in the coldest of regions"">Yeti</span>"
Yugoloths						= "<span class=""monsters"" title=""A collection of lower planar beings from Acheron, Gehenna, Hades, and Carceri, similar to demons and devils"">Yugoloths</span>"
Yugoloth							= "<span class=""monsters"" title=""A collection of lower planar beings from Acheron, Gehenna, Hades, and Carceri, similar to demons and devils"">Yugoloth</span>"
Zombies							= "<span class=""monsters"" title=""Animated corpses"">Zombies</span>"
Zombie_Gnolls					= "<span class=""monsters"" title=""Incredibly tough, undead gnolls"">Zombie Gnolls</span>"




' Devils
Zariel							= "<span class=""monsters"" title=""Arch-Devil and ruler of the burning 1st level of Hell, Avernus"">Zariel</span>"
Dispater							= "<span class=""monsters"" title=""Arch-Devil and ruler of the burning 2st level of Hell, Dis"">Dispater</span>"
Mammon							= "<span class=""monsters"" title=""Arch-Devil and ruler of the eternal swamp 3rd level of Hell, Minauros"">Mammon</span>"
Fierna							= "<span class=""monsters"" title=""Arch-Devil and co-ruler of the burning 4th level of Hell, Phlegethos"">Fierna</span>"
Lady_Fierna						= "<span class=""monsters"" title=""Arch-Devil and co-ruler of the burning 4th level of Hell, Phlegethos"">Lady Fierna</span>"
Archduchess_Fierna			= "<span class=""monsters"" title=""Arch-Devil and co-ruler of the burning 4th level of Hell, Phlegethos"">Archduchess Fierna</span>"

Belial							= "<span class=""monsters"" title=""Arch-Devil and co-ruler of the burning 4th level of Hell, Phlegethos"">Belial</span>"
Levistus							= "<span class=""monsters"" title=""Arch-Devil and ruler of the frozen 5th level of Hell, Stygia"">Levistus</span>"
Glasya							= "<span class=""monsters"" title=""Arch-Devil and ruler of the burning 6th level of Hell, Malbolge"">Glasya</span>"
Baalzebul						= "<span class=""monsters"" title=""Arch-Devil and ruler of the burning 7th level of Hell, Maladomini"">Baalzebul</span>"
Mephistopheles					= "<span class=""monsters"" title=""Arch-Devil and ruler of the frozen 8th level of Hell, Cania"">Mephistopheles</span>"
Asmodeus							= "<span class=""monsters"" title=""Arch-Devil and ruler of the burning 9th level of Hell, Nessus, and supreme ruler of the 9 Hells"">Asmodeus</span>"

Baatezu							= "<span class=""monsters"" title=""The true name of Bearded Devils"">Baatezu</span>"
Bearded_Devil					= "<span class=""monsters"" title=""One of the more common medium-sized devils"">Bearded Devil</span>"

Barbed_Devil					= "<span class=""monsters"" title=""One of the more common medium-sized devils"">Barbed Devil</span>"
Barbed_Devils					= "<span class=""monsters"" title=""One of the more common medium-sized devils"">Barbed Devils</span>"
Hamatulas						= "<span class=""monsters"" title=""The true name of the Barbed Devils"">Hamatulas</span>"

Bone_Devils						= "<span class=""monsters"" title=""One of the more common large-sized devil"">Bone Devils</span>"
Osyluths							= "<span class=""monsters"" title=""The true name of the Bone Devils"">Osyluths</span>"

Pit_Fiend						= "<span class=""monsters"" title=""The undisputed lords of most other devils"">Pit Fiend</span>"
Pit_Fiends						= "<span class=""monsters"" title=""The undisputed lords of most other devils"">Pit Fiends</span>"




' Places in Hell
Abriymoch						= "<a href=""Hell4.asp" & Arg & "#"" title=""Capital city of Phlegethos (the 4th lavel of Hell)""><span class=""place"">Abriymoch</span></a>"
Phlegethos						= "<a href=""Hell4.asp" & Arg & "#"" title=""The 4th layer of Hell""><span class=""place"">Phlegethos</span></a>"


' Infernal boons
Charm_of_Agelessness			= "<span class=""magic"" title=""The recipient of this gift never ages - it lasts until the person dies"">Charm of Agelessness</span>"
Charm_of_Many_Tongues		= "<span class=""magic"" title=""The recipient can speak (but not read or write) all languages and become more persuasive - it lasts until the person dies"">Charm of Many Tongues</span>"
Charm_of_the_Adamant			= "<span class=""magic"" title=""The recipient of this gift never ages - it lasts until the person dies"">Charm of the Adamant</span>"


' Place in the Abyss
Abyss								= "<span class=""monsters"" title=""The collective name for the 666 planes that are the home to all Demons"">Abyss</span>"
Gehenna							= "<span class=""monsters"" title=""The collective name for the 4 planes between the Hells and the Abyss, home planes of the Yugoloth"">Gehenna</span>"
									' https://forgottenrealms.fandom.com/wiki/Gehenna







' Misc
The_Yonkith_Technique			= "<span class=""monsters"" title=""The act of tying a rope around the lead character so that if they fall in a trap, the person at the other end of the rope can yank them back"">The Yonkith Technique</span>"





' House rules
Adamantine_Weapons				= "<a href=""House_Rules.asp" & Arg & "#Adamantine_Weapons"" title=""Extremely tough, sharp weapons""><span class=""magic"">Adamantine Weapons</span></a>"
Cavalier_Code_of_Honor			= "<a href=""House_Rules.asp" & Arg & "#Cavalier_Code_of_Honor"" title=""Code of Chivalry""><span class=""magic"">Cavalier Code of Honor</span></a>"
Charging								= "<a href=""House_Rules.asp" & Arg & "#Charging"" title=""Rules for Charging (including from the air)""><span class=""magic"">Charging</span></a>"
Climbing								= "<a href=""House_Rules.asp" & Arg & "#Climbing"" title=""Rules for climbing ropes, ladders, etc""><span class=""magic"">Climbing</span></a>"
Compound_Bow						= "<a href=""House_Rules.asp" & Arg & "#Compound_Bow"" title=""A Paynim light bow""><span class=""magic"">Compound Bow</span></a>"
CostItemsServices					= "<a href=""House_Rules.asp" & Arg & "#CostItemsServices"" title=""Recommended costs for goods and services""><span class=""magic"">Cost of Items and Services</span></a>"
Crafting_Magic_Items				= "<a href=""House_Rules.asp" & Arg & "#Crafting_Magic_Items"" title=""Creating magic items""><span class=""magic"">Crafting Magic Items</span></a>"
Critical_Hits						= "<a href=""House_Rules.asp" & Arg & "#Critical_Hits"" title=""Enhanced critical hits""><span class=""magic"">Critical Hits</span></a>"
Critical_Hit						= "<a href=""House_Rules.asp" & Arg & "#Critical_Hits"" title=""Enhanced critical hits""><span class=""magic"">Critical Hit</span></a>"
Exhaustion							= "<a href=""House_Rules.asp" & Arg & "#Exhaustion"" title=""Enhanced exhaustion rules""><span class=""magic"">Exhaustion</span></a>"
Flanking								= "<a href=""House_Rules.asp" & Arg & "#Flanking"" title=""Rules for attacking from the side or rear""><span class=""magic"">Flanking</span></a>"
Horses								= "<a href=""House_Rules.asp" & Arg & "#Horses"" title=""Rules for various types of horses""><span class=""magic"">Horses</span></a>"
Gambling								= "<a href=""House_Rules.asp" & Arg & "#Gambling"" title=""Gambling""><span class=""magic"">Gambling</span></a>"
Item_Saving_Throws				= "<a href=""House_Rules.asp" & Arg & "#Item_Saving_Throws"" title=""Rules possible loss of possessions from damage""><span class=""magic"">Item Saving Throws</span></a>"
Large_Cats							= "<a href=""House_Rules.asp" & Arg & "#Large_Cats"" title=""Tigers, panthers, etc.""><span class=""magic"">Large Cats</span></a>"
Light_Lance							= "<a href=""House_Rules.asp" & Arg & "#Light_Lance"" title=""A Paynim light lance""><span class=""magic"">Light Lance</span></a>"
Riding_Horse						= "<a href=""House_Rules.asp" & Arg & "#Riding_Horse"" title=""A mount for pleasure riding""><span class=""magic"">Riding Horse</span></a>"
Light_War_Horse					= "<a href=""House_Rules.asp" & Arg & "#Light_War_Horse"" title=""A quick horse for combat""><span class=""magic"">Light War Horse</span></a>"
Heavy_War_Horse					= "<a href=""House_Rules.asp" & Arg & "#Heavy_War_Horse"" title=""A large horse for combat""><span class=""magic"">Heavy War Horse</span></a>"
Draft_Horse							= "<a href=""House_Rules.asp" & Arg & "#Draft_Horse"" title=""A large horse for hauling or pulling""><span class=""magic"">Draft Horse</span></a>"
Magic_Item_Price_Calcs			= "<a href=""House_Rules.asp" & Arg & "#Magic_Item_Price_Calcs"" title=""General calculations for magic item prices""><span class=""magic"">Magic Item Price Calculations</span></a>"
Mule									= "<a href=""House_Rules.asp" & Arg & "#Mule"" title=""A common beast of burden""><span class=""magic"">Mule</span></a>"
Monsters								= "<a href=""House_Rules.asp" & Arg & "#Monsters"" title=""Special actions for monsters""><span class=""magic"">Monsters</span></a>"
Mounted_Combat						= "<a href=""House_Rules.asp" & Arg & "#Mounted_Combat"" title=""Skill required to effectively fight from a mount""><span class=""magic"">Mounted Combat</span></a>"
Natural_Healing					= "<a href=""House_Rules.asp" & Arg & "#Natural_Healing"" title=""Healing by normal means""><span class=""magic"">Natural Healing</span></a>"
New_Weapons							= "<a href=""House_Rules.asp" & Arg & "#New_Weapons"" title=""New Weapons""><span class=""magic"">New Weapons</span></a>"
Poison								= "<a href=""House_Rules.asp" & Arg & "#Poison"" title=""Different types of poison""><span class=""magic"">Poison</span></a>"
Setting_Spear						= "<a href=""House_Rules.asp" & Arg & "#Setting_Spear"" title=""Setting weapons against a charging foe""><span class=""magic"">Setting Spears, Javalins or Pikes Against a Charge</span></a>"
Skills								= "<a href=""House_Rules.asp" & Arg & "#Skills"" title=""New skills""><span class=""magic"">Skills</span></a>"
Skinning								= "<a href=""House_Rules.asp" & Arg & "#Skinning"" title=""Skinning table""><span class=""magic"">Skinning</span></a>"
Spells								= "<a href=""House_Rules.asp" & Arg & "#Spells"" title=""New and modified spells""><span class=""magic"">Spells</span></a>"
Swimming_in_Armor					= "<a href=""House_Rules.asp" & Arg & "#Swimming_in_Armor"" title=""Swimming while wearing armor""><span class=""magic"">Swimming in Armor</span></a>"
Taxidermy							= "<a href=""House_Rules.asp" & Arg & "#Taxidermy"" title=""Costs for stuffing trophies""><span class=""magic"">Taxidermy</span></a>"
Tracking								= "<a href=""House_Rules.asp" & Arg & "#Tracking"" title=""Tables for tracking creatures""><span class=""magic"">Tracking</span></a>"
Siege_Rules							= "<a href=""House_Rules.asp" & Arg & "#Siege_Rules"" title=""Siege weapons, items and monsters""><span class=""magic"">Siege Rules</span></a>"
Traps									= "<a href=""House_Rules.asp" & Arg & "#Traps"" title=""Rules for detecting & disarming both physical and magical traps""><span class=""magic"">Traps</span></a>"
Weapon_Proficiencies				= "<a href=""House_Rules.asp" & Arg & "#Weapon_Proficiencies"" title=""Weapon Proficiencies""><span class=""magic"">Weapon Proficiencies</span></a>"



' Links for clans, tribes, groups, etc.
Aerdi									= "<a href=""./Appendix.asp" & Arg & "#Aerdi""><span class=""people"">Aerdi</span></a>"
Anainyer								= "<span class=""people"" title=""1st ruler of the Sulois people"">Anainyer</span>"
AnaKeri								= "<span class=""place"" title=""A distant island to the south, home of the Kersi people"">AnaKeri</span>"
Arinanin								= "<span class=""people"" title=""A Suel warrior who sought to overthrow the Sulois Empire during the 2nd Regency War - later became the 1st vampire"">Arinanin</span>"
Alberk 								= "<span class=""people"" title=""A Suel archmage"">Alberk</span>"
Bakluni								= "<a href=""./Appendix.asp" & Arg & "#Baklunish""><span class=""people"">Bakluni</span></a>"
Baklunish							= "<a href=""./Appendix.asp" & Arg & "#Baklunish""><span class=""people"">Baklunish</span></a>"
Eomund								= "<span class=""people"" title=""Young Se-Ul mage"">Eomund</span>"
Imaravelle							= "<span class=""people"" title=""Daughter of the Se-Ul ambassador, Imarollon"">Imaravelle</span>"
Imarollon							= "<span class=""people"" title=""Se-Ul ambassador to the elves"">Imarollon</span>"
Kel_ak_Kord							= "<span class=""people"" title=""A Se-Ul chiefain, father of Teriman"">Kel-ak-Kord</span>"
Kendaris								= "<span class=""people"" title=""An elf who fell in love with a Se-Ul ambassador's daughter"">Kendaris</span>"
Kersi									= "<span class=""people"" title=""A beautiful dark-skinned people from an Island called AnaKeri in the south who traded with the ancient Se-Ul"">Kersi</span>"
Kestar								= "<span class=""people"" title=""Bodyguard of Se-Ul mage Teriman"">Kestar</span>"
The_Nine_Mages						= "<span class=""people"" title=""9 Se-Ul mages trained by the elf, Kendaris, to seek revenge for being insulted"">The Nine Mages</span>"
Orid									= "<span class=""people"" title=""An long gone race of men who traded with the ancient Se-Ul to the east"">Orid</span>"
ReAtryniBa							= "<span class=""place"" title=""The final city to survice the Se-Ul wars, later renamed to Seula"">ReAtryniBa</span>"
Seula									= "<span class=""place"" title=""The capital of the Suloise"">Seula</span>"
Tilorop								= "<span class=""people"" title=""A Suel archmage who sought to overthrow the Sulois Empire during the 2nd Regency War - later became the 1st lich"">Tilorop</span>"
Teriman								= "<span class=""people"" title=""Son of the Se-Ul chieftain Kel-ak-Kord"">Teriman</span>"
Flan									= "<a href=""./Appendix.asp" & Arg & "#Flannae""><span class=""people"">Flan</span></a>"
Flannae								= "<a href=""./Appendix.asp" & Arg & "#Flannae""><span class=""people"">Flannae</span></a>"
Flanaess								= "<a href=""./Appendix.asp" & Arg & "#Flanaess""><span class=""place"">Flanaess</span></a>"
Suloise								= "<a href=""./Appendix.asp" & Arg & "#Suloise""><span class=""people"">Suloise</span></a>"
Suel									= "<a href=""./Appendix.asp" & Arg & "#Suloise""><span class=""people"">Suel</span></a>"
Se_Ul									= "<a href=""./Appendix.asp" & Arg & "#Suloise"" title=""The People of Ul - the ancient name of the people later to be called the Suel""><span class=""people"">Se-Ul</span></a>"
The_Suloise_Mages_of_Power		= "<a href=""./Appendix.asp" & Arg & "#The_Suloise_Mages_of_Power""><span class=""people"">The Suloise Mages of Power</span></a>"
The_Whyme_Pines					= "<a title=""Name of the party""><span class=""people"">The Whyme Pines</span></a>"



' Ancient Sulois and Baklunish references
The_Codex_of_the_Infinite_Planes	= "<span class=""magic"" title=""An ancient book of vast, unknown power"">The Codex of the Infinite Planes</span>"
Suendrako								= "<span class=""place"" title=""One of the largest cities of the Sulois Empire"">Suendrako</span>"
Xolan										= "<span class=""people"" title=""A powerful Sule archmage and descendant of Xodast of the House of Xuel-Crix"">Xolan</span>"
Xodast_Xuel_Crix						= "<span class=""people"" title=""The most powerful archmage of the Sule Empire, over 2 millennia ago"">Xodast Xuel-Crix</span>"
Xodast									= "<span class=""people"" title=""The most powerful archmage of the Sule Empire, over 2 millennia ago"">Xodast</span>"



' Links for The Great Kingdom
Atirr									= "<a href=""./Appendix.asp" & Arg & "#House_Atirr"" title=""Ancient Oeridian family""><span class=""people"">Atirr</span></a>"
House_Atirr							= "<a href=""./Appendix.asp" & Arg & "#House_Atirr"" title=""Ancient Oeridian family""><span class=""house"">House Atirr</span></a>"
Cranden								= "<a href=""./Appendix.asp" & Arg & "#House_Cranden"" title=""Ancient Oeridian family""><span class=""people"">Cranden</span></a>"
House_Cranden						= "<a href=""./Appendix.asp" & Arg & "#House_Cranden""><span class=""house"">House Cranden</span></a>"
Darmen								= "<a href=""./Appendix.asp" & Arg & "#House_Darmen"" title=""The wealthiest of the Celestial Houses of Aerdi""><span class=""house"">Darmen</span></a>"
House_Darmen						= "<a href=""./Appendix.asp" & Arg & "#House_Darmen"" title=""The wealthiest of the Celestial Houses of Aerdi""><span class=""house"">House Darmen</span></a>"
Garasteth							= "<a href=""./Appendix.asp" & Arg & "#House_Garasteth"" title=""The most feared of the Celestial Houses of Aerdi due to their widards, scholars & eldritch secrets""><span class=""house"">Garasteth</span></a>"
House_Garasteth					= "<a href=""./Appendix.asp" & Arg & "#House_Garasteth"" title=""The most feared of the Celestial Houses of Aerdi due to their widards, scholars & eldritch secrets""><span class=""house"">House Garasteth</span></a>"
Naelax								= "<a href=""./Appendix.asp" & Arg & "#House_Naelax"" title=""The most feared of the Celestial Houses of Aerdi due to their wizards, scholars & eldritch secrets""><span class=""house"">Naelax</span></a>"
House_Naelax						= "<a href=""./Appendix.asp" & Arg & "#House_Naelax"" title=""The most feared of the Celestial Houses of Aerdi due to their wizards, scholars & eldritch secrets""><span class=""house"">House Naelax</span></a>"
Nyrond								= "<a href=""./Appendix.asp" & Arg & "#House_Nyrond"" title=""A junior branch of the House Rax, they went on to found the Kingdom of Nyrond""><span class=""house"">Nyrond</span></a>"
House_Nyrond						= "<a href=""./Appendix.asp" & Arg & "#House_Nyrond"" title=""A junior branch of the House Rax, they went on to found the Kingdom of Nyrond""><span class=""house"">House Nyrond</span></a>"
Rax									= "<a href=""./Appendix.asp" & Arg & "#House_Rax"" title=""One of the most powerful Houses, they were know as a calculating people""><span class=""house"">Rax</span></a>"
House_Rax							= "<a href=""./Appendix.asp" & Arg & "#House_Rax"" title=""One of the most powerful Houses, they were know as a calculating people""><span class=""house"">House Rax</span></a>"
Torquann								= "<a href=""./Appendix.asp" & Arg & "#House_Torquann"" title=""A cruel and ruthless house, they became known as 'The Fiend-Seeing' House due to their pact with Baalzephon""><span class=""house"">Torquann</span></a>"
House_Torquann						= "<a href=""./Appendix.asp" & Arg & "#House_Torquann"" title=""A cruel and ruthless house, they became known as 'The Fiend-Seeing' House due to their pact with Baalzephon""><span class=""house"">House Torquann</span></a>"
Erhart								= "<span class=""people"" title=""A powerful family of the House Rax"">Erhart</span>"
Jaran_Krimeeah						= "<span class=""people"" title=""One of the families from the now gone House of Rax"">Jaran Krimeeah</span>"
Nasri									= "<span class=""people"" title=""One of the families from the now gone House of Rax"">Nasri</span>"
Nyrondese							= "<span class=""people"" title=""Ancient rival of the Oeridian family Rax"">Nyrondese</span>"
Prince_Xavener						= "<span class=""people"" title=""A prince of Houst Darmen who defeated the Overking in the United Kingdom of Ahlissa"">Prince Xavener</span>"
Toran									= "<span class=""people"" title=""A powerful family of the House Rax"">Toran</span>"


Jiranen								= "<span class=""people"" title=""Overking of The Kingdom"">Jiranen</span>"
Malev									= "<span class=""people"" title=""Uninterested overking of The Kingdom, son of Overking Jiranen"">Malev</span>"
Manshen								= "<span class=""people"" title=""The 1st Rax overking"">Manshen</span>"
Nalif									= "<span class=""people"" title=""The last Overking of the House of Rax, murdered by House Naelax assassins in 437 CY"">Nalif</span>"
Overking_Portillan				= "<span class=""people"" title=""Weak ruler of The Kingdom during its time of decline"">Overking Portillan</span>"
Selvor_the_Younger				= "<span class=""people"" title=""Profit"">Selvor the Younger</span>"
Zelcor								= "<span class=""people"" title=""Cousin of Overking Malev, inheritor of The Kingdom"">Zelcor</span>"

Almor									= "<span class=""place"" title=""A former part of The Great Kingdom"">Almor</span>"
Eastfair								= "<span class=""place"" title=""Ancient capital city of the northern provice of The Kingdom, administered by the house Naelax"">Eastfair</span>"
Irongate								= "<span class=""place"" title=""A 'free city', a former part of The Great Kingdom"">Irongate</span>"
Medegia								= "<span class=""place"" title=""A former part of The Great Kingdom"">Medegia</span>"
Nyrond								= "<span class=""place"" title=""A former part of The Great Kingdom founded by the House Nyrond"">Nyrond</span>"
The_Kingdom_of_Nyrond			= "<span class=""place"" title=""A former part of The Great Kingdom founded by the House Nyrond"">The Kingdom of Nyrond</span>"
Rel_Mord								= "<span class=""place"" title=""A junior family of the House Rax"">Rel Mord</span>"
Rel_Deven							= "<span class=""place"" title=""Current home city of most of House Cranden"">Rel Deven</span>"
Sea_Barons							= "<span class=""place"" title=""An island nation, originally formed to provide naval power for The Great Kingdom"">Sea Barons</span>"
Sunndi								= "<span class=""place"" title=""A former member of The Great Kingdom"">Sunndi</span>"
Urnst									= "<span class=""place"" title=""A former part of The Great Kingdom"">Urnst</span>"
Zelradton							= "<span class=""place"" title=""Ancient capital city of the southern provice of The Kingdom"">Zelradton</span>"


Fals_Gap								= "<span class=""natural"" title=""A natural pass used by the Oeridions to flee The Twin Catalysm"">Fals Gap</span>"
Nyr_Dyv								= "<span class=""water"" title=""A vast lake in the center of the Flanaess"">Nyr Dyv</span>"
Quaglands							= "<span class=""natural"" title=""Edge of The Great Kingdom"">Quaglands</span>"
Dyvers								= "<span class=""place"" title=""City"">Dyvers</span>"
Ferrond								= "<span class=""place"" title=""Viceroyalty ruled by House Rax"">Ferrond</span>"
Iron_League							= "<span class=""place"" title=""An affiliation of states that opposed the Great Kingdom of Aerdy founded by The Free City of Irongate and Onnwal"">Iron League</span>"


Ahlissa								= "<span class=""place"" title=""Ancient Suel kingdom in the southwest"">Ahlissa</span>"
Aerdy									= "<a href=""./Appendix.asp" & Arg & "#The_Great_Kingdom_of_Aerdy""><span class=""place"">Aerdy</span></a>"
Battle_of_a_Fortnights_Length	= "<span class=""events"" title=""Ancient battle where the Rax family defeated the Nyrondese"">Battle of a Fortnight's Length</span>"
The_Brotherhood					= "<span class=""people"" title=""People of Sule ancestry who fled the Sule Empire decades before the Twin Devastation"">The Brotherhood</span>"
Celestial_Houses					= "<a href=""./Appendix.asp" & Arg & "#Celestial_Houses""  title=""The collective name of the great houses of the ancient Aerdi""><span class=""house"">Celestial Houses</span></a>"
Duke_Szeffrin						= "<span class=""people"" title=""A brutal leader from Almor"">Duke Szeffrin</span>"
Fiend_Seeing_Throne				= "<span class=""people"" title=""The nickname of the Malachite Throne during the rule of House Ivid due to their dealings with evil outsiders"">Fiend-Seeing Throne</span>"
Grand_Prince_Almor_I				= "<span class=""people"" title=""1st of rulers of the Great Kingdom, from House Cranden"">Grand Prince Almor I</span>"
Grand_Prince_Almor_II			= "<span class=""people"" title=""Ancient Oeridian king of the Rax family"">Grand Prince Almor II</span>"
Grand_Prince_Nasran				= "<span class=""people"" title=""Ancient Aerdy king of the house Rauxes"">Grand Prince Nasran</span>"
Ivid									= "<span class=""people"" title=""House name of a cruel and brutal house that ruled The Kingdom for a century and a half"">Ivid</span>"
Ivid_I								= "<span class=""people"" title=""The brutal ruler who took the throne of The Great Kingdom following the assassination of Overking Nalif by House Naelax"">Ivid I</span>"
Ivid_V								= "<span class=""people"" title=""Ruler of The Kingdom who sought to reunite the provinces that had broken away, ultimately leading to the ruin of the heartland"">Ivid V</span>"
Nasran								= "<span class=""people"" title=""Ancient Aerdy king of the house Rauxes"">Nasran</span>"
The_Great_Kingdom					= "<a href=""./Appendix.asp" & Arg & "#The_Great_Kingdom""><span class=""place"">The Great Kingdom</span></a>"
The_Great_Kingdom_of_Aerdy		= "<a href=""./Appendix.asp" & Arg & "#The_Great_Kingdom_of_Aerdy""><span class=""place"">The Great Kingdom of Aerdy</span></a>"
The_Kingdom_of_Aerdy				= "<a href=""./Appendix.asp" & Arg & "#The_Great_Kingdom_of_Aerdy""><span class=""place"">The Kingdom of Aerdy</span></a>"
The_Scarlet_Brotherhood			= "<span class=""people"" title=""People of Sule ancestry who fled the Sule Empire decades before the Twin Devastation"">The Scarlet Brotherhood</span>"
Lord_Mikar							= "<span class=""people"" title=""Ancient Oeridian leader of the Garasteth family"">Lord Mikar</span>"
Malachite_Throne					= "<span class=""people"" title=""Title of the rulers of the Ancient Oeridian"">Malachite Throne</span>"
Oerth									= "<a href=""./Appendix.asp" & Arg & "#Oerth"" title=""The name of the planet""><span class=""place"">Oerth</span></a>"
Oeridian								= "<a href=""./Appendix.asp" & Arg & "#Oeridians""><span class=""people"">Oeridian</span></a>"
Oeridians							= "<a href=""./Appendix.asp" & Arg & "#Oeridians""><span class=""people"">Oeridians</span></a>"
Oerik									= "<a href=""./Appendix.asp" & Arg & "#Oerik""><span class=""place"">Oerik</span></a>"
Rauxes								= "<span class=""place"" title=""Ancient capital city of The Aerdy"">Rauxes</span>"
Rel_Astra							= "<span class=""place"" title=""Ancient Aerdi capital city"">Rel Astra</span>"
Rhennee								= "<a href=""./Appendix.asp" & Arg & "#Rhennee""><span class=""people"">Rhennee</span></a>"
See_of_Medegia						= "<span class=""deities"" title=""Name of the rulers of the worshipers of Pelor"">See of Medegia</span>"




' Build standard links for Events - this MUST come after the login logic
Age_of_Great_Sorrow				= "<span class=""events"" title=""The period following Zelcor's ascension to The Kingdom"">Age of Great Sorrow</span>"
The_Blood_Wars						= "<span class=""events"" title=""The eternal battle between demons and devils"">The Blood Wars</span>"
Century_War_of_the_Houses		= "<span class=""events"" title=""The war when the Great Suel Houses overthrew the Priest Regent"">Century War of the Houses</span>"
The_Invoked_Devastation			= "<a href=""./Appendix.asp" & Arg & "#The_Invoked_Devastation"" title=""The common term for the magical Sulois attack against the Baclunish Empire""><span class=""events"">The Invoked Devastation</span></a>"
The_Great_Migration				= "<a href=""./Appendix.asp" & Arg & "#The_Great_Migration"" title=""The common term for the exodus of the Sule and Baclunish people following The Twin Catalysms""><span class=""events"">The Great Migration</span></a>"
The_Rain_of_Colorless_Fire		= "<a href=""./Appendix.asp" & Arg & "#The_Rain_of_Colorless_Fire"" title=""The common term for the magical Baklunish attack against the Sule Empire""><span class=""events"" title=""The magical attack by the Baclunish Empire against the Sulois Empire"">The Rain of Colorless Fire</span></a>"
Regency_Wars						= "<span class=""events"" title=""A series of civil wars in the Suel Empire caused by the emperor's death with no heir"">Regency Wars</span>"
The_Suel_Baklunish_War			= "<a href=""./Appendix.asp" & Arg & "#The_Suel-Baklunish_War""><span class=""events"">The Suel-Baklunish War</span></a>"
Turmoil_Between_Crowns			= "<span class=""events"" title=""The period of major infighting between The Houses in The Kingdom"">Turmoil Between Crowns</span>"
The_Twin_Cataclysms				= "<a href=""./Appendix.asp" & Arg & "#The_Twin_Cataclysms""><span class=""events"">The Twin Cataclysms</span></a>"
Twin_Cataclysms					= "<a href=""./Appendix.asp" & Arg & "#The_Twin_Cataclysms""><span class=""events"">Twin Cataclysms</span></a>"



' Languages
AncientBaklunish					= "<a href=""Languages.asp" & Arg & "#AncientBaklunish""><span class=""languages"">Ancient Baklunish</span></a>"
AncientSuloise						= "<a href=""Languages.asp" & Arg & "#AncientSuloise""><span class=""languages"">Ancient Suloise</span></a>"
Common								= "<a href=""Languages.asp" & Arg & "#Common""><span class=""languages"">Common</span></a>"
FlanL									= "<a href=""Languages.asp" & Arg & "#Flan""><span class=""languages"">Flan</span></a>"
LowBaklunish						= "<a href=""Languages.asp" & Arg & "#LowBaklunish""><span class=""languages"">Low Baklunish</span></a>"
Modern_Baklunish					= "<a href=""Languages.asp" & Arg & "#ModernBaklunish""><span class=""languages"">Modern Baklunish</span></a>"
OldOeridian							= "<a href=""Languages.asp" & Arg & "#OldOeridian""><span class=""languages"">Old Oeridian</span></a>"
Rhopan								= "<a href=""Languages.asp" & Arg & "#Rhopan""><span class=""languages"">Rhopan</span></a>"
UrFlan								= "<a href=""Languages.asp" & Arg & "#UrFlan""><span class=""languages"">Ur-Flan</span></a>"



' Dieties
Boccob								= "<a href=""Deities.asp" & Arg & "#Boccob"" title=""God of Magic, Arcane Knowledge, Balance & Foresight""><span class=""deities"">Boccob</span></a>"
Celestian 							= "<a href=""Deities.asp" & Arg & "#Celestian"" title=""The Wanderer""><span class=""deities"">Celestian</span></a>"
Delleb								= "<a href=""Deities.asp" & Arg & "#Delleb"" title=""The Scholar""><span class=""deities"">Delleb</span></a>"
Ehlonna								= "<a href=""Deities.asp" & Arg & "#Ehlonna"" title=""Goddess of Forests, Woodlands, Flora, Fauna, & Fertility""><span class=""deities"">Ehlonna</span></a>"
Erythnul								= "<a href=""Deities.asp" & Arg & "#Erythnul"" title=""God of Hate, Envy, Malice, Panic, Ugliness & Slaughter""><span class=""deities"">Erythnul</span></a>"
Fharlanghn							= "<a href=""Deities.asp" & Arg & "#Fharlanghn"" title=""God of Horizons, Distance, Travel & Roads""><span class=""deities"">Fharlanghn</span></a>"
Heironeous							= "<a href=""Deities.asp" & Arg & "#Heironeous"" title=""God of Chivalry""><span class=""deities"">Heironeous</span></a>"
Hextor								= "<a href=""Deities.asp" & Arg & "#Hextor"" title=""God of War, Discord, Massacres, Conflict, Fitness & Tyranny""><span class=""deities"">Hextor</span></a>"
Incabulos 							= "<a href=""Deities.asp" & Arg & "#Incabulos"" title=""God of Plagues, Sickness, Famine, Nightmares, Drought & Disasters""><span class=""deities"">Incabulos</span></a>"
Iuz									= "<a href=""Deities.asp" & Arg & "#Iuz"" title=""God of Deceit, Pain, Oppression & Evil""><span class=""deities"">Iuz</span></a>"
Kord									= "<a href=""Deities.asp" & Arg & "#Kord"" title=""God of Sports, Strength, and Brawling""><span class=""deities"">Kord</span></a>"
Obad_Hai								= "<a href=""Deities.asp" & Arg & "#Obad-Hai"" title=""God of Nature, Woodlands, Hunting & Beasts""><span class=""deities"">Obad-Hai</span></a>"
Olidammara							= "<a href=""Deities.asp" & Arg & "#Olidammara"" title=""God of Music, Revels, Wine, Rogues, Humor & Tricks""><span class=""deities"">Olidammara</span></a>"
Nerull								= "<a href=""Deities.asp" & Arg & "#Nerull"" title=""God of Death, Darkness, Murder & the Underworld""><span class=""deities"">Nerull</span></a>"
Pelor									= "<a href=""Deities.asp" & Arg & "#Pelor"" title=""God of the Sun, Light, Strength, and Healing""><span class=""deities"">Pelor</span></a>"
Pholtus								= "<a href=""Deities.asp" & Arg & "#Pholtus"" title=""God of Light, Resolution, Law, Order, Inflexibility, Sun, Moons""><span class=""deities"">Pholtus</span></a>"
Ralishaz								= "<a href=""Deities.asp" & Arg & "#Ralishaz"" title=""God of Chance, Ill Luck, Madness & Evil""><span class=""deities"">Ralishaz</span></a>"


Rao									= "<a href=""Deities.asp" & Arg & "#Rao"" title=""God of Peace, Reason, and Serenity""><span class=""deities"">Rao</span></a>"


Sancier								= "<a href=""Deities.asp" & Arg & "#St_Cuthbert"" title=""An alternate name of St. Cuthbert, God of Forthrightness, Common Sense, Wisdom, Zeal, Honesty, Truth, and Discipline""><span class=""deities"">Sancier</span></a>"
St_Cuthbert							= "<a href=""Deities.asp" & Arg & "#St_Cuthbert"" title=""God of Forthrightness, Common Sense, Wisdom, Zeal, Honesty, Truth, and Discipline""><span class=""deities"">Saint Cuthbert</span></a>"
Tharizdun							= "<span class=""deities"" title=""The ancient Suel diety of Eternal Darkness, Decay, Entropy, Malign Knowledge, Insanity, and Cold"">Tharizdun</span>"
Trithereon							= "<a href=""Deities.asp" & Arg & "#Trithereon"" title=""God of Individuality, Liberty, Retribution & Self-Defense""><span class=""deities"">Trithereon</span></a>"
Vecna									= "<a href=""Deities.asp" & Arg & "#Vecna"" title=""God of Evil, Knowledge and Magic""><span class=""deities"">Vecna</span></a>"
Wastri								= "<a href=""Deities.asp" & Arg & "#Wastri"" title=""God of Amphibians, Bigotry and Self-Deception""><span class=""deities"">Wastri</span></a>"
WeeJas								= "<a href=""Deities.asp" & Arg & "#WeeJas"" title=""Goddess of Death & Magic""><span class=""deities"">Wee-Jas</span></a>"
Zagyg									= "<a href=""Deities.asp" & Arg & "#Zagyg"" title=""God of Humor, Eccentricity, Occult Lore & Unpredictability""><span class=""deities"">Zagyg</span></a>"



' Elf deities
Corellon								= "<a href=""Deities.asp" & Arg & "#Corellon"" title=""God of Spring, Eladrin, Poetry and Art""><span class=""deities"">Corellon Larethian</span></a>"



' Dwarf deities
Moradin								= "<a href=""Deities.asp" & Arg & "#Moradin"" title=""Dwarven god of Protection, Craftsmen, the Forge and head of the Dwarven gods""><span class=""deities"">Moradin</span></a>"



' Orc deities
Bahgtru								= "<a href=""Deities.asp" & Arg & "#Bahgtru"" title=""Orc God of Strength and Combat""><span class=""deities"">Bahgtru</span></a>"
Gruumsh								= "<a href=""Deities.asp" & Arg & "#Gruumsh"" title=""Orc God of Conquest""><span class=""deities"">Gruumsh</span></a>"
Ilneval								= "<a href=""Deities.asp" & Arg & "#Ilneval"" title=""Orc God of War, Combat, Overwhelming Numbers, Strategy""><span class=""deities"">Ilneval</span></a>"
Luthic								= "<a href=""Deities.asp" & Arg & "#Luthic"" title=""Orc God of Fertility, Medicine, Females and Servitude""><span class=""deities"">Luthic</span></a>"
Shargaas								= "<a href=""Deities.asp" & Arg & "#Shargaas"" title=""Orc God of Darkness, Night, Stealth, Thieves, and the Undead""><span class=""deities"">Shargaas</span></a>"
Yurtrus								= "<a href=""Deities.asp" & Arg & "#Yurtrus"" title=""Orc God of Death and Disease""><span class=""deities"">Yurtrus</span></a>"



' Mystic links
Mystic_Table						= "<a href=""./Mystic.asp" & Arg & "#MysticTable""><span class=""events"">Mystic Table</span></a>"



' City of Brass
Anumon								= "<span class=""monsters"" title=""One of the original gods, creator of Sulymon"">Anumon</span>"
Ashur_Ban							= "<span class=""monsters"" title=""Efreeti who did not side with Iblis against the gods"">Ashur Ban</span>"
Axam									= "<span class=""people"" title=""A jeweler in the Bazaar of Beggers - inventor of the Brazen Amulet"">Axam</span>"
Bazaar_of_Beggers					= "<span class=""place"" title=""A sprawling, ramshackle collection of tents located just beyond the Obsidian Bridge"">Bazaar of Beggers</span>"
City_of_Brass						= "<span class=""place"" title=""A fabled city ruled by Efreeti"">City of Brass Ban</span>"
Cirrishade							= "<span class=""monsters"" title=""Daughter of Sulymon, princess among the djinn"">Cirrishade</span>"
Djinn									= "<span class=""monsters"" title=""Powerful being from the Elemental Plane of Air"">Djinn</span>"
Eye_of_Fire							= "<span class=""monsters"" title=""TBD"">Eye of Fire</span>"
Hawanar								= "<span class=""monsters"" title=""The children and grandchildren of Cirrishade and Ashur Ban"">Hawanar</span>"
Iblis									= "<span class=""monsters"" title=""Genie created by Sulymon, later the 1st Efreeti"">Iblis</span>"
Jann									= "<span class=""monsters"" title=""Powerful being from the Elemental Plane of Earth"">Jann</span>"
Marid									= "<span class=""monsters"" title=""Powerful being from the Elemental Plane of Water"">Marid</span>"
Mudawwarah_Al_Jin					= "<span class=""place"" title=""City build by the genies, later called the city of Brass"">Mudawwarah Al Jin</span>"
Plane_of_Molten_Skies			= "<span class=""place"" title=""A triangular demi-plane formed where the planes of Air, Earth and Fire join, gateway to the City of Brass"">Plane of Molten Skies</span>"
Sulymon								= "<span class=""monsters"" title=""The first genie, the great engineer and architect of the gods"">Sulymon</span>"




' Base spell cost
FirstLevel	= 750
SecondLevel	= 1500
ThirdLevel	= 3000
FourthLevel	= 5000
FifthLevel	= 7500
SixthLevel	= 10000
SeventhLevel= 14000
EighthLevel	= 10000
NinethLevel	= 20000



' Array for crafting magic items
CraftDescs	= Array("Common", "Uncommon", "Rare", "Very Rare", "Legendary")
CraftLevels	= Array(3, 3, 4, 11, 17)
CraftCosts	= Array(1000, 5000, 50000, 500000, 5000000)
CraftDays	= Array(0, 0, 0, 0, 0)
for cc1 = 0 to 4
	CraftDays(cc1) = CraftCosts(cc1) / 250
next
Common		= 0
Uncommon		= 1
Rare			= 2
VeryRare		= 3
Legendary	= 4









sub RenderMonsters(Name, Weapons, Damages, HDs, ACs, HPs, SpecialAttacks, SpecialDefences, SpecialAbilities)
	' Only the HPs array must be fully populated. The other arrays will be ReDim'ed to
	' match the size of the HPs array. At least the first element of each array should
	' be populated, but this is not technically required.
	NoHPs = ubound(HPs)
	ReDim Preserve Weapons(NoHPs)
	ReDim Preserve Damages(NoHPs)
	ReDim Preserve HDs(NoHPs)
	ReDim Preserve ACs(NoHPs)
%>
								<table class="monster" >
									<tr valign="bottom" class="monsterhead">
										<th colspan="5">
											<%=Name%>
										</th>
									</tr>
									<tr valign="bottom" class="monsterhead">
										<th class="TDcenter">Weapon</th>
										<th class="TDcenter">Damage</th>
										<th class="TDcenter">HD</th>
										<th class="TDcenter">AC</th>
										<th class="TDcenter">HPs</th>
									</tr>
<% for mm1 = 0 to NoHPs %>
									<tr>
										<td nowrap class="monster"><%=Weapons(mm1)%></td>
										<td nowrap class="TDcenter monster"><%=Damages(mm1)%></td>
										<td class="TDcenter monster"><%=HDs(mm1)%></td>
										<td class="TDcenter monster"><%=ACs(mm1)%></td>
										<td class="TDright monster"><%=HPs(mm1)%></td>
									</tr>
<%
	next
	if (SpecialAttacks <> "") then %>
									<tr>
										<td class="monsterSPTitle">Sp Attack</td>
										<td class="monsterSPDesc" colspan="4"><%=SpecialAttacks%></td>
									</tr>
<%
	end if
	if (SpecialDefences <> "") then %>
									<tr>
										<td class="monsterSPTitle">Sp Defense</td>
										<td class="monsterSPDesc" colspan="4"><%=SpecialDefences%></td>
									</tr>
<%
	end if
	if (SpecialAbilities <> "") then %>
									<tr>
										<td class="monsterSPTitle">Sp Abilities</td>
										<td class="monsterSPDesc" colspan="4"><%=SpecialAbilities%></td>
									</tr>
<% end if %>
								</table>
<%
End Sub

'		style="-webkit-transform: scaleX(-1); transform: scaleX(-1);"
%>