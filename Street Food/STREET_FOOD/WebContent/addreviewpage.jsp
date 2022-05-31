<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="customerheader.jsp" %>
 <section class="home-slider owl-carousel img" style="background-image: url(images/bg_1.jpg);">

      <div class="slider-item" style="background-image: url(images/bg_3.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">Add Review</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="venderhomepage.jsp">Home</a></span> </p>
            </div>

          </div>
        </div>
      </div>
    </section>
    <section class="ftco-section contact-section">
      <div class="container mt-5">
        <div class="row block-9">
					
		<div class="col-md-1"></div>
          <div class="col-md-6 ftco-animate">
          <%@ include file="connect.jsp" %>
          <%

		int id=Integer.parseInt(request.getParameter("Id"));
          try
          {
        	 PreparedStatement ps= con.prepareStatement("select email from vender where id="+id);
        	 ResultSet rs=ps.executeQuery();
        	 
        	 while(rs.next())
        	 {
        		 String restemail=rs.getString(1);
        	
          
          %>
            <form action="addreviewdata.jsp" class="contact-form" method="post">
            <div class="row">
            	<div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="restemail" value="<%=restemail %>" placeholder="Item Name" required readonly>
	                </div>
                </div>
                <div class="col-md-6">
	                <div class="form-group">
	                  <input type="number" min="1" max="5" class="form-control" name="rate" placeholder="Add Rating" required>
	                </div>
	              </div>
	              <div class="col-md-6">
	                <div class="form-group">
	                  <input type="text"  class="form-control" name="comment" placeholder="Comment" required>
	                </div>
	              </div>
	              
               
              </div>
              
              <div class="form-group">
                <input type="submit" value="ADD" class="btn btn-primary py-3 px-5">
              </div>
             
            </form>
            <%
        	 }
          }
          catch(Exception e)
          {
        	  e.printStackTrace();
          }
            %>
          </div>
        </div>
      </div>
    </section>

    <div id="map"></div>
    

    <%@ include file="footer.jsp" %>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>