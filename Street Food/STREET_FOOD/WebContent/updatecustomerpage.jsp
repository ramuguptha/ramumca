<!DOCTYPE html>
<html lang="en">
<%@ include file="customerheader.jsp" %>
<%@ include file="connect.jsp" %>
 <section class="home-slider owl-carousel img" style="background-image: url(images/bg_1.jpg);">

      <div class="slider-item" style="background-image: url(images/bg_3.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row slider-text justify-content-center align-items-center">

            <div class="col-md-7 col-sm-12 text-center ftco-animate">
            	<h1 class="mb-3 mt-5 bread">Update Page</h1>
	            <p class="breadcrumbs"><span class="mr-2"><a href="customerhomepage.jsp">Home</a></span> </p>
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
          <%
          int id=Integer.parseInt(request.getParameter("Id"));
          try
          {
        	  PreparedStatement ps=con.prepareStatement("select * from customer where id="+id);
        	  ResultSet rs=ps.executeQuery();
        	  if(rs.next());
        	  {
        		 int id1=rs.getInt(1);
        		 String name=rs.getString(2);
        		 String address=rs.getString(5);
        		 long mobile=rs.getLong(6);
        	  
          
          %>
            <form action="updatecustomerdata.jsp" class="contact-form">
            <div class="row">
            	
            	<div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="id" value="<%=id1 %>" placeholder="Your Id" readonly required>
	                </div>
                </div>
            	<div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="name" value="<%=name %>" placeholder="Your Name" required>
	                </div>
                </div>
                  
                <div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="address" value="<%=address %>" placeholder="Your Address" required>
	                </div>
	              </div>
	               <div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="mobile" value="<%=mobile %>" placeholder="Your Mobile" pattern="[6-9]{1}[0-9]{9}" title="phone number with 7-9 remaining 9 digits with 0-9" required>
	                </div>
	              </div>
              </div>
              
              <div class="form-group">
                <input type="submit" value="Update" class="btn btn-primary py-3 px-5">
              </div>
              
            </form>
           <%
            }
        	  rs.close();
        	  con.close();
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