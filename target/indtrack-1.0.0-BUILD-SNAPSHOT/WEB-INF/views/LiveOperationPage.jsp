	  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
	
	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
		
				<div class="widget-toolbar no-border">
					<ul class="nav nav-tabs" id="recent-tab">
						<li  class="active"><a data-toggle="tab" href="#/LiveOperationPage">Live Operation
							</a></li>

<!-- 						<li><a data-toggle="tab" href="#/CallDetails">Call Details -->
<!-- 							</a></li> -->

					</ul>
				</div>
			</div>

	</div>
	
	
	
<!-- 	-------------------------------- -->

<div class="row">&nbsp;</div>

 <div class="row">
        <div class="col-md-3 col-sm-3 col-xs-4"  style="width:250px;">
          <div class="info-box"  style="">
            <span class="info-box-icon bg-red" style="background-color:red;" ><i class=" fa  fa-cog fa-spin fa-fw"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font style="font-size:20px;"><b><a id="gpsliveslide"  href="">Vehicle Status</a></b></font></span>
              <br>
              <span class="info-box-number"><font color="orange"><b>{{validgps}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-red"  style="background-color:rgb(243,156,18);">
<!--             <i class="ion ion-ios-gear-outline"></i> -->
                  <i class="ion ion-android-locate"></i>
            
            </span>

            <div class="info-box-content" style="text-align:center;">
              <span class="info-box-text"><font><a id="slider"  href="" ng-click="baseDetails();">At Base</a></font></span>
              <br>
              <span class="info-box-number"><font color="orange"><b>{{basecount}}</b></font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

<!--         <div class="col-md-3 col-sm-6 col-xs-12"> -->
<div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-green" style="background-color: #7166B5"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a id="baseslider" href="" ng-click="hospDetails();">At Base(Hotspot)</a></font></span>
              <br>
              <span class="info-box-number"><font color="orange"></font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-yellow" style="background-color: rgb(0,166,90); "><i class="ion ion-ios-people-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a href="" id="caseslider" ng-click="caseDetails();">At Case</a></font></span>
              <br>
              <span class="info-box-number"><font color="orange">{{casecount}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
<!--         <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;"> -->
<!--           <div class="info-box" > -->
<!--             <span class="info-box-icon bg-aqua" style="background-color:rgb(204,206,213);"> -->
<!-- <!--             <i class="ion ion-ios-gear-outline"></i> --> 
<!--             <i class="ion  ion-thumbsdown"></i> -->

           
<!--             </span> -->

<!-- <!--             <div class="info-box-content" style="text-align:center; "> --> 
<!-- <!--               <span class="info-box-text"><font>Vehicles Down</font></span> --> 
<!-- <!--               <br> --> 
<!-- <!--               <span class="info-box-number"><font color="orange">{{notworkingdata}}</font></span> --> 
<!-- <!--             </div> --> 
<!--             /.info-box-content -->
<!--           </div> -->
<!--           /.info-box -->
<!--         </div> -->
        
        
        
        <!-- /.col -->
      </div>
	
	
	
<!-- 	------------------------------------ -->
	
	
<!-- 	----------------------------------------------- -->
	
	
	
<!-- 	---------------------------------------------------------- -->



<!-- 	------------------------------------------------- -->


<div class="row">
       
        <!-- /.col -->
       
        <!-- /.col -->

        <!-- fix for small devices only -->

        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-green" style="background-color:rgb(0,166,90);">
<!--             <i class="ion ion-ios-gear-outline"></i> -->
                        <i class="ion ion-android-car"></i>
            
           
            
            </span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>Total Trips</font></span>
              <br>
              <span class="info-box-number"><font>{{sumtrips}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-aqua" style="background-color:rgb(204,206,213);"><i class="ion ion-ios-people-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a href="" id="tripslide">5 Trips</a></font></span>
              <br>
              <span class="info-box-number"><font>{{fivecount}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-red" style="background-color:red;" ><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a href="" id="tripslide6">6 to 11 Trips</a></font></span>
              <br>
              <span class="info-box-number"><font>{{elevencount}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
         <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-yellow"  style="background-color:rgb(243,156,18);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center;">
              <span class="info-box-text"><font><a href="" id="tripslide11">11 To 15 Trips</a></font></span>
              <br>
              <span class="info-box-number"><font>{{fifteencount}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-green" style="background-color:rgb(0,166,90);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a href="" id="16tripsslide">16 Trips</a></font></span>
              <br>
              <span class="info-box-number"><font>{{sixteencount}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>



<!-- -------------------------- -->



<!-- ------------------------------------------------------------------------------------------------ -->

<div class="row">
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-red" style="background-color:red;">
<!--             <i class="ion ion-ios-people-outline"></i> -->
<i class="fa fa-flask" aria-hidden="true"></i> 
<!-- <i class="fa fa-hourglass" aria-hidden="true"></i>  -->
         </span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>Idle Time</font></span>
              <br>
              <span class="info-box-number"><font></font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-red"  style="background-color:rgb(243,156,18);">
            <i class="ion ion-ios-gear-outline"></i>
<!--              <i class="fa fa-hourglass-1"></i> -->
              </span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a href="" id="idle1slider">5 Mins</a></font></span>
              <br>
              <span class="info-box-number"><font>{{fiveidle}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span  class="info-box-icon bg-green" style="background-color: #7166B5"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center;">
              <span class="info-box-text"><font><a href="" id="idle2slider">11 to 15 Mins</a></font></span>
              <br>
              <span class="info-box-number"><font>{{elevenidle}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-yellow" style="background-color: rgb(0,166,90); "><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a href="" id="idle3slider">16 to 20 Mins</a></font></span>
              <br>
              <span class="info-box-number"><font>{{fifteenidle}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
         <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span  class="info-box-icon bg-aqua" style="background-color:rgb(204,206,213);"><i class="ion ion-ios-people-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a href="" id="idle4slider">Above 21 Mins</a></font></span>
              <br>
              <span class="info-box-number"><font>{{sixteenidle}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>


<!-- ---------------------------------------------------------------------------------------------------------------------------- -->



<!-- --------------------------------------------- -->

<!-- <div class="row"> -->
<!--         <div class="col-md-3 col-sm-6 col-xs-12"> -->
<!--           <div class="info-box"> -->
<!--             <span class="info-box-icon bg-aqua" style="background-color:rgb(204,206,213)"><i class="ion ion-ios-gear-outline"></i></span> -->

<!--             <div class="info-box-content" style="text-align:center; "> -->
<!--               <span class="info-box-text"><font>>5 Mins</font></span> -->
<!--               <br> -->
<!--               <span class="info-box-number"><font>{{fiveidle}}</font></span> -->
<!--             </div> -->
<!--             /.info-box-content -->
<!--           </div> -->
<!--           /.info-box -->
<!--         </div> -->
<!--         /.col -->
<!--         <div class="col-md-3 col-sm-6 col-xs-12"> -->
<!--           <div class="info-box"> -->
<!--             <span class="info-box-icon bg-red" style="background-color:red"><i class="ion ion-ios-gear-outline"></i></span> -->

<!--             <div class="info-box-content" style="text-align:center;"> -->
<!--               <span class="info-box-text"><font>11 to 15 Mins</font></span> -->
<!--               <br> -->
<!--               <span class="info-box-number"><font>{{elevenidle}}</font></span> -->
<!--             </div> -->
<!--             /.info-box-content -->
<!--           </div> -->
<!--           /.info-box -->
<!--         </div> -->
<!--         /.col -->

<!--         fix for small devices only -->
<!--         <div class="clearfix visible-sm-block"></div> -->

<!--         <div class="col-md-3 col-sm-6 col-xs-12"> -->
<!--           <div class="info-box"> -->
<!--             <span class="info-box-icon bg-green" style="background-color:rgb(0,166,90) "><i class="ion ion-ios-gear-outline"></i></span> -->

<!--             <div class="info-box-content" style="text-align:center; "> -->
<!--               <span class="info-box-text"><font>16 to 20 Mins</font></span> -->
<!--               <br> -->
<!--               <span class="info-box-number"><font>{{fifteenidle}}</font></span> -->
<!--             </div> -->
<!--             /.info-box-content -->
<!--           </div> -->
<!--           /.info-box -->
<!--         </div> -->
<!--         /.col -->
<!--         <div class="col-md-3 col-sm-6 col-xs-12"> -->
<!--           <div class="info-box"> -->
<!--             <span class="info-box-icon bg-yellow" style="background-color:rgb(243,156,18)"><i class="ion ion-ios-people-outline"></i></span> -->

<!--             <div class="info-box-content" style="text-align:center; "> -->
<!--               <span class="info-box-text"><font>Above 21 Mins</font></span> -->
<!--               <br> -->
<!--               <span class="info-box-number"><font>{{sixteenidle}}</font></span> -->
<!--             </div> -->
<!--             /.info-box-content -->
<!--           </div> -->
<!--           /.info-box -->
<!--         </div> -->
<!--         /.col -->
<!--       </div> -->


<!-- ----------------------------------------------------------------------------------------- -->


<div class="row">
        <div  class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-green" style="background-color:rgb(0,166,90);"><i class="fa fa-clock-o"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>Cycle Time</font></span>
              <br>
              <span class="info-box-number"><font>{{totalcycle}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div  class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-aqua" style="background-color:rgb(204,206,213);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center;">
              <span class="info-box-text"><font><a  href="" id="cycle1slider">1 to 30 Mins</a></font></span>
              <br>
              <span class="info-box-number"><font>{{fivecycle}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div  class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-red" style="background-color:red;"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a  href="" id="cycle2slider">31 To 60 Mins</a></font></span>
              <br>
              <span class="info-box-number"><font>{{elevencycle}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div  class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"  style="background-color:rgb(243,156,18);"><i class="ion ion-ios-people-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a  href="" id="cycle3slider">61 To 90 Mins</a></font></span>
              <br>
              <span class="info-box-number"><font>{{fifteencycle}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
         <div  class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-green" style="background-color:rgb(0,166,90);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a  href="" id="cycle4slider">91 To 120 Mins</a></font></span>
              <br>
              <span class="info-box-number"><font>{{sixteencycle}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>


<!-- ----------------------------------------- -->

<div class="row">
       
        <!-- /.col -->
        <div  class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-red" style="background-color:red;">
<!--             <i class="ion ion-ios-gear-outline"></i> -->
               <i class="ion ion-android-walk"></i>
            </span>

            <div class="info-box-content" style="text-align:center;">
              <span class="info-box-text"><font>Kilometers Covered</font></span>
              <br>
              <span class="info-box-number"><font>{{sumtrips}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div  class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-red"  style="background-color:rgb(243,156,18);">
            <i class="ion ion-ios-gear-outline"></i>
 
            </span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a href="" id="0to15kmslide">0 To 15 Km</a></font></span>
              <br>
              <span class="info-box-number"><font>{{fifteenkm}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div  class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-green" style="background-color: #7166B5"><i class="ion ion-ios-people-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a href="" id="15to50kmslide">15 To 50 Km</a></font></span>
              <br>
              <span class="info-box-number"><font>{{fiftykm}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        <div  class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-yellow" style="background-color: rgb(0,166,90); "><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font><a href="" id="51to100slide">51 To 100 Km</a></font></span>
              <br>
              <span class="info-box-number"><font>{{hundredkm}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div  class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-aqua" style="background-color:rgb(204,206,213);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center;">
              <span class="info-box-text"><font><a href="" id="above100slide">Above 100</a></font></span>
              <br>
              <span class="info-box-number"><font>{{above100}}</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>

<!-- --------------------------------------------------------- -->
<div class="row">
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-green" style="background-color:rgb(0,166,90);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center;">
              <span class="info-box-text"><font>Total Availed </font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-aqua" style="background-color:rgb(204,206,213);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center;">
              <span class="info-box-text"><font>zero Cases </font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-red" style="background-color:red;"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>One Cases</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span  class="info-box-icon bg-yellow"  style="background-color:rgb(243,156,18);"><i class="ion ion-ios-people-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>Two Cases</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-green" style="background-color:rgb(0,166,90);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>Three Cases</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
         
        <!-- /.col -->
      </div>
	
	
	
	
	
	<div class="row">
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-red" style="background-color:red;"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>Four Cases</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        
        <!-- /.col -->

        <!-- fix for small devices only -->
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-red"  style="background-color:rgb(243,156,18);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>5 to 6</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-green" style="background-color: #7166B5"><i class="ion ion-ios-people-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>7 to 8</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        
        
         <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-yellow" style="background-color: rgb(0,166,90);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>9 to 10 Cases</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        
          <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-aqua" style="background-color:rgb(204,206,213);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center;">
              <span class="info-box-text"><font>Above 11 </font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        <!-- /.col -->
      </div>
	
	
	
	
<div class="row">

        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-green" style="background-color:rgb(0,166,90);"><i class="ion ion-ios-people-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>Hotspot Alerts</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-aqua" style="background-color:rgb(204,206,213);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>Identified</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-red" style="background-color:red;" ><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center;">
              <span class="info-box-text"><font>Moved</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
         <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box" >
            <span class="info-box-icon bg-yellow"  style="background-color:rgb(243,156,18);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>Not Moved</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        
        <div class="col-md-3 col-sm-3 col-xs-4" style="width:250px;">
          <div class="info-box">
            <span class="info-box-icon bg-green" style="background-color:rgb(0,166,90);"><i class="ion ion-ios-gear-outline"></i></span>

            <div class="info-box-content" style="text-align:center; ">
              <span class="info-box-text"><font>Not Moved</font></span>
              <br>
              <span class="info-box-number"><font>0</font></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>

	
	
<div id="mydeviceModal1" class="modal fade" role="dialog" style="width:500px;left:35%;top:30%;">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header" style="background-color:#1252ba ">
     <span class="close" data-dismiss="modal">
     <font color="white" style="size:20px;">X</font></span>
     <font color="white">GPS Status Details</font>
    </div>
   <div class="modal-body">
  				<div class="row">
		
			<div class="col-md-1 " style="width:100px;">
			<a href="" title="Halt Count" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
				<a href="">
				<img  title="Halt Vehicles"  src="<c:url value="/resources/images/haltGray.png"/>"height="">
				<center>
				<font color="black">{{yellow}}</font>
				</center>
				</a>
		
<!-- 					<a >View </a> -->
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href='' ng-click="dgetsorted('halt');yellowvehicle();"><font color="white">Halt</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			
			
			<div class="col-md-1" style="width:100px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
					<a href="">	<img   title="Stop Vehicles" ng-click="dgetsorted('stop');redvehicle()" src="<c:url value="/resources/images/haltvehicle.png"/>"><center><font color="black">{{red}}</font></center></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href='' ng-click="dgetsorted('stop');redvehicle()"><font color="white">Stop</font></a></div>
					
				</div>
				
			</div>
			
			<div class="col-md-1"  style="width:100px;">
				<a href="" title="Running Count" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
			<a href="">	<img   title="Running Vehicles" ng-click="dgetsorted('running');greenvehicle();" src="<c:url value="/resources/images/runningveh.png"/>"><center><font color="black">{{green}}</font></center></a>

					
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href='' ng-click="dgetsorted('running');greenvehicle();" ><font color="white">Running</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			<div class="col-md-1" style="width:150px;">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
					<a href="">	<img   title="Not Working " ng-click="dgetsorted('notworking');NOtworking();" src="<c:url value="/resources/images/notworking.png"/>"><center><font color="black">{{notworkingdata}}</font></center></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center;"><a data-placement='bottom'  href='' ng-click="dgetsorted('notworking');NOtworking();"><font color="white">Non Working</font></a></div>
					
				</div>
				
			</div>
	
			
	</div>
	
	
	
	<div class="row">
	
			
			<div class="col-md-2"  style="width:100px;">
				<a href="" title="GPS Connect" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
					<a href="">	<img   title="GPS Connect" ng-click="dgetsorted('gpson');validGpsceh();" src="<c:url value="/resources/imagenew/GPSOn.png"/>"><center><font color="black">{{validgps}}</font></center></a>

				
<!-- 					<a >View </a> -->
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href='' ng-click="getsorted('gpson')"><font color="white">ON</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			
			
			<div class="col-md-2 " style="width:100px;">
			<a href="" title="GPS Disconnect" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
				<a href="">	<img  title="GPS Disconnect" ng-click="dgetsorted('gpsoff');invalidGpsveh();" src="<c:url value="/resources/imagenew/gpsoff.png"/>"><center><font color="black">{{invalidgps}}</font></center></a>

				</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href='' ng-click="getsorted('gpsoff')"><font color="white">OFF</font></a></div>
					
				</div>
				</a>
				
			</div>
			
	
	
	
	
            
	<div class="col-md-2" style="width:100px;">
	<a href="" title="Ignition On" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
					<a href="">	<img  title="Ignition On" ng-click="dgetsorted('ignnumberon');igionveh();"  src="<c:url value="/resources/images/IgnitionON.png"/>"><center><font color="black">{{ignitionon}}</font></center></a>

					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href=''  ng-click="getsorted('ignnumberon')"><font color="white">ON</font></a></div>
					
				</div>
				</a>
			
			</div>
			
			
			<div class="col-md-2"  style="width:100px;">
				<a href="" title="Ignition Off" style="text-decoration: none">
				<div class="panel panel-primary">
					<div class="panel-body"  style="background: #C0C0C0 ;text-align:center;">
					<a href="">	<img   title="Ignition Off" ng-click="dgetsorted('ignnumberoff');igiOffveh" src="<c:url value="/resources/images/Ignitionoff.png"/>"><center><font color="black">{{ignitionoff}}</font></center></a>
		
<!-- 					<a >View </a> -->
					</div>
			<div  class="" style="background-color: #1E0833;text-align: center"><a data-placement='bottom'  href='' ng-click="getsorted('ignnumberoff')" ><font color="white">OFF</font></a></div>
					
				</div>
				</a>
				
			</div>
			
			

	
	</div>
	
	
	
	
<!-- 	<div class="modal-footer"> -->
<!--      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!--      </div> -->
	</div>
	</div>
	</div>
	
	
	
<!-- 	basecount -->
	

<div  class="dd collapse in" id="dislide" role="dialog"> 
 <!-- Modal content -->
  <div class="modal-content" style="width:1123px;">
    <div class="modal-header" style="background-color: #1b5b03">
<!--      <span class="close" data-dismiss="modal"> -->
<!-- <!--      <font color="white" style="size:20px;">X</font> --> 
<!--     <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->
<!--    </span> -->
     <font color="white">Base Details</font>
    </div>
   <div class="modal-body">
  		


<div class="row">
<div class="col-md-12">

<div class="col-md-2" style="width:450px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Base Status</font>
						</div>
					<div class="panel-body">
		
			
<!-- 					<div id="piechart" ></div> -->
<div id="basechartdata"></div>


					</div>
				</div>
			</div><!--/.col-->
			
<!-- 			</div>	 -->
			
<div class="col-md-8" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Base Details</font>
						</div>
					<div class="panel-body">
		
			
<!-- 					<div id="piechart" ></div> -->
<div style="height:500px; width:100%;overflow: scroll;">	
				
			<table class="table" border="1px" style="border-color:black;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					</colgroup>
					<thead class="thin-border-bottom">
					<tr style="background:black">
					<td><font color="White" id="dashfontsize">Sr.No</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Base Location</font></td>
						<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
					<td><font color="White" id="dashfontsize">Date/Time</font></td>
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="base in baseDEtailsdata">
<!-- 					<tr dir-paginate="k in basedata|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{base.rowno}}</font></td>
					<td><font id="dashfontsize">{{base.district}}</font></td>
					<td><font id="dashfontsize">{{base.location}}</font></td>
					<td><font id="dashfontsize">{{base.vehicleno}}</font></td>
					<td><font id="dashfontsize">{{base.date}}</font></td>
<!-- 					<td><a ng-click="showmapdiv1(base)" href=""><font><i class="fa fa-map-marker"></i></font></a></td> -->
					</tr>
					</tbody>
					</table>
					
			
					</div>


					</div>
				</div>
			</div>
			
		
			


</div>

	</div>
	
	
	<div class="modal-footer">
	
	 <button type="button" class="btn btn-danger" id="closebasediv"><font>Close</font></button>
	
	</div>
	
	
	

	</div>
	
	</div>
	

</div>

<!-- hos -->

<div id="hospdetailsdiv" class="dd collapse in"   role="dialog">

  <!-- Modal content -->
  <div class="modal-content" style="width:1100px;">
    <div class="modal-header" style="background-color: #1b5b03">
<!--      <span class="close" data-dismiss="modal"> -->
<!-- <!--      <font color="white" style="size:20px;">X</font> --> 
<!--     <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->

<!--      </span> -->
     <font color="white">Hostspot Details</font>
    </div>
   <div class="modal-body">
   
   
<div class="row">
<div class="col-md-12">

<div class="col-md-2" style="width:450px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Hotspot Status</font>
						</div>
					<div class="panel-body">
		
			
<!-- 					<div id="piechart" ></div> -->
<div id="hotspotchartdata"></div>


					</div>
				</div>
</div><!--/.col-->
			
   
   <div class="col-md-8" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Hotspot Details</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
	<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					</colgroup>
					<thead class="thin-border-bottom">
					<tr style="background:black ">
					<td><font color="White" id="dashfontsize">Sr.No</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Base Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
					<td><font color="White" id="dashfontsize">Date/Time</font></td>
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="hosp in hospDEtailsdata">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{hosp.rowno}}</font></td>
					<td><font id="dashfontsize">{{hosp.district}}</font></td>
					<td><font id="dashfontsize">{{hosp.location}}</font></td>
					<td><font id="dashfontsize">{{hosp.vehicleno}}</font></td>
<!-- 					<td><font>{{hosp.type}}</font></td> -->
					<td><font id="dashfontsize">{{hosp.date}}</font></td>
<!-- 					<td> <a ng-click="showmapdiv1(hosp)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>

</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
	
	<div class="modal-footer">
	
	 <button type="button" class="btn btn-danger" id="closehotdiv"><font>Close</font></button>
	
	</div>
	
	
	

	</div>
	
	</div>
	<!-- 	case -->
	
	
<div id="casediv"  class="dd collapse in"  role="dialog">

  <!-- Modal content -->
  <div class="modal-content"  style="width:1100px;">
    <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">Case Details</font>
    </div>
   <div class="modal-body">
	
	
	
	
<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Case Status</font>
						</div>
			<div class="panel-body">			
<!-- 					<div id="piechart" ></div> -->
<div id="casechartdata"></div>


			</div>
			</div>
			</div>
			
			<!--/.col-->
			
   
   <div class="col-md-8" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Case Details</font>
						</div>
			<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
			
				
					<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					</colgroup>
					<thead class="thin-border-bottom">
					<tr style="background:black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
					<td><font color="White" id="dashfontsize">Date/Time</font></td>
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="case in caseDEtailsdata">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{case.rowno}}</font></td>
					<td><font id="dashfontsize">{{case.district}}</font></td>
					<td><font id="dashfontsize">{{case.location}}</font></td>
					<td><font id="dashfontsize">{{case.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
					<td><font id="dashfontsize">{{case.date}}</font></td>
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					
					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
	
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="closecasediv"><font>Close</font></button>
	
	</div>
	
	
	

	</div>
	
	</div>
		
	<!-- 	trips -->
<div  id="tripdetailsdeiv" class="dd collapse in"  role="dialog">
	
	
  <div class="modal-content"  style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">5 Trips Details</font>
    </div>
   <div class="modal-body">
	
	
	
<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>5 Trips Sttaus</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="tripchart1"></div>


					</div>
				</div>
</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>5 Trips Details</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
	
	

		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					</colgroup>
					<thead class="thin-border-bottom">
					<tr style="background:black ">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="five in fivedetails">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{five.rowno}}</font></td>
					<td><font id="dashfontsize">{{five.district}}</font></td>
					<td><font id="dashfontsize">{{five.location}}</font></td>
					<td><font id="dashfontsize">{{five.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
	
	<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="closediv""><font>Close</font></button>
	
	</div>
	
	
	

	</div>
	
	</div>
		
<!-- for6 -->
	
<div id="tripdeatilsdiv6" class="dd collapse in" role="dialog">
	
	
  <div class="modal-content"  style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">6 To 11 Trips Details</font>
    </div>
   <div class="modal-body">
	
	<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>6 to 11Trip  Status</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="tripchart2"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>6 to 11Trip Details</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
	
	
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
					<thead class="thin-border-bottom">
					<tr  style="background:black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="six in sixdetails">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{six.rowno}}</font></td>
					<td><font id="dashfontsize">{{six.district}}</font></td>
					<td><font id="dashfontsize">{{six.location}}</font></td>
					<td><font id="dashfontsize">{{six.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
	
	<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="trip6div""><font>Close</font></button>
	
	</div>
	
	
	

	</div>
	
	</div>


<!-- 11trips -->
	
<div id="tripdeatilsdiv11" class="dd collapse in" role="dialog">
	
	
  <div class="modal-content"  style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">11 To 15 Trips Details</font>
    </div>
   <div class="modal-body">
	
	
<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>11 To 15 Trip Status</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="tripchart3"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>11 To 15 Trip Details</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
					<thead class="thin-border-bottom">
					<tr style="background: black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" style="font-size:12px;">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="elv in elevendetails">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{elv.rowno}}</font></td>
					<td><font id="dashfontsize">{{elv.district}}</font></td>
					<td><font id="dashfontsize">{{elv.location}}</font></td>
					<td><font id="dashfontsize">{{elv.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
	
	
	<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="trip11div""><font>Close</font></button>
	
	</div>
	
	
	

	</div>
	
	</div>


	
<!-- 	16trip -->
	
<div id="div16trips" class="dd collapse in" role="dialog">
	
<div class="modal-content" style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">16 Trips Details</font>
    </div>
   <div class="modal-body">
<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font> 16 Trips Status</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="tripchart4"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font> 16 Trips Details</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">

		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				
					
					</colgroup>
					<thead class="thin-border-bottom">
					<tr style="background:black ">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in sixteendetails">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>
				
					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
	
	
	<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="trip16div""><font>Close</font></button>
	
	</div>
	
	
	

	</div>
	
	</div>


	
	
	
	
	
<!-- 	dist1 -->
	
	
<div id="distancediv1" class="dd collapse in" role="dialog">
	
	
	<div class="modal-content" style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">0 to 15 km Details</font>
    </div>
   <div class="modal-body">
<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>0 to 15 KM Status</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="barchart1"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>0 to 15 kilometers</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
	
<!-- <div class="row"  style="height:500px;overflow: scroll;"> -->
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
					<thead class="thin-border-bottom">
					<tr style="background: black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in distance1">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="distanc1div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>

	
<!-- 	dis2 -->

<div id="distancemodal2" class="dd collapse in" role="dialog">
	
	
	<div class="modal-content" style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">15 to 50km Details</font>
    </div>
   <div class="modal-body">
	<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>15 to 50 Km Status</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="barchart2"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>15 to 50kilometers</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">

		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					</colgroup>
					<thead class="thin-border-bottom">
					<tr style="background: black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in distnace2">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="distanc2div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>

	
	
<!-- 	dis3 -->

<div id="distancemodal3" class="dd collapse in"  role="dialog">
	
	
	<div class="modal-content" style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">51 to 100km Details</font>
    </div>
   <div class="modal-body">
<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>51 to  100km Status</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="barchart3"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>51 to 100kilometers</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
					<thead class="thin-border-bottom">
					<tr style="background: black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in distance3">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="distanc3div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>

<!-- 	dis4 -->


<div id="dismodal4" class="dd collapse in"  role="dialog">
	
	
	<div class="modal-content" style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">Above 100km Details</font>
    </div>
   <div class="modal-body">
	<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Above 100km status</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="barchart4"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Above 100kilometers</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
	
<!-- <div class="row"  style="height:500px;overflow: scroll;"> -->
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>			
			<thead class="thin-border-bottom">
					<tr id="gridheader">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in distance4">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="distanc4div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>

	
	
	
<!-- 	 idle1 -->
	
<div id="idle1"  class="dd collapse in"  role="dialog">
	
	
	<div class="modal-content" style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">5 Mins Details</font>
    </div>
   <div class="modal-body">
	<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>5 mins Status</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="idlechart1"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>5 Mins</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
					<thead class="thin-border-bottom">
					<tr style="background:black ">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in time1">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="idle1div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>

	
	
	
<!-- 	idle2 -->

<div id="idle2"  class="dd collapse in"  role="dialog">
	
	
	<div class="modal-content"  style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">11 to 15 Mins Details</font>
    </div>
   <div class="modal-body">
	<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>11 to 15 mins status</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="idlechart2"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>11 to 15 mins</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
					<thead class="thin-border-bottom">
					<tr style="background: black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in time2">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="idle2div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>

	
	
<!-- 	idle3 -->
<div id="idle3" class="dd collapse in"  role="dialog">
	
	
	<div class="modal-content"  style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">16 to 20 Mins Details</font>
    </div>
   <div class="modal-body">
	<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>16 to 20 mins</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="idlechart3"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>16 to 20 mins</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
			<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
	<thead class="thin-border-bottom">
					<tr style="background:black ">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in time3">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="idle3div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>

	
<!-- 	idle4 -->


<div id="idle4" class="dd collapse in"  role="dialog">
	
	
	<div class="modal-content"  style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">Above 21 Mins Details</font>
    </div>
   <div class="modal-body">
	<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="width:450px;">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Above 21 mins</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="idlechart4"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   
   <div class="col-md-6" style="width:600px;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Above 21 mins</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
					
					<thead class="thin-border-bottom">
					<tr style="background: black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in time4">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="idle4div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>

<!-- 	cycle1 -->

<div id="cycle1" class="dd collapse in"  role="dialog">
	
	
	<div class="modal-content"  style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">1 To 30 Mins</font>
    </div>
   <div class="modal-body">
	<div class="row">
<div class="col-md-12">

<!-- <div class="col-md-4" style="width:450px;"> -->
<!-- 		<div class="panel panel-primary"> -->
<!-- 					<div class="panel-heading dark-overlay" id="panelheadre"> -->
<!-- 					<i class="fa fa-pie-chart" style="color:white"></i> -->
<!-- 						<font>1 To 30 Mins Status</font> -->
<!-- 						</div> -->
<!-- 					<div class="panel-body"> -->
<!-- <!-- 					<div id="piechart" ></div> --> 
<!-- <div id="idlechart4"></div> -->


<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div>/.col -->
			
   
   <div class="col-md-6" style="width:100%;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>1 To 30 Mins</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
					
					<thead class="thin-border-bottom">
					<tr style="background: black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in cycle1">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="cycle1div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>
	
	
	
<!-- cycle2 -->
<div id="cycle2" class="dd collapse in"  role="dialog">
	
	
	<div class="modal-content"  style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">31 to 60 Mins</font>
    </div>
   <div class="modal-body">
	<div class="row">
<div class="col-md-12">

<!-- <div class="col-md-4" style="width:450px;"> -->
<!-- 		<div class="panel panel-primary"> -->
<!-- 					<div class="panel-heading dark-overlay" id="panelheadre"> -->
<!-- 					<i class="fa fa-pie-chart" style="color:white"></i> -->
<!-- 						<font>31 to 60 Mins Status</font> -->
<!-- 						</div> -->
<!-- 					<div class="panel-body"> -->
<!-- <!-- 					<div id="piechart" ></div> --> 
<!-- <div id="idlechart4"></div> -->


<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div>/.col -->
			
   
   <div class="col-md-6" style="width:100%;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>31 to 60 Mins</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
					
					<thead class="thin-border-bottom">
					<tr style="background: black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in cycle2">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="cycle2div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>
	
	
	
<!-- 	cycle3 -->

<div id="cycle3" class="dd collapse in"  role="dialog">
	
	
	<div class="modal-content"  style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">61 to 90 Mins</font>
    </div>
   <div class="modal-body">
	<div class="row">
<div class="col-md-12">

<!-- <div class="col-md-4" style="width:450px;"> -->
<!-- 		<div class="panel panel-primary"> -->
<!-- 					<div class="panel-heading dark-overlay" id="panelheadre"> -->
<!-- 					<i class="fa fa-pie-chart" style="color:white"></i> -->
<!-- 						<font>61 to 90 Mins Status</font> -->
<!-- 						</div> -->
<!-- 					<div class="panel-body"> -->
<!-- <!-- 					<div id="piechart" ></div> --> 
<!-- <div id="idlechart4"></div> -->


<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div>/.col -->
			
   
   <div class="col-md-6" style="width:100%;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>61 to 90  Mins</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
					
					<thead class="thin-border-bottom">
					<tr style="background: black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in cycle3">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="cycle3div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>
	
	
<!-- 	cycle4 -->
<div id="cycle4" class="dd collapse in"  role="dialog">
	
	
	<div class="modal-content"  style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">91 to 120 Mins</font>
    </div>
   <div class="modal-body">
	<div class="row">
<div class="col-md-12">

<!-- <div class="col-md-4" style="width:450px;"> -->
<!-- 		<div class="panel panel-primary"> -->
<!-- 					<div class="panel-heading dark-overlay" id="panelheadre"> -->
<!-- 					<i class="fa fa-pie-chart" style="color:white"></i> -->
<!-- 						<font>91 to 120 Mins Status</font> -->
<!-- 						</div> -->
<!-- 					<div class="panel-body"> -->
<!-- <!-- 					<div id="piechart" ></div> --> 
<!-- <div id="idlechart4"></div> -->


<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div>/.col -->
			
   
   <div class="col-md-6" style="width:100%;">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>91 to 120 Mins</font>
						</div>
					<div class="panel-body">

<div  style="height:500px; width:100%;overflow: scroll;">
		<table class="table" border="1px" style="border-color:black;width:100%;table-layout:fixed;" id="livesumm">
					<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					
					
					</colgroup>
					
					<thead class="thin-border-bottom">
					<tr style="background: black">
					<td><font color="White" id="dashfontsize">Sr.No.</font></td>
					<td><font color="White" id="dashfontsize">District</font></td>
					<td><font color="White" id="dashfontsize">Location</font></td>
					<td><font color="White" id="dashfontsize">Vehicle No.</font></td>
<!-- 					<td><font color="White">Type.</font></td> -->
<!-- 					<td><font color="White">Datetimestamp</font></td> -->
<!-- 					<td><font color="White">View On Map</font></td> -->
					</tr>
					</thead>
					<tbody>
					<tr ng-repeat="x in cycle4">
<!-- 			<tr dir-paginate="hosp in baseDEtailsdatanew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"></tr> -->
					<td><font id="dashfontsize">{{x.rowno}}</font></td>
					<td><font id="dashfontsize">{{x.district}}</font></td>
					<td><font id="dashfontsize">{{x.location}}</font></td>
					<td><font id="dashfontsize">{{x.vehicleno}}</font></td>
<!-- 					<td><font>{{case.type}}</font></td> -->
<!-- 					<td><font>{{case.date}}</font></td> -->
<!-- 					<td> <a ng-click="showmapdiv1(case)" href=""><font><i class="fa fa-map-marker"></i></a></font></td> -->
				</tr>
					</tbody>
					</table>

					</div>


					</div>
				</div>
			</div>
			
		
			
</div>

</div>

	</div>
	
		
<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="cycle4div"><font>Close</font></button>
	
</div>
	
	
	

	</div>
	
	</div>
	
	
	
	
<!-- 	gpslive -->
<div id="gpslivedata" class="dd collapse in" role="dialog">
	
	
  <div class="modal-content"  style="width:1100px;">
  <div class="modal-header" style="background-color: #1b5b03">
     <span>
     
<!--      <font color="white" style="size:20px;">    -->
<!--  </font> -->
 </span>
     <font color="white">Vehicle Status Details</font>
    </div>
   <div class="modal-body">
	
	
<div class="row">
<div class="col-md-12">

<div class="col-md-12">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="panelheadre">
					<i class="fa fa-pie-chart" style="color:white"></i>
						<font>Vehicle Status</font>
						</div>
					<div class="panel-body">
<!-- 					<div id="piechart" ></div> -->
<div id="statusbar"></div>


					</div>
				</div>
			</div><!--/.col-->
			
   	
</div>

</div>

	</div>
	
	
	
	<div class="modal-footer" >
	
 <button type="button" class="btn btn-danger" id="gpsstatusdiv"><font>Close</font></button>
	
	</div>
	
	
	

	</div>
	
	</div>

	
	
	