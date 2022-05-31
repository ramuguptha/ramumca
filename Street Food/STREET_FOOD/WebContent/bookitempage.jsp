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
            	<h1 class="mb-3 mt-5 bread">Booking Page</h1>
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
          String remail=request.getParameter("Email");
            	int itemid=Integer.parseInt(request.getParameter("Id"));
          	    	
          	    	try
          	    	{
          	    	PreparedStatement ps=con.prepareStatement("select cost from item where id="+itemid);
          	    	ResultSet rs=ps.executeQuery();
          	    	while(rs.next())
          	    	{
          	    		double cost=rs.getDouble(1);
          	    	
          	    	 
            	%>
            <form action="bookitemdata.jsp" class="contact-form">
            <div class="row">
            	
            	<div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="restemail" value="<%= remail %>"  placeholder="Restrunt Id" required>
	                </div>
	              </div>
            	<div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="itemid" value="<%= itemid %>" placeholder="Item Id" required readonly>
	                </div>
	              </div>
	              
	              
	               <div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="itemcost" id="cost"  value="<%= cost %>" placeholder="Item Cost"  required readonly>
	                </div>
	                
	              </div>
	              <div class="col-md-6">
	                <div class="form-group">
	                  <input type="number" class="form-control" name="quan" min="1" id="quan" placeholder="Items Quantity" onchange="findTotalcalculateAmount(this.value)"  required>
	                </div>
	                  
	              </div>
                <div class="col-md-6">
	                <div class="form-group">
	                  <input type="text" class="form-control" name="totalcost" id="totalcost"  placeholder="Total Cost" required readonly>
	                </div>
	              </div>
	              
	             
              </div>
              
              <div class="form-group">
                <input type="submit" value="Book" class="btn btn-primary py-3 px-5" >
              </div>
              
            </form>
             <script>
            function findTotalcalculateAmount(val) {
            	var cost = document.getElementById('cost').value;
                var totcost = parseFloat(cost);
                if(val>0)
                	{
                var tot_price = val * totcost;
                
                var divobj = document.getElementById('totalcost');
                divobj.value = tot_price;
                	}
                else
                	{
                	alert("Please select More than One ");
                	}
            }
            function checknumber(val) {
            	
                if(val<=0)
                	{
                
                	alert("Please select More than One ");
                	}
            }
        </script>
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