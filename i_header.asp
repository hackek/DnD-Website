	<!-- i_header.asp -->
	<div id="header">
		<div class="HeaderContaner">
			<!-- https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_slideshow_fading -->
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Barbarian.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Coastline.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Dragon.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Dragon_Red.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Dragon_Rider.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Dragon_Ship.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Dragon_War.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Dragon_White.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Dragon2.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Dragon3.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Image.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Litch.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Monster.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Orental.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Sunrise.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Tiamat.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Tower_Attack.jpg" style="width:100%">
			<img class="mySlides w3-animate-fading" src="./Images/Header_Slideshow/Header_Underwater.jpg" style="width:100%">

			<div class="HeaderText"">
				D&D 5e
<% if (userId = "DM") then %>
<!--
				<br><%=UserMode%>
				<br>Condition: <%=Condition%>
				<br>Arg: <%=Arg%>
-->
<% else %>
<!--
				<br>Condition: <%=Condition%>
				<br>Arg: <%=Arg%>
				<br>Campaign: <%=Campaign%>
-->
<% end if %>
			</div>
		</div>


		<div id="to-bottom">
			<a href="#GoToBottom">Bottom</a>
		</div>

	</div>
