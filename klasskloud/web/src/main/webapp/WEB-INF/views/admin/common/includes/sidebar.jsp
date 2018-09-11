<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="sidebar">
    <!-- begin ads -->
	<div class="ads">
		<c:forEach items="${adversements }" var="adv">
			<%-- <a href="#"><img src="${imagepath}/ad125x125.jpg" alt="" /></a>  --%>
			 <img  border="1" src="getPhoto.do?id=${adv.adv_id}&loc=2"/>
			<p>${adv.discription }</p>
			<hr>
		</c:forEach>
		
	</div>
	<!-- end ads -->
    <!-- begin search -->
    <!-- <form class="search" action="#">
      <input type="text" name="s" id="s" />
      <button type="submit">Search</button>
    </form> -->
    <!-- end search -->
    <div class="wrapper">
      <!-- begin popular posts -->
    <%--   <h2>Popular Posts</h2>
      <ul>
        <li><a href="#">Google says......... “Experience Android naked”</a></li>
        <li><a href="#">Google says “Experience Android naked”</a></li>
        <li><a href="#">Apple to trade in old iPhones for a shiny new one </a></li>
        <li><a href="#">Apple to trade in old iPhones for a shiny new one </a></li>
        <li><a href="#">Apple to trade in old iPhones for a shiny new one </a></li>
      </ul>
      <!-- end popular posts -->
      <!-- begin flickr photos -->
      <h2>Flickr Photos</h2>
      <div class="flickr"> <a href="#"><img src="${imagepath}/_thumb3.jpg" alt="" /></a> <a href="#"><img src="${imagepath}/_thumb4.jpg" alt="" /></a> <a href="#"><img src="${imagepath}/_thumb5.jpg" alt="" /></a> <a href="#"><img src="${imagepath}/_thumb6.jpg" alt="" /></a> <a href="#"><img src="${imagepath}/_thumb7.jpg" alt="" /></a> <a href="#"><img src="${imagepath}/_thumb8.jpg" alt="" /></a> </div>
      <!-- end flickr photos -->
      <!-- begin featured video -->
      <h2>Featured Video</h2>
      <div class="video"> <img src="${imagepath}/_video.jpg" alt="" /> </div>
      <!-- end featured video -->
      <!-- begin tags -->
      <h2>Tags</h2>
      <div class="tags"> </div>
      <!-- end tags -->
      <!-- BEGIN left -->
      <div class="l sbar">
        <!-- begin categories -->
        <h2>Categories</h2>
        <ul>
          <li><a href="#">Entertainment</a></li>
          <li><a href="#">Fashion</a></li>
          <li><a href="#">Internet</a></li>
          <li><a href="#">Marketing</a></li>
          <li><a href="#">Lifestyle</a></li>
          <li><a href="#">Make Money</a></li>
          <li><a href="#">Online</a></li>
          <li><a href="#">Parenting</a></li>
        </ul>
        <!-- end categories -->
        <!-- begin pages -->
        <h2>Pages</h2>
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#">About</a></li>
          <li><a href="#">Archives</a></li>
          <li><a href="#">Links</a></li>
          <li><a href="#">Contact</a></li>
          <li><a href="#">Sitemap</a></li>
        </ul>
        <!-- end pages -->
      </div>
      <!-- END left -->
      <!-- BEGIN right -->
      <div class="r sbar">
        <!-- begin archives -->
        <h2>Archives</h2>
        <ul>
          <li><a href="#">August 2008</a></li>
          <li><a href="#">July 2008</a></li>
          <li><a href="#">June 2008</a></li>
          <li><a href="#">May 2008</a></li>
          <li><a href="#">April 2008</a></li>
          <li><a href="#">March 2008</a></li>
        </ul>
        <!-- end archives -->
        <!-- begin blogroll -->
        <h2>Blogroll</h2>
        <ul>
          <li><a href="#">Carlos</a></li>
          <li><a href="#">Digital Point Forum</a></li>
          <li><a href="#">Eric's Photo Gallery</a></li>
          <li><a href="#">Fashion Trends</a></li>
          <li><a href="#">Google Scoreboard</a></li>
          <li><a href="#">Marketing Forum</a></li>
        </ul>
        <!-- end blogroll -->
        <!-- begin meta -->
        <h2>Meta</h2>
        <ul>
          <li><a href="#">Login</a></li>
        </ul>
        <!-- end meta -->
      </div> --%>
      <!-- END right -->
    </div>
  </div>