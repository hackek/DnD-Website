<!-- This is the standard footer for each web page -->
<% if (PriorPage <> "") or (NextPage <> "") then %>
		<div>
<%		if (PriorPage <> "") then %>
			<a href="<%=PriorPage%><%=Arg%>" class="leftArrow">&larr;</a>
<%		end if

		if (NextPage <> "") then %>
			<a href="<%=NextPage%><%=Arg%>" class="rightArrow">&rarr;</a>
<%		end if %>
		</div>
<% end if %>



<script>
	var myIndex = 0;
	carousel();

	function carousel() {
		var i;
		var x = document.getElementsByClassName("mySlides");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		myIndex++;
		if (myIndex > x.length) {myIndex = 1}
		x[myIndex-1].style.display = "block";
		setTimeout(carousel, 10000);		// Change image every 10 seconds
	}
</script>



		<div id="footer">
			<a name="GoToBottom" />
			<div id="to-top">
				<a href="#GoToTop">Top</a>
			</div>
		</div>