package mytrack.rtl.indtrack;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.pakt.EmailSend;
import com.pakt.SearchBloxREST;
import com.pakt.ValidateTokens;
import com.pakt.generateOTP;
import com.pakt.getLocationClass;
import com.pakt.pojos.DailyReport_details;
import com.pakt.pojos.DataReceived_Dump1;
import com.pakt.pojos.Multipledeviceassng_jsonlist;
import com.pakt.pojos.TotalDevice;
import com.pakt.pojos.asset_details;
import com.pakt.pojos.bang_imei;
import com.pakt.pojos.company_details;
import com.pakt.pojos.customer_details;
import com.pakt.pojos.customerdevice_assigndetails;
import com.pakt.pojos.customerwisedevice;
import com.pakt.pojos.daywisevehiclesReport;
import com.pakt.pojos.dealer_details;
import com.pakt.pojos.dealerassign_details;
import com.pakt.pojos.dealercustomers_details;
import com.pakt.pojos.dealerdash;
import com.pakt.pojos.dealerdevice_assigndetails;
import com.pakt.pojos.device_details;
import com.pakt.pojos.deviceassign_details;
import com.pakt.pojos.devicemanager;
import com.pakt.pojos.devicesale;
import com.pakt.pojos.devicesalecustomer;
import com.pakt.pojos.forget_passDetails;
import com.pakt.pojos.fueltype_details;
import com.pakt.pojos.geofence_details;
import com.pakt.pojos.geofencereportdet;
import com.pakt.pojos.idleReport_details;
import com.pakt.pojos.iginition_details;
import com.pakt.pojos.imeilist;
import com.pakt.pojos.livedet;
import com.pakt.pojos.login_details;
import com.pakt.pojos.make_details;
import com.pakt.pojos.menu_details;
import com.pakt.pojos.model_details;
import com.pakt.pojos.network_details;
import com.pakt.pojos.overspeed_details;
import com.pakt.pojos.parentcomp_details;
import com.pakt.pojos.rawdata;
import com.pakt.pojos.rawdet;
import com.pakt.pojos.role_details;
import com.pakt.pojos.sim_details;
import com.pakt.pojos.simassign_details;
import com.pakt.pojos.subdealers;
import com.pakt.pojos.subdealersold;
import com.pakt.pojos.user_details;
import com.pakt.pojos.vehicle_details;
import com.pakt.pojos.vehicleassigntogps_details;
import com.pakt.pojos.vehiclesummary_report;
import com.pakt.pojos.vehicletype_details;
import com.pakt.pojos.vendor_details;
import com.pakt.pojos.vts_Live_Vehicle;

import mytrack.rtl.indtrack.Authentication.AESCrypt;
import mytrack.rtl.indtrack.Authentication.VTSRabbitMQClient;
import mytrack.rtl.indtrack.Authentication.VTSRabbitMQInfo;
import mytrack.rtl.indtrack.Authentication.historylog_details;
import mytrack.rtl.indtrack.Authentication.vehiclesummary;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	int Login =0;
	Timestamp loginTimestamp;
	List<historylog_details> history = new ArrayList<historylog_details>();
	List<vehiclesummary> summary = new ArrayList<vehiclesummary>();
	ValidateTokens vt = new ValidateTokens();
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//System.out.println("Welcome home! The client locale is {}."+locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );

		return "Login";
	}
	
	
	
	@RequestMapping("index")
	public  String getLatLong(@RequestParam String key, Map<String, Object> model) {
		String keydec = null;
		try {
			
			//System.out.println("in index");
			 key = key.replace("nkm", "+");
//			System.out.println("key = "+key+" "+AESCrypt.decrypt(key));
			keydec = AESCrypt.decrypt(key);
			String[] spltstr = keydec.split("&&");
			SimpleDateFormat formatter;
//			formatter = new SimpleDateFormat("MMM dd, yyyy HH:mm:ss a");
			formatter = new SimpleDateFormat("dd MMM, yyyy HH:mm:ss a");//original
		      Date date = (Date) formatter.parse(spltstr[5]);
		      Timestamp tt1 = new Timestamp(date.getTime());
//		      loginTimestamp = tt1;
//		      System.out.println("date = "+tt1);
		      java.util.Date dd = new java.util.Date();
		      date = (Date) formatter.parse(dd.toLocaleString());
		      Timestamp tt2 = new Timestamp(date.getTime());
//		      System.out.println("date = "+tt2);
//		      System.out.println("tt "+tt1+" "+tt2);
		      long diff = compareTwoTimeStampsseconds(tt2,tt1);
//		      System.out.println("diff "+diff);
		      if(diff<=10){
		    	  Login = 1;
		      }
//		      System.out.println("tt "+diff);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		String login = "1";
		if(Login == 1){
			model.put("key", keydec);
			return "home";
		}else{
			return "Login";
		}
	}
	
	
	@RequestMapping("minesdashboard")
	public  ModelAndView  getminesdashboard() {
		return new ModelAndView ("minesdashboard");
		
	}
	
	
	@RequestMapping("newvehicle")
	public  ModelAndView  NewVehicleFormInsert() {
		return new ModelAndView ("NewVehicleFormInsert");
		
	}
	
	
	
	@RequestMapping("circledash")
	public  ModelAndView  circledash() {
		return new ModelAndView ("circledash");
		
	}
	
	@RequestMapping("routedev")
	public  ModelAndView  routedev() {
		return new ModelAndView ("rotedev");
	}
	
	@RequestMapping("dash")
	public  ModelAndView dash(Model model,@RequestParam String token){
		model.addAttribute("token", token);
		return new ModelAndView ("singlepage");
	}
	
	
	@RequestMapping("truckmov")
	public  ModelAndView  truckmov() {
		return new ModelAndView ("truckmov");
		
	}
	
	@RequestMapping("dealerreport")
	public  ModelAndView  dealerreport() {
		return new ModelAndView ("dealerreport");
		
	}
	
	@RequestMapping("minereport")
	public  ModelAndView  minereport() {
		return new ModelAndView ("minereport");
		
	}
	
	
	@RequestMapping("routewisetime")
	public  ModelAndView  routewisetime() {
		return new ModelAndView ("routewisetime");
		
	}
	
	public static long compareTwoTimeStampsseconds(java.sql.Timestamp currentTime, java.sql.Timestamp oldTime)
	{
	  long milliseconds1 = oldTime.getTime();
	  long milliseconds2 = currentTime.getTime();
	  long diff = milliseconds2 - milliseconds1;
	  long diffSeconds = diff / 1000;
	  long diffMinutes = diff / (60 * 1000);
	  long diffHours = diff / (60 * 60 * 1000);
	  long diffDays = diff / (24 * 60 * 60 * 1000);
      return diffSeconds;
	}
	@RequestMapping(value = "fileUpload", method = RequestMethod.POST)
	public Data continueFileUpload(HttpServletRequest request, HttpServletResponse response){
	        MultipartHttpServletRequest mRequest;
		String filename = "upload.xlsx";
		try {
		   mRequest = (MultipartHttpServletRequest) request;
		   mRequest.getParameterMap();

		   Iterator<String> itr = mRequest.getFileNames();
		   while (itr.hasNext()) {
		        MultipartFile mFile = mRequest.getFile(itr.next());
		        String fileName = mFile.getOriginalFilename();
		        System.out.println(fileName);
		              
		        java.nio.file.Path path = Paths.get("/home/nrdadb/" + filename);
		        Files.deleteIfExists(path);
		        InputStream in = mFile.getInputStream();
		        Files.copy(in, path);
			 }
		   } catch (Exception e) {
		        e.printStackTrace();
		   }
		return null;
		}
	@RequestMapping("testnew")
	public  ModelAndView  testnew(HttpServletRequest request) {
		return new ModelAndView ("NewFile");
	}
	@RequestMapping("ApprovalForm")
	public  ModelAndView  ApprovalForm(HttpServletRequest request) {
		return new ModelAndView ("ApprovalForm");
	}
	
	@RequestMapping("companyupdate")
	public  ModelAndView  getcompany1(HttpServletRequest request) {
		 String test2 = request.getSession().getServletContext().getRealPath("/");
		 System.out.println("path"+test2);
		return new ModelAndView ("CompanyFormUpdate");
		
	}
	
	@RequestMapping("DealerMap")
	public  ModelAndView  DealerMap() {
			return new ModelAndView ("DealerMap");
		
	}
	
	@RequestMapping("livestatus")
	public  ModelAndView  getlivestatus() {
		return new ModelAndView ("livestatus");
		
	}
	
	@RequestMapping("CustomerMap")
	public  ModelAndView  CustomerMap() {
			return new ModelAndView ("CustomerMap");
		
	}
	
	
	@RequestMapping("Nonpolling")
	public  ModelAndView  Nonpolling() {
			return new ModelAndView ("Nonpolling");
		
	}
	@RequestMapping("Devicestatistics")
	public  ModelAndView  Devicestatistics() {
			return new ModelAndView ("Devicestatistics");
		
	}
	
	
	
	@RequestMapping("companyinsert")
	public  ModelAndView  getform() {
		return new ModelAndView ("CompanyFormInsert");
		
	}
	
	
	@RequestMapping("Changepassword")
	public  ModelAndView  Changepassword() {
		return new ModelAndView ("Changepassword");
		
	}
	

	@RequestMapping("AlertsReport")
	public  ModelAndView  AlertReport() {
		return new ModelAndView ("AlertsReport");
		
	}
	
	@RequestMapping("LUStatusReport")
	public  ModelAndView  LUStatusReport() {
		return new ModelAndView ("LUStatusReport");
		
	}
	
	
	@RequestMapping("dashboard")
	public  ModelAndView  getdashboard() {
		return new ModelAndView ("dashboard");
		
	}
	
	@RequestMapping("RawData")
	public  ModelAndView  getrawdata() {
		return new ModelAndView ("RawData");
		
	}
	
	@RequestMapping("deviceupdate")
	public  ModelAndView  getdeviceupdate() {
		return new ModelAndView ("DeviceFormUpdate");
	}
	
	@RequestMapping("deviceinsert")
	public  ModelAndView  getdeviceinsert() {
		return new ModelAndView ("DeviceFormInsert");
		
	}
	
	@RequestMapping("simupdate")
	public  ModelAndView  getsimupdate() {
		return new ModelAndView ("SimFormUpdate");
	}
	
	@RequestMapping("siminsert")
	public  ModelAndView  getsiminsert() {
		return new ModelAndView ("SimFormInsert");
		
	}
	
	@RequestMapping("simassigninsert")
	public  ModelAndView  getsimassigninsert() {
		return new ModelAndView ("SimAssignInsert");
		
	}
	
	@RequestMapping("simassignupdate")
	public  ModelAndView  getsimassignupdate() {
		return new ModelAndView ("SimAssignUpdate");
		
	}
	
	@RequestMapping("mapall")
	public  ModelAndView  getmapall() {
		return new ModelAndView ("Map");
		
	}
	
	@RequestMapping("getlivevehicle")
	public  ModelAndView  getlive() {
		return new ModelAndView ("LiveSummary");
		
	}
	
	@RequestMapping("geofencereport")
	public  ModelAndView  geofencereport() {
		return new ModelAndView ("geofencereport");
		
	}
	
	@RequestMapping("test")
	public  ModelAndView  gettest() {
		return new ModelAndView ("NewFile4");
		
	}
	
	@RequestMapping("loadtest")
	public  ModelAndView  getloadtest() {
		return new ModelAndView ("test");
		
	}
	
	@RequestMapping("deviceassignupdate")
	public  ModelAndView  getDeviceAssignupdate() {
		return new ModelAndView ("vehicleassignupdate");
		
	}
	
	
	@RequestMapping("deviceassigninsert")
	public  ModelAndView  getDeviceAssigninsert() {
		return new ModelAndView ("vehicleassigninsert");
		
	}
	
	
	
	@RequestMapping("Logout")
	public  ModelAndView  getLogout() {
		System.out.println("Logout");
		Login = 0;
		return new ModelAndView ("Login");
		
	}
	
	

	@RequestMapping("VehicleFormUpdate")
	public  ModelAndView  getVehicle() {
		return new ModelAndView ("VehicleFormUpdate");
		
	}
	
	
	@RequestMapping("VehicleFormInsert")
	public  ModelAndView  getvehicleInsert() {
		return new ModelAndView ("VehicleFormInsert");
		
	}
	
	@RequestMapping("MakeFormUpdate")
	public  ModelAndView  getMake() {
		return new ModelAndView ("MakeFormUpdate");
		
	}
	
	@RequestMapping("MakeFormInsert")
	public  ModelAndView  getMakeInsert() {
		return new ModelAndView ("MakeFormInsert");
		
	}
	@RequestMapping("UserFormInsert")
	public  ModelAndView  getuserInsert() {
		return new ModelAndView ("UserFormInsert");
		
	}
	
	
	@RequestMapping("UserFormUpdate")
	public  ModelAndView  getuserupdate() {
		return new ModelAndView ("UserFormUpdate");
		
	}
	
	
	
	@RequestMapping("DealerFormUpdate")
	public  ModelAndView  getdealerupdate() {
		return new ModelAndView ("DealerFormUpdate");
		
	}
	
	
	@RequestMapping("DealerFormInsert")
	public  ModelAndView  getdealerInsert() {
		return new ModelAndView ("DealerFormInsert");
		
	}
	
	@RequestMapping("LiveSummary")
	public  ModelAndView  get() {
		return new ModelAndView ("LiveSummary");
		
	}
	
	
	@RequestMapping("NetworkFormUpdate")
	public  ModelAndView  getnetUpdate() {
		return new ModelAndView ("NetworkFormUpdate");
		
	}
	
	@RequestMapping("NetworkFormInsert")
	public  ModelAndView  getnetInsert() {
		return new ModelAndView ("NetworkFormInsert");
		
	}
	
	
	@RequestMapping("ModelFormInsert")
	public  ModelAndView  getmodelInsert() {
		return new ModelAndView ("ModelFormInsert");
		
	}
	
	@RequestMapping("ModelFormUpdate")
	public  ModelAndView  getmodelUpdate() {
		return new ModelAndView ("ModelFormUpdate");
		
	}
	
	@RequestMapping("VendorFormUpdate")
	public  ModelAndView  getvendorUpdate() {
		return new ModelAndView ("VendorFormUpdate");
		
	}
	
	@RequestMapping("VendorFormInsert")
	public  ModelAndView  getvendorInsert() {
		return new ModelAndView ("VendorFormInsert");
		
	}
	
	@RequestMapping("RoleFormUpdate")
	public  ModelAndView  getroleUpdate() {
		return new ModelAndView ("RoleFormUpdate");
		
	}
	
	@RequestMapping("RoleFormInsert")
	public  ModelAndView  getroleInsert() {
		return new ModelAndView ("RoleFormInsert");
		
	}
	
	@RequestMapping("MenuassignFormUpdate")
	public  ModelAndView  getmenuassignUpdate() {
		return new ModelAndView ("MenuAssignFormUpdate");
		
	}
	
	@RequestMapping("MenuassignFormInsert")
	public  ModelAndView  getmenuassignInsert() {
//		System.out.println("in insert menu assign");
		return new ModelAndView ("MenuAssingFormInsert");
		
	}
	
	@RequestMapping("AssetFormUpdate")
	public  ModelAndView  getAssetFormUpdate() {
//		System.out.println("in update AssetFormUpdate");
		return new ModelAndView ("AssetFormUpdate");
		
	}
	@RequestMapping("AssetFormInsert")
	public  ModelAndView  getAssetFormInsert() {
//		System.out.println("in insert AssetFormInsert");
		return new ModelAndView ("AssetFormInsert");
		
	}
	
	@RequestMapping("CustomerMasterFormInsert")
	public  ModelAndView  CustomerMasterForm() {
//		System.out.println("in insert CustomerMasterForm");
		return new ModelAndView ("CustomerMasterFormInsert");
		
	}
	@RequestMapping("CustomerMasterFormUpdate")
	public  ModelAndView  CustomerMasterFormUpdate() {
//		System.out.println("in insert CustomerMasterFormUpdate");
		return new ModelAndView ("CustomerMasterFormUpdate");
		
	}
	
	@RequestMapping("MenuFormUpdate")
	public  ModelAndView  MenuFormUpdate() {
		return new ModelAndView ("MenuFormUpdate");
	}
	

	@RequestMapping("MenuFormInsert")
	public  ModelAndView  MenuFormInsert() {
		return new ModelAndView ("MenuFormInsert");
	}
	@RequestMapping("DealerAssignFormInsert")
	public  ModelAndView  dealerassignFormInsert() {
		return new ModelAndView ("DealerAssignFormInsert");
	}
	@RequestMapping("DealerAssignFormUpdate")
	public  ModelAndView  dealerassignFormUpdate() {
		return new ModelAndView ("DealerAssignFormUpdate");
	}
	@RequestMapping("report")
	public  ModelAndView  reportForm() {
		return new ModelAndView ("Reports");
	}
	@RequestMapping("response")
	public  ModelAndView  responseForm() {
		return new ModelAndView ("Response");
	}
	
	@RequestMapping("vehiclesummaryreport")
	public  ModelAndView  vehiclesummaryreportForm() {
		return new ModelAndView ("vehiclesummary");
	}
	
	
	
	@RequestMapping("DeviceSaleFormUpdate")
	public  ModelAndView  DeviceSaleUpdate() {
		return new ModelAndView ("DeviceSaleFormUpdate");
	}
	
	
	@RequestMapping("Vehiclelivedetails")
	public  ModelAndView  Vehiclelivedetails() {
		return new ModelAndView ("Vehiclelivedetails");
	}
	
	
	
	@RequestMapping("ForgotPassword")
	public  ModelAndView  getforgotpass( Model model,@RequestParam String ownersid) {
		model.addAttribute("ownersid",ownersid);
		System.out.println("in forgot pass"+ownersid);
		return new ModelAndView ("ForgotPassword");
		
	}
	
	
	@RequestMapping("getmessage")
	public  String  getmessage(Model model,@RequestParam String jsonmsg,@RequestParam String queuename) {
		jsonmsg="{\"reactorKey\":\"QUEUE_8b89a1d6-303b-4fba-aa14-cd8befb135cd\",\"clientKey\":\"106.221.133.49:52929\",\"messageReceived\":\"Hello\"}";
		System.out.println("msg "+jsonmsg+"\n queuename "+queuename);
		
		VTSRabbitMQInfo info = new VTSRabbitMQInfo("209.190.15.18",5672, "takshak", "takshak", "/");
		VTSRabbitMQClient vtr = new VTSRabbitMQClient();
		vtr.initializeClient(info);
		vtr.publishMessage(jsonmsg,queuename);
		return "ok";
	}
	
	@RequestMapping("DealerDashboard")
	public  ModelAndView  DeviceDashboard() {
		return new ModelAndView ("DealerDashboard");
	}
	
	@RequestMapping("takshakdash")
	public  ModelAndView  takshakdash() {
		return new ModelAndView ("takshakdash");
	}
	
	
	@RequestMapping("forgot")
	public  ModelAndView  forgot() {
		return new ModelAndView ("forgot");
	}
	
	@RequestMapping("CustomerAssignFormInsert")
	public  ModelAndView  customerassignFormInsert() {
		return new ModelAndView ("CustomerAssignFormat");
	}
	@RequestMapping("CustomerAssignFormUpdate")
	public  ModelAndView  customerassignFormUpdate() {
		return new ModelAndView ("CustomerAssignFormUpdate");
	}
	@RequestMapping("VehicleDealerChange")
	public  ModelAndView  VehicleDealerChange() {
		return new ModelAndView ("VehicleDealerChange");
	}

	
	@RequestMapping("DayWiseAllvehiclesReport")
	public  ModelAndView  DayWiseAllvehiclesReport() {
		return new ModelAndView ("DayWiseAllvehiclesReport");
	}
	
	@RequestMapping("DaywiseVehicleReport")
	public  ModelAndView  DaywiseVehicleReport() {
		return new ModelAndView ("DaywiseVehicleReport");
	}
	
	@RequestMapping("Dealerdashnew")
	public  ModelAndView  Dealerdashnew() {
		return new ModelAndView ("Dealerdashnew");
	}
	@RequestMapping("adminDashboard")
	public  ModelAndView  adminDshboard() {
		return new ModelAndView ("adminDashboard");
	}
	
	@RequestMapping("map")
	public  String getLatLong(Model model,@RequestParam String vehicleno) {
		model.addAttribute("vehicleno", vehicleno );
		return "dashboardmap";
		
	}
	
	@RequestMapping("maptrack")
	public ModelAndView getMapTrack(Model model,@RequestParam String ownersid) {
		model.addAttribute("ownersid", ownersid);
//		System.out.println("hello");
		return new ModelAndView("MapTrack");
	}
	
	
	@RequestMapping("tripall")
	public ModelAndView tripall(Model model, @RequestParam String circle) {
		model.addAttribute("circle", circle);
		return new ModelAndView ("tripall");
	}
	
	
	@RequestMapping("tripmaprdev")
	public ModelAndView tripmaprdev(Model model,@RequestParam String vehicleno, @RequestParam String fromtime,  @RequestParam String totime,
			@RequestParam String rtime) {
		System.out.println(vehicleno+" "+fromtime+" "+totime);
		model.addAttribute("vehicleno", vehicleno);
		model.addAttribute("fromtime", fromtime);
		model.addAttribute("totime", totime);
		model.addAttribute("rtime", rtime);
		return new ModelAndView("tripMap");
	}
	
	
	@RequestMapping("tripmap")
	public ModelAndView tripmap(Model model,@RequestParam String vehicleno, @RequestParam String fromtime,  @RequestParam String totime) {
		System.out.println(vehicleno+" "+fromtime+" "+totime);
		model.addAttribute("vehicleno", vehicleno);
		model.addAttribute("fromtime", fromtime);
		model.addAttribute("totime", totime);
		return new ModelAndView("tripMap");
	}
	
	
	@RequestMapping(value = "/PostService", method = RequestMethod.POST)
	public @ResponseBody String PostService(@RequestBody List<historylog_details> det) {
		
 //System.out.println(det);
		 history = det;
		
		return "OK";
	}
	
	@RequestMapping("historydata")
	public @ResponseBody String getdata() {
		
//		 System.out.println(det);
		String json = new Gson().toJson(history);
		return json;
	}
	
	
	@RequestMapping("historymap")
	public ModelAndView historymap(Model model) {
//			System.out.println(history);
//		
//		    model.addAttribute("history", history);
			return new ModelAndView("historyMap");
	}
	
	
	@RequestMapping(value = "/SummaryService", method = RequestMethod.POST)
	public @ResponseBody String SummaryService(@RequestBody List<vehiclesummary> det) {
		
//		 System.out.println(det);
		 summary = det;
		
		return "OK";
	}
	
	@RequestMapping("summarydatadata")
	public @ResponseBody String summarydatadata() {
		
		String json = new Gson().toJson(summary);
		return json;
	}
	
	@RequestMapping("vehiclesummary")
	public ModelAndView getVehicleSummary(Model model,@RequestParam String vehicleno) {
		    
		    model.addAttribute("vehicleno", vehicleno);
			return new ModelAndView("vehiclesummaryM");
	}
	
	@RequestMapping("vehiclesummarysingle")
	public ModelAndView getVehicleSummarysing(Model model,@RequestParam String vehicleno,@RequestParam String tripid,
			@RequestParam String latitude,@RequestParam String longitude,@RequestParam String date) {
		    
		    model.addAttribute("vehicleno", vehicleno );
		    model.addAttribute("tripid", tripid );
		    model.addAttribute("latitude", latitude );
		    model.addAttribute("longitude", longitude );
		    model.addAttribute("date", date );
			return new ModelAndView("vehiclesummaryM");
	}

	
	@RequestMapping("bangloreimei")
	public ModelAndView bangloreimei(){
		return new ModelAndView("bangloreimei");
	}
	
	@RequestMapping("historylogs")
	public ModelAndView historylogs(){
		return new ModelAndView("historylogReport");
	}
	
	
	@RequestMapping("IdlehourReport")
	public ModelAndView IdlehourReport(){
		return new ModelAndView("IdlehourReport");
	}
	
	
		
	@RequestMapping("OverspeedReport")
	public ModelAndView OverspeedReport(){
		return new ModelAndView("OverspeedReport");
	}
	
	
	@RequestMapping("IgnitionReport")
	public ModelAndView IgnitionReport(){
		return new ModelAndView("IgnitionReport");
	}
	
	
	
	
	@RequestMapping("DealerdashLiveDetails")
	public  ModelAndView  getDealerLivedetails() {
		return new ModelAndView ("DealerdashLiveDetails");
		
	}
	

	@RequestMapping("CustomerLivedash")
	public  ModelAndView  CustomerLivedash() {
		return new ModelAndView ("CustomerLivedash");
		
	}
	
	
	@RequestMapping("login1")
	
	public @ResponseBody String validateLogin(@RequestParam("username") String user, @RequestParam("password") String password) {
		List<login_details> data = new ArrayList<login_details>();
		Connection con = null;
		try {
			System.out.println("hello");
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			String sqlselect4 = "select * from dblocator.login('" + user + "','" + password + "')";

			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
//			ml.loginid, ml.ownersid, md.contactperson, ml.roleid::text,
//			mc.companyid, mc.contactpersonname, ml.controlid
			while (rs4.next()) {
				login_details obj =new login_details();
				obj.setLoginid(rs4.getString(1));
				obj.setOwnersid(rs4.getString(2));
				obj.setOwnersname(rs4.getString(3));
				obj.setRoleid(rs4.getString(4));
				obj.setCompanyid(rs4.getString(5));
				obj.setCompanyname(rs4.getString(6));
				obj.setControlid(rs4.getString(7));
				
				java.util.Date dd = new java.util.Date();
				Timestamp tt = new Timestamp(dd.getTime());

				String str = obj.getOwnersname() + "&&" + obj.getCompanyid() + "&&" + obj.getLoginid() + "&&"
						+ obj.getCompanyname() + "&&" + obj.getControlid() + "&&" + tt.toLocaleString() + "&&"
						+ obj.getRoleid() + "&&" + obj.getOwnersid();
				
//				 obj.getOwnersname() + "&&" + obj.getCompanyid() + "&&" + obj.getLoginid() + "&&"
//						0									1							2
//				+ obj.getCompanyname() + "&&" + obj.getControlid() + "&&" + tt.toLocaleString() + "&&"
//						3									4							5
//				+ obj.getRoleid() + "&&" + obj.getOwnersid();
//						6						7
				String k = AESCrypt.encrypt(str);
				// System.out.println("key ="+k);
				k = k.replace("+", "nkm");
				obj.setKey(k);
				data.add(obj);
			}
			String json = new Gson().toJson(data);
			if (data.isEmpty()) {
				return json;
			} else {
				return json;
			}

		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close();
				// System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}


	// --------------------------------------select
	// Function-------------------------------------
	
	@RequestMapping("livevehicle")
	
	public @ResponseBody String getLuveVehicleDetails(@RequestParam("companyid") String companyid,@RequestParam("customerid") String customerid,
			@RequestParam("pageno") String pageno,@RequestParam("itemsPerPage") String itemsPerPage,@RequestParam("overspeedlimit")String overspeedlimit) {
		List<vts_Live_Vehicle> data = new ArrayList<vts_Live_Vehicle>();
		Connection con = null;
		long vgps = 0, ngps = 0, onig = 0, offig = 0,start=0,end=0;
		int count=0;
		try {
			System.out.println("overspeedlimit"+overspeedlimit);
			if(Integer.parseInt(pageno)!=1){
				start = Integer.parseInt(itemsPerPage) * (Integer.parseInt(pageno)-1);
				end = start + Integer.parseInt(itemsPerPage);
				start++;
			}else{
				start = 0;
				end = start + Integer.parseInt(itemsPerPage);
				start++;
			}
			String tablename = null;
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice live ");
			
			String sqlselect4 = "select * from dblocator.selectprocedure('selectlivevehicle', '" + companyid
					+ "', '"+customerid+"', '"+start+"', '"+end+"', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			System.out.println("livevh"+sqlselect4);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MMM-yyyy hh:mm a");
			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
			int indexno=1;
			while (rs4.next()) {

				vts_Live_Vehicle obj = new vts_Live_Vehicle();
//				lpp.reactorkey, lpp.updatedtimestamp, lpp.packettime, lpp.imeino, lpp.gpsstatus, lpp.packetdate+lpp.packettime, 
//				   lpp.latitude, lpp.longitude, lpp.vehiclespeed, lpp.gpsstatus, lpp.gpsstatus,mv.vehicleregno,
//				   lpp.gpsstatus, lpp.vehicledirection, md.deviceid,mt.vehicletypename,
//				   mss.mobilenumber,mc.customername,lpp.ignumber,lpp.temperstatus,
				obj.setRecordid(rs4.getString(1));
				java.util.Date parseTimestamp = sdf.parse(rs4.getString(2));
				//System.out.println("inn date"+rs4.getString(2));
				obj.setDatatimestamp(sdfnew.format(parseTimestamp));
				obj.setPackettype(rs4.getString(3));
				//System.out.println("inn pac"+rs4.getString(3));
				obj.setImeino(rs4.getString(4));
				//System.out.println("inn imeino"+rs4.getString(4));
				obj.setSequenceno(rs4.getString(5));
				//System.out.println("inn seq"+rs4.getString(5));
				obj.setGpsdatetime(rs4.getString(6));
				//System.out.println("inn gpsdate"+rs4.getString(6));
				obj.setLatitude(rs4.getString(7));
				//System.out.println("inn dlat"+rs4.getString(8));
				obj.setLongitude(rs4.getString(8));
				//System.out.println("inn dlon"+rs4.getString(8));
				Double speed = Double.parseDouble(rs4.getString(9));
				//System.out.println("inn speedte"+rs4.getString(9));
				// System.out.println("index = "+speed);
				obj.setVehiclespeed(String.valueOf(speed));
				obj.setCoarseoverground(rs4.getString(10));
				//System.out.println("inn coares"+rs4.getString(10));
				obj.setTracksatellite(rs4.getString(11));
				//System.out.println("inn trac"+rs4.getString(11));
				obj.setVehicleid(rs4.getString(12));
				//System.out.println("inn veh"+rs4.getString(12));
				try{
					obj.setLocation(getLocationClass.getLoc(Double.parseDouble(obj.getLatitude()),
					Double.parseDouble(obj.getLongitude())));
				}catch(Exception e){
				  //System.out.println(e);
				}
////			//	System.out.println("location = "+obj.getLocation()+"hello");
				if(obj.getLocation().equals("") || obj.getLocation().startsWith("Object")){
					obj.setLocation("Location Not Found");
				}
//			//	System.out.println("location = "+obj.getLocation());
				obj.setVehicledirection(reticon(rs4.getInt(14)));
				//System.out.println("inn dir"+rs4.getString(14));
				obj.setIgnumber(iginition(Integer.parseInt(rs4.getString(19))));
				//System.out.println("inn ign"+rs4.getString(19));
				String ign = rs4.getString(19);
				if(Double.parseDouble(obj.getVehiclespeed())>0.00){
					obj.setIgnumber(iginition(1));
					ign = "1";
				}else{
					obj.setIgnumber(iginition(0));
					ign = "0";
				}
				
				obj.setGpsstatus(GPS(rs4.getString(13)));
				//System.out.println("inn gpssts"+rs4.getString(13));
				
				obj.setDeviceid(rs4.getString(15));
				//System.out.println("devid"+rs4.getString(15));
				obj.setVehicletype(vehicletype(rs4.getString(16)));
				//System.out.println("inn type"+rs4.getString(16));
				try{
				obj.setMobileno(rs4.getString(17));
				//System.out.println("inn mobil"+rs4.getString(17));
				obj.setCustomername(rs4.getString(18));
				//System.out.println("inn cust"+rs4.getString(18));
				}catch(Exception e){
//					System.out.println(e);
				}
				parseTimestamp = sdfnew.parse(obj.getDatatimestamp());
				java.util.Date newdate = new java.util.Date();
//				long diffMinutes = compareTwoTimeStamps(new Timestamp(newdate.getTime()),
//						new Timestamp(parseTimestamp.getTime()));
//				System.out.println("ign = "+ign);
				if (ign.equals("1") && Double.parseDouble(obj.getVehiclespeed()) > 0.0 && rs4.getString(13).equals("1")) {
					obj.setVehiclestatus(vehiclestatus("Running"));
				} else {
					if (ign.equals("1") && Double.parseDouble(obj.getVehiclespeed()) == 0.0 && rs4.getString(13).equals("1")) {
						obj.setVehiclestatus(vehiclestatus("Halt"));
					} 
					else {
						obj.setVehiclestatus(vehiclestatus("Stop"));
					}
				}
//				obj.setVehiclespeed(obj.getVehiclespeed()+ " KM/Hr");
				count = Integer.parseInt(rs4.getString(20));
				//System.out.println("inn count"+rs4.getString(20));
				obj.setRowno(Integer.parseInt(rs4.getString(21)));
				//System.out.println("inn row"+rs4.getString(21));
				try
				{
				obj.setTemperstatus(gettemperStatus(rs4.getString(22)));
				//System.out.println("inn t"+rs4.getString(22));
				//System.out.println(gettemperStatus(rs4.getString(22)+""+obj.getTemperstatus()));
				}catch(Exception ex){}
				obj.setAc(getacStatus("0"));
				if(Double.parseDouble(obj.getVehiclespeed()) > Double.parseDouble(overspeedlimit))
				{
					obj.setOverspeed("Overspeed");
				}
				else
				{
					obj.setOverspeed("Normal");
				}
				indexno++;
				data.add(obj);
				
			}
			livedet det = new livedet();
			det.setData(data);
			det.setTotal_count(count);
			String json = new Gson().toJson(det);
			return json;
		} catch (Exception e) {
			System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("livevehiclebyname")
	
	public @ResponseBody String livevehiclebyname(@RequestParam("companyid") String companyid,@RequestParam("customerid") String customerid,
			@RequestParam("pageno") String pageno,@RequestParam("itemsPerPage") String itemsPerPage,@RequestParam("overspeedlimit")String overspeedlimit,@RequestParam("deviceid")String deviceid) {
		List<vts_Live_Vehicle> data = new ArrayList<vts_Live_Vehicle>();
		Connection con = null;
		long vgps = 0, ngps = 0, onig = 0, offig = 0,start=0,end=0;
		int count=0;
		try {
			System.out.println("overspeedlimit"+overspeedlimit);
			if(Integer.parseInt(pageno)!=1){
				start = Integer.parseInt(itemsPerPage) * (Integer.parseInt(pageno)-1);
				end = start + Integer.parseInt(itemsPerPage);
				start++;
			}else{
				start = 0;
				end = start + Integer.parseInt(itemsPerPage);
				start++;
			}
			String tablename = null;
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
System.out.println("Connected in websservice live ");
			
			String sqlselect4 = "select * from dblocator.selectprocedure('selectlivevehicleByName', '" + companyid
					+ "', '"+customerid+"', '"+start+"', '"+end+"', '"+deviceid+"', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			System.out.println("livevh"+sqlselect4);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MMM-yyyy hh:mm a");
			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
			int indexno=1;
			while (rs4.next()) {

				vts_Live_Vehicle obj = new vts_Live_Vehicle();
//				lpp.reactorkey, lpp.updatedtimestamp, lpp.packettime, lpp.imeino, lpp.gpsstatus, lpp.packetdate+lpp.packettime, 
//				   lpp.latitude, lpp.longitude, lpp.vehiclespeed, lpp.gpsstatus, lpp.gpsstatus,mv.vehicleregno,
//				   lpp.gpsstatus, lpp.vehicledirection, md.deviceid,mt.vehicletypename,
//				   mss.mobilenumber,mc.customername,lpp.ignumber,lpp.temperstatus,
				obj.setRecordid(rs4.getString(1));
				java.util.Date parseTimestamp = sdf.parse(rs4.getString(2));
				//System.out.println("inn date"+rs4.getString(2));
				obj.setDatatimestamp(sdfnew.format(parseTimestamp));
				obj.setPackettype(rs4.getString(3));
				//System.out.println("inn pac"+rs4.getString(3));
				obj.setImeino(rs4.getString(4));
				//System.out.println("inn imeino"+rs4.getString(4));
				obj.setSequenceno(rs4.getString(5));
				//System.out.println("inn seq"+rs4.getString(5));
				obj.setGpsdatetime(rs4.getString(6));
				//System.out.println("inn gpsdate"+rs4.getString(6));
				obj.setLatitude(rs4.getString(7));
				//System.out.println("inn dlat"+rs4.getString(8));
				obj.setLongitude(rs4.getString(8));
				//System.out.println("inn dlon"+rs4.getString(8));
				Double speed = Double.parseDouble(rs4.getString(9));
				//System.out.println("inn speedte"+rs4.getString(9));
				// System.out.println("index = "+speed);
				obj.setVehiclespeed(String.valueOf(speed));
				obj.setCoarseoverground(rs4.getString(10));
				//System.out.println("inn coares"+rs4.getString(10));
				obj.setTracksatellite(rs4.getString(11));
				//System.out.println("inn trac"+rs4.getString(11));
				obj.setVehicleid(rs4.getString(12));
				//System.out.println("inn veh"+rs4.getString(12));
				try{
					obj.setLocation(getLocationClass.getLoc(Double.parseDouble(obj.getLatitude()),
					Double.parseDouble(obj.getLongitude())));
				}catch(Exception e){
				  //System.out.println(e);
				}
//			//	System.out.println("location = "+obj.getLocation()+"hello");
				if(obj.getLocation().equals("") || obj.getLocation().startsWith("Object")){
					obj.setLocation("Location Not Found");
				}
//			//	System.out.println("location = "+obj.getLocation());
				obj.setVehicledirection(reticon(rs4.getInt(14)));
				//System.out.println("inn dir"+rs4.getString(14));
				obj.setIgnumber(iginition(Integer.parseInt(rs4.getString(19))));
				//System.out.println("inn ign"+rs4.getString(19));
				String ign = rs4.getString(19);
				if(Double.parseDouble(obj.getVehiclespeed())>0.00){
					obj.setIgnumber(iginition(1));
					ign = "1";
				}else{
					obj.setIgnumber(iginition(0));
					ign = "0";
				}
				
				obj.setGpsstatus(GPS(rs4.getString(13)));
				//System.out.println("inn gpssts"+rs4.getString(13));
				
				obj.setDeviceid(rs4.getString(15));
				//System.out.println("devid"+rs4.getString(15));
				obj.setVehicletype(vehicletype(rs4.getString(16)));
				//System.out.println("inn type"+rs4.getString(16));
				try{
				obj.setMobileno(rs4.getString(17));
				//System.out.println("inn mobil"+rs4.getString(17));
				obj.setCustomername(rs4.getString(18));
				//System.out.println("inn cust"+rs4.getString(18));
				}catch(Exception e){
//					System.out.println(e);
				}
				parseTimestamp = sdfnew.parse(obj.getDatatimestamp());
				java.util.Date newdate = new java.util.Date();
//				long diffMinutes = compareTwoTimeStamps(new Timestamp(newdate.getTime()),
//						new Timestamp(parseTimestamp.getTime()));
//				System.out.println("ign = "+ign);
				if (ign.equals("1") && Double.parseDouble(obj.getVehiclespeed()) > 0.0 && rs4.getString(13).equals("1")) {
					obj.setVehiclestatus(vehiclestatus("Running"));
				} else {
					if (ign.equals("1") && Double.parseDouble(obj.getVehiclespeed()) == 0.0 && rs4.getString(13).equals("1")) {
						obj.setVehiclestatus(vehiclestatus("Halt"));
					} 
					else {
						obj.setVehiclestatus(vehiclestatus("Stop"));
					}
				}
//				obj.setVehiclespeed(obj.getVehiclespeed()+ " KM/Hr");
				count = Integer.parseInt(rs4.getString(20));
				//System.out.println("inn count"+rs4.getString(20));
				obj.setRowno(Integer.parseInt(rs4.getString(21)));
				//System.out.println("inn row"+rs4.getString(21));
				try
				{
				obj.setTemperstatus(gettemperStatus(rs4.getString(22)));
				//System.out.println("inn t"+rs4.getString(22));
				//System.out.println(gettemperStatus(rs4.getString(22)+""+obj.getTemperstatus()));
				}catch(Exception ex){}
				obj.setAc(getacStatus("0"));
				if(Double.parseDouble(obj.getVehiclespeed()) > Double.parseDouble(overspeedlimit))
				{
					obj.setOverspeed("Overspeed");
				}
				else
				{
					obj.setOverspeed("Not Overspeed");
				}
				indexno++;
				data.add(obj);
				
			}
			livedet det = new livedet();
			det.setData(data);
			det.setTotal_count(count);
			String json = new Gson().toJson(det);
			return json;
		} catch (Exception e) {
			System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("sendcommand")
	
	public @ResponseBody String sendcommand(@RequestParam("imeino") String imeino) {
	 Connection con = null;
	 String mobno;
	 try{
	 	Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		System.out.println("Connected in websservice check user");

		// String sqlselect4="select vehicle_creation()";
//		String sqlselect4 = "select * from db_nrda_dborissa.dblocator.selectprocedure('selectForgotpassword', "
//				+ "'"+param+"', '', '', '', '', '', '', '', "
//				+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
//				+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

		String sqlselect4 = "select * from dblocator.selectprocedure('getmobno', '"
				+ imeino + "', '', '', '', '', '', '', '', "
				+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
				+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
	
		Statement st4 = con.createStatement();
		ResultSet rs4 = st4.executeQuery(sqlselect4);
		System.out.println("query"+sqlselect4);
		while(rs4.next()){
			mobno = rs4.getString(1);
			System.out.println("mobno"+mobno);
			com.pakt.sendcommand.sendcmd("8446819467");
		}
		String json = new Gson().toJson("command Send");
		return json;
	 }catch(Exception e){
		 System.out.println(e);
		 return "Command Not Send";
	 }
 }
	
	
	
	public String gettemperStatus(String temper){
		String temperstatus=null;
		 if(temper.equals("NNN")){
			 temperstatus="Normal";
			// temperstatus="resources/imagenew/temper.png";
	      }
		 else if(temper.equals("NTN")){
			 temperstatus="Box";
	      }
		 else if(temper.equals("SNN")){
			 temperstatus="Sim";
	      }
		 else if(temper.equals("NNB")){
			 temperstatus="Battery";
	      }
		 else
		 {
			 temperstatus="Tamper";
		     
		 }
		return(temperstatus);
	}
	



public String getacStatus(String ac){
	String acstatus=null;
	 if(ac.equals("0")){
		 acstatus="Not Connected";
		 
		 //acstatus="resources/imagenew/battery.png";
      }
	 else{
		 acstatus="Connected";
		// acstatus="resources/images/notass1.png";
      }
	return(acstatus);
}


	
	public static long compareTwoTimeStamps(java.sql.Timestamp currentTime, java.sql.Timestamp oldTime) {
		long milliseconds1 = oldTime.getTime();
		long milliseconds2 = currentTime.getTime();

		long diff = milliseconds2 - milliseconds1;
		long diffSeconds = diff / 1000;
		long diffMinutes = diff / (60 * 1000);
		long diffHours = diff / (60 * 60 * 1000);
		long diffDays = diff / (24 * 60 * 60 * 1000);

		return diffMinutes;
	}

//	
//	@RequestMapping("gpsdetails")
//	
//	public @ResponseBody String gpsDetails(@RequestParam("companyid") String companyid, @RequestParam("customerid") String customerid,@RequestParam("overspeed")String overspeed) {
//		long ovp = 0, vgps = 0, tamper=0,ngps = 0, onig = 0, offig = 0, total = 0, work = 0, nowork = 0, red = 0, yellow = 0, green = 0;
//		Connection con = null;
//		try {
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			Class.forName("org.postgresql.Driver");
//			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//			System.out.println("Connected in websservice gps details");
//			
//			String sqlselect4 = "select * from dblocator.selectprocedure('selectlivevehicle', '" + companyid
//					+ "', '"+customerid+"', '1', '69', '', '', '', '', "
//					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
//					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
//
//			Statement st4 = con.createStatement();
//			ResultSet rs4 = st4.executeQuery(sqlselect4);
//			// livevehicle obj ;
//			// recordid, datatimestamp, packettype, imeino, sequenceno,
//			// gpsdatetime,
//			// latitude, longitude, devicespeed, coarseoverground,
//			// tracksatellite
//			
//			while (rs4.next()) {
//
//				
//				vts_Live_Vehicle obj = new vts_Live_Vehicle();
//				// recordid, datatimestamp, packettype, imeino, vehicleid,
//				// gpsstatus,
//				// packetdate, packettime, latitude, latitudedirection,
//				// longitude,
//				// longitudedirection, vehiclespeed, vehicledirection,
//				// vehiclestatus,
//				// temperstatus, panicstatus, batteryvoltage, swversion, tripid,
//				// ignumber, checksum
//				obj.setRecordid(rs4.getString(1));
//				obj.setDatatimestamp(rs4.getString(2));
//				obj.setPackettype(rs4.getString(3));
//				obj.setImeino(rs4.getString(4));
//				obj.setSequenceno(rs4.getString(5));
//				obj.setGpsdatetime(rs4.getString(6));
//				obj.setLatitude(rs4.getString(7));
//				obj.setLongitude(rs4.getString(8));
//				obj.setVehiclespeed(rs4.getString(9));
//				obj.setCoarseoverground(rs4.getString(10));
//				obj.setTracksatellite(rs4.getString(11));
//				obj.setGpsstatus(rs4.getString(13));
////			//	System.out.println("val = "+obj.getGpsstatus());
//				
////					obj.setIgnumber(rs4.getString(19));
//				String ign = "0";
//				if(Double.parseDouble(obj.getVehiclespeed())>0.00){
//					obj.setIgnumber("1");
//					ign = "1";
//				}else{
//					obj.setIgnumber("0");
//					ign = "0";
//				}
//					if(Double.parseDouble(obj.getVehiclespeed())>Double.parseDouble(overspeed)){
//					      ovp++;	
//					}
//				
//					if(obj.getTemperstatus()!="NNN")
//					{
//						tamper++;
//					}
//					
////				obj.setGpsstatus("C");
//
//				if (obj.getGpsstatus().contains("0")) {
//					ngps++;
//				} else {
//					vgps++;
//				}
//
//				if (Integer.parseInt(obj.getIgnumber()) == 1) {
//					onig++;
//				} else {
//					offig++;
//				}
//				java.util.Date parseTimestamp = sdf.parse(obj.getGpsdatetime());
//				java.util.Date newdate = new java.util.Date();
//				// System.out.println("time = "+newdate+"
//				// "+obj.getDatatimestamp());
//				if ((parseTimestamp.getDate() == newdate.getDate()) && (parseTimestamp.getDay() == newdate.getDay())
//						&& (parseTimestamp.getYear() == newdate.getYear())) {
//					// System.out.println("data no ="+parseTimestamp.getTime()+"
//					// "+newdate.getTime());
//					work++;
//				} else {
//					// System.out.println("data ="+parseTimestamp.getTime()+"
//					// "+newdate.getTime());
//					nowork++;
//				}
//
//				// long diff = newdate.getTime() - parseTimestamp.getTime();
////				long diffMinutes = compareTwoTimeStamps(new Timestamp(newdate.getTime()),
////						new Timestamp(parseTimestamp.getTime()));
////				if (diffMinutes > 60 || rs4.getString(13).equals("0") || rs4.getString(19).equals("0")) {
////					red++;
////				} else {
////					if (Double.parseDouble(obj.getVehiclespeed()) == 0.00) {
////						yellow++;
////					} else {
////						green++;
////					}
////				}
//				
//				
//				if (ign.equals("1") && Double.parseDouble(obj.getVehiclespeed()) > 0.0 && rs4.getString(13).equals("1")) {
//					green++;
//				} else {
//					if (ign.equals("1") && Double.parseDouble(obj.getVehiclespeed()) == 0.0 && rs4.getString(13).equals("1")) {
//						yellow++;
//					} 
//					else {
//						red++;
//					}
//				}
//
//				total++;
//
//			}
//		//	System.out.println("data = " + vgps + " " + ngps + " " + onig + " " + offig + " " + green + " " + yellow + " " + red);
//			vt.setIgnitionoff(offig);
//			vt.setIgnitionon(onig);
//			vt.setValidgps(vgps);
//			vt.setInvalidgps(ngps);
//			vt.setTotalVehicles(total);
//			vt.setWorking_devices(work);
//			vt.setNot_working_devices(nowork);
//			vt.setGreen(green);
//			vt.setRed(red);
//			vt.setYellow(yellow);
//			vt.setAc(0);
//			vt.setTemper(tamper);
//			vt.setOverspeed(ovp);
//			return vt;
//		} catch (Exception e) {
//		 System.out.println(e);
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
//		} finally {
//			try {
//				con.close(); // System.out.println("connection closed");
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//	}
//	
	
	
	@RequestMapping("gpsdetails")
	
	public @ResponseBody String gpsDetails(@RequestParam("companyid") String companyid, @RequestParam("customerid") String customerid,@RequestParam("overspeed")String overspeed) {
		long ovp = 0, vgps = 0, tamper=0,ngps = 0, onig = 0, offig = 0, total = 0, work = 0, nowork = 0, red = 0, yellow = 0, green = 0;
		Connection con = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice gps details");
			
			String sqlselect4 = "select * from dblocator.selectprocedure('selectgpsdetails', '" + companyid
					+ "', '"+customerid+"', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
			// livevehicle obj ;
			// recordid, datatimestamp, packettype, imeino, sequenceno,
			// gpsdatetime,
			// latitude, longitude, devicespeed, coarseoverground,
			// tracksatellite
			
			while (rs4.next()) {

				
				vts_Live_Vehicle obj = new vts_Live_Vehicle();
				// recordid, datatimestamp, packettype, imeino, vehicleid,
				// gpsstatus,
				// packetdate, packettime, latitude, latitudedirection,
				// longitude,
				// longitudedirection, vehiclespeed, vehicledirection,
				// vehiclestatus,
				// temperstatus, panicstatus, batteryvoltage, swversion, tripid,
				// ignumber, checksum
				obj.setRecordid(rs4.getString(1));
				obj.setDatatimestamp(rs4.getString(2));
				obj.setPackettype(rs4.getString(3));
				obj.setImeino(rs4.getString(4));
				obj.setSequenceno(rs4.getString(5));
				obj.setGpsdatetime(rs4.getString(6));
				obj.setLatitude(rs4.getString(7));
				obj.setLongitude(rs4.getString(8));
				obj.setVehiclespeed(rs4.getString(9));
				obj.setCoarseoverground(rs4.getString(10));
				obj.setTracksatellite(rs4.getString(11));
				obj.setGpsstatus(rs4.getString(13));
				obj.setTemperstatus(rs4.getString(20));
				
				
//					obj.setIgnumber(rs4.getString(19));
					String ign = "0";
					if(Double.parseDouble(obj.getVehiclespeed())>0.00){
						obj.setIgnumber("1");
						ign = "1";
					}else{
						obj.setIgnumber("0");
						ign = "0";
					}
//					System.out.println("val = "+obj.getTemperstatus()+" "+overspeed);
					if(Double.parseDouble(obj.getVehiclespeed())>Double.parseDouble(overspeed)){
					      ovp++;	
					}
				
					if(obj.getTemperstatus()!="NNN")
					{
						tamper++;
					}
					
//				obj.setGpsstatus("C");

				if (obj.getGpsstatus().contains("0")) {
					ngps++;
				} else {
					vgps++;
				}

				if (Integer.parseInt(obj.getIgnumber()) == 1) {
					onig++;
				} else {
					offig++;
				}
				java.util.Date parseTimestamp = sdf.parse(obj.getGpsdatetime());
				java.util.Date newdate = new java.util.Date();
				// System.out.println("time = "+newdate+"
				// "+obj.getDatatimestamp());
				if ((parseTimestamp.getDate() == newdate.getDate()) && (parseTimestamp.getDay() == newdate.getDay())
						&& (parseTimestamp.getYear() == newdate.getYear())) {
					work++;
				} else {

					nowork++;
				}

				
				
				if (ign.equals("1") && Double.parseDouble(obj.getVehiclespeed()) > 0.0 && rs4.getString(13).equals("1")) {
					green++;
				} else {
					if (ign.equals("1") && Double.parseDouble(obj.getVehiclespeed()) == 0.0 && rs4.getString(13).equals("1")) {
						yellow++;
					} 
					else {
						red++;
					}
				}

				total++;

			}
		//	System.out.println("data = " + vgps + " " + ngps + " " + onig + " " + offig + " " + green + " " + yellow + " " + red);
			vt.setIgnitionoff(offig);
			vt.setIgnitionon(onig);
			vt.setValidgps(vgps);
			vt.setInvalidgps(ngps);
			vt.setTotalVehicles(total);
			vt.setWorking_devices(work);
			vt.setNot_working_devices(nowork);
			vt.setGreen(green);
			vt.setRed(red);
			vt.setYellow(yellow);
			vt.setAc(0);
			vt.setTemper(tamper);
			vt.setOverspeed(ovp);
			String json = new Gson().toJson(vt);
			return json;
		} catch (Exception e) {
		 System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	

	
	
	@RequestMapping("dailyreportDetails")
	
	public @ResponseBody String dailyreportDetails(@RequestParam("vehicleno") String vehicleno,
			@RequestParam("fdate") String fdate,@RequestParam("tdate") String tdate,
			@RequestParam("loginid1") String loginid1) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
	//System.out.println("Connected in websservice daily details summary");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// devicemapid,dealerid, dealername,
			// deviceid,devicename,salecost, credit_money, payement_mode
			String sqlselect4 = "select * from dblocator.getdailyreport('"+vehicleno+"','"+fdate+"',"
					+ "'"+tdate+"','"+loginid1+"')";
			System.out.println(sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
//			//	System.out.println(" rs = "+rs);
				return "ok";
			} else {
				return "error";
			}

		}

		catch (Exception e) {
		//System.out.println("indeat"+e);
			return "error";
		} finally {
			try {
				con.close(); //System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	@RequestMapping("dailyreport")
	
	public @ResponseBody String dailyreport() {
	List<DailyReport_details> data = new ArrayList<DailyReport_details>();
	Connection con = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice ");
//			selectvstop
			String sqlselect4 = "select * from dblocator.selectprocedure('selectdailyreport', '"
					+ "', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
			String vno = "h";  int i =0;int k=0;
			String dist="";
			while (rs4.next()) {
try
{
				
				DailyReport_details obj = new DailyReport_details();
				if(i==0){
					obj.setVehicleno(rs4.getString(1));
				}
				if(!vno.equals(rs4.getString(1))&& !dist.equals(rs4.getString(4))){
					obj.setVehicleno(rs4.getString(1));
					obj.setTotal(String.valueOf(Math.round(Double.parseDouble(rs4.getString(4)) * 100.0) / 100.0));
				}else{
					obj.setVehicleno("");
				}
			
				
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MM-yyyy");
				java.util.Date parseTimestamp = sdf1.parse(rs4.getString(2));
//				dd.setDatereceived(sdfnew.format(parseTimestamp));
//				dd.setTrackdate(parseTimestamp.toLocaleString());
				obj.setTodate(sdfnew.format(parseTimestamp));
				//obj.setTodate(rs4.getString(2));
				obj.setDistance(String.valueOf(Math.round(Double.parseDouble(rs4.getString(3)) * 100.0) / 100.0));
				data.add(obj);
				vno=rs4.getString(1);
				dist=String.valueOf(Math.round(Double.parseDouble(rs4.getString(4)) * 100.0) / 100.0);
				i++;
//			System.out.println(rs4.getString(1)+""+rs4.getString(2)+""+rs4.getString(3)+""+rs4.getString(4));
}catch(Exception ex){System.out.println(ex);}
}
			String json = new Gson().toJson(data);
			if(data.isEmpty()){
				//System.out.println("empty data");
				return json;
			}else{
//				System.out.println("data = "+data);
				return json;
			}
			
		} catch (Exception e) {
			System.out.println("e1"+e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
//	@RequestMapping("vehiclesummaryreport")
//	
//	public @ResponseBody String vehiclesummaryDetails() {
////		if(vehicleSummaryReport(deviceid, fromdate, todate, fromtime, totime).equals("ok"))
//		List<vehiclesummary> data = new ArrayList<vehiclesummary>();
////		String retval = vehicleSummaryReport(deviceid, fromdate, todate, fromtime, totime);
////	//	System.out.println(retval+"\n"+"values  ="+deviceid+" "+fromdate+" "+todate+" "+totime+" "+fromtime);
//		Connection con = null;
//		try {
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//			Class.forName("org.postgresql.Driver");
//			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//		//	System.out.println("Connected in websservice ");
////			selectvstop
//			String sqlselect4 = "select * from dblocator.selectprocedure('selectvstop', '"
//					+ "', '', '', '', '', '', '', '', "
//					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
//					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
//			System.out.println(sqlselect4);
//			Statement st4 = con.createStatement();
//			ResultSet rs4 = st4.executeQuery(sqlselect4);
//			// livevehicle obj ;
//			// recordid, datatimestamp, packettype, imeino, sequenceno,
//			// gpsdatetime,
//			// latitude, longitude, devicespeed, coarseoverground,
//			// tracksatellite
//			while (rs4.next()) {
//
////		   unitid, tripid, latitude, longitude, mindatereceived, mintimereceived, 
////	       maxdatereceived, maxtimereceived, datdiffer, timdiffer, stop, 
////	       ntown, nvillage, ncity, companyid
//				
////		MinDateReceived, MaxDateReceived, MinTimeReceived, MaxTimeReceived, TripID, Latitude, Longitude,     
////        Stop, ntoWN, NCITY
//				try{
//				vehiclesummary obj = new vehiclesummary();
//				obj.setMindatereceived(rs4.getString(1));
//				obj.setMaxdatereceived(rs4.getString(2));
//				obj.setMintimereceived(rs4.getString(3));
//				obj.setMaxtimereceived(rs4.getString(4));
//				obj.setTripid(rs4.getString(5));
//				obj.setLatitude(rs4.getString(6));
//				obj.setLongitude(rs4.getString(7));
//				obj.setStop(rs4.getString(8));
//				try{
//					obj.setLocation(getLocationClass.getLoc(Double.parseDouble(obj.getLatitude()),
//						Double.parseDouble(obj.getLongitude())));
//				}catch(Exception e){
//				  System.out.println(e);
//				}
//				if(obj.getLocation().equals("") || obj.getLocation().startsWith("Object")){
//					obj.setLocation("Location Not Found");
//				}
////				obj.setNtown(rs4.getString(8+1));
////				obj.setNcity(rs4.getString(9+1));
//				obj.setDistance(rs4.getString(11));
//				data.add(obj);
//				}catch(Exception e){
//					System.out.println(e);
//				}
//				
//			}
//			String json = new Gson().toJson(data);
//			if(data.isEmpty()){
//				//System.out.println("in if");
//				return json;
//			}else{
//				//System.out.println("in else");
//				return json;
//			}
//			
//		} catch (Exception e) {
//		  System.out.println(e);
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
//		} finally {
//			try {
//				con.close(); // System.out.println("connection closed");
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//	}
	
	
	
	
	
	@RequestMapping("vehiclesummarydetails")
	
	public @ResponseBody String vehicleSummaryReport(@RequestParam("deviceid") String deviceid,
			@RequestParam("todate") String todate,@RequestParam("fromtime") String fromtime,
			@RequestParam("fromdate") String fromdate,@RequestParam("totime") String totime) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehicle summary");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// devicemapid,dealerid, dealername,
			// deviceid,devicename,salecost, credit_money, payement_mode

			String sqlselect4 = "select dblocator.latestfndaysummary('"+deviceid+"','"+fromdate+"',"
					+ "'"+fromtime+"','"+totime+"','"+fromdate+"')";
			System.out.println(sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			
			if (rs) {
				System.out.println(" rs = "+rs);
				return "ok";
			} else {
				return "error";
			}

		}

		catch (Exception e) {
		 // System.out.println(e);
			return "error";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	
	
	//
	
	@RequestMapping("devicecount")
	
	public @ResponseBody String selectdeviceid(@RequestParam("count") String count,@RequestParam("modelid") String modelid,
			@RequestParam("dealerid") String dealerid) {
		List<device_details> data = new ArrayList<device_details>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//			 System.out.println("Connected in websservice deviceIDdetails count ");
			
				String sqlselect4 = "select * from dblocator.selectprocedure('selectdeviceCount', '"
						+ modelid + "', '"+dealerid+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				
//				System.out.println(sqlselect4);
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
			
				boolean avail=false;;
			
			
//			i
//				// deviceid, makeid, modelid, uniqueid, loginid, datetimestamp,
//				// remark, flag, companyid, assetid, available, vendorid
			while (rs4.next()) {
					try {
						device_details obj=new device_details();
						obj.setCountno(Integer.parseInt(rs4.getString(1)));
						data.add(obj);
						int devicecount= obj.getCountno();
					//	System.out.println("count devicecount"+devicecount);
						if(devicecount >=Integer.parseInt(count))
						{
					//	System.out.println("success model");
					
						// deviceiddetails(modelid);
						return "{\"success\": true,\"error_code\": 200}";
						}
						else
						{
						//	System.out.println("not Avialiable");
							return "{\"success\": false,\"error\": \"Devices Not Available\",\"error_code\": 404}";
						}
						
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
		}
			
			return "{\"success\": true,\"error_code\": 200}";
			
		
		} catch (Exception e) {
		  //System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	@RequestMapping("devicecountcustomer")
	
	public @ResponseBody String selectdeviceidcustomer(@RequestParam("count") String count,@RequestParam("modelid") String modelid,
			@RequestParam("loginid") String loginid) {
		List<device_details> data = new ArrayList<device_details>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//			 System.out.println("Connected in websservice deviceIDdetails count ");
			
				String sqlselect4 = "select * from dblocator.selectprocedure('selectdeviceCountcustomer', '"
						+ modelid + "', '"+loginid+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			//	System.out.println(sqlselect4);
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
			
				boolean avail=false;;
			
			
//			i
//				// deviceid, makeid, modelid, uniqueid, loginid, datetimestamp,
//				// remark, flag, companyid, assetid, available, vendorid
			while (rs4.next()) {
					try {
						device_details obj=new device_details();
						obj.setCountno(Integer.parseInt(rs4.getString(1)));
						data.add(obj);
						int devicecount= obj.getCountno();
					//	System.out.println("count devicecount"+devicecount);
						if(devicecount >=Integer.parseInt(count))
						{
					//	System.out.println("success model");
					
						// deviceiddetails(modelid);
						return "{\"success\": true,\"error_code\": 200}";
						}
						else
						{
						//	System.out.println("not Avialiable");
							return "{\"success\": false,\"error\": \"Devices Not Available\",\"error_code\": 404}";
						}
						
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
		}
			
			return "{\"success\": true,\"error_code\": 200}";
			
		
		} catch (Exception e) {
		 // System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	@RequestMapping("devicemanager")
	
	public @ResponseBody String devicemanager() {
		List<devicemanager> data = new ArrayList<devicemanager>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//			 System.out.println("Connected in websservice deviceIDdetails count ");
			
				String sqlselect4 = "select * from dblocator.selectprocedure('selectdevicemanager', '"
						+ "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			//	System.out.println(sqlselect4);
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
			
				boolean avail=false;;
			
			
//			i
//				// deviceid, makeid, modelid, uniqueid, loginid, datetimestamp,
//				// remark, flag, companyid, assetid, available, vendorid
			while (rs4.next()) {
					try {
						devicemanager obj=new devicemanager();
						obj.setImeino(rs4.getString(1));
						obj.setReactorkey(rs4.getString(2));
						obj.setClientkey(rs4.getString(3));
						obj.setTimestmp(rs4.getString(4));
						data.add(obj);
						
						
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
		}
			String json = new Gson().toJson(data);
			return json;
			
		
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	@RequestMapping("rawdata")
	
	public @ResponseBody String selectRawData(@RequestParam("pageno") String pageno,
			@RequestParam("itemsPerPage") String itemsPerPage,@RequestParam("imeino") String imeino) {
		List<rawdata> data = new ArrayList<rawdata>();
		Connection con = null;
		int start=0,end=0,count=0;
		try {
			
			if(Integer.parseInt(pageno)!=1){
				start = Integer.parseInt(itemsPerPage) * (Integer.parseInt(pageno)-1);
				end = start + Integer.parseInt(itemsPerPage);
				start++;
			}else{
				start = 0;
				end = start + Integer.parseInt(itemsPerPage);
				start++;
			}
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//			 System.out.println("Connected in websservice deviceIDdetails count ");
			
				String sqlselect4 = "select * from dblocator.selectprocedure('selectRawData2', '"
						+  start+"', '"+end+"', '"+imeino+"', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
				System.out.println(sqlselect4);
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
			
				boolean avail=false;;
			
			
//			i
//				recordid, datatimestamp, datamessage, clientfqdn, clientport
				while (rs4.next()) {
					try {
						rawdata obj = new rawdata();
						obj.setRecordid(rs4.getString(1));
						
						java.util.Date parseTimestamp = sdf.parse(rs4.getString(2));
						obj.setDatatimestamp(sdfnew.format(parseTimestamp).toString());
						obj.setDatamessage(rs4.getString(3));
						obj.setClientfqdn(rs4.getString(4));
						obj.setClientport(rs4.getString(5));
						count = Integer.parseInt(rs4.getString(6));
						data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
				rawdet rr =new rawdet();
				rr.setData(data);
				rr.setTotal_count(count);
			//System.out.println("values"+data);
				String json = new Gson().toJson(rr);
			return json;
			
		
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	@RequestMapping("deviceIddetails")
	
	public @ResponseBody String deviceiddetails(@RequestParam("modelid") String modelid) {
		List<device_details> data = new ArrayList<device_details>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			 System.out.println("Connected in websservice deviceIDdetails ");
			
				String sqlselect4 = "select * from dblocator.selectprocedure('selectdeviceid', '"
						+ modelid + "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				
			
				// deviceid, makeid, modelid, uniqueid, loginid, datetimestamp,
				// remark, flag, companyid, assetid, available, vendorid
				while (rs4.next()) {
					try {
						device_details obj = new device_details();
						obj.setDeviceid(Long.parseLong(rs4.getString(1)));
						obj.setUniqueid(rs4.getString(2));
						data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
		//	System.out.println("values"+data);
				String json = new Gson().toJson(data);
			return json;
		} catch (Exception e) {
		  //System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	@RequestMapping("getallvehicles")
	
	public @ResponseBody String aalVehicleDetails(@RequestParam("ownersid") String ownersid) {
		List<DataReceived_Dump1> data = new ArrayList<DataReceived_Dump1>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//			 System.out.println("ownersid = "+ownersid);
			
				String sqlselect4 = "select * from dblocator.selectprocedure('selectallvehicles', '"
						+ ownersid+ "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
				
				// deviceid, makeid, modelid, uniqueid, loginid, datetimestamp,
				// remark, flag, companyid, assetid, available, vendorid
				while (rs4.next()) {
					
					try {
//						lpp.recordid, lpp.datatimestamp, lpp.packettype, lpp.imeino, lpp.packetdate, lpp.packettime, 
//							0				1					2				3				4				5
//						lpp.latitude, lpp.longitude, lpp.vehiclespeed, lpp.temperstatus, lpp.checksum,mv.vehicleregno 
//							6					7			8					9					10					11
							
						if (rs4.getDouble(6+1) > 0 && rs4.getDouble(7+1) > 0) {
							DataReceived_Dump1 dd = new DataReceived_Dump1();
							dd.setUnitid(rs4.getString(3+1));
							dd.setVehical_no(rs4.getString(11+1));
							SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss a");
							java.util.Date parseTimestamp = sdf1.parse(rs4.getString(1+1));
							dd.setDatereceived(sdfnew.format(parseTimestamp));
							dd.setTrackdate(parseTimestamp.toLocaleString());
							dd.setLatitude(rs4.getString(6+1));
							dd.setLongitude(rs4.getString(7+1));
							dd.setSpeed(rs4.getDouble(8+1));
							dd.setHeadings(getDir(rs4.getInt(13)));
							dd.setGpsstatus(getGPS(rs4.getString(14)));
							dd.setIgnnumber(getIGN(rs4.getString(15)));
							dd.setLocation(getLocationClass.getLoc(Double.parseDouble(dd.getLatitude()), Double.parseDouble(dd.getLongitude())));
							data.add(dd);
						}
						
						
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
				String json = new Gson().toJson(data);
			return json;
		} catch (Exception e) {
		 // System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public String getIGN(String val){
		if(val.equals("1")){
			return "ON";
		}else{
			return "OFF";
		}
	}
	
	public String getGPS(String val){
		if(val.equals("1")){
			return "VALID";
		}else{
			return "INVALID";
		}
	}
	
	public String getDir(int head){
		  String dir;
		  if(head>=345 && head<15){
		      dir="North";
		  }
		  else if(head>=15 && head<45){
		      dir="North-West";
		  }
		  else if(head>=45 && head<75){
		      dir="North-West";
		  }
		  else if(head>=75 && head<150){
		      dir="West";
		  }
		  else if(head>=105 && head<135){
		       dir="South-West";
		  }
		  else if(head>=135 && head<165){
		      dir="South-West";
		  }
		  else if(head>=165 && head<195){
		      dir="South";
		  }
		  else if(head>=195 && head<225){
		      dir="South-East";
		  }
		  else if(head>=225 && head<255){
		      dir="South-East";
		  }
		  else if(head>=255 && head<285){
		      dir="East";
		  }
		  else if(head>=285 && head<315){
		      dir="North-East";
		  }
		  else if(head>=315 && head<345){
		      dir="North-East";
		  }
		  else {
		      dir="North";
		  }
		  return(dir);
		}

	
	
	
	@RequestMapping("getlivevehicles")
	
	public @ResponseBody String liveVehicleDetails(@RequestParam("vehicleno") String vehicleno) {
		List<DataReceived_Dump1> data = new ArrayList<DataReceived_Dump1>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			// System.out.println("Connected in websservice device "+vehicleno);
			
				String sqlselect4 = "select * from dblocator.selectprocedure('selectvehiclelive', '"
						+ vehicleno+ "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				
//			//	System.out.println(sqlselect4);
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
				
				// deviceid, makeid, modelid, uniqueid, loginid, datetimestamp,
				// remark, flag, companyid, assetid, available, vendorid
				while (rs4.next()) {
					
					try {
//						lpp.recordid, lpp.datatimestamp, lpp.packettype, lpp.imeino, lpp.packetdate, lpp.packettime, 
//							0				1					2				3				4				5
//						lpp.latitude, lpp.longitude, lpp.vehiclespeed, lpp.temperstatus, lpp.checksum,mv.vehicleregno 
//							6					7			8					9					10					11

						if (rs4.getDouble(6+1) > 0 && rs4.getDouble(7+1) > 0) {
							DataReceived_Dump1 dd = new DataReceived_Dump1();
							dd.setUnitid(rs4.getString(3+1));
							dd.setVehical_no(rs4.getString(11+1));
							SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss a");
							java.util.Date parseTimestamp = sdf1.parse(rs4.getString(1+1));
							dd.setDatereceived(sdfnew.format(parseTimestamp));
							dd.setTrackdate(parseTimestamp.toLocaleString());
							dd.setLatitude(rs4.getString(6+1));
							dd.setLongitude(rs4.getString(7+1));
							dd.setSpeed(rs4.getDouble(8+1));
							dd.setHeadings(getDir(rs4.getInt(13)));
							dd.setGpsstatus(getGPS(rs4.getString(14)));
							dd.setIgnnumber(getIGN(rs4.getString(15)));
							dd.setLocation(getLocationClass.getLoc(Double.parseDouble(dd.getLatitude()), Double.parseDouble(dd.getLongitude())));
							data.add(dd);
						}
						
						
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
				String json = new Gson().toJson(data);
			return json;
		} catch (Exception e) {
		  //System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	@RequestMapping("gethistoryvehicles")
	
	public @ResponseBody String historyVehicleDetails(@RequestParam("vehicleno") String vehicleno,
			@RequestParam("date") String date, @RequestParam("time1") String time1,
			@RequestParam("time2") String time2) {
		List<DataReceived_Dump1> data = new ArrayList<DataReceived_Dump1>();
		Connection con = null;
		try {
			
			SimpleDateFormat dateFormat = new SimpleDateFormat(
		            "dd-MMM-yyyy HH:mm:ss");

		    Date parsedTimeStamp = dateFormat.parse(date+" "+time1);
		    Date parsedTimeStamp1 = dateFormat.parse(date+" "+time2);

		    Timestamp timest1 = new Timestamp(parsedTimeStamp.getTime());
		    Timestamp timest2 = new Timestamp(parsedTimeStamp1.getTime());
			
			
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			// System.out.println("Connected in websservice device ");
			
				String sqlselect4 = "select * from dblocator.selectprocedure('selectvehiclehistory', '"
						+ vehicleno+ "', '"+timest1+"', '"+timest2+"', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
				
				// deviceid, makeid, modelid, uniqueid, loginid, datetimestamp,
				// remark, flag, companyid, assetid, available, vendorid
				while (rs4.next()) {
					
					try {
//						lpp.recordid, lpp.datatimestamp, lpp.packettype, lpp.imeino, lpp.packetdate, lpp.packettime, 
//							0				1					2				3				4				5
//						lpp.latitude, lpp.longitude, lpp.vehiclespeed, lpp.temperstatus, lpp.checksum,mv.vehicleregno 
//							6					7			8					9					10					11

						if (rs4.getDouble(6+1) > 0 && rs4.getDouble(7+1) > 0 && rs4.getDouble(8+1) > 0) {
							DataReceived_Dump1 dd = new DataReceived_Dump1();
							dd.setUnitid(rs4.getString(3+1));
							dd.setVehical_no(rs4.getString(11+1));
							SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss a");
							java.util.Date parseTimestamp = sdf1.parse(rs4.getString(1+1));
							dd.setDatereceived(sdfnew.format(parseTimestamp));
							dd.setTrackdate(parseTimestamp.toLocaleString());
							dd.setLatitude(rs4.getString(6+1));
							dd.setLongitude(rs4.getString(7+1));
							dd.setSpeed(rs4.getDouble(8+1));
							dd.setHeadings(getDir(rs4.getInt(13)));
							dd.setGpsstatus(getGPS(rs4.getString(14)));
							dd.setIgnnumber(getIGN(rs4.getString(15)));
//							dd.setLocation(getLocationClass.getLoc(Double.parseDouble(dd.getLatitude()), Double.parseDouble(dd.getLongitude())));
							data.add(dd);
						}
						
						
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
				
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	@RequestMapping("devicedetails")
	
	public @ResponseBody String deviceDetails(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("searchBydeviceno")String searchBydeviceno) {
		List<device_details> data = new ArrayList<device_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice device ");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
			if(searchBydeviceno==null)
			{
				searchBydeviceno="";
				
			}
				String sqlselect4 = "select * from dblocator.selectprocedure('selectBCUDevice', '"
						+ loginid + "', '"+searchBydeviceno+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				
				System.out.println(sqlselect4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
//			//	System.out.println("flag = " + flag);
				// deviceid, makeid, modelid, uniqueid, loginid, datetimestamp,
				// remark, flag, companyid, assetid, available, vendorid
				
//				d.deviceid, d.makeid,d.modelid,d.uniqueid, d.loginid, d.datetimestamp, d.remark, d.flag,
//		        m.makename,mk.modelname,d.status_sim,d.status_veh, mda.status, d.status_customer,mpd.flag
				while (rs4.next()) {
					
					try {
//						System.out.println("in rs");
						device_details obj = new device_details();
						obj.setDeviceid(Long.parseLong(rs4.getString(1)));
						obj.setMakeid(Long.parseLong(rs4.getString(2)));
						obj.setModelid(Long.parseLong(rs4.getString(3)));
						obj.setUniqueid(rs4.getString(4));
						obj.setLoginid(Long.parseLong(rs4.getString(5)));
						obj.setDatetimestamp(rs4.getString(6));
						obj.setRemark(rs4.getString(7));
						// obj.setFlag(Integer.parseInt(rs4.getString(7)));
						int flag1 = Integer.parseInt(rs4.getString(8));
//						System.out.println("in flag"+flag1);
						if(flag1 == 0)
						{
						obj.setDevice_status("Active");	
						}
						else
						{
							obj.setDevice_status("InActive");
						}
						obj.setMakename(rs4.getString(9));
						obj.setModelname(rs4.getString(10));
						String status = rs4.getString(11);
						obj.setRowno(indexno);
						indexno++;
						if (status.equals("1")) {
							obj.setStatussim("Sim Assigned");
						} else {
							obj.setStatussim("Sim Not Assigned");
						}

						status = rs4.getString(12);
						if (status.equals("1")) {
							obj.setStatusvehicle("Assigned to Vehicle");
						} else {
							obj.setStatusvehicle("Not  Assigned to Vehicle");
						}
						obj.setStatus(rs4.getString(13));
						obj.setStatus_customer(rs4.getString(14));
						int flag = Integer.parseInt(rs4.getString(15));
						if (flag == 1) {
							obj.setFlag("false");
						} else {
							obj.setFlag("true");
						}
						try
						{
						String poling=rs4.getString(16);
						if(poling!=null)
						{
							obj.setPolling_status("Polling");
						}else
						{
							//System.out.println("in else");
							obj.setPolling_status("Not Polling");
						}
						}catch(Exception er){}
						data.add(obj);
					} catch (Exception e) {
						System.out.println("err = " + e);
					}
				}
				
				
				
				 
				
				
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
		 	return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	@RequestMapping("searchByDeviceid")
	
	public @ResponseBody String searchByDeviceid(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("deviceid")String deviceid) {
		List<device_details> data = new ArrayList<device_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			 System.out.println("Connected in websservice serchbydevice ");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				String sqlselect4 = "select * from dblocator.selectprocedure('selectSearchByDeviceid', '"
						+ loginid + "', '"+deviceid+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			
				System.out.println("query  "+sqlselect4);
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
//			//	System.out.println("flag = " + flag);
				// deviceid, makeid, modelid, uniqueid, loginid, datetimestamp,
				// remark, flag, companyid, assetid, available, vendorid
				
//				d.deviceid, d.makeid,d.modelid,d.uniqueid, d.loginid, d.datetimestamp, d.remark, d.flag,
//		        m.makename,mk.modelname,d.status_sim,d.status_veh, mda.status, d.status_customer,mpd.flag
				while (rs4.next()) {
					
					try {
						device_details obj = new device_details();
						obj.setDeviceid(Long.parseLong(rs4.getString(1)));
						obj.setMakeid(Long.parseLong(rs4.getString(2)));
						obj.setModelid(Long.parseLong(rs4.getString(3)));
						obj.setUniqueid(rs4.getString(4));
						obj.setLoginid(Long.parseLong(rs4.getString(5)));
						obj.setDatetimestamp(rs4.getString(6));
						obj.setRemark(rs4.getString(7));
						// obj.setFlag(Integer.parseInt(rs4.getString(7)));
						int flag1 = Integer.parseInt(rs4.getString(8));
//						System.out.println("in flag"+flag1);
						if(flag1 == 0)
						{
						obj.setDevice_status("Active");	
						}
						else
						{
							obj.setDevice_status("InActive");
						}
						obj.setMakename(rs4.getString(9));
						obj.setModelname(rs4.getString(10));
						String status = rs4.getString(11);
						obj.setRowno(indexno);
						indexno++;
						if (status.equals("1")) {
							obj.setStatussim("Sim Assigned");
						} else {
							obj.setStatussim("Sim Not Assigned");
						}

						status = rs4.getString(12);
						if (status.equals("1")) {
							obj.setStatusvehicle("Assigned to Vehicle");
						} else {
							obj.setStatusvehicle("Not  Assigned to Vehicle");
						}
						obj.setStatus(rs4.getString(13));
						obj.setStatus_customer(rs4.getString(14));
						int flag = Integer.parseInt(rs4.getString(15));
						if (flag == 1) {
							obj.setFlag("false");
						} else {
							obj.setFlag("true");
						}
						data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
				
				
				
				 
				
				
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
		 	return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getControlId(String ownerid) {
		Connection con = null;
		String controlid = null;
		try{
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			String sqlselect4 = "select * from dblocator.selectprocedure('selectControlid', '" + ownerid
					+ "', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
			
			while (rs4.next()) {
				
				try {
					
					controlid = rs4.getString(1);
//					 System.out.println(controlid);

				} catch (Exception e) {
				//	System.out.println("e = " + e);
				}
			}

		}catch(Exception e){
		  System.out.println(e);
		}
		return controlid;
	}

	public List<parentcomp_details> getLoginId(String companyid) {
		List<parentcomp_details> data = new ArrayList<parentcomp_details>();
		Connection con = null;
		long pid, cid = 0;
		String kid =null;
		pid = Long.parseLong(companyid);
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//		//	System.out.println("Connected in websservice sim");
			String tblnamecdet="selectCompanydet", tblnamepdet="selectParentCompanydet";
			if(companyid.startsWith("7")){
				companyid = getControlId(companyid);
				pid = Long.parseLong(companyid);
//			//	System.out.println(companyid+"hello");
			}
			if(companyid.startsWith("3")){
				tblnamecdet = "selectCompanydet";
				tblnamepdet = "selectParentCompanydet";
			}else if(companyid.startsWith("6")){
//			//	System.out.println("in dealer 6");
				tblnamecdet = "selectDealerdet";
				tblnamepdet = "selectParentDealerdet";
			}
			
			// String sqlselect4="select sim_creation()";
			while (pid != 0) {
//			//	System.out.println("in first loop");
				String sqlselect4 = "select * from dblocator.selectprocedure('"+tblnamecdet+"', '" + pid
						+ "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				
				
					pid = 0;
				
				
				while (rs4.next()) {
					
					try {
						//
						pid = Long.parseLong(rs4.getString(2));
						cid = Long.parseLong(rs4.getString(1));
						// cid=pid;
						// System.out.println("cid= "+cid+" "+pid);
						if (pid == 0) {
							
							parentcomp_details obj = new parentcomp_details();
							obj.setCompanyid(rs4.getString(1));
							obj.setParentcompid(rs4.getString(2));
//							obj.setCompanyname(rs4.getString(3));
							obj.setLoginid(rs4.getString(3));
							kid = rs4.getString(1);
//							obj.setOrderno(orderno);
							 data.add(obj);
							
							 System.out.println("breaked "+obj.getLoginid()+" comp "+obj.getCompanyid()+" parent comp "+obj.getParentcompid());
							break;
						}
						// data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
			}
			// System.out.println("cid = "+cid);
			if (cid != 0) {
				int orderno = 3;
			//	System.out.println("in pid of result = "+cid);
				pid = cid;
				cid = 1;
				Pattern delhiLivePattern = null;
				String pattn = kid;
				while (cid == 1) {
				//	System.out.println("loop comp id= " + pid);
					String sqlselect4 = "select * from dblocator.selectprocedure('"+tblnamepdet+"', '" + pid
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					// System.out.println("rs = "+rs4);
					cid = 0;
					while (rs4.next()) {
						
						try {
							

								parentcomp_details obj = new parentcomp_details();
								obj.setCompanyid(rs4.getString(1));
								obj.setParentcompid(rs4.getString(2));
//								obj.setCompanyname(rs4.getString(3));
								obj.setLoginid(rs4.getString(3));
								obj.setOrderno(orderno);
								pid = Long.parseLong(rs4.getString(1));
								cid = Long.parseLong(rs4.getString(1));
								delhiLivePattern = Pattern.compile(pattn);
								if (!(delhiLivePattern.matcher(obj.getCompanyid()).find())) {
//								//	System.out.println("pattern= " + pattn + "in true");
									data.add(obj);
									pattn = pattn + "|" + obj.getCompanyid();
								}
						} catch (Exception e) {
						//	System.out.println("e = " + e);
						}
						cid = 1;
					}
					orderno++;
				}
				// System.out.println("out of while loop"+data.size());
			}
		} catch (Exception e) {
		  System.out.println(e);
		} finally {
			try {
				con.close();
				// System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//	//	System.out.println(data.size());
		 return data;
	}

	
	@RequestMapping("getids")
	
	public List<parentcomp_details> getLoginIdWeb(@RequestParam("companyid") String companyid) {
		List<parentcomp_details> data = new ArrayList<parentcomp_details>();
		Connection con = null;
		long pid = 1, cid = 0;
		cid = Long.parseLong(companyid);
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			// System.out.println("Connected in websservice sim/n"+cid);

			// String sqlselect4="select sim_creation()";
			while (pid != 0) {
			//	System.out.println("in first loop");
				String sqlselect4 = "select * from dblocator.selectprocedure('selectParentCompanydet', '" + cid
						+ "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				pid = 0;
				while (rs4.next()) {
					
					try {

						pid = Long.parseLong(rs4.getString(2));
						cid = Long.parseLong(rs4.getString(1));
						// System.out.println(cid);

					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
			}
			pid = 1;
			while (pid != 2) {
			//	System.out.println("in first loop");
				String sqlselect4 = "select * from dblocator.selectprocedure('selectCompanydet', '" + cid
						+ "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				pid = 2;
				while (rs4.next()) {
				
					try {
						parentcomp_details obj = new parentcomp_details();
						obj.setCompanyid(rs4.getString(0+1));
						obj.setParentcompid(rs4.getString(1+1));
						obj.setCompanyname(rs4.getString(2+1));
						obj.setLoginid(rs4.getString(3+1));
						// obj.setOrderno(orderno);
						pid = Long.parseLong(rs4.getString(0+1));
						cid = Long.parseLong(rs4.getString(0+1));
						data.add(obj);
						pid = Long.parseLong(rs4.getString(1+1));
						cid = Long.parseLong(rs4.getString(1+1));
					//	System.out.println(cid);

					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
			}
			// System.out.println("cid = "+cid);

		} catch (Exception e) {
		 // System.out.println(e);
		} finally {
			try {
				con.close();
				// System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 return data;
	}

	
	@RequestMapping("simdetails")
	
	public @ResponseBody String simDetails(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("searchBySimno")String searchBySimno) {
		List<sim_details> data = new ArrayList<sim_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice sim");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select sim_creation()";
			if(searchBySimno==null)
			{
				searchBySimno="";
			}
				String sqlselect4 = "select * from dblocator.selectprocedure('selectsim', '" + loginid
						+ "', '"+searchBySimno+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				
				System.out.println("sim"+sqlselect4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}

				while (rs4.next()) {
				
					try {
						
//						 s.simid,s.networkid,s.assettypeid,s.simnumber,s.mobilenumber,s.vendorid,s.receiptdt,s.loginid,s.datetimestamp,s.remarks,s.flag,
//							a.assetname,n.networkname,v.vendorfirmname,s.status,mdm.flag
						sim_details obj = new sim_details();
						obj.setSimid(Long.parseLong(rs4.getString(0+1)));
						obj.setNetworkid(Long.parseLong(rs4.getString(1+1)));
						obj.setAssettypeid(Long.parseLong(rs4.getString(2+1)));
						obj.setSimnumber(rs4.getString(3+1));
						obj.setMobilenumber(Long.parseLong(rs4.getString(4+1)));
						obj.setVendorid(Long.parseLong(rs4.getString(5+1)));
						obj.setReceiptdt(rs4.getString(6+1));
						obj.setLoginid(Long.parseLong(rs4.getString(7+1)));
						obj.setDatetimestamp(rs4.getString(8+1));
						obj.setRemarks(rs4.getString(9+1));
						int flag1 = Integer.parseInt(rs4.getString(10+1));
						if(flag1 == 0)
						{
							obj.setSim_status("Active");
						}
						else
						{
							obj.setSim_status("InActive");
						}
						// obj.setFlag(Integer.parseInt(rs4.getString(10+1)));
						obj.setAssetname(rs4.getString(11+1));
						obj.setNetworkname(rs4.getString(12+1));
						obj.setVendorname(rs4.getString(13+1));
						String status = rs4.getString(14+1);
						obj.setRowno(indexno);
						indexno++;
						if (status.equals("1")) {
							obj.setStatus("Assigned");
						} else {
							obj.setStatus("UnAssigned");
						}
						int flag = Integer.parseInt(rs4.getString(16));
						if (flag == 1) {
							obj.setFlag("false");
						} else {
							obj.setFlag("true");
						}
						// System.out.println("vendor name =
						// "+obj.getVendorname());
						data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	@RequestMapping("searchBySimnumber")
	
	public @ResponseBody String searchBySimnumber(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("simno")String simno) {
		List<sim_details> data = new ArrayList<sim_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice sim");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select sim_creation()";
				String sqlselect4 = "select * from dblocator.selectprocedure('selectsearchbysimnumber', '" + loginid
						+ "', '"+simno+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}

				while (rs4.next()) {
				
					try {
//						 s.simid,s.networkid,s.assettypeid,s.simnumber,s.mobilenumber,s.vendorid,s.receiptdt,s.loginid,s.datetimestamp,s.remarks,s.flag,
//							a.assetname,n.networkname,v.vendorfirmname,s.status,mdm.flag
						sim_details obj = new sim_details();
						obj.setSimid(Long.parseLong(rs4.getString(0+1)));
						obj.setNetworkid(Long.parseLong(rs4.getString(1+1)));
						obj.setAssettypeid(Long.parseLong(rs4.getString(2+1)));
						obj.setSimnumber(rs4.getString(3+1));
						obj.setMobilenumber(Long.parseLong(rs4.getString(4+1)));
						obj.setVendorid(Long.parseLong(rs4.getString(5+1)));
						obj.setReceiptdt(rs4.getString(6+1));
						obj.setLoginid(Long.parseLong(rs4.getString(7+1)));
						obj.setDatetimestamp(rs4.getString(8+1));
						obj.setRemarks(rs4.getString(9+1));
						int flag1 = Integer.parseInt(rs4.getString(10+1));
						if(flag1 == 0)
						{
							obj.setSim_status("Active");
						}
						else
						{
							obj.setSim_status("InActive");
						}
						// obj.setFlag(Integer.parseInt(rs4.getString(10+1)));
						obj.setAssetname(rs4.getString(11+1));
						obj.setNetworkname(rs4.getString(12+1));
						obj.setVendorname(rs4.getString(13+1));
						String status = rs4.getString(14+1);
						obj.setRowno(indexno);
						indexno++;
						if (status.equals("1")) {
							obj.setStatus("Assigned");
						} else {
							obj.setStatus("UnAssigned");
						}
						int flag = Integer.parseInt(rs4.getString(16));
						if (flag == 1) {
							obj.setFlag("false");
						} else {
							obj.setFlag("true");
						}
						// System.out.println("vendor name =
						// "+obj.getVendorname());
						data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	@RequestMapping("companydetails")
	
	public @ResponseBody String companyDetails(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid) {

		List<company_details> data = new ArrayList<company_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice ");

//			int k = 0, flag = 1;
//			while (k < list.size()) {
//			//	System.out.println("cid of company = " + list.get(k).getCompanyid());
				String sqlselect4 = "select * from dblocator.selectprocedure('selectCompany', '" + loginid
						+ "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

				int indexno = 1;
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}

				while (rs4.next()) {
					
					try {
						company_details obj = new company_details();
						// companyid, companyname, shortname, companyaddress,
						// contactpersonname, lanldlinenumber1,
						// lanldlinenumber2, faxnumber, emailid,
						// registeredaddress, loginid, datetimestamp,
						// remarks, parentcompid

						obj.setCompanyid(Long.parseLong(rs4.getString(0+1)));
						obj.setCompanyname(rs4.getString(1+1));
						obj.setShortname(rs4.getString(2+1));
						obj.setCompanyaddress(rs4.getString(3+1));
						obj.setContactpersonname(rs4.getString(4+1));
						obj.setLanldlinenumber1(Long.parseLong(rs4.getString(5+1)));
						obj.setLanldlinenumber2(Long.parseLong(rs4.getString(6+1)));
						obj.setFaxnumber(Long.parseLong(rs4.getString(7+1)));
						obj.setEmailid(rs4.getString(8+1));
						obj.setRegisteredaddress(rs4.getString(9+1));
						obj.setLoginid(Long.parseLong(rs4.getString(10+1)));

						java.util.Date parseTimestamp = sdf.parse(rs4.getString(11+1));

						// obj.setDatetimestamp(new
						// Timestamp(parseTimestamp.getTime()));
						obj.setDatetimestamp(rs4.getString(11+1));
						obj.setRemarks(rs4.getString(12+1));
						obj.setParentcompid(rs4.getString(13+1));
						obj.setFlag(rs4.getString(14+1));
						obj.setCity(rs4.getString(15+1));
						obj.setState(rs4.getString(16+1));
						obj.setZip(rs4.getString(17+1));
						obj.setRowno(indexno);
						
						indexno++;
						
//						if (flag == 1) {
//							obj.setFlag("false");
//							obj.setStatus("Inactive");
//							
//						} else {
							obj.setFlag("true");
							obj.setStatus("Active");
//						}
						data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
					
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	

	
	@RequestMapping("vehicledelete")
	
	public @ResponseBody String vehicledelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehicledelete");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteVehicle'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("makedelete")
	
	public @ResponseBody String makedelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice deleteMake");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteMake'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}" ;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("makedetails")
	
	public @ResponseBody String makeDetails(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("searchByMakename")String searchByMakename) {
		List<make_details> data = new ArrayList<make_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehde ");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
			if(searchByMakename==null)
			{
				searchByMakename="";
			}
				String sqlselect4 = "select * from dblocator.selectprocedure('selectMake', '" + loginid
						+ "', '"+searchByMakename+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
int indexno=1;
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
////				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
					
					// m.makeid, m.makename, a.assettypeid ,a.assetname,
					// m.vendorid,v.vendorfirmname,
					// m.loginid, m.datetimestamp, m.remarks,
					// m.flag,c.Companyname,m.maketype,m.companyid
					make_details obj = new make_details();
					obj.setMakeid(rs4.getString(0+1));
					obj.setMakename(rs4.getString(1+1));
					obj.setAssettypeid(rs4.getString(2+1));
					obj.setAssetname(rs4.getString(3+1));
//					obj.setVendorid(rs4.getString(4+1));
//					obj.setVendorfirmname(rs4.getString(5+1));
					obj.setLoginid(rs4.getString(4+1));
					obj.setDatetimestamp(rs4.getString(5+1));
					obj.setRemarks(rs4.getString(6+1));
					obj.setRowno(indexno);
					indexno++;
					// obj.setFlag(rs4.getString(9+1));
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					// obj.setCompanyname(rs4.getString(10+1));
					// obj.setMaketype(rs4.getString(11+1));
					// obj.setCompanyid(rs4.getString(12+1));
					data.add(obj);
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	@RequestMapping("searchBymakename")
	
	public @ResponseBody String searchBymakename(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("makename")String makename ) {
		List<make_details> data = new ArrayList<make_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice make ");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
				String sqlselect4 = "select * from dblocator.selectprocedure('selectsearchByMakename', '" + loginid
						+ "', '"+makename+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				System.out.println("in make"+sqlselect4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				int indexno=1;
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
////				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
					
					// m.makeid, m.makename, a.assettypeid ,a.assetname,
					// m.vendorid,v.vendorfirmname,
					// m.loginid, m.datetimestamp, m.remarks,
					// m.flag,c.Companyname,m.maketype,m.companyid
					make_details obj = new make_details();
					obj.setMakeid(rs4.getString(0+1));
					obj.setMakename(rs4.getString(1+1));
					obj.setAssettypeid(rs4.getString(2+1));
					obj.setAssetname(rs4.getString(3+1));
//					obj.setVendorid(rs4.getString(4+1));
//					obj.setVendorfirmname(rs4.getString(5+1));
					obj.setLoginid(rs4.getString(4+1));
					obj.setDatetimestamp(rs4.getString(5+1));
					obj.setRemarks(rs4.getString(6+1));
					obj.setRowno(indexno);
					indexno++;
					// obj.setFlag(rs4.getString(9+1));
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					// obj.setCompanyname(rs4.getString(10+1));
					// obj.setMaketype(rs4.getString(11+1));
					// obj.setCompanyid(rs4.getString(12+1));
					data.add(obj);
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	
	
	
	
	@RequestMapping("assetdetails")
	
	public @ResponseBody String assetDetails(@RequestParam("companyid") String companyid) {
		List<asset_details> data = new ArrayList<asset_details>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice asset");

			// String sqlselect4="select vehicle_creation()";
			String sqlselect4 = "select * from dblocator.selectprocedure('selectAsset', '" + companyid
					+ "', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);

			while (rs4.next()) {
				
				// a.companyid,a.assettypeid,a.assetname,a.loginid,a.datetimestamp,a.remarks
				asset_details obj = new asset_details();
				obj.setCompanyid(rs4.getString(0+1));
				obj.setAssettypeid(rs4.getString(1+1));
				obj.setAssetname(rs4.getString(2+1));
				obj.setLoginid(rs4.getString(3+1));
				obj.setDatetimestamp(rs4.getString(4+1));
				obj.setRemarks(rs4.getString(5+1));
				data.add(obj);
			}

			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("modeldetails")
	
	public @ResponseBody String modelDetails(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("searchbymodelname")String searchbymodelname) {
		List<model_details> data = new ArrayList<model_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			 System.out.println("Connected in websservice models ");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
			if(searchbymodelname==null)
			{
				searchbymodelname="";
			}
				String sqlselect4 = "select * from dblocator.selectprocedure('selectModel', '" + loginid
						+ "', '"+searchbymodelname+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				System.out.println("model "+sqlselect4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				int indexno=1;
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
					
					// mo.modelid, mo.modelname, mo.makeid, mo.loginid,
					// mo.datetimestamp,
					// mo.remarks, mo.flag,mk.Makename
try
{
					model_details obj = new model_details();
					obj.setModelid(rs4.getString(0+1));
					obj.setModelname(rs4.getString(1+1));
					obj.setMakeid(rs4.getString(2+1));
					obj.setLoginid(rs4.getString(3+1));
					obj.setDatetimestamp(rs4.getString(4+1));
					obj.setRemarks(rs4.getString(5+1));
					// obj.setFlag(rs4.getString(6+1));
					obj.setMakename(rs4.getString(7+1));
					obj.setAssetname(rs4.getString(8+1));
					obj.setCost(rs4.getString(9+1));
					obj.setRowno(indexno);
					indexno++;
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					data.add(obj);
}catch(Exception e){System.out.println("exception"+e);}
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	@RequestMapping("searchbyModelname")
	
	public @ResponseBody String searchbyModelname(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("modelname")String modelname) {
		List<model_details> data = new ArrayList<model_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			// System.out.println("Connected in websservice vehde ");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
				String sqlselect4 = "select * from dblocator.selectprocedure('selectsearchbymodelname', '" + loginid
						+ "', '"+modelname+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
int indexno=1;
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
					
					// mo.modelid, mo.modelname, mo.makeid, mo.loginid,
					// mo.datetimestamp,
					// mo.remarks, mo.flag,mk.Makename
try
{
					model_details obj = new model_details();
					obj.setModelid(rs4.getString(0+1));
					obj.setModelname(rs4.getString(1+1));
					obj.setMakeid(rs4.getString(2+1));
					obj.setLoginid(rs4.getString(3+1));
					obj.setDatetimestamp(rs4.getString(4+1));
					obj.setRemarks(rs4.getString(5+1));
					// obj.setFlag(rs4.getString(6+1));
					obj.setMakename(rs4.getString(7+1));
					obj.setAssetname(rs4.getString(8+1));
					obj.setCost(rs4.getString(9+1));
					obj.setRowno(indexno);
					indexno++;
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					data.add(obj);
}catch(Exception e){System.out.println("exception"+e);}
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	
	
	
	
	
	
	
	@RequestMapping("menudetails")
	
	public @ResponseBody String menuDetails(@RequestParam("roleid") String roleid, @RequestParam("parentid") String parentid) {
		List<menu_details> data = new ArrayList<menu_details>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice menus");
			String names;
			if (Integer.parseInt(parentid) == 0) {
				names = "selectmenu";
			} else {
				names = "selectmenuall";
			}
			// String sqlselect4="select vehicle_creation()";
			String sqlselect4 = "select * from dblocator.selectprocedure('" + names + "', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
			int indexno=1;
			while (rs4.next()) {
				// System.out.println("res= "+rs4.getString(1));
				
				// m.menutext,m.navigateurl,m.parentid,m.mid,m.orderno,m.menuid,parentname

				menu_details obj = new menu_details();
				obj.setMenutext(rs4.getString(0+1));
				obj.setNavigateurl(rs4.getString(1+1));
				obj.setParentid(rs4.getString(2+1));
				obj.setMid(rs4.getString(3+1));
				obj.setOrderno(rs4.getString(4+1));
				obj.setMenuid(rs4.getString(5+1));
				obj.setDescription(rs4.getString(6+1));
				obj.setRowno(indexno);
				indexno++;
				try {
					obj.setParentname(rs4.getString(7+1));
				} catch (Exception e) {

				}
				
				data.add(obj);
			}

			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("menudalletails")
	
	public @ResponseBody String menuallDetails(@RequestParam("companyid") String companyid, @RequestParam("roleid") String roleid) {
		List<menu_details> data = new ArrayList<menu_details>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			// System.out.println("Connected in websservice vehde ");
int indexno=1;
			// String sqlselect4="select vehicle_creation()";
			String sqlselect4;
			if (roleid != null) {
				sqlselect4 = "select * from dblocator.selectprocedure('selectmenuall', '" + companyid + "', '" + roleid
						+ "', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			} else {
				sqlselect4 = "select * from dblocator.selectprocedure('selectmenuall', '" + companyid
						+ "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println(sqlselect4);
			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
			
			while (rs4.next()) {
				// System.out.println("res= "+rs4.getString(1));
				
				// m.menutext,m.navigateurl,m.parentid,m.mid,m.orderno,m.menuid

				menu_details obj = new menu_details();
				obj.setMenutext(rs4.getString(0+1));
				obj.setNavigateurl(rs4.getString(1+1));
				obj.setParentid(rs4.getString(2+1));
				obj.setMid(rs4.getString(3+1));
				obj.setOrderno(rs4.getString(4+1));
				obj.setMenuid(rs4.getString(5+1));
				obj.setDescription(rs4.getString(6+1));
				obj.setRolename(rs4.getString(7+1));
//				obj.setParentname(rs4.getString(9+1));
				obj.setRowno(indexno);
				indexno++;
				data.add(obj);
			}

			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	@RequestMapping("menupage")
	
	public @ResponseBody String menupage(@RequestParam("companyid") String companyid, @RequestParam("roleid") String roleid,@RequestParam("searchBymenuname")String searchBymenuname) {
		List<menu_details> data = new ArrayList<menu_details>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			// System.out.println("Connected in websservice vehde ");
int indexno=1;
			// String sqlselect4="select vehicle_creation()";
			String sqlselect4;
			if(searchBymenuname== null)
			{
				searchBymenuname="";
			}
			if (roleid != null) {
				sqlselect4 = "select * from dblocator.selectprocedure('selectmenupage', '" + companyid + "', '" + roleid
						+ "', '"+searchBymenuname+"', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			} else {
				sqlselect4 = "select * from dblocator.selectprocedure('selectmenupage', '" + companyid
						+ "', '', '"+searchBymenuname+"', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			}
			 System.out.println("menupage"+sqlselect4);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			System.out.println(sqlselect4);
			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
			
			while (rs4.next()) {
				// System.out.println("res= "+rs4.getString(1));
				
				// m.menutext,m.navigateurl,m.parentid,m.mid,m.orderno,m.menuid

				menu_details obj = new menu_details();
				obj.setMenutext(rs4.getString(0+1));
				obj.setNavigateurl(rs4.getString(1+1));
				obj.setParentid(rs4.getString(2+1));
				obj.setMid(rs4.getString(3+1));
				obj.setOrderno(rs4.getString(4+1));
				obj.setMenuid(rs4.getString(5+1));
				obj.setDescription(rs4.getString(6+1));
				obj.setRolename(rs4.getString(7+1));
				obj.setParentname(rs4.getString(9+1));
				obj.setRowno(indexno);
				indexno++;
				data.add(obj);
			}

			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("networkdetails")
	
	public @ResponseBody String networkDetails(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("searchbyNetworkname")String searchbyNetworkname) {
		List<network_details> data = new ArrayList<network_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehde ");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
			if(searchbyNetworkname==null)
			{
				searchbyNetworkname="";
			}
				String sqlselect4 = "select * from dblocator.selectprocedure('selectnetwork', '" + loginid
						+ "', '"+searchbyNetworkname+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
					
					// n.networkid, n.networkname, n.networkapn, n.loginid,
					// n.datetimestamp, n.remarks,c.companyname

					network_details obj = new network_details();
					obj.setNetworkid(rs4.getString(0+1));
					obj.setNetworkname(rs4.getString(1+1));
					obj.setNetworkapn(rs4.getString(2+1));
					obj.setLoginid(rs4.getString(3+1));
					obj.setDatetimestamp(rs4.getString(4+1));
					obj.setRemarks(rs4.getString(5+1));
					obj.setRowno(indexno);
					indexno++;
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					// obj.setCompanyname(rs4.getString(6+1));
					data.add(obj);
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	
	@RequestMapping("searchbynetworkName")
	
	public @ResponseBody String searchbynetworkName(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("networkname")String networkname) {
		List<network_details> data = new ArrayList<network_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehde ");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
				String sqlselect4 = "select * from dblocator.selectprocedure('selectsearchBynetworkname', '" + loginid
						+ "', '"+networkname+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
					
					// n.networkid, n.networkname, n.networkapn, n.loginid,
					// n.datetimestamp, n.remarks,c.companyname

					network_details obj = new network_details();
					obj.setNetworkid(rs4.getString(0+1));
					obj.setNetworkname(rs4.getString(1+1));
					obj.setNetworkapn(rs4.getString(2+1));
					obj.setLoginid(rs4.getString(3+1));
					obj.setDatetimestamp(rs4.getString(4+1));
					obj.setRemarks(rs4.getString(5+1));
					obj.setRowno(indexno);
					indexno++;
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					// obj.setCompanyname(rs4.getString(6+1));
					data.add(obj);
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	
	@RequestMapping("vendordetails")
	
	public @ResponseBody String vendorDetails(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("vendorname")String vendorname,@RequestParam("searchbyVendorname")String searchbyVendorname) {
		List<vendor_details> data = new ArrayList<vendor_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice vendorde ");
//			int k = 0, flag = 1;
//		//	System.out.println("size = "+list.size());
//			while (k < list.size()) {
//			//	System.out.println("loginid = "+list.get(k).getLoginid());
				// String sqlselect4="select vehicle_creation()";
			if(searchbyVendorname==null)
			{
				searchbyVendorname="";
			}
				String sqlselect4 = "select * from dblocator.selectprocedure('selectVendor', '" + loginid
						+ "', '"+searchbyVendorname+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				System.out.println("q  "+sqlselect4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				int indexno=1;
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
					
					// v.vendorid , v.vendorfirmname, v.vendoraddress, v.city,
					// v.statename, v.landlinenumber,
					// v.contactperson, v.designation, v.mobilenumber,
					// v.emailid, v.assettypeid, v.servicestationaddr,
					// v.servstationcontactno, v.creditdays,
					// v.loginid, v.datetimestamp , v.paymentdate, v.remarks
					// ,v.flag,a.assetname

					vendor_details obj = new vendor_details();
					obj.setVendorid(rs4.getString(0+1));
					obj.setVendorfirmname(rs4.getString(1+1));
					obj.setVendoraddress(rs4.getString(2+1));
					obj.setCity(rs4.getString(3+1));
					obj.setStatename(rs4.getString(4+1));
					obj.setLandlinenumber(rs4.getString(5+1));
					obj.setContactperson(rs4.getString(6+1));
					obj.setDesignation(rs4.getString(7+1));
					obj.setMobilenumber(rs4.getString(8+1));
					obj.setEmailid(rs4.getString(9+1));
					obj.setAssettypeid(rs4.getString(10+1));
					obj.setServicestationaddr(rs4.getString(11+1));
					obj.setServstationcontactno(rs4.getString(12+1));
					obj.setCreditdays(rs4.getString(13+1));
					obj.setLoginid(rs4.getString(14+1));
					obj.setDatetimestamp(rs4.getString(15+1));
					obj.setPaymentdate(rs4.getString(16+1));
					obj.setRemarks(rs4.getString(17+1));
					// obj.setFlag(rs4.getString(18+1));
					obj.setAssetname(rs4.getString(19+1));
					obj.setMakeid(rs4.getString(20+1));
					obj.setMakename(rs4.getString(21+1));
					obj.setRowno(indexno);
					indexno++;
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					data.add(obj);
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	@RequestMapping("searchByVendorName")
	
	public @ResponseBody String searchByVendorName(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("vendorname")String vendorname) {
		List<vendor_details> data = new ArrayList<vendor_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice vendorde ");
//			int k = 0, flag = 1;
//		//	System.out.println("size = "+list.size());
//			while (k < list.size()) {
//			//	System.out.println("loginid = "+list.get(k).getLoginid());
				// String sqlselect4="select vehicle_creation()";
				String sqlselect4 = "select * from dblocator.selectprocedure('selectsearchbyvendorname', '" + loginid
						+ "', '"+vendorname+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				System.out.println("vendorquery"+sqlselect4);
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				int indexno=1;
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
					
					// v.vendorid , v.vendorfirmname, v.vendoraddress, v.city,
					// v.statename, v.landlinenumber,
					// v.contactperson, v.designation, v.mobilenumber,
					// v.emailid, v.assettypeid, v.servicestationaddr,
					// v.servstationcontactno, v.creditdays,
					// v.loginid, v.datetimestamp , v.paymentdate, v.remarks
					// ,v.flag,a.assetname

					vendor_details obj = new vendor_details();
					obj.setVendorid(rs4.getString(0+1));
					obj.setVendorfirmname(rs4.getString(1+1));
					obj.setVendoraddress(rs4.getString(2+1));
					obj.setCity(rs4.getString(3+1));
					obj.setStatename(rs4.getString(4+1));
					obj.setLandlinenumber(rs4.getString(5+1));
					obj.setContactperson(rs4.getString(6+1));
					obj.setDesignation(rs4.getString(7+1));
					obj.setMobilenumber(rs4.getString(8+1));
					obj.setEmailid(rs4.getString(9+1));
					obj.setAssettypeid(rs4.getString(10+1));
					obj.setServicestationaddr(rs4.getString(11+1));
					obj.setServstationcontactno(rs4.getString(12+1));
					obj.setCreditdays(rs4.getString(13+1));
					obj.setLoginid(rs4.getString(14+1));
					obj.setDatetimestamp(rs4.getString(15+1));
					obj.setPaymentdate(rs4.getString(16+1));
					obj.setRemarks(rs4.getString(17+1));
					// obj.setFlag(rs4.getString(18+1));
					obj.setAssetname(rs4.getString(19+1));
					obj.setMakeid(rs4.getString(20+1));
					obj.setMakename(rs4.getString(21+1));
					obj.setRowno(indexno);
					indexno++;
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					data.add(obj);
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("roledetails")
	
	public @ResponseBody String roleDetails(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("searchbyrolename")String searchbyrolename) {
		List<role_details> data = new ArrayList<role_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		System.out.println("userdetails");
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehde ");
//			int k = 0, flag = 1;
//		//	System.out.println("size = "+list.size());
//			while (k < list.size()) {
			// String sqlselect4="select vehicle_creation()";
			if(searchbyrolename==null)
			{
				searchbyrolename="";
			}
			String sqlselect4;
//			if(rolename.contains(null))
//			{
//				sqlselect4 = "select * from dblocator.selectprocedure('selectRole',"
//						+ " '"+loginid+"', '''', '', '', '', '', '', '', "
//						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
//						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
//			}
//			else
//			{
			sqlselect4 = "select * from dblocator.selectprocedure('selectRole',"
					+ " '"+loginid+"', '"+searchbyrolename+"', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			//}
			System.out.println("role "+sqlselect4);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
			int indexno=1;
//			if (list.get(k).getLoginid().equals(loginid)) {
//				flag = 0;
//			}
			while (rs4.next()) {
				
				// System.out.println("values ="+rs4.getString(3+1));
				// roleid, rolename, companyid, loginid, datetimestamp, remarks,
				// flag
				
					role_details obj = new role_details();
					obj.setRoleid(rs4.getString(0+1));
					obj.setRolename(rs4.getString(1+1));
					obj.setCompanyid(rs4.getString(2+1));
					obj.setLoginid(rs4.getString(3+1));
					obj.setDatetimestamp(rs4.getString(4+1));
					obj.setRemarks(rs4.getString(5+1));
					obj.setParentcompid(rs4.getString(7+1));
					obj.setRowno(indexno);
					indexno++;
					
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					data.add(obj);
				}
//			k++;
//			}

			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("simassigndetails")
	
	public @ResponseBody String simAssignDetails(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("searchbydeviceno")String searchbydeviceno) {
		List<simassign_details> data = new ArrayList<simassign_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		System.out.println("Connected in websservice simassigndetails");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
		if(searchbydeviceno==null)
		{
			searchbydeviceno="";
		}
				String sqlselect4 = "select * from dblocator.selectprocedure('selectsimassign', '"
						+ loginid + "', '"+searchbydeviceno+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				
				System.out.println("simass"+sqlselect4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Statement st4 = con.createStatement();
				int indexno=1;
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
				
					// select d.deviceid,d.uniqueid,da.simid,s.simnumber,n.networkname,s.networkid,da.devicesimid,da.remarks,s.mobilenumber,mdm.flag
					try {
						//System.out.println("in rs simass");
						simassign_details obj = new simassign_details();
						obj.setDeviceid(rs4.getString(0+1));
						obj.setUniqueid(rs4.getString(1+1));
						obj.setSimid(rs4.getString(2+1));
						obj.setSimnumber(rs4.getString(3+1));
						obj.setNetworkname(rs4.getString(4+1));
						obj.setNetworkid(rs4.getString(5+1));
						obj.setDevicesimid(rs4.getString(6+1));
						obj.setRemarks(rs4.getString(7+1));
						obj.setMobileno(rs4.getString(8+1));
						obj.setRowno(indexno);
						indexno++;
						int flag = Integer.parseInt(rs4.getString(10));
						if (flag == 1) {
							obj.setFlag("false");
						} else {
							obj.setFlag("true");
						}
						int flag1=Integer.parseInt(rs4.getString(11));
						if(flag1 == 0)
						{
							obj.setSimassign_status("Active");
						}
						else
						{
							obj.setSimassign_status("InActive");
						}
						data.add(obj);
					} catch (Exception e) {
						System.out.println("e " + e);
					}
//					k++;
//				}
			}

			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	@RequestMapping("searchsimassignByDeviceno")
	
	public @ResponseBody String searchsimassignByDeviceno(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("deviceno")String deviceno) {
		List<simassign_details> data = new ArrayList<simassign_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		System.out.println("Connected in websservice simassigndetails");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
				String sqlselect4 = "select * from dblocator.selectprocedure('selectsearchsimssByDeviceno', '"
						+ loginid + "', '"+deviceno+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				
				System.out.println("simass"+sqlselect4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Statement st4 = con.createStatement();
				int indexno=1;
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
				
					// select d.deviceid,d.uniqueid,da.simid,s.simnumber,n.networkname,s.networkid,da.devicesimid,da.remarks,s.mobilenumber,mdm.flag
					try {
						simassign_details obj = new simassign_details();
						obj.setDeviceid(rs4.getString(0+1));
						obj.setUniqueid(rs4.getString(1+1));
						obj.setSimid(rs4.getString(2+1));
						obj.setSimnumber(rs4.getString(3+1));
						obj.setNetworkname(rs4.getString(4+1));
						obj.setNetworkid(rs4.getString(5+1));
						obj.setDevicesimid(rs4.getString(6+1));
						obj.setRemarks(rs4.getString(7+1));
						obj.setMobileno(rs4.getString(8+1));
						obj.setRowno(indexno);
						indexno++;
						int flag = Integer.parseInt(rs4.getString(10));
						if (flag == 1) {
							obj.setFlag("false");
						} else {
							obj.setFlag("true");
						}
						int flag1=Integer.parseInt(rs4.getString(11));
						if(flag1 == 0)
						{
							obj.setSimassign_status("Active");
						}
						else
						{
							obj.setSimassign_status("InActive");
						}
						data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e " + e);
					}
//					k++;
//				}
			}

			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	@RequestMapping("deviceassigndetails")
	
	public @ResponseBody String DeviceAssignDetails(@RequestParam("companyid") String companyid,
			@RequestParam("loginid") String loginid,@RequestParam("searchByDeviceVehicle")String searchByDeviceVehicle) {
		List<deviceassign_details> data = new ArrayList<deviceassign_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
	System.out.println("Connected in websservice deviceass ");

//			int k = 0, flag = 1;
			int indexno=1;
//			while (k < list.size()) {

				// String sqlselect4="select vehicle_creation()";
				String sqlselect4 = "select * from dblocator.selectprocedure('selectvehassigngps', '"
						+ loginid + "', '', '"+searchByDeviceVehicle+"', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

//				System.out.println(sqlselect4);
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
				
					// va.id,
					// v.vehicleid,v.vehicleregno,va.deviceid,va.assigndate,d.uniqueid,va.remarks
					try {
						deviceassign_details obj = new deviceassign_details();
						obj.setId(rs4.getString(0+1));
			
						obj.setVehicleid(rs4.getString(1+1));
						obj.setVehicleregno(rs4.getString(2+1));
						//obj.setAssigndate(rs4.getString(4+1));
						
						SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
						SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MM-yyyy");
						java.util.Date parseTimestamp = sdf1.parse(rs4.getString(4+1));
//						dd.setDatereceived(sdfnew.format(parseTimestamp));
//						dd.setTrackdate(parseTimestamp.toLocaleString());
						obj.setAssigndate(sdfnew.format(parseTimestamp));
						
//						System.out.println(obj.getAssigndate()+""+parseTimestamp);
						obj.setUniqueid(rs4.getString(5+1));
						obj.setRemarks(rs4.getString(6+1));
						obj.setRowno(indexno);
						indexno++;
//						if (flag == 1) {
//							obj.setFlag("false");
//						} else {
							obj.setFlag("true");
//						}
						data.add(obj);
					} catch (Exception e) {
				System.out.println("e " + e);
					}
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	

	

	
	@RequestMapping("customerassigndetails")
	
	public @ResponseBody String customerAssignDetails() {
		List<customerdevice_assigndetails> data = new ArrayList<customerdevice_assigndetails>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehde ");

			// String sqlselect4="select vehicle_creation()";
			String sqlselect4 = "select * from dblocator.selectprocedure('selectcustomerdeviceassign', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			int indexno=1;
			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);

			while (rs4.next()) {
				
				// customerid, customername, deviceid, devicename
				try {
					customerdevice_assigndetails obj = new customerdevice_assigndetails();
					obj.setCustomerid(rs4.getString(0+1));
					obj.setCustomername(rs4.getString(1+1));
					obj.setDeviceid(rs4.getString(2+1));
					obj.setDevicename(rs4.getString(3+1));
					obj.setSalecost(rs4.getString(4+1));
					obj.setCredit_money(rs4.getString(5+1));
					obj.setPayement_mode(rs4.getString(6+1));
					obj.setDevicemapid(rs4.getString(7+1));
					obj.setDatetimesatmp(rs4.getString(8+1));
					obj.setCompanyname(rs4.getString(9+1));
					obj.setCompanyid(rs4.getString(10+1));
					obj.setDealerid(rs4.getString(11+1));
					obj.setDealername(rs4.getString(12+1));
					obj.setRowno(indexno);
					indexno++;
					data.add(obj);
				} catch (Exception e) {
				//	System.out.println("e " + e);
				}
			}

			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("vehicleassigndetails")
	
	public @ResponseBody String vehicleAssigntoGPSDetails(@RequestParam("loginid") String loginid,
			@RequestParam("companyid") String companyid) {
		List<vehicleassigntogps_details> data = new ArrayList<vehicleassigntogps_details>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehde");

			// String sqlselect4="select vehicle_creation()";
			String sqlselect4 = "select * from dblocator.selectprocedure('selectvehassigngps', '" + loginid
					+ "', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
int indexno=1;
			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);

			while (rs4.next()) {
			
				// v.vehicleid,v.vehicleregno,va.deviceid,va.assigndate,c.companyname,v.companyid,d.uniqueid
				vehicleassigntogps_details obj = new vehicleassigntogps_details();
				obj.setId(rs4.getString(0+1));
				obj.setVehicleid(rs4.getString(1+1));
				obj.setVehicleregno(rs4.getString(2+1));
				obj.setDeviceid(rs4.getString(3+1));
				obj.setAssigndate(rs4.getString(4+1));
				obj.setCompanyname(rs4.getString(5+1));
				obj.setCompanyid(rs4.getString(6+1));
				obj.setUniqueid(rs4.getString(7+1));
				obj.setRemarks(rs4.getString(8+1));
				obj.setRowno(indexno);
				indexno++;
				data.add(obj);
			}

			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close();
				// System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("fuletypedetails")
	
	public @ResponseBody String fuletypedetails(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid) {
		List<fueltype_details> data = new ArrayList<fueltype_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehicledetails ");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
				String sqlselect4 = "select * from dblocator.selectprocedure('selectFuletype', '"
						+ loginid + "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
//			//	System.out.println("in vehicledetails " + list.get(k).getLoginid() + " " + loginid);

				while (rs4.next()) {
					
					// ft.fueltypeid, ft.fueltypedesc, ft.assettypeid,
					// ft.loginid, ft.datetimestamp, ft.remarks,
					// ft.flag,ma.assetname
					fueltype_details obj = new fueltype_details();
					obj.setFueltypeid(rs4.getString(0+1));
					obj.setFueltypedesc(rs4.getString(1+1));
					obj.setAssettypeid(rs4.getString(2+1));
					obj.setLoginid(rs4.getString(3+1));
					obj.setDatetimestamp(rs4.getString(4+1));
					obj.setRemarks(rs4.getString(5+1));
					obj.setFlag(rs4.getString(6+1));
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					obj.setAssetname(rs4.getString(7+1));
					data.add(obj);

				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	@RequestMapping("geofencedetails")
	
	public @ResponseBody String geofenceDetails(@RequestParam("companyid") String companyid,
			@RequestParam("loginid") String loginid) {
		List<geofence_details> data = new ArrayList<geofence_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehde ");

//			int k = 0, flag = 1;
//			while (k < list.size()) {

				// String sqlselect4="select vehicle_creation()";
				String sqlselect4 = "select * from dblocator.selectprocedure('selectgeofence', '"
						+ loginid + "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				int m=0;
				while (rs4.next()) {
					
					// mg.id,mg.geofencename,mg.coord,mg.datatimestamp,mg.loginid
					try {
						
						geofence_details obj = new geofence_details();
						obj.setId(rs4.getString(1));
						obj.setGeofencename(rs4.getString(2));
						String fence = "{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"geometry\":"+rs4.getString(3)+",\"properties\":null}]}";
					//	System.out.println("fence ="+fence);
						obj.setCoord(fence);
						obj.setDatatimestamp(rs4.getString(4));
						obj.setLoginid(rs4.getString(5));
						
//						if (flag == 1) {
//							obj.setFlag("false");
//						} else {
							obj.setFlag("true");
//						}
						data.add(obj);
						m++;
					} catch (Exception e) {
					//	System.out.println("e " + e);
					}
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
//	selectgeofencecoord
	
	
	

	
	@RequestMapping("vehicletypedetails")
	
	public @ResponseBody String vehicletypeDetails(@RequestParam("loginid") String loginid,
			@RequestParam("companyid") String companyid) {
		List<vehicletype_details> data = new ArrayList<vehicletype_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice  vehiceltypedetails");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select sim_creation()";
				String sqlselect4 = "select * from dblocator.selectprocedure('selectvehicletype', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}

				while (rs4.next()) {
					
					try {
						// vehicletypeid, vehicletypename, assettypeid, loginid,
						// datetimestamp,remarks, flag
						vehicletype_details obj = new vehicletype_details();
						obj.setVehicletypeid(rs4.getString(0+1));
						obj.setVehicletypename(rs4.getString(1+1));
						obj.setAssettypeid(rs4.getString(2+1));
						obj.setLoginid(rs4.getString(3+1));
						obj.setDatetimestamp(rs4.getString(4+1));
						obj.setRemarks(rs4.getString(5+1));
						obj.setFlag(rs4.getString(6+1));
//						if (flag == 1) {
//							obj.setFlag("false");
//						} else {
							obj.setFlag("true");
//						}
						data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	@RequestMapping("geofencereportnew")
	
	public @ResponseBody String geofenceReportget(@RequestParam("vehicleno") String vehicleno,
			@RequestParam("fdate") String fdate,@RequestParam("tdate") String tdate,@RequestParam("type") String type) {
		List<geofencereportdet> data = new ArrayList<geofencereportdet>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice  vehiceltypedetails");
//			int k = 0, flag = 1;
			String tblname= null;
			if(type.equals("geofence_wise")){
				tblname = "getgeofence_geofencewise";
			}else{
				tblname = "getgeofence";
			}
			
			String sqlselect4 = "select * from dblocator."+tblname+"('"+vehicleno+"','"+fdate+"','"+tdate+"')";
//		//	System.out.println()
//			System.out.println(sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			 sqlselect4 = "select * from dblocator.selectprocedure('selectGeofenceDetails', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				SimpleDateFormat sdf2 = new SimpleDateFormat("MM/dd/yyyy HH:mm a");
				SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a");
				SimpleDateFormat sdf4 = new SimpleDateFormat("dd-MMM-yyyy hh:mm a");
//				System.out.println(sqlselect4);
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				java.util.Date dd2=null,dd1=null;

				while (rs4.next()) {
					
					try {
						// vehicletypeid, vehicletypename, assettypeid, loginid,
						// datetimestamp,remarks, flag
						geofencereportdet obj = new geofencereportdet();
						obj.setVehicleno(rs4.getString(1));
						
						dd1 = sdf.parse(rs4.getString(2));
						obj.setIntime(sdf3.format(dd1).toString());
						
						if(rs4.getString(3)!=null){
							 dd2 = sdf.parse(rs4.getString(3));
							 obj.setOuttime(sdf3.format(dd2).toString());
						}else{
							dd2 = sdf4.parse(tdate);
							obj.setOuttime("In geogence till end date");
						}
						
						
						obj.setGeofencename(rs4.getString(4));
						
						obj.setStoppage(String.valueOf((Math.abs(Integer.parseInt(String.valueOf(compareTwoTimeStamps(new Timestamp(dd2.getTime()), new Timestamp(dd1.getTime()))))))));
						data.add(obj);
					} catch (Exception e) {
						System.out.println("e = " + e);
					}
				}
//				k++;
//				System.out.println(data.size());
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("userdetails")
	
	public @ResponseBody String userDetails(@RequestParam("loginid") String loginid, @RequestParam("ownersid") String ownersid, 
			@RequestParam("roleid") String roleid,@RequestParam("searchusername")String searchusername ) {
		List<user_details> data = new ArrayList<user_details>();
		System.out.println("in userdetails");
		
//		List<parentcomp_details> list = getLoginId(ownersid);
		Connection con = null;
		int indexno=1;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//		//	System.out.println("Companyid = " + companyid);
//		//	System.out.println("size = "+list.size());
			int k = 0, flag = 1;
			for(int i=0; i<2 ; i++){
				if(i==0){
//				//	System.out.println("in if");
					roleid="1002";
				}else if(i==1){
//				//	System.out.println("in else");
					roleid="1003";
				}
				k=0;
//			while (k < list.size()) {
//			//	System.out.println("ownersid = "+list.get(k).getCompanyid());
				
				if(searchusername==null)
				{
					searchusername="";
				}
				
			String sqlselect4 = "select * from dblocator.selectprocedure('selectUser', '" + ownersid
					+ "', '"+roleid+"', '"+searchusername+"', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			System.out.println("in userdet"+sqlselect4);
			
			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
//		//	System.out.print(sqlselect4);
//			if (list.get(k).getCompanyid().equals(ownersid)) {
//				flag = 0;
//			}
			while (rs4.next()) {
				
				try {

					//System.out.println("in rs");
//					ml.loginname, ml.password, ml.ownersid, 
//					ml.roleid, ml.datetimestamp, ml.loginid, ml.flag, ml.controlid, md.dealername, mr.rolename
					user_details obj = new user_details();
					obj.setLoginname(rs4.getString(0+1));
					obj.setPassword(rs4.getString(1+1));
					obj.setOwnersid(rs4.getString(2+1));
					obj.setRoleid(rs4.getString(3+1));
					obj.setDatetimestamp(rs4.getString(4+1));
					obj.setLoginid(rs4.getString(5+1));
					obj.setControlid(rs4.getString(7+1));
					obj.setDealername(rs4.getString(8+1));
					obj.setRolename(rs4.getString(9+1));
					obj.setRowno(indexno);
					indexno++;
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}

					data.add(obj);
				} catch (Exception e) {
				//	System.out.println("e = " + e);
				}
			}
//			k++;
//		}
	}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	@RequestMapping("custoerwisedevice")
	
	public @ResponseBody String custoerwisedevice(@RequestParam("customerid") String customerid) {
		List<customerwisedevice> data = new ArrayList<customerwisedevice>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			 System.out.println("Connected in websservice customerwisedevice ");
			 System.out.println("customerid"+customerid);
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				String sqlselect4 = "select * from dblocator.selectprocedure('customerwisedevice', '"
						+ customerid + "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
//			//	System.out.println("flag = " + flag);
				// deviceid, makeid, modelid, uniqueid, loginid, datetimestamp,
				// remark, flag, companyid, assetid, available, vendorid
				while (rs4.next()) {
					
					try {
						customerwisedevice obj = new customerwisedevice();

						// d.deviceid, d.makeid,d.modelid,d.uniqueid, d.loginid,
						// d.datetimestamp, d.remark, d.flag,
						// m.makename,mk.modelname

						obj.setDeviceid(Long.parseLong(rs4.getString(1)));
						obj.setMakeid(Long.parseLong(rs4.getString(2)));
						obj.setModelid(Long.parseLong(rs4.getString(3)));
						obj.setUniqueid(rs4.getString(4));
						obj.setLoginid(Long.parseLong(rs4.getString(5)));
						obj.setDatetimestamp(rs4.getString(6));
						obj.setRemark(rs4.getString(7));
						// obj.setFlag(Integer.parseInt(rs4.getString(7)));
						obj.setMakename(rs4.getString(9));
						obj.setModelname(rs4.getString(10));
						String status = rs4.getString(11);
						obj.setRowno(indexno);
						indexno++;
						if (status.equals("1")) {
							obj.setStatussim("Sim Assigned");
						} else {
							obj.setStatussim("Sim Not Assigned");
						}

						status = rs4.getString(12);
						if (status.equals("1")) {
							obj.setStatusvehicle("Assigned to Vehicle");
						} else {
							obj.setStatusvehicle("Not  Assigned to Vehicle");
						}
						obj.setStatus(rs4.getString(13));
						obj.setStatus_customer(rs4.getString(14));
						int flag = Integer.parseInt(rs4.getString(15));
						if (flag == 1) {
							obj.setFlag("false");
						} else {
							obj.setFlag("true");
						}
						obj.setCustomername(rs4.getString(16));
						
						data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e = " + e);
					}
				}
				
				
				
				 
				
				
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	

	// --------------------------------------select
	// Function-------------------------------------

	// ---------------------------------InsertUpdate----------------------------------------

	
	@RequestMapping("menudelete")
	
	public @ResponseBody String menudelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice deleteMenu");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deletemenu'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("userdelete")
	
	public @ResponseBody String userdelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice deleteUser");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteUser'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("userinsert")
	
	public @ResponseBody String insertUser(@RequestParam("loginname") String loginname, @RequestParam("password") String password,
			@RequestParam("companyid") String companyid, @RequestParam("controlid") String controlid,
			@RequestParam("roleid") String roleid, @RequestParam("ownersid") String ownersid) {
		
		Connection con = null;
		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice  user insert");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			String sqlselect4 = null;
			// String sqlselect4=" select
			// company_creation_insert1('"+maxID+1+"','"+companyname+"','"+shortname+"','"+caddress+"','"+personname+"','"+landlin1+"','"+landlin1+"','"+faxnumber+"','"+emailid+"','"+regisraddress+"','"+dd+"',10001,'"+remark+"')";
//			loginid,loginname, password, roleid, datetimestamp,flag, controlid, ownersid,companyid
			try {
				// loginname, password, roleid, datetimestamp, flag, companyid
				sqlselect4 = "select * from dblocator.insertprocedure('insertUser', '0', '" + loginname + "', " + "'"
						+ password + "', '" + roleid + "', '" + tt.toLocaleString() + "', '0', '"+controlid+"'," + "'" + ownersid
						+ "', '"+companyid+"',  " + "'', '', '', '',"
						+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			System.out.println(sqlselect4);
			} catch (Exception e) {
			System.out.println("in insert qer" + e);
			}
			PreparedStatement ps = con.prepareStatement(sqlselect4);

			boolean b = ps.execute();

			if (b) {
			//	System.out.println("success");

			} else {
			//	System.out.println("failedhhhhh");
			}

			return "ok";

		} catch (Exception e) {
			System.out.println("insert" + e);
			livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
			
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	
	@RequestMapping("userupdate")
	
	public @ResponseBody String insertUpdate(@RequestParam("loginname") String loginname, @RequestParam("password") String password,
			@RequestParam("companyid") String companyid, @RequestParam("controlid") String controlid,
			@RequestParam("roleid") String roleid, @RequestParam("ownersid") String ownersid,
			@RequestParam("loginid") String loginid) {
		
		Connection con = null;
		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice  company insert");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			String sqlselect4 = null;
			// String sqlselect4=" select
			// company_creation_insert1('"+maxID+1+"','"+companyname+"','"+shortname+"','"+caddress+"','"+personname+"','"+landlin1+"','"+landlin1+"','"+faxnumber+"','"+emailid+"','"+regisraddress+"','"+dd+"',10001,'"+remark+"')";
//			loginid,loginname, password, roleid, datetimestamp,flag, controlid, ownersid,companyid
			try {
				// loginname, password, roleid, datetimestamp, flag, companyid
				sqlselect4 = "select * from dblocator.insertprocedure('insertUser', '"+loginid+"', '" + loginname + "', " + "'"
						+ password + "', '" + roleid + "', '" + tt.toLocaleString() + "', '0', '"+controlid+"'," + "'" + ownersid
						+ "', '"+companyid+"',  " + "'', '', '', '',"
						+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			} catch (Exception e) {
			//	System.out.println("in insert qer" + e);
			}
			PreparedStatement ps = con.prepareStatement(sqlselect4);

			boolean b = ps.execute();

			if (b) {
			//	System.out.println("success");

			} else {
			//	System.out.println("failedhhhhh");
			}

			return "ok";

		} catch (Exception e) {
		//	System.out.println("insert" + e);
			
			livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	
//	@RequestMapping("companyinsert")
//	
//	public @ResponseBody String insertCom(@RequestParam("companyname") String companyname, @RequestParam("shortname") String shortname,
//			@RequestParam("caddress") String caddress, @RequestParam("personname") String personname,
//			@RequestParam("landlin1") String landlin1, @RequestParam("faxnumber") String faxnumber,
//			@RequestParam("landlin2") String landlin2,
//			@RequestParam("regisraddress") String regisraddress, @RequestParam("emailid") String emailid,
//			@RequestParam("remark") String remark, @RequestParam("parentcompid") String parentcompid,
//			@RequestParam("loginid") String loginid,@RequestParam("city") String city,@RequestParam("state") String state,@RequestParam("zip") String zip) {
//
//		Connection con = null;
//		try {
//
//			Class.forName("org.postgresql.Driver");
//			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//		//	System.out.println("Connected in websservice  company insert");
//			java.util.Date dd = new Date();
//			Timestamp tt = new Timestamp(dd.getTime());
//			String sqlselect4 = null;
//			// String sqlselect4=" select
//			// company_creation_insert1('"+maxID+1+"','"+companyname+"','"+shortname+"','"+caddress+"','"+personname+"','"+landlin1+"','"+landlin1+"','"+faxnumber+"','"+emailid+"','"+regisraddress+"','"+dd+"',10001,'"+remark+"')";
//			
//			
//			try {
////				companyid, companyname, shortname, companyaddress, contactpersonname, 
////				lanldlinenumber1, lanldlinenumber2, faxnumber, emailid, registeredaddress, loginid, datetimestamp, remarks,parentcompid,flag,city,state,zip
//				sqlselect4 = "select * from dblocator.insertprocedure('insertCompany', '0', '" + companyname + "', " + "'"
//						+ shortname + "', '" + caddress + "', '" + personname + "', '" + landlin1 + "', " + "'"
//						+ landlin2 + "', '" + faxnumber + "', '" + emailid + "', ' " + regisraddress + "', '"
//						+ loginid + "', '" + tt.toLocaleString() + "', '" + remark + "'," + "'" + parentcompid+"',"
//						+ "'0', '"+city+"', '"+state+"', '"+zip+"', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
////				System.out.println(sqlselect4);
//			} catch (Exception e) {
//			//	System.out.println("in insert qer" + e);
//			}
//			PreparedStatement ps = con.prepareStatement(sqlselect4);
//
//			boolean b = ps.execute();
//
//			if (b) {
//			//	System.out.println("success");
//
//			} else {
//			//	System.out.println("failedhhhhh");
//			}
//			
//			return "ok";
//
//		} catch (Exception e) {
//		//	System.out.println("insert" + e);
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
//		} finally {
//			try {
//				con.close(); // System.out.println("connection closed");
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//
//	}

	
	@RequestMapping("companyedit")
	
	public @ResponseBody String editCom(@RequestParam("companyid") String companyid, @RequestParam("companyname") String companyname,
			@RequestParam("shortname") String shortname, @RequestParam("caddress") String caddress,
			@RequestParam("personname") String personname, @RequestParam("landlin1") long landlin1,
			@RequestParam("faxnumber") long faxnumber, @RequestParam("regisraddress") String regisraddress,
			@RequestParam("emailid") String emailid, @RequestParam("remark") String remark,
			@RequestParam("parentcompid") String parentcompid, @RequestParam("loginid") String loginid,@RequestParam("city") String city,@RequestParam("state") String state,@RequestParam("zip") String zip) {
		Connection con = null;

		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice editcom");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// String sqlselect4=" select
			// company_creation_update('"+maxID+"','"+companyname+"','"+shortname+"','"+caddress+"','"+personname+"','"+landlin1+"','"+landlin1+"','"+faxnumber+"','"+emailid+"','"+regisraddress+"',0,null,'"+remark+"')";
			// company_creation_insert(ncompanyid numeric,
			// ncompanyname character varying, nshortname character,
			// ncompanyaddress character varying, ncontactpersonname character
			// varying, nlanldlinenumber1 numeric, nlanldlinenumber2 numeric,
			// nfaxnumber numeric, nemailid character varying,
			// nregisteredaddress character varying, nloginid numeric,
			// ndatetimestamp timestamp without time zone, nremarks character
			// varying)

			String sqlselect4 = "select * from dblocator.insertprocedure('insertCompany', '" + companyid + "', '"
					+ companyname + "', " + "'" + shortname + "', '" + caddress + "', '" + personname + "', '"
					+ landlin1 + "', " + "'" + landlin1 + "', '" + faxnumber + "', '" + emailid + "',  " + "'"
					+ regisraddress + "', '" + loginid + "', '" + tt.toLocaleString() + "', '" + remark + "'," + "'"
					+ parentcompid+"',"
					+ "'0', '"+city+"', '"+state+"', '"+zip+"', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			System.out.println(sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			ResultSet rs = ps.executeQuery();

			return "ok";

		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	// insertBCUDevice
	
//	@RequestMapping("siminsert")
//	
//	public @ResponseBody String deleteComnew(@RequestParam("networkid") String networkid, @RequestParam("assettypeid") String assettypeid,
//			@RequestParam("simno") String simno, @RequestParam("mobileno") String mobileno,
//			@RequestParam("vendorid") String vendorid, @RequestParam("receiptdt") String receiptdt,
//			@RequestParam("loginid") String loginid, @RequestParam("remark") String remark) {
//		Connection con = null;
//
//		try {
//			Class.forName("org.postgresql.Driver");
//			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//		//	System.out.println("Connected in websservice simins");
//			java.util.Date dd = new Date();
//			Timestamp tt = new Timestamp(dd.getTime());
//			// String sqlselect4=" select
//			// sim_creation_insert('"+maxID+1+"','"+network+"',110010,'"+simno+"','"+mobileno+"','"+vendor+"',0,44001,null,'"+remark+"',0,'"+company+"',null,null)";
//
//			// simid, networkid, assettypeid, simnumber, mobilenumber, vendorid,
//			// receiptdt, loginid, datetimestamp, remarks, flag
//			
//			String sqlselect4 = "select * from dblocator.insertprocedure('insertsim'," + " '0', '" + networkid + "', "
//					+ "'" + assettypeid + "', '" + simno + "', '" + mobileno + "', '" + vendorid + "', " + "'"
//					+ receiptdt + "', '" + loginid + "', '" + tt.toLocaleString() + "',  " + "'" + remark
//					+ "', '0', '', '',"
//					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
//			PreparedStatement ps = con.prepareStatement(sqlselect4);
//			boolean rs = ps.execute();
//			if (rs) {
////				return "ok";
//			} else {
////				return "Not ok";
//			}
//			
//			return "ok";
//		} catch (Exception e) {
//		  System.out.println(e);
//			livedet det = new livedet();
//			det.setExc(String.valueOf(e));
//			String json = new Gson().toJson(det);
//			return json;
//		  
////			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
////					;
//		} finally {
//			try {
//				con.close(); // System.out.println("connection closed");
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//
//	}

	
	@RequestMapping("simupdatenew")
	
	public @ResponseBody String simUpdate(@RequestParam("simid") String simid, @RequestParam("networkid") String networkid,
			@RequestParam("assettypeid") String assettypeid, @RequestParam("simno") String simno,
			@RequestParam("mobileno") String mobileno, @RequestParam("vendorid") String vendorid,
			@RequestParam("receiptdt") String receiptdt, @RequestParam("loginid") String loginid,
			@RequestParam("remark") String remark) {
		Connection con = null;

		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// String sqlselect4=" select
			// sim_creation_insert('"+maxID+1+"','"+network+"',110010,'"+simno+"','"+mobileno+"','"+vendor+"',0,44001,null,'"+remark+"',0,'"+company+"',null,null)";

			// simid, networkid, assettypeid, simnumber, mobilenumber, vendorid,
			// receiptdt, loginid, datetimestamp, remarks, flag

			String sqlselect4 = "select * from dblocator.insertprocedure('insertsim'," + " '" + simid + "', '" + networkid
					+ "', " + "'" + assettypeid + "', '" + simno + "', '" + mobileno + "', '" + vendorid + "', " + "'"
					+ receiptdt + "', '" + loginid + "', '" + tt.toLocaleString() + "',  " + "'" + remark
					+ "', '0', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
		  
			livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	
	@RequestMapping("simdelete")
	
	public @ResponseBody String simdelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deletesim'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	@RequestMapping("simactivate")
	
	public @ResponseBody String simactivate(@RequestParam("id") String id) {
		Connection con = null;
	try {
		Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			 System.out.println("activatesim");
			String sqlselect4 = "select * from dblocator.insertprocedure('activatesim'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println("errr"+e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	
//	@RequestMapping("deviceinsert")
//	
//	public @ResponseBody String deviceInsert(@RequestParam("makeid") String makeid, @RequestParam("modelid") String modelid,
//			@RequestParam("uniqueid") String uniqueid, @RequestParam("loginid") String loginid,
//			@RequestParam("remark") String remark,@RequestParam("deviceid") String deviceid) {
//
//		Connection con = null;
//		try {
//			Class.forName("org.postgresql.Driver");
//			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//		//	System.out.println("Connected in websservice simins");
//			java.util.Date dd = new Date();
//			Timestamp tt = new Timestamp(dd.getTime());
//			// deviceid, makeid, modelid, uniqueid, loginid,datetimestamp,
//			// remark, flag,companyid,
//			// assetid,available,vendorid
//			
//			String sqlselect4 = "select * from dblocator.insertprocedure('insertBCUDevice'," + " '0', '" + makeid + "', "
//					+ "'" + modelid + "', '" + uniqueid + "', '" + loginid + "', '" + tt.toLocaleString() + "', " + "'"
//					+ remark + "', '" + 0 + "', '"+deviceid+"',  " + "'', '', '', '',"
//					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
////			System.out.println(sqlselect4);
//			PreparedStatement ps = con.prepareStatement(sqlselect4);
//			boolean rs = ps.execute();
//			if (rs) {
////				return "ok";
//			} else {
////				return "Not ok";
//			}
//			
//			return "ok";
//		} catch (Exception e) {
//		  System.out.println(e);
//			livedet det = new livedet();
//			det.setExc(String.valueOf(e));
//			String json = new Gson().toJson(det);
//			return json;
//		  
////			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
////					;
//		} finally {
//			try {
//				con.close(); // System.out.println("connection closed");
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//
//	}
//
//	
////	@RequestMapping("deviceupdate")
////	
////	public @ResponseBody String deviceUpdate(@RequestParam("deviceid") String deviceid, @RequestParam("makeid") String makeid,
////			@RequestParam("modelid") String modelid, @RequestParam("uniqueid") String uniqueid,
////			@RequestParam("loginid") String loginid, @RequestParam("remark") String remark) {
////
////		Connection con = null;
////		try {
////			Class.forName("org.postgresql.Driver");
////			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
////		//	System.out.println("Connected in websservice simins");
////			java.util.Date dd = new Date();
////			Timestamp tt = new Timestamp(dd.getTime());
////			// deviceid, makeid, modelid, uniqueid, loginid,datetimestamp,
////			// remark, flag,companyid,
////			// assetid,available,vendorid
////			String sqlselect4 = "select * from dblocator.insertprocedure('insertBCUDevice'," + " '" + deviceid + "', '"
////					+ makeid + "', " + "'" + modelid + "', '" + uniqueid + "', '" + loginid + "', '"
////					+ tt.toLocaleString() + "', " + "'" + remark + "', '" + 0 + "', '',  " + "'', '0', '', '',"
////					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
////			PreparedStatement ps = con.prepareStatement(sqlselect4);
////			boolean rs = ps.execute();
////			if (rs) {
////				return "ok";
////			} else {
////				return "Not ok";
////			}
////
////		} catch (Exception e) {
////		  System.out.println(e);
////			livedet det = new livedet();
////			det.setExc(String.valueOf(e));
////			String json = new Gson().toJson(det);
////			return json;
//////			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//////					;
////		} finally {
////			try {
////				con.close(); // System.out.println("connection closed");
////			} catch (SQLException e) {
////				// TODO Auto-generated catch block
////				e.printStackTrace();
////			}
////		}
////
////	}

	
	@RequestMapping("devicedelete")
	
	public @ResponseBody String devicedelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteBCUDevice'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	@RequestMapping("activateDevice")
	
	public @ResponseBody String activateDevice(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice activate  device");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('activateBCUDevice'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
		System.out.println("activate"+sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	 @RequestMapping("dealersaledetails")
	 
	 public @ResponseBody String dealerSaleDetails(@RequestParam("companyid") String companyid,@RequestParam("loginid") String loginid,@RequestParam("searchbyDealername")String searchbyDealername) {
	 List<devicesale>data=new ArrayList<devicesale>();
//	 List<parentcomp_details> list = getLoginId(companyid);
	 Connection con = null;
	 try{
	 Class.forName("org.postgresql.Driver");
	  con =
	 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
					"takshak");
//    System.out.println("Connected in websservice dealersale");
//	 int k=0, flag=1;
	 int indexno=1;
//	  while(k<list.size()){
//	 String sqlselect4="select vehicle_creation()";
		if(searchbyDealername==null)
		{
			searchbyDealername="";
		}
		  
		  String sqlselect4 = "select * from dblocator.selectprocedure('selectDeviceSale', '" +loginid
					+ "', '"+searchbyDealername+"', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
  
		  
	
//	 System.out.println(sqlselect4);

	 SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 Statement st4=con.createStatement();
	 ResultSet rs4=st4.executeQuery(sqlselect4);
//	 if(list.get(k).getLoginid().equals(loginid)){
//			flag=0;
//		}
	 while(rs4.next()){
	
		  // transid, dealerid, no_devices, purchaseorder_number, purchaseorder_date, 
//	       invoice_number, invoice_date, total, tax, octroi, vatt, servicetax, 
//	       paymentmode, chequeno, chequedate, creditdays, creditamount, 
//	       payedby, order_placedby, emailidby, phonenoby, nameby, dispatchnameby, 
//	       dispatchphoneby, dispatchcourier, dispatchpaketno, datetimestamp, 
//	       loginid, flag, finaltotal, dispatchby
		 
		 try{
			 devicesale obj = new devicesale();
			 
			 obj.setTransid(rs4.getString(0+1));
			 obj.setDealerid(rs4.getString(1+1));
			 obj.setNo_devices(rs4.getString(2+1));
			 obj.setPurchaseorder_number(rs4.getString(3+1));
			 obj.setPurchaseorder_date(rs4.getString(4+1));
			 obj.setInvoice_number(rs4.getString(5+1));
			 obj.setInvoice_date(rs4.getString(6+1));
			 obj.setTotal(rs4.getString(7+1));
			 obj.setTax(rs4.getString(8+1));
			 obj.setOctroi(rs4.getString(9+1));
			 obj.setVatt(rs4.getString(10+1));
			 obj.setServicetax(rs4.getString(11+1));
			 obj.setPaymentmode(rs4.getString(12+1));
			 obj.setChequeno(rs4.getString(13+1));
			 obj.setChequedate(rs4.getString(14+1));
			 obj.setCreditdays(rs4.getString(15+1));
			 obj.setCreditamount(rs4.getString(16+1));
			 obj.setPayedby(rs4.getString(17+1));
			 obj.setOrder_placedby(rs4.getString(18+1));
			 obj.setEmailidby(rs4.getString(19+1));
			 obj.setPhonenoby(rs4.getString(20+1));
			 obj.setNameby(rs4.getString(21+1));
			 obj.setDispatchnameby(rs4.getString(22+1));
			 obj.setDispatchphoneby(rs4.getString(23+1));
			 obj.setDispatchcourier(rs4.getString(24+1));
			 obj.setDispatchpaketno(rs4.getString(25+1));
			 obj.setDatetimestamp(rs4.getString(26+1));
			 obj.setLoginid(rs4.getString(27+1));
			 obj.setFlag(rs4.getString(28+1));
			 obj.setDealername(rs4.getString(29+1));
			 obj.setFinaltotal(rs4.getString(30+1));
			 obj.setDispatchby(rs4.getString(31+1));
			 obj.setSolddealer(rs4.getString(32+1));
			 obj.setRowno(indexno);
			 List<String> imeino = new ArrayList<String>();
	    String sqlselect = "select * from dblocator.selectprocedure('selectimeidealer', '" +obj.getPurchaseorder_number()
						+ "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
	  
//		 System.out.println(sqlselect);
		 Statement st=con.createStatement();
		 ResultSet rs=st.executeQuery(sqlselect);
		 int h=0;
		 while(rs.next()){
			 imeino.add(rs.getString(1));
		 }
		 obj.setImeino(imeino);
			 
//			 if(flag==1){
//				 obj.setFlag("false");
//			 } else{
				 obj.setFlag("true");
//			 }
			 indexno++;
//			 System.out.println(obj.getTotal()+""+obj.getCreditamount());
			 data.add(obj);
		 }catch(Exception e){
			 System.out.println("e "+e);
		 }
	 }
//	 k++;
//	 }
	
	 String json = new Gson().toJson(data);   return json;
	 }
	 catch (Exception e)
	 {
	 System.out.println(e);
	 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		  System.out.println(e);
			e.printStackTrace();
		}
	 }
	}
	
	
	
	 @RequestMapping("customersaledetails")
	 
	 public @ResponseBody String customerSaleDetails(@RequestParam("companyid") String companyid,@RequestParam("loginid") String loginid,@RequestParam("searchbyCustomer")String searchbyCustomer) {
	 List<devicesalecustomer>data=new ArrayList<devicesalecustomer>();
//	 List<parentcomp_details> list = getLoginId(companyid);
	 Connection con = null;
	 try{
	 Class.forName("org.postgresql.Driver");
	  con =
	 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
					"takshak");
  System.out.println("Connected in websservice customersale");
//	 int k=0, flag=1;
	 int indexno=1;
//	  while(k<list.size()){
//	 String sqlselect4="select vehicle_creation()";
		if(searchbyCustomer==null)
		{
			searchbyCustomer="";
		}
		  
		  String sqlselect4 = "select * from dblocator.selectprocedure('selectDeviceSalecustomer', '" +loginid
					+ "', '"+searchbyCustomer+"', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

		  System.out.println("cust"+sqlselect4);

	 SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 Statement st4=con.createStatement();
	 ResultSet rs4=st4.executeQuery(sqlselect4);
//	 if(list.get(k).getLoginid().equals(loginid)){
//			flag=0;
//		}
	 while(rs4.next()){
		
		  //		 transid, customerid, no_devices, purchaseorder_number, purchaseorder_date, 
//	       invoice_number, invoice_date, total, tax, octroi, vatt, servicetax, 
//	       paymentmode, chequeno, chequedate, creditdays, creditamount, 
//	       payedby, order_placedby, emailidby, phonenoby, nameby, dispatchnameby, 
//	       dispatchphoneby, dispatchcourier, dispatchpaketno, datetimestamp, 
//	       loginid, flag, finaltotal, dispatchby
		 
		 try{
			 devicesalecustomer obj = new devicesalecustomer();
			 
			 obj.setTransid(rs4.getString(0+1));
			 obj.setCustomerid(rs4.getString(1+1));
			 obj.setNo_devices(rs4.getString(2+1));
			 obj.setPurchaseorder_number(rs4.getString(3+1));
			  obj.setPurchaseorder_date(rs4.getString(4+1));
			 obj.setInvoice_number(rs4.getString(5+1));
			 obj.setInvoice_date(rs4.getString(6+1));
			 obj.setTotal(rs4.getString(7+1));
			 obj.setTax(rs4.getString(8+1));
			 obj.setOctroi(rs4.getString(9+1));
			 obj.setVatt(rs4.getString(10+1));
			 obj.setServicetax(rs4.getString(11+1));
			 obj.setPaymentmode(rs4.getString(12+1));
			 obj.setChequeno(rs4.getString(13+1));
			 obj.setChequedate(rs4.getString(14+1));
			 obj.setCreditdays(rs4.getString(15+1));
			 obj.setCreditamount(rs4.getString(16+1));
			 obj.setPayedby(rs4.getString(17+1));
			 obj.setOrder_placedby(rs4.getString(18+1));
			 obj.setEmailidby(rs4.getString(19+1));
			 obj.setPhonenoby(rs4.getString(20+1));
			 obj.setNameby(rs4.getString(21+1));
			 obj.setDispatchnameby(rs4.getString(22+1));
			 obj.setDispatchphoneby(rs4.getString(23+1));
			 obj.setDispatchcourier(rs4.getString(24+1));
			 obj.setDispatchpaketno(rs4.getString(25+1));
			 obj.setDatetimestamp(rs4.getString(26+1));
			 obj.setLoginid(rs4.getString(27+1));
			  obj.setFlag(rs4.getString(28+1));
			 obj.setCustomername(rs4.getString(29+1));
			 obj.setFinaltotal(rs4.getString(30+1));
			 obj.setDispatchby(rs4.getString(31+1));
			 obj.setSolddealer(rs4.getString(32+1));
			 obj.setRowno(indexno);
			 List<String> imeino = new ArrayList<String>();
			 
			 String sqlselect = "select * from dblocator.selectprocedure('selectimeicustomer', '" +obj.getPurchaseorder_number()
				+ "', '', '', '', '', '', '', '', "
				+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
				+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

//				System.out.println(sqlselect);
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(sqlselect);
				int h=0;
				while(rs.next()){
					 imeino.add(rs.getString(1));
				}
				obj.setImeino(imeino);
			 
//			 if(flag==1){
//				 obj.setFlag("false");
//			 } else{
				 obj.setFlag("true");
//			 }
			 indexno++;
//			 System.out.println(obj.getTotal()+""+obj.getCreditamount());
			 data.add(obj);
		 }catch(Exception e){
			 System.out.println("e "+e);
		 }
	 }
//	 k++;
//	 }
	
	 String json = new Gson().toJson(data);   return json;
	 }
	 catch (Exception e)
	 {
	 System.out.println(e);
	 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		  System.out.println(e);
			e.printStackTrace();
		}
	 }
	}

	 

	
	@RequestMapping("devicesaleinsert")
	
	public @ResponseBody String devicesaleInsert(@RequestParam("dealerid") String dealerid, @RequestParam("no_devices") String no_devices,
			@RequestParam("purchaseorder_number") String purchaseorder_number, @RequestParam("purchaseorder_date") String purchaseorder_date,
			@RequestParam("invoice_number") String invoice_number, @RequestParam("invoice_date") String invoice_date,
			@RequestParam("total") String total, @RequestParam("tax") String tax,
			@RequestParam("octroi") String octroi, @RequestParam("vatt") String vatt,
			@RequestParam("servicetax") String servicetax, @RequestParam("paymentmode") String paymentmode,
			@RequestParam("chequeno") String chequeno, @RequestParam("chequedate") String chequedate,
			@RequestParam("creditdays") String creditdays, @RequestParam("creditamount") String creditamount,
			@RequestParam("payedby") String payedby,@RequestParam("order_placedby") String order_placedby,
			@RequestParam("emailidby") String emailidby,@RequestParam("phonenoby") String phonenoby,
			@RequestParam("nameby") String nameby,@RequestParam("dispatchnameby") String dispatchnameby,
			@RequestParam("dispatchphoneby") String dispatchphoneby,@RequestParam("dispatchcourier") String dispatchcourier,
			@RequestParam("dispatchpaketno") String dispatchpaketno,@RequestParam("finaltotal") String finaltotal,
			@RequestParam("loginid") String loginid,@RequestParam("dispatchby") String dispatchby,
			@RequestParam("modelid") String modelid,@RequestParam("count") String count) {
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice dealersale insert");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			
//			transid, dealerid, no_devices, purchaseorder_number, purchaseorder_date, 
//		    invoice_number, invoice_date, total, tax, octroi, vatt, servicetax, 
//		    paymentmode, chequeno, chequedate, creditdays, creditamount, 
//		    payedby, order_placedby, emailidby, phonenoby, nameby, dispatchnameby, 
//		    dispatchphoneby, dispatchcourier, dispatchpaketno, datetimestamp, 
//		    loginid, flag, finaltotal
		    
		
			
//			transid, dealerid, no_devices, purchaseorder_number, purchaseorder_date, 
//		       invoice_number, invoice_date, total, tax, octroi, vatt, servicetax, 
//		       paymentmode, chequeno, chequedate, creditdays, creditamount, 
//		       payedby, order_placedby, emailidby, phonenoby, nameby, dispatchnameby, 
//		       dispatchphoneby, dispatchcourier, dispatchpaketno, datetimestamp, 
//		       loginid, flag, finaltotal,dispatchby
//			
			
			
			String sqlselect4 = " select * from dblocator.insertprocedure('insertDevicesale'," + " '0', '" + dealerid + "', "
					+ "'" + no_devices + "', '" + purchaseorder_number + "', '" + purchaseorder_date + "', '" + invoice_number + "', " + "'"
					+ invoice_date + "', '" + total + "', '" + tax + "',  " + "'" + octroi + "', '"
					+ vatt + "', '" + servicetax + "', '" + paymentmode + "'," + "'" + chequeno + "', '"
					+ chequedate + "', '" + creditdays+ "', '" + creditamount + "', " + "'"+payedby+"',"
					+ "'"+order_placedby+"', '"+emailidby+"', '"+phonenoby+"', '"+nameby+"','"+dispatchnameby+"', '"+dispatchphoneby+"',"
					+ " '"+dispatchcourier+"', '"+dispatchpaketno+"','"+tt.toLocaleString()+"', '"+loginid+"', "
					+ "'0', '"+finaltotal+"','"+dispatchby+"', '', "
					+ "'', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
		//	System.out.println("query"+sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
//			sqlselect4 = "select * from dblocator.insertprocedure('insertdevicetodealer'," + " '" + modelid + "', '" + dealerid
//						+ "', " + "'" + purchaseorder_number + "', '" + tt.toLocaleString() + "', '" + loginid
//						+ "', " + "'"+count+"', '', '',  " + "'', '', '', '',"
//						+ "'', '', '', '', '','', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
//			//	System.out.println("query"+sqlselect4);
//				ps = con.prepareStatement(sqlselect4);
//				rs = ps.execute();
//				
//				if (rs) {
//				return "ok";
//				} else {
//					return "Not ok";
//				}
			} else {
//				return "Not ok";
			}
			
			return "ok";

		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("devicesaleinsertcustomer")
	
	public @ResponseBody String devicesaleInsertcustomer(@RequestParam("customerid") String customerid, @RequestParam("no_devices") String no_devices,
			@RequestParam("purchaseorder_number") String purchaseorder_number, @RequestParam("purchaseorder_date") String purchaseorder_date,
			@RequestParam("invoice_number") String invoice_number, @RequestParam("invoice_date") String invoice_date,
			@RequestParam("total") String total, @RequestParam("tax") String tax,
			@RequestParam("octroi") String octroi, @RequestParam("vatt") String vatt,
			@RequestParam("servicetax") String servicetax, @RequestParam("paymentmode") String paymentmode,
			@RequestParam("chequeno") String chequeno, @RequestParam("chequedate") String chequedate,
			@RequestParam("creditdays") String creditdays, @RequestParam("creditamount") String creditamount,
			@RequestParam("payedby") String payedby,@RequestParam("order_placedby") String order_placedby,
			@RequestParam("emailidby") String emailidby,@RequestParam("phonenoby") String phonenoby,
			@RequestParam("nameby") String nameby,@RequestParam("dispatchnameby") String dispatchnameby,
			@RequestParam("dispatchphoneby") String dispatchphoneby,@RequestParam("dispatchcourier") String dispatchcourier,
			@RequestParam("dispatchpaketno") String dispatchpaketno,@RequestParam("finaltotal") String finaltotal,
			@RequestParam("loginid") String loginid,@RequestParam("dispatchby") String dispatchby,
			@RequestParam("modelid") String modelid,@RequestParam("count") String count,@RequestParam("parentloginid") String parentloginid) {
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice dealersale insert");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			
//			transid, customer, no_devices, purchaseorder_number, purchaseorder_date, 
//		    invoice_number, invoice_date, total, tax, octroi, vatt, servicetax, 
//		    paymentmode, chequeno, chequedate, creditdays, creditamount, 
//		    payedby, order_placedby, emailidby, phonenoby, nameby, dispatchnameby, 
//		    dispatchphoneby, dispatchcourier, dispatchpaketno, datetimestamp, 
//		    loginid, flag, finaltotal
		    
		
			
//			transid, customer, no_devices, purchaseorder_number, purchaseorder_date, 
//		       invoice_number, invoice_date, total, tax, octroi, vatt, servicetax, 
//		       paymentmode, chequeno, chequedate, creditdays, creditamount, 
//		       payedby, order_placedby, emailidby, phonenoby, nameby, dispatchnameby, 
//		       dispatchphoneby, dispatchcourier, dispatchpaketno, datetimestamp, 
//		       loginid, flag, finaltotal,dispatchby
//			
			
			
			System.out.println("parentloginid"+parentloginid);
			
			String sqlselect4 = " select * from dblocator.insertprocedure('insertDevicesaleCustomer'," + " '0', '" + customerid + "', "
					+ "'" + no_devices + "', '" + purchaseorder_number + "', '" + purchaseorder_date + "', '" + invoice_number + "', " + "'"
					+ invoice_date + "', '" + total + "', '" + tax + "',  " + "'" + octroi + "', '"
					+ vatt + "', '" + servicetax + "', '" + paymentmode + "'," + "'" + chequeno + "', '"
					+ chequedate + "', '" + creditdays+ "', '" + creditamount + "', " + "'"+payedby+"',"
					+ "'"+order_placedby+"', '"+emailidby+"', '"+phonenoby+"', '"+nameby+"','"+dispatchnameby+"', '"+dispatchphoneby+"',"
					+ " '"+dispatchcourier+"', '"+dispatchpaketno+"','"+tt.toLocaleString()+"', '"+loginid+"', "
					+ "'0', '"+finaltotal+"','"+dispatchby+"', '"+parentloginid+"', "
					+ "'', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
//			System.out.println("query"+sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
//			sqlselect4 = "select * from dblocator.insertprocedure('insertdevicetodealer'," + " '" + modelid + "', '" + customer
//						+ "', " + "'" + purchaseorder_number + "', '" + tt.toLocaleString() + "', '" + loginid
//						+ "', " + "'"+count+"', '', '',  " + "'', '', '', '',"
//						+ "'', '', '', '', '','', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
//			//	System.out.println("query"+sqlselect4);
//				ps = con.prepareStatement(sqlselect4);
//				rs = ps.execute();
//				
//				if (rs) {
//				return "ok";
//				} else {
//					return "Not ok";
//				}
			} else {
//				return "Not ok";
			}
			
			return "ok";

		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	@RequestMapping("idlereportDetails")
	
	public @ResponseBody String idlereportDetails(@RequestParam("vehicleno") String vehicleno,
			@RequestParam("fdate") String fdate,@RequestParam("tdate") String tdate,
			@RequestParam("loginid1") String loginid1) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
	System.out.println("Connected in websservice idelreport summary");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// devicemapid,dealerid, dealername,
			// deviceid,devicename,salecost, credit_money, payement_mode
			String sqlselect4 = "select * from dblocator.getidlehoursreport1('"+vehicleno+"','"+fdate+"',"
					+ "'"+tdate+"','"+loginid1+"')";
			System.out.println(sqlselect4);
			System.out.println("fdate"+fdate+"tdate"+tdate);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
//			//	System.out.println(" rs = "+rs);
				return "ok";
			} else {
				return "error";
			}

		}

		catch (Exception e) {
		System.out.println("indeat"+e);
			return "error";
		} finally {
			try {
				con.close(); //System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	

	
	@RequestMapping("idlereport")
	
	public @ResponseBody String idlereport() {
	List<idleReport_details> data = new ArrayList<idleReport_details>();
	Connection con = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice ");
//			selectvstop
			String sqlselect4 = "select * from dblocator.selectprocedure('selectidlereport', '"
					+ "', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

			System.out.println("query"+sqlselect4);
			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
			String vno = "h";  int i =0;int k=0;
			String dist="";
			String dist1="";
			while (rs4.next()) {
try
{
	idleReport_details  obj = new idleReport_details ();
				if(!vno.equals(rs4.getString(1))&& !dist.equals(rs4.getString(4))){
					obj.setVehicleno(rs4.getString(1));
					//obj.setTotalhours((rs4.getString(4)));
					obj.setTotalhours(rs4.getTime(4).toString());

					}else{
					obj.setVehicleno("");
					//obj.setTotalhours("");
				}
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MM-yyyy");
				java.util.Date parseTimestamp = sdf1.parse(rs4.getString(2));
//				dd.setDatereceived(sdfnew.format(parseTimestamp));
//				dd.setTrackdate(parseTimestamp.toLocaleString());
				obj.setTodate(sdfnew.format(parseTimestamp));
				
				//obj.setTodate(rs4.getString(2));
				obj.setHours(rs4.getString(3));
				data.add(obj);
				vno=rs4.getString(1);
				//dist=rs4.getString(4);
				dist=String.valueOf(Math.round(Double.parseDouble(rs4.getString(4)) * 100.0) / 100.0);
				//dist1=rs4.getString(2);
				i++;
}catch(Exception ex){
//	System.out.println(ex);
	}
}
			if(data.isEmpty()){
				System.out.println("empty data");
				return "";
			}else{
				System.out.println("data = "+data);
				String json = new Gson().toJson(data);   return json;
			}
			
		} catch (Exception e) {
			System.out.println("e1"+e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	@RequestMapping("overspeedReport")
	
	public @ResponseBody String overspeedReport(@RequestParam("vehicleno") String vehicleno,@RequestParam("fromdate")String fromdate,@RequestParam("todate")String todate,@RequestParam("overspeedlimit")String overspeedlimit) {
		List<overspeed_details > data = new ArrayList<overspeed_details >();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
 System.out.println("Connected in websservice overspeed report ");
			
				String sqlselect4 = "select * from dblocator.selectprocedure('overspeedReport', '"
						+ fromdate + "', '"+todate+"', '"+overspeedlimit+"', '"+vehicleno+"', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				
				System.out.println("in  log"+sqlselect4);
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				 System.out.println("in overlint"+overspeedlimit);
				boolean avail=false;;
		while (rs4.next()) {
					try {
						overspeed_details  obj=new overspeed_details ();
						obj.setVehicleid(rs4.getString(1));
						obj.setVehicletypeid(rs4.getString(2));
						obj.setVehicleregno(rs4.getString(3));
						obj.setDeviceid(rs4.getString(4));
						obj.setImeino(rs4.getString(5));
						obj.setLatitude(rs4.getString(6));
						obj.setLongitude(rs4.getString(7));
						
						SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss a");
						java.util.Date parseTimestamp = sdf1.parse(rs4.getString(8));

						obj.setDatatimestamp(sdfnew.format(parseTimestamp));
						
						if(rs4.getString(9).equals("0"))
						{
						obj.setGpsstatus("Invalid");
						}
						else
						{
							obj.setGpsstatus("Valid");
						}
						obj.setPackettime(rs4.getString(10));
						
						obj.setVehiclespeed(String.valueOf(Math.round(Double.parseDouble(rs4.getString(11)) * 100.0) / 100.0));

						
						//obj.setVehiclespeed(rs4.getString(11));
						if(rs4.getInt(12)==0)
						{
							obj.setIgnumber("ON");
						}
						else
						{
							obj.setIgnumber("OFF");
						}
						
						try{
							obj.setLocation(getLocationClass.getLoc(Double.parseDouble(obj.getLatitude()),
								Double.parseDouble(obj.getLongitude())));
							}catch(Exception e){
							  System.out.println(e);
							}
						if(obj.getLocation().equals("") || obj.getLocation().startsWith("Object")){
							obj.setLocation("Location Not Found");
						}
						//System.out.println("speed"+rs4.getString(11)+"location"+obj.getLocation());
						data.add(obj);
					
					} catch (Exception e) {
						System.out.println("e = " + e);
					}
		}
			String json = new Gson().toJson(data);   return json;
//			return "{\"success\": true,\"error_code\": 200}";
			
		
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	
	
	
	
	
	@RequestMapping("ignitionReportDetails")
	
	public @ResponseBody String ignitionReport(@RequestParam("vehicleno") String vehicleno,
			@RequestParam("fdate") String fdate,@RequestParam("tdate") String tdate,
			@RequestParam("loginid1") String loginid1) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice iginitdetais summary");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// devicemapid,dealerid, dealername,
			// deviceid,devicename,salecost, credit_money, payement_mode
			String sqlselect4 = "select * from dblocator.getignitonreport('"+vehicleno+"','"+fdate+"',"
					+ "'"+tdate+"','"+loginid1+"')";
			System.out.println(sqlselect4);
			System.out.println("fdate"+fdate+"tdate"+tdate);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
//			//	System.out.println(" rs = "+rs);
				return "ok";
			} else {
				return "error";
			}

		}

		catch (Exception e) {
		System.out.println("indeat"+e);
			return "error";
		} finally {
			try {
				con.close(); //System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	@RequestMapping("ignitionreport")
	
	public @ResponseBody String ignitionreport() {
	List<iginition_details> data = new ArrayList<iginition_details>();
	Connection con = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice igintio report ");
//			selectvstop
			String sqlselect4 = "select * from dblocator.selectprocedure('selectIgnitionReport', '"
					+ "', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

			System.out.println("query"+sqlselect4);
			Statement st4 = con.createStatement();
			ResultSet rs4 = st4.executeQuery(sqlselect4);
			String vno = "h";  int i =0;int k=0;
			String dist="";
			String dist1="";
			while (rs4.next()) {
try
{
		iginition_details  obj = new iginition_details ();
//				if(!vno.equals(rs4.getString(1))&& !dist.equals(rs4.getString(4))){
//					obj.setVehicleno(rs4.getString(1));
//					//obj.setTotalhours((rs4.getString(4)));
//					obj.setTotal_switchonhours(rs4.getTime(4).toString());
//					obj.setTotal_switchoffhours(rs4.getTime(6).toString());
//
//					}else{
//					obj.setVehicleno("");
//					//obj.setTotalhours("");
//				}
		
				obj.setVehicleno(rs4.getString(1));
				SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MM-yyyy");
				java.util.Date parseTimestamp = sdf1.parse(rs4.getString(2));
				obj.setTdate(sdfnew.format(parseTimestamp));
				obj.setSwitchon_duration(rs4.getString(3));
				obj.setTotal_switchonhours(rs4.getString(4));
				obj.setSwitchoff_duration(rs4.getString(5));
				obj.setTotal_switchoffhours(rs4.getString(6));
				
				data.add(obj);
		
}catch(Exception ex){
	System.out.println(ex);
	}
}
			if(data.isEmpty()){
				System.out.println("empty data");
				return "";
			}else{
				System.out.println("data = "+data);
				String json = new Gson().toJson(data);   return json;
			}
			
		} catch (Exception e) {
			System.out.println("e1"+e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("devicesaleupdate")
	
	public @ResponseBody String devicesaleUpdate(@RequestParam("transid") String transid,
			@RequestParam("dealerid") String dealerid, @RequestParam("no_devices") String no_devices,
			@RequestParam("purchaseorder_number") String purchaseorder_number, @RequestParam("purchaseorder_date") String purchaseorder_date,
			@RequestParam("invoice_number") String invoice_number, @RequestParam("invoice_date") String invoice_date,
			@RequestParam("total") String total, @RequestParam("tax") String tax,
			@RequestParam("octroi") String octroi, @RequestParam("vatt") String vatt,
			@RequestParam("servicetax") String servicetax, @RequestParam("paymentmode") String paymentmode,
			@RequestParam("chequeno") String chequeno, @RequestParam("chequedate") String chequedate,
			@RequestParam("creditdays") String creditdays, @RequestParam("creditamount") String creditamount,
			@RequestParam("payedby") String payedby,@RequestParam("order_placedby") String order_placedby,
			@RequestParam("emailidby") String emailidby,@RequestParam("phonenoby") String phonenoby,
			@RequestParam("nameby") String nameby,@RequestParam("dispatchnameby") String dispatchnameby,
			@RequestParam("dispatchphoneby") String dispatchphoneby,@RequestParam("dispatchcourier") String dispatchcourier,
			@RequestParam("dispatchpaketno") String dispatchpaketno,@RequestParam("finaltotal") String finaltotal,
			@RequestParam("loginid") String loginid,@RequestParam("dispatchby") String dispatchby
			) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice dealersaleupdate");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			
//			transid, dealerid, no_devices, purchaseorder_number, purchaseorder_date, 
//		       invoice_number, invoice_date, total, tax, octroi, vatt, servicetax, 
//		       paymentmode, chequeno, chequedate, creditdays, creditamount, 
//		       payedby, order_placedby, emailidby, phonenoby, nameby, dispatchnameby, 
//		       dispatchphoneby, dispatchcourier, dispatchpaketno, datetimestamp, 
//		       loginid, flag, finaltotal, dispatchby
		       
			
			String sqlselect4 = "select * from dblocator.insertprocedure('insertDevicesale'," + " '"+transid+"', '" + dealerid + "', "
					+ "'" + no_devices + "','" + purchaseorder_number + "', '" + purchaseorder_date + "', '" + invoice_number + "', " + "'"
					+ invoice_date + "', '" + total + "', '" + tax + "',  " + "'" + octroi + "', '"
					+ vatt + "', '" + servicetax + "', '" + paymentmode + "'," + "'" + chequeno + "', '"
					+ chequedate + "', '" + creditdays+ "', '" + creditamount + "', " + "'"+payedby+"',"
					+ "'"+order_placedby+"', '"+emailidby+"', '"+phonenoby+"', '"+nameby+"','"+dispatchnameby+"', '"+dispatchphoneby+"',"
					+ "'"+dispatchcourier+"', '"+dispatchpaketno+"','"+tt.toLocaleString()+"', '"+loginid+"', "
					+ "'0', '"+finaltotal+"','"+dispatchby+"', '', "
					+ "'', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			
		//	System.out.println(sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
		  
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
		  System.out.println(e);
		  String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block 
				e.printStackTrace();
			}
		}
	}
	
	
		
		@RequestMapping("daywiseallvehicle")
		
		public @ResponseBody String daywiseallvehicle(@RequestParam("day") String day,@RequestParam("loginid")String loginid) {
			List<daywisevehiclesReport> data = new ArrayList<daywisevehiclesReport>();
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice vehde ");
				
				
				
					String sqlselect4 = "select * from dblocator.selectprocedure('daywiseAllVehiclereport', '" +day
							+ "', '"+loginid+"', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
					
				//	System.out.println("query"+sqlselect4);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					int indexno=1;
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					
//					mstvehicle.vehicleid, mstvehicle.vehicletypeid, mstvehicle.vehicleregno,
//				       mstass.deviceid,mstass.assigndate,
//					deviceparse.imeino,deviceparse.latitude,deviceparse.longitude,deviceparse.datatimestamp
//				       FROM dblocator.msttblvehicle as mstvehicle inner  join dblocator.msttblvehicleassigngps as mstass on mstass.vehicleid=mstvehicle.vehicleid
//				       inner join  dblocator.msttbldevice as mstdev on mstdev.deviceid =mstass.deviceid  inner join  devicedata_parsed  as deviceparse 
//				       on deviceparse.imeino= mstdev.uniqueid where deviceparse.datatimestamp::date=$2::date;
//					
					
					while (rs4.next()) {
						daywisevehiclesReport obj=new daywisevehiclesReport();
							obj.setVehicleid(rs4.getString(1));
							obj.setVehicletypeid(rs4.getString(2));
							obj.setVehicleregno(rs4.getString(3));
							obj.setDeviceid(rs4.getString(4));
							obj.setAssigndate(rs4.getString(5));
							obj.setUniqueid(rs4.getString(6));
							obj.setLatitude(rs4.getString(7));
							obj.setLongitude(rs4.getString(8));
							obj.setDatetimestamp(rs4.getString(9));
						//	System.out.println(obj.getVehicleregno()+" "+obj.getLatitude()+" "+obj.getLongitude());
							data.add(obj);
					}
					
				
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		
		
		@RequestMapping("daterangewiseallvehicle")
		
		public @ResponseBody String daterangewiseallvehicle(@RequestParam("date1") String date1,@RequestParam("date2")String date2,@RequestParam("loginid")String loginid) {
			List<daywisevehiclesReport> data = new ArrayList<daywisevehiclesReport>();
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice daterangewiseAllVehiclereport ");
				
				 String sqlselect4=" select * from dblocator.selectprocedure('daterangewiseAllVehiclereport', '"+date1+"', '"+date2+"', '"+loginid+"', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				
				
//				String sqlselect4 = "select * from dblocator.selectprocedure('daterangewiseAllVehiclereport', '" +date1
//							+ "'"+date2+"'', '', '', '', '', '', '', '', "
//							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
//							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
//					
				//	System.out.println("query"+sqlselect4);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					
//					mstvehicle.vehicleid, mstvehicle.vehicletypeid, mstvehicle.vehicleregno,
//				       mstass.deviceid,mstass.assigndate,
//					deviceparse.imeino,deviceparse.latitude,deviceparse.longitude,deviceparse.datatimestamp
//				       FROM dblocator.msttblvehicle as mstvehicle inner  join dblocator.msttblvehicleassigngps as mstass on mstass.vehicleid=mstvehicle.vehicleid
//				       inner join  dblocator.msttbldevice as mstdev on mstdev.deviceid =mstass.deviceid  inner join  devicedata_parsed  as deviceparse 
//				       on deviceparse.imeino= mstdev.uniqueid where deviceparse.datatimestamp::date=$2::date;
//					
					
					while (rs4.next()) {
						daywisevehiclesReport obj=new daywisevehiclesReport();
							obj.setVehicleid(rs4.getString(1));
							obj.setVehicletypeid(rs4.getString(2));
							obj.setVehicleregno(rs4.getString(3));
							obj.setDeviceid(rs4.getString(4));
							obj.setAssigndate(rs4.getString(5));
							obj.setUniqueid(rs4.getString(6));
							obj.setLatitude(rs4.getString(7));
							obj.setLongitude(rs4.getString(8));
							obj.setDatetimestamp(rs4.getString(9));
							data.add(obj);
							 
					
					}
					
				
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		
		
		@RequestMapping("daywiseaparticularvehicle")
		
		public @ResponseBody String daywiseaparticularvehicle(@RequestParam("day") String day,@RequestParam("vehicleno")String vehicleno,@RequestParam("loginid")String loginid) {
			List<daywisevehiclesReport> data = new ArrayList<daywisevehiclesReport>();
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice vehde ");
				
		String sqlselect4=" select * from dblocator.selectprocedure('DailyVehiclereportdaywise', '"+day+"', '"+vehicleno+"', '"+loginid+"', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				
				//	System.out.println("query"+sqlselect4);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					int indexno=1;
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					
					while (rs4.next()) {
						daywisevehiclesReport obj=new daywisevehiclesReport();
							obj.setVehicleid(rs4.getString(1));
							obj.setVehicletypeid(rs4.getString(2));
							obj.setVehicleregno(rs4.getString(3));
							obj.setDeviceid(rs4.getString(4));
							obj.setAssigndate(rs4.getString(5));
							obj.setUniqueid(rs4.getString(6));
							obj.setLatitude(rs4.getString(7));
							obj.setLongitude(rs4.getString(8));
							obj.setDatetimestamp(rs4.getString(9));
//						//	System.out.println("lat long = "+obj.getLatitude()+ " "+obj.getLongitude());
							data.add(obj);
						}
				
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		@RequestMapping("daterangeaparticularvehicle")
		
		public @ResponseBody String daterangeaparticularvehicle(@RequestParam("date1") String date1,@RequestParam("date2") String date2,@RequestParam("vehicleno")String vehicleno,@RequestParam("loginid")String loginid) {
			List<daywisevehiclesReport> data = new ArrayList<daywisevehiclesReport>();
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice daterangeparticu;ar vehicle ");
				
		String sqlselect4=" select * from dblocator.selectprocedure('DailyVehiclereportdatewise', '"+date1+"', '"+date2+"', '"+vehicleno+"', '"+loginid+"', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				
				//	System.out.println("query"+sqlselect4);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					int indexno=1;
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					
					while (rs4.next()) {
						daywisevehiclesReport obj=new daywisevehiclesReport();
					
							obj.setVehicleid(rs4.getString(1));
							obj.setVehicletypeid(rs4.getString(2));
							obj.setVehicleregno(rs4.getString(3));
							obj.setDeviceid(rs4.getString(4));
							obj.setAssigndate(rs4.getString(5));
							obj.setUniqueid(rs4.getString(6));
							obj.setLatitude(rs4.getString(7));
							obj.setLongitude(rs4.getString(8));
							obj.setDatetimestamp(rs4.getString(9));
//						//	System.out.println("uniqueid"+rs4.getString(6));
//						//	System.out.println("latitude"+rs4.getString(7));
//						//	System.out.println("longitude"+rs4.getString(8));
							data.add(obj);
							 
					
					}
					
				
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		@RequestMapping("dealerdashvalues")
		
		public @ResponseBody String dealerdashvalues(@RequestParam("loginid") String loginid) {
			dealerdash obj = new dealerdash();
		
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice vehde ");
				
					
					String sqlselect4 = "select * from dblocator.selectprocedure('selectdealerdashvalues', '" + loginid
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					int indexno=1;
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					while (rs4.next()) {
						
						obj.setTotaldevice(rs4.getString(1));
						obj.setSolddevice(rs4.getString(2));
						obj.setAvailabledevice(rs4.getString(3));
						obj.setDamageddevice(rs4.getString(4));
						obj.setCustomers(rs4.getString(5));
						obj.setDealers(rs4.getString(6));
						
						}
					
					String json = new Gson().toJson(obj);
					return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		
		
		
		
		@RequestMapping("dealerdashsimvehicledetails")
		
		public @ResponseBody String dealerdashsimvehicledetails(@RequestParam("loginid") String loginid) {
			List <dealerassign_details>  data = new  ArrayList<dealerassign_details>();
		
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice in dealersimvehi ");
				
					
					String sqlselect4 = "select * from dblocator.selectprocedure('selectsimandvehicleassigned', '" + loginid
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
					System.out.println(sqlselect4);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					int indexno=1;
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					while (rs4.next()) {
						dealerassign_details obj=new dealerassign_details();
						obj.setTotal(rs4.getString(1));
						obj.setDealername(rs4.getString(2));
						obj.setVehiclenotassigned(rs4.getString(3));
						obj.setVehicleassigned(rs4.getString(4));
						obj.setSimnotassigned(rs4.getString(5));
						obj.setSimassigned(rs4.getString(6));
						data.add(obj);
						}
					
				
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
				System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		@RequestMapping("dealercustomerdetails")
		
		public @ResponseBody String dealercustomerdetails(@RequestParam("loginid") String loginid) {
			List<dealer_details> data = new ArrayList<dealer_details>();
		
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice vehde ");
				
					String sqlselect4 = "select * from dblocator.selectprocedure('selectdealercust', '" + loginid
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				//	System.out.println(sqlselect4);
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);

					
					int count=0;
					while (rs4.next()) {
							 count=rs4.getInt(1);
						}
					
					String json = new Gson().toJson(count);
				return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		
		@RequestMapping("dealersolddevice")
		
		public @ResponseBody String dealersolddevice() {
			List<TotalDevice> data = new ArrayList<TotalDevice>();
		
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice dealersold ");
				
					String sqlselect4 = "select * from dblocator.selectprocedure('dealersolddevice', '" 
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			//	System.out.println(sqlselect4);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				//	System.out.println(sqlselect4);
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					while (rs4.next()) {
						TotalDevice totaldev=new TotalDevice();
						
						totaldev.setId(rs4.getString(1));
						totaldev.setTotal_devices(rs4.getString(2));
						totaldev.setAvailable(rs4.getString(3));
						totaldev.setDamaged(rs4.getString(4));
						totaldev.setSaled(rs4.getString(5));
						totaldev.setDatetimestamp(rs4.getString(6));
						data.add(totaldev);
							
						}
					
				
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		
		@RequestMapping("getSubdealers")
		
		public @ResponseBody String getSubdealers(@RequestParam("loginid") String loginid) {

			List<subdealers> data = new ArrayList<subdealers>();
//			List<parentcomp_details> list = getLoginId(companyid);
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice ");

//				int k = 0, flag = 1;
//				while (k < list.size()) {
//				//	System.out.println("cid of company = " + list.get(k).getCompanyid());
					String sqlselect4 = "select * from dblocator.selectprocedure('mappingdealer', '" + loginid
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

					int indexno = 1;
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
//					if (list.get(k).getLoginid().equals(loginid)) {
//						flag = 0;
//					}

					while (rs4.next()) {
						
						try {
						
							subdealers sb=new subdealers();
							sb.setDealerid(rs4.getString(1));
							data.add(sb);
						} catch (Exception e) {
						//	System.out.println("e = " + e);
						}
						
					}
//					k++;
//				}
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		
		
		@RequestMapping("getSubdealersname")
		
		public @ResponseBody String getSubdealersname(@RequestParam("loginid")String loginid) {

			List<subdealersold> data = new ArrayList<subdealersold>();
//			List<parentcomp_details> list = getLoginId(companyid);
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice subdealername ");
//				SELECT mapdealer.dealerid, mapdealer.loginid,dealer.dealername,sale.no_devices
//				int k = 0, flag = 1;
//				while (k < list.size()) {
//				//	System.out.println("cid of company = " + list.get(k).getCompanyid());
					String sqlselect4 = "select * from dblocator.selectprocedure('subdealername', '" + loginid
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
					
			//	System.out.println(sqlselect4);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

					int indexno = 1;
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					while (rs4.next()) {
						
						try {
							subdealersold sb=new subdealersold();
							sb.setDealername(rs4.getString(1));
							data.add(sb);
					
						} catch (Exception e) {
						//	System.out.println("e = " + e);
						}
						
					}
//					k++;
//				}
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		@RequestMapping("getsolddeviceNumbers")
		
		public @ResponseBody String getsolddeviceNumbers() {

			List<device_details> data = new ArrayList<device_details>();
//			List<parentcomp_details> list = getLoginId(companyid);
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice subdealername ");
//				SELECT mapdealer.dealerid, mapdealer.loginid,dealer.dealername,sale.no_devices
//				int k = 0, flag = 1;
//				while (k < list.size()) {
//				//	System.out.println("cid of company = " + list.get(k).getCompanyid());
					String sqlselect4 = "select * from dblocator.selectprocedure('solddevicesNumber', '" 
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
					
			//	System.out.println(sqlselect4);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					while (rs4.next()) {
						
						try {
							device_details sb=new device_details();
							sb.setUniqueid(rs4.getString(1));
							data.add(sb);
					
						} catch (Exception e) {
						//	System.out.println("e = " + e);
						}
						
					}
//					k++;
//				}
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		
		
		
		@RequestMapping("avialdevicesNumber")
		
		public @ResponseBody String avialdevicesNumber() {

			List<device_details> data = new ArrayList<device_details>();
//			List<parentcomp_details> list = getLoginId(companyid);
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice avialdevicesNumber ");
//				SELECT mapdealer.dealerid, mapdealer.loginid,dealer.dealername,sale.no_devices
//				int k = 0, flag = 1;
//				while (k < list.size()) {
//				//	System.out.println("cid of company = " + list.get(k).getCompanyid());
					String sqlselect4 = "select * from dblocator.selectprocedure('avialdevicesNumber', '" 
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
					
			//	System.out.println(sqlselect4);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					while (rs4.next()) {
						
						try {
							device_details sb=new device_details();
							sb.setUniqueid(rs4.getString(1));
							data.add(sb);
					
						} catch (Exception e) {
						//	System.out.println("e = " + e);
						}
						
					}
//					k++;
//				}
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		
		
		@RequestMapping("getcustomername")
		
		public @ResponseBody String getselectdealercustomername(@RequestParam("loginid") String loginid) {

			List<customer_details> data = new ArrayList<customer_details>();
//			List<parentcomp_details> list = getLoginId(companyid);
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice selectdealercustomername ");
//				SELECT mapdealer.dealerid, mapdealer.loginid,dealer.dealername,sale.no_devices
//				int k = 0, flag = 1;
//				while (k < list.size()) {
//				//	System.out.println("cid of company = " + list.get(k).getCompanyid());
					String sqlselect4 = "select * from dblocator.selectprocedure('selectdealercustomername', '" +loginid
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
					
			//	System.out.println(sqlselect4);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					while (rs4.next()) {
						try {
							customer_details sb=new customer_details();
							sb.setCustomername(rs4.getString(1));
							data.add(sb);
					
						} catch (Exception e) {
						//	System.out.println("e = " + e);
						}
						
					}
//					k++;
//				}
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		@RequestMapping("imenosearch")
		
		public @ResponseBody String imenosearch(@RequestParam("deviceid") String deviceid
				) {
			Connection con = null;

			try {

				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//System.out.println("Connected in websservice daily details summary");
				java.util.Date dd = new Date();
				Timestamp tt = new Timestamp(dd.getTime());

				// devicemapid,dealerid, dealername,
				// deviceid,devicename,salecost, credit_money, payement_mode
				String sqlselect4 = "select * from dblocator.getdailyreport('"+deviceid+"','',"
						+ "'','')";
				System.out.println(sqlselect4);
				PreparedStatement ps = con.prepareStatement(sqlselect4);
				boolean rs = ps.execute();
				if (rs) {
//				//	System.out.println(" rs = "+rs);
					return "ok";
				} else {
					return "error";
				}

			}

			catch (Exception e) {
			//System.out.println("indeat"+e);
				return "error";
			} finally {
				try {
					con.close(); //System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		
		
		
		
		
		
		@RequestMapping("getSubdealerssolddeatils")
		
		public @ResponseBody String getSubdealerssolddeatils(@RequestParam("loginid") String loginid) {

			List<subdealersold> data = new ArrayList<subdealersold>();
//			List<parentcomp_details> list = getLoginId(companyid);
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice ");
//				SELECT mapdealer.dealerid, mapdealer.loginid,dealer.dealername,sale.no_devices
//				int k = 0, flag = 1;
//				while (k < list.size()) {
//				//	System.out.println("cid of company = " + list.get(k).getCompanyid());
					String sqlselect4 = "select * from dblocator.selectprocedure('selectdealerssaledetails', '" + loginid
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
					
			//	System.out.println(sqlselect4);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

					int indexno = 1;
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					String dealer = null,subdealer=null;
					int count = 0;
					while (rs4.next()) {
						
						try {
							if(indexno==1){
								dealer = rs4.getString(3);
								subdealer = rs4.getString(2);
							}
							if(!dealer.equals(rs4.getString(3)) || !subdealer.equals(rs4.getString(2))){
								subdealersold sb=new subdealersold();
								sb.setNo_devices(String.valueOf(count));
								sb.setSubdealername(subdealer);
								sb.setDealername(dealer);
								data.add(sb);
								count = 0;
							}
								dealer = rs4.getString(3);
								subdealer = rs4.getString(2);
								count = count + Integer.parseInt(rs4.getString(1));
//								System.out.println(dealer+" "+subdealer+" "+count);
							
							indexno++;
					
						} catch (Exception e) {
						//	System.out.println("e = " + e);
						}
						
					}
					try{
						subdealersold sb=new subdealersold();
						sb.setNo_devices(String.valueOf(count));
						sb.setSubdealername(subdealer);
						sb.setDealername(dealer);
						data.add(sb);
					}catch(Exception e){
						System.out.println(e);
					}
//					k++;
//				}
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		
		
		@RequestMapping("getdealercustdetails")
		
		public @ResponseBody String getdealercustdetails(@RequestParam("loginid") String loginid) {

			List<dealercustomers_details> data = new ArrayList<dealercustomers_details>();
//			List<parentcomp_details> list = getLoginId(companyid);
			Connection con = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice getdealercustdetails ");
//				SELECT mapdealer.dealerid, mapdealer.loginid,dealer.dealername,sale.no_devices
//				int k = 0, flag = 1;
//				while (k < list.size()) {
//				//	System.out.println("cid of company = " + list.get(k).getCompanyid());
					String sqlselect4 = "select * from dblocator.selectprocedure('selectcustomerssaledetails', '" +loginid
							+ "', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
							+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
					
			//	System.out.println(sqlselect4);
				String dealrid;
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		            int indexno = 1;
					Statement st4 = con.createStatement();
					ResultSet rs4 = st4.executeQuery(sqlselect4);
					String dealer = null,customer=null;
					int count = 0;
					while (rs4.next()) {
						try {
							if(indexno==1){
								dealer = rs4.getString(3);
								customer = rs4.getString(2);
							}
							if(!dealer.equals(rs4.getString(3)) || !customer.equals(rs4.getString(2))){
								dealercustomers_details sb=new dealercustomers_details();
								sb.setNo_devices(String.valueOf(count));
								sb.setCustomername(customer);
								sb.setDealername(dealer);
								data.add(sb);
								count = 0;
							}
							
							dealer = rs4.getString(3);
							customer = rs4.getString(2);
							count = count + Integer.parseInt(rs4.getString(1));
							indexno++;
					
						} catch (Exception e) {
						//	System.out.println("e = " + e);
						}
						
					}
					try{
						dealercustomers_details sb=new dealercustomers_details();
						sb.setNo_devices(String.valueOf(count));
						sb.setCustomername(customer);
						sb.setDealername(dealer);
						data.add(sb);
					}catch(Exception e){
						System.out.println(e);
					}
//					k++;
//				}
				String json = new Gson().toJson(data);   return json;
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}


	
	
	@RequestMapping("devicesaleupdatecustomer")
	
	public @ResponseBody String devicesaleUpdateCustomer(@RequestParam("transid") String transid,
			@RequestParam("customerid") String customerid, @RequestParam("no_devices") String no_devices,
			@RequestParam("purchaseorder_number") String purchaseorder_number, @RequestParam("purchaseorder_date") String purchaseorder_date,
			@RequestParam("invoice_number") String invoice_number, @RequestParam("invoice_date") String invoice_date,
			@RequestParam("total") String total, @RequestParam("tax") String tax,
			@RequestParam("octroi") String octroi, @RequestParam("vatt") String vatt,
			@RequestParam("servicetax") String servicetax, @RequestParam("paymentmode") String paymentmode,
			@RequestParam("chequeno") String chequeno, @RequestParam("chequedate") String chequedate,
			@RequestParam("creditdays") String creditdays, @RequestParam("creditamount") String creditamount,
			@RequestParam("payedby") String payedby,@RequestParam("order_placedby") String order_placedby,
			@RequestParam("emailidby") String emailidby,@RequestParam("phonenoby") String phonenoby,
			@RequestParam("nameby") String nameby,@RequestParam("dispatchnameby") String dispatchnameby,
			@RequestParam("dispatchphoneby") String dispatchphoneby,@RequestParam("dispatchcourier") String dispatchcourier,
			@RequestParam("dispatchpaketno") String dispatchpaketno,@RequestParam("finaltotal") String finaltotal,
			@RequestParam("loginid") String loginid,@RequestParam("dispatchby") String dispatchby
			) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice customersaleupdate");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			
//			transid, customerid, no_devices, purchaseorder_number, purchaseorder_date, 
//		       invoice_number, invoice_date, total, tax, octroi, vatt, servicetax, 
//		       paymentmode, chequeno, chequedate, creditdays, creditamount, 
//		       payedby, order_placedby, emailidby, phonenoby, nameby, dispatchnameby, 
//		       dispatchphoneby, dispatchcourier, dispatchpaketno, datetimestamp, 
//		       loginid, flag, finaltotal, dispatchby
		       
			
			String sqlselect4 = "select * from dblocator.insertprocedure('insertDevicesaleCustomer'," + " '"+transid+"', '" + customerid + "', "
					+ "'" + no_devices + "','" + purchaseorder_number + "', '" + purchaseorder_date + "', '" + invoice_number + "', " + "'"
					+ invoice_date + "', '" + total + "', '" + tax + "',  " + "'" + octroi + "', '"
					+ vatt + "', '" + servicetax + "', '" + paymentmode + "'," + "'" + chequeno + "', '"
					+ chequedate + "', '" + creditdays+ "', '" + creditamount + "', " + "'"+payedby+"',"
					+ "'"+order_placedby+"', '"+emailidby+"', '"+phonenoby+"', '"+nameby+"','"+dispatchnameby+"', '"+dispatchphoneby+"',"
					+ "'"+dispatchcourier+"', '"+dispatchpaketno+"','"+tt.toLocaleString()+"', '"+loginid+"', "
					+ "'0', '"+finaltotal+"','"+dispatchby+"', '', "
					+ "'', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			
		//	System.out.println(sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block 
				e.printStackTrace();
			}
		}
	}


	
	
	@RequestMapping("dealersaledelete")
	
	public @ResponseBody String dealersaledelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice deleteDevicesale");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteDevicesale'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	@RequestMapping("deleteDevicesalecustomer")
	
	public @ResponseBody String customersaledelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice deleteDevicesale");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteDevicesalecustomer'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	


	
	@RequestMapping("vehicledetails")
	
	public @ResponseBody String vehicleDetails(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("searchbyvehicleno")String searchbyvehicleno) {
		List<vehicle_details> data = new ArrayList<vehicle_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehicledetails 1");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
			if(searchbyvehicleno==null)
			{
			searchbyvehicleno="";
			}
			
				String sqlselect4 = "select * from dblocator.selectprocedure('selectvehicle', '" + loginid
						+ "', '"+searchbyvehicleno+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				
				System.out.println("veh"+sqlselect4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
				while (rs4.next()) {
					vehicle_details obj = new vehicle_details();
					obj.setVehicleid(Long.parseLong(rs4.getString(0+1)));
					obj.setMakeid(Long.parseLong(rs4.getString(1+1)));
					obj.setModelid(Long.parseLong(rs4.getString(2+1)));
					obj.setVehicletypeid(Long.parseLong(rs4.getString(3+1)));
					obj.setVehicleregno(rs4.getString(4+1));

					// obj.setRegdate(sdf.parse(rs4.getString(5+1)));
					obj.setRegdate(rs4.getString(5+1));
					obj.setChasisnumber(rs4.getString(6+1));
					obj.setEnginenumber(rs4.getString(7+1));
					obj.setBodycolor(rs4.getString(8+1));
					obj.setFueltypeid(Long.parseLong(rs4.getString(9+1)));
					// obj.setRegvaliddate(sdf.parse(rs4.getString(10+1)));
					obj.setRegvaliddate(rs4.getString(10+1));
					obj.setInsurancevaliddate(rs4.getString(11+1));
					obj.setPucdate(rs4.getString(12+1));
					obj.setTankcapacity(Integer.parseInt(rs4.getString(13+1)));
					obj.setLoginid(Long.parseLong(rs4.getString(14+1)));

					java.util.Date parseTimestamp = sdf2.parse(rs4.getString(15+1));

					// obj.setDatetimestamp(new
					// Timestamp(parseTimestamp.getTime()));
					obj.setDatetimestamp(parseTimestamp.toLocaleString());
					obj.setRemarks(rs4.getString(16+1));
					obj.setFlag(rs4.getString(17+1));
					obj.setInsurancecompany(rs4.getString(18+1));
					
					obj.setRowno(indexno);
					indexno++;
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					obj.setMakename(rs4.getString(19+1));
					obj.setModelname(rs4.getString(20+1));

					obj.setVehicletypename(rs4.getString(21+1));
					// obj.setStatus(rs4.getString(21+1));
					String status = rs4.getString(22+1);
					if (status.equals("1")) {
						obj.setStatus("Assigned");
					} else {
						obj.setStatus("Not Assigned");
					}
					obj.setCustomername(rs4.getString(24));
					data.add(obj);
					//System.out.println("lenght"+data.size());

				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
			System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	

	
	@RequestMapping("searchByVehicleno")
	
	public @ResponseBody String searchByVehicleno(@RequestParam("loginid") String loginid, @RequestParam("companyid") String companyid,@RequestParam("vehicleno")String vehicleno) {
		List<vehicle_details> data = new ArrayList<vehicle_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vehicledetails 1");
//			int k = 0, flag = 1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
			String sqlselect4 = "select * from dblocator.selectprocedure('selectsearchByvehicleno', '" + loginid
					+ "', '"+vehicleno+"', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				
				System.out.println(sqlselect4);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
				int indexno=1;
				while (rs4.next()) {
					vehicle_details obj = new vehicle_details();
					obj.setVehicleid(Long.parseLong(rs4.getString(0+1)));
					obj.setMakeid(Long.parseLong(rs4.getString(1+1)));
					obj.setModelid(Long.parseLong(rs4.getString(2+1)));
					obj.setVehicletypeid(Long.parseLong(rs4.getString(3+1)));
					obj.setVehicleregno(rs4.getString(4+1));

					// obj.setRegdate(sdf.parse(rs4.getString(5+1)));
					obj.setRegdate(rs4.getString(5+1));
					obj.setChasisnumber(rs4.getString(6+1));
					obj.setEnginenumber(rs4.getString(7+1));
					obj.setBodycolor(rs4.getString(8+1));
					obj.setFueltypeid(Long.parseLong(rs4.getString(9+1)));
					// obj.setRegvaliddate(sdf.parse(rs4.getString(10+1)));
					obj.setRegvaliddate(rs4.getString(10+1));
					obj.setInsurancevaliddate(rs4.getString(11+1));
					obj.setPucdate(rs4.getString(12+1));
					obj.setTankcapacity(Integer.parseInt(rs4.getString(13+1)));
					obj.setLoginid(Long.parseLong(rs4.getString(14+1)));

					java.util.Date parseTimestamp = sdf2.parse(rs4.getString(15+1));

					// obj.setDatetimestamp(new
					// Timestamp(parseTimestamp.getTime()));
					obj.setDatetimestamp(parseTimestamp.toLocaleString());
					obj.setRemarks(rs4.getString(16+1));
					obj.setFlag(rs4.getString(17+1));
					obj.setInsurancecompany(rs4.getString(18+1));
					
					obj.setRowno(indexno);
					indexno++;
//					if (flag == 1) {
//						obj.setFlag("false");
//					} else {
						obj.setFlag("true");
//					}
					obj.setMakename(rs4.getString(19+1));
					obj.setModelname(rs4.getString(20+1));

					obj.setVehicletypename(rs4.getString(21+1));
					// obj.setStatus(rs4.getString(21+1));
					String status = rs4.getString(22+1);
					if (status.equals("1")) {
						obj.setStatus("Assigned");
					} else {
						obj.setStatus("Not Assigned");
					}
					obj.setCustomername(rs4.getString(24));
					data.add(obj);

				}
//				k++;
//			}
			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
			System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	

	
	@RequestMapping("vehicleinsert")
	
	public @ResponseBody String vehicleInsert(@RequestParam("makeid") String makeid, @RequestParam("modelid") String modelid,
			@RequestParam("vehicletypeid") String vehicletypeid, @RequestParam("vehicleregno") String vehicleregno,
			@RequestParam("chasisnumber") String chasisnumber, @RequestParam("enginenumber") String enginenumber,
			@RequestParam("bodycolor") String bodycolor, @RequestParam("fueltypeid") String fueltypeid,
			@RequestParam("regdate") String regdate, @RequestParam("regvaliddate") String regvaliddate,
			@RequestParam("insurancevaliddate") String insurancevaliddate, @RequestParam("pucdate") String pucdate,
			@RequestParam("tankcapacity") String tankcapacity, @RequestParam("loginid") String loginid,
			@RequestParam("remarks") String remarks,@RequestParam("inusrancecompanyname") String inusrancecompanyname,
			@RequestParam("customerid") String customerid) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		System.out.println("Connected in websservice vehicleinsert");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// vehicleid, makeid, modelid, vehicletypeid, vehicleregno, regdate,
			// chasisnumber, enginenumber, bodycolor, fueltypeid, regvaliddate,
			// permitdate, permitvaliddate, insurancedate, insurancevaliddate,
			// pucdate, pucvaliddate, tankcapacity, loginid, datetimestamp,
			// remarks, flag
			
			
			String sqlselect4 = "select * from dblocator.insertprocedure('insertVehicle'," + " '0', '" + makeid + "', "
					+ "'" + modelid + "', '" + vehicletypeid + "', '" + vehicleregno + "', '" + regdate + "', " + "'"
					+ chasisnumber + "', '" + enginenumber + "', '" + bodycolor + "',  " + "'" + fueltypeid + "', '"
					+ regvaliddate + "', '" + insurancevaliddate + "', '" + pucdate + "'," + "'" + tankcapacity + "', '"
					+ loginid + "', '" + tt.toLocaleString() + "', '" + remarks + "', " + "'0','"+inusrancecompanyname+"', '"+customerid+"', '', '','', '',"
					+ " '', '','', '', '', '','', '', "
					+ "'', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			System.out.println("vehinsert "+sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
			return "ok";
			} else {
			return "Not ok";
			}
			
			//return "ok";
		} catch (Exception e) {
		  System.out.println(e);
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
		  //System.out.println(e);
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	@RequestMapping("vehicleupdate")
	
	public @ResponseBody String vehicleUpdate(@RequestParam("vehicleid") String vehicleid, @RequestParam("makeid") String makeid,
			@RequestParam("modelid") String modelid, @RequestParam("vehicletypeid") String vehicletypeid,
			@RequestParam("vehicleregno") String vehicleregno, @RequestParam("chasisnumber") String chasisnumber,
			@RequestParam("enginenumber") String enginenumber, @RequestParam("bodycolor") String bodycolor,
			@RequestParam("fueltypeid") String fueltypeid, @RequestParam("regdate") String regdate,
			@RequestParam("regvaliddate") String regvaliddate,
			@RequestParam("insurancevaliddate") String insurancevaliddate, @RequestParam("pucdate") String pucdate,
			@RequestParam("tankcapacity") String tankcapacity, @RequestParam("loginid") String loginid,
			@RequestParam("remarks") String remarks,@RequestParam("inusrancecompanyname")String inusrancecompanyname) {
		Connection con = null;

		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice vehicleupdate");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// vehicleid, makeid, modelid, vehicletypeid, vehicleregno, regdate,
			// chasisnumber, enginenumber, bodycolor, fueltypeid, regvaliddate,
			// permitdate, permitvaliddate, insurancedate, insurancevaliddate,
			// pucdate, pucvaliddate, tankcapacity, loginid, datetimestamp,
			// remarks, flag
			String sqlselect4 = "select * from dblocator.insertprocedure('insertVehicle'," + " '" + vehicleid + "', '"
					+ makeid + "', " + "'" + modelid + "', '" + vehicletypeid + "', '" + vehicleregno + "', '" + regdate
					+ "', " + "'" + chasisnumber + "', '" + enginenumber + "', '" + bodycolor + "',  " + "'"
					+ fueltypeid + "', '" + regvaliddate + "', '" + insurancevaliddate + "', '" + pucdate + "'," + "'"
					+ tankcapacity + "', '" + loginid + "', '" + tt.toLocaleString() + "', '" + remarks + "', "
					+ "'0','"+inusrancecompanyname+"', '', '', '','', ''," + " '', '','', '', '', '','', '', "
					+ "'', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			System.out.println("update"+sqlselect4);
			
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
			livedet det = new livedet();
			det.setExc(String.valueOf(e));
		  //System.out.println(e);
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	
	@RequestMapping("makeinsert")
	
	public @ResponseBody String makeInsert(@RequestParam("makename") String makename, @RequestParam("assetid") String assetid,
			 @RequestParam("loginid") String loginid,
		 @RequestParam("remarks") String remarks) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			
		//	System.out.println("Connected in websservice makeinsert");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			//makeid, makename, assetid, loginid, datetimestamp, remarks, flag
			
			
			
			String sqlselect4 = "select * from dblocator.insertprocedure('insertMake'," + " '0', '" + makename + "',  '"
					+ assetid + "',  '" + loginid + "', '" + tt.toLocaleString() + "', '" + remarks + "', '0',  "
					+ "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			
			
			
			
//			String sqlselect4 = "select * from dblocator.insertprocedure('insertMake'," + " '0', '" + makename + "', "
//					+ "'" + assetid + "', '" + loginid + "', '" + tt.toLocaleString() + "', " + "'"
//					+ remarks + "', '0', '',  " + "'', '', '', '', '', "
//					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			
		//	System.out.println(sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
//				return "ok";
			} else {
//				return "Not ok";
			}
			
			return "ok";
		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		}

		finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("makeupdate")
	
	public @ResponseBody String makeUpdate(@RequestParam("makeid") String makeid, @RequestParam("makename") String makename,
			@RequestParam("assetid") String assetid,
			@RequestParam("loginid") String loginid, @RequestParam("datetimestamp") String datetimestamp,
			@RequestParam("remarks") String remarks) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// makeid, makename, assetid, vendorid, loginid, datetimestamp,
			// remarks, flag,companyid,maketype
			String sqlselect4 = "select * from dblocator.insertprocedure('insertMake'," + " '" + makeid + "', '" + makename
					+ "', " + "'" + assetid + "', '" + loginid + "', '" + tt.toLocaleString()
					+ "', " + "'" + remarks + "', '" + 0 + "', '" + loginid + "',  " + "'', '', '', '',"
					+ "'', '', '', '', '','', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("simassigninsertnew")
	
	public @ResponseBody String simAssignInsertnew(@RequestParam("deviceid") String deviceid, @RequestParam("simid") String simid,
			@RequestParam("loginid") String loginid, @RequestParam("remarks") String remarks) {
		Connection con = null;
		// devicesimid, deviceid, simid, loginid, datetimestamp, remarks, flag
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// System.out.println("values = "+deviceid+" "+simid+" "+loginid+"
			// "+status+" "+assigndate+" "+remarks);
			// devicesimid, deviceid, simid, loginid, datetimestamp, remarks,
			// flag
			
			
			String sqlselect4 = "select * from dblocator.insertprocedure('insertsimassign', '0', '" + deviceid + "', "
					+ "'" + simid + "', '" + loginid + "', '" + tt.toLocaleString() + "', '" + remarks + "', "
					+ "'0', '', '',  " + "'', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
		//	System.out.println(sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
//				return "ok";
			} else {
//				return "Not ok";
			}
			
			
			return "ok";

		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("simassignupdatenew")
	
	public @ResponseBody String simAssignUpdatenew(@RequestParam("devicesimid") String devicesimid,
			@RequestParam("deviceid") String deviceid, @RequestParam("simid") String simid,
			@RequestParam("loginid") String loginid, @RequestParam("remarks") String remarks) {
		Connection con = null;
		// devicesimid, deviceid, simid, loginid, datetimestamp, remarks, flag
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// System.out.println("values = "+deviceid+" "+simid+" "+loginid+"
			// "+status+" "+assigndate+" "+remarks);
			// devicesimid, deviceid, simid, loginid, datetimestamp, remarks,
			// flag
			String sqlselect4 = "select * from dblocator.insertprocedure('insertsimassign', '" + devicesimid + "', '"
					+ deviceid + "', " + "'" + simid + "', '" + loginid + "', '" + tt.toLocaleString() + "', '"
					+ remarks + "', " + "'0', '', '',  " + "'', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
		//	System.out.println(sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("customerdetails")
	
	public @ResponseBody String customerDetails(@RequestParam("companyid") String companyid, @RequestParam("loginid") String loginid,@RequestParam("searchbycustomername")String searchbycustomername) {
		List<customer_details> data = new ArrayList<customer_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//		//	System.out.println("Connected in websservice customerdetails ");
//			int k = 0, flag = 1; 
			int indexno=1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
			//	System.out.println("loginid "+loginid);
			if(searchbycustomername==null)
			{
				searchbycustomername="";
			}
				String sqlselect4 = "select * from dblocator.selectprocedure('selectCustomer', '"
						+ loginid + "', '"+searchbycustomername+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
					
//			mco.customerid, mco.customername, mco.customertype, mco.contactperson, mco.emailid, 
//			mco.mobilenumber, mco.alternatecontnumber, mco.address, mco.city, mco.pincode, mco.iscredit, 
//			mco.creditdays, mco.creditamount, mco.paymentmode, mco.bank_name, mco.branch, mco.accountno, 
//			mco.bankaddress, mco.ifscno, mco.loginid, mco.datetimestamp, mco.remarks, mco.flag
					try {
						customer_details obj = new customer_details();
						obj.setCustomerid(rs4.getString(1));
						obj.setCustomername(rs4.getString(2));
						obj.setCustomertype(rs4.getString(3));
						obj.setContactperson(rs4.getString(4));
						obj.setEmailid(rs4.getString(5));
						obj.setMobilenumber(rs4.getString(6));
						obj.setAlternatecontnumber(rs4.getString(7));
						obj.setAddress(rs4.getString(8));
						obj.setCity(rs4.getString(9));
						obj.setPincode(rs4.getString(10));
						obj.setIscredit(rs4.getString(11));
						obj.setCreditdays(rs4.getString(12));
						obj.setCreditamount(rs4.getString(13));
						obj.setPaymentmode(rs4.getString(14));
						obj.setBank_name(rs4.getString(15));
						obj.setBranch(rs4.getString(16));
						obj.setAccountno(rs4.getString(17));
						obj.setBankaddress(rs4.getString(18));
						obj.setIfscno(rs4.getString(19));
						obj.setLoginid(rs4.getString(20));
						obj.setDatetimestamp(rs4.getString(21));
						obj.setRemarks(rs4.getString(22));
						obj.setFlag(rs4.getString(23));
						obj.setDealername(rs4.getString(24));
						obj.setRowno(indexno);
						indexno++;
						// obj.setFlag(rs4.getString(14+1));
//						if (flag == 1) {
//							obj.setFlag("false");
//						} else {
							obj.setFlag("true");
//						}
						data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e " + e);
					}
				}
//				k++;
//			}

			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close();
			//	System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	@RequestMapping("searchcustomerByName")
	
	public @ResponseBody String searchcustomerByName(@RequestParam("companyid") String companyid, @RequestParam("loginid") String loginid,@RequestParam("customername")String customername) {
		List<customer_details> data = new ArrayList<customer_details>();
//		List<parentcomp_details> list = getLoginId(companyid);
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		System.out.println("Connected in websservice customerdetails byname ");
//			int k = 0, flag = 1; 
			int indexno=1;
//			while (k < list.size()) {
				// String sqlselect4="select vehicle_creation()";
			//	System.out.println("loginid "+loginid);
				String sqlselect4 = "select * from dblocator.selectprocedure('selectCustomerByName', '"
						+ loginid + "', '"+customername+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				
				System.out.println("cust"+sqlselect4);
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
//				if (list.get(k).getLoginid().equals(loginid)) {
//					flag = 0;
//				}
				while (rs4.next()) {
					
//			mco.customerid, mco.customername, mco.customertype, mco.contactperson, mco.emailid, 
//			mco.mobilenumber, mco.alternatecontnumber, mco.address, mco.city, mco.pincode, mco.iscredit, 
//			mco.creditdays, mco.creditamount, mco.paymentmode, mco.bank_name, mco.branch, mco.accountno, 
//			mco.bankaddress, mco.ifscno, mco.loginid, mco.datetimestamp, mco.remarks, mco.flag
					try {
						customer_details obj = new customer_details();
						obj.setCustomerid(rs4.getString(1));
						obj.setCustomername(rs4.getString(2));
						obj.setCustomertype(rs4.getString(3));
						obj.setContactperson(rs4.getString(4));
						obj.setEmailid(rs4.getString(5));
						obj.setMobilenumber(rs4.getString(6));
						obj.setAlternatecontnumber(rs4.getString(7));
						obj.setAddress(rs4.getString(8));
						obj.setCity(rs4.getString(9));
						obj.setPincode(rs4.getString(10));
						obj.setIscredit(rs4.getString(11));
						obj.setCreditdays(rs4.getString(12));
						obj.setCreditamount(rs4.getString(13));
						obj.setPaymentmode(rs4.getString(14));
						obj.setBank_name(rs4.getString(15));
						obj.setBranch(rs4.getString(16));
						obj.setAccountno(rs4.getString(17));
						obj.setBankaddress(rs4.getString(18));
						obj.setIfscno(rs4.getString(19));
						obj.setLoginid(rs4.getString(20));
						obj.setDatetimestamp(rs4.getString(21));
						obj.setRemarks(rs4.getString(22));
						obj.setFlag(rs4.getString(23));
						obj.setDealername(rs4.getString(24));
						obj.setRowno(indexno);
						indexno++;
						// obj.setFlag(rs4.getString(14+1));
//						if (flag == 1) {
//							obj.setFlag("false");
//						} else {
							obj.setFlag("true");
//						}
						data.add(obj);
					} catch (Exception e) {
					//	System.out.println("e " + e);
					}
				}
//				k++;
//			}

			String json = new Gson().toJson(data);   return json;
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close();
				System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("customerinsert")
	
	public @ResponseBody String customerInsert(@RequestParam("customername") String customername,
			@RequestParam("customertype") String customertype, @RequestParam("contactperson") String contactperson,
			@RequestParam("emailid") String emailid, @RequestParam("mobilenumber") String mobilenumber,
			@RequestParam("alternatecontnumber") String alternatecontnumber,@RequestParam("address") String address,
			@RequestParam("city") String city, @RequestParam("pincode") String pincode,
			@RequestParam("iscredit") String iscredit, @RequestParam("creditdays") String creditdays,
			@RequestParam("creditamount") String creditamount,@RequestParam("paymentmode") String paymentmode,
			@RequestParam("bank_name") String bank_name,@RequestParam("branch") String branch,
			@RequestParam("accountno") String accountno,@RequestParam("bankaddress") String bankaddress,
			@RequestParam("ifscno") String ifscno,@RequestParam("loginid") String loginid,
			@RequestParam("remarks") String remarks,@RequestParam("dealerid")String dealerid) {
		Connection con = null;

		try {

//			mco.customerid, mco.customername, mco.customertype, mco.contactperson,
//			mco.emailid, mco.mobilenumber, mco.alternatecontnumber, mco.address, mco.city, mco.pincode, mco.iscredit, 
//			mco.creditdays, mco.creditamount, mco.paymentmode, mco.bank_name, mco.branch, mco.accountno, 
//			mco.bankaddress, mco.ifscno, mco.loginid, mco.datetimestamp, mco.remarks, mco.flag
			
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//		//	System.out.println("Connected in websservice customerinsert");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			
			
				String sqlselect4 = "select * from dblocator.insertprocedure('insertCustomer', '" 
						+ "0', '"+customername+"', '"+customertype+"', '"+contactperson+"', '"+emailid+"',"
						+ " '"+mobilenumber+"', '"+alternatecontnumber+"', '"+address+"', "
						+ "'"+city+"', '"+pincode+"', '"+iscredit+"', '"+creditdays+"', '"+creditamount+"', "
						+ "'"+paymentmode+"', '"+bank_name+"', '"+branch+"', '"+accountno+"', "
						+ "'"+bankaddress+"', '"+ifscno+"', '"+loginid+"', '"+tt.toLocaleString()+"',"
						+ " '"+remarks+"', '0', '"+dealerid+"', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
	//		//	System.out.println()
				System.out.println(sqlselect4);
				PreparedStatement ps = con.prepareStatement(sqlselect4);
				boolean rs = ps.execute();
				
			return "ok";
		}

		catch (Exception e) {
			System.out.println(e);
			 livedet det = new livedet();
				det.setExc(String.valueOf(e));
			 // System.out.println(e);
				String json = new Gson().toJson(det);
				return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close();
			//	System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	
	@RequestMapping("customerupdate")
	
	public @ResponseBody String customerUpdate(@RequestParam("customerid") String customerid,@RequestParam("customername") String customername,
			@RequestParam("customertype") String customertype, @RequestParam("contactperson") String contactperson,
			@RequestParam("emailid") String emailid, @RequestParam("mobilenumber") String mobilenumber,
			@RequestParam("alternatecontnumber") String alternatecontnumber,@RequestParam("address") String address,
			@RequestParam("city") String city, @RequestParam("pincode") String pincode,
			@RequestParam("iscredit") String iscredit, @RequestParam("creditdays") String creditdays,
			@RequestParam("creditamount") String creditamount,@RequestParam("paymentmode") String paymentmode,
			@RequestParam("bank_name") String bank_name,@RequestParam("branch") String branch,
			@RequestParam("accountno") String accountno,@RequestParam("bankaddress") String bankaddress,
			@RequestParam("ifscno") String ifscno,@RequestParam("loginid") String loginid,
			@RequestParam("remarks") String remarks) {
		Connection con = null;

		try {

//			mco.customerid, mco.customername, mco.customertype, mco.contactperson,
//			mco.emailid, mco.mobilenumber, mco.alternatecontnumber, mco.address, mco.city, mco.pincode, mco.iscredit, 
//			mco.creditdays, mco.creditamount, mco.paymentmode, mco.bank_name, mco.branch, mco.accountno, 
//			mco.bankaddress, mco.ifscno, mco.loginid, mco.datetimestamp, mco.remarks, mco.flag
			
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
	System.out.println("Connected in websservice update cust");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// devicesimid,deviceid,simid,loginid,status,assigndate,datetimestamp,remarks,flag
			String sqlselect4 = "select * from dblocator.insertprocedure('insertCustomer', '" 
					+ customerid +"', '"+customername+"', '"+customertype+"', '"+contactperson+"', '"+emailid+"',"
					+ " '"+mobilenumber+"', '"+alternatecontnumber+"', '"+address+"', "
					+ "'"+city+"', '"+pincode+"', '"+iscredit+"', '"+creditdays+"', '"+creditamount+"', "
					+ "'"+paymentmode+"', '"+bank_name+"', '"+branch+"', '"+accountno+"', "
					+ "'"+bankaddress+"', '"+ifscno+"', '"+loginid+"', '"+tt.toLocaleString()+"',"
					+ " '"+remarks+"', '0', '', '', '', '', '', "
					+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
			
			System.out.println("in custome "+sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
		  //System.out.println(e);
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close();
			//	System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("customerdelete")
	
	public @ResponseBody String customerdelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice deleteCustomer");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteCustomer'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {

			try {
				con.close();
			//	System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	 
	
	 @RequestMapping("dealerdetails")
	 
	 public @ResponseBody String dealerDetails(@RequestParam("companyid") String companyid,@RequestParam("loginid") String loginid,@RequestParam("searchbydealername")String searchbydealername) {
	 List<dealer_details>data=new ArrayList<dealer_details>();
//	 List<parentcomp_details> list = getLoginId(companyid);

	 Connection con = null;
	 try{
	 Class.forName("org.postgresql.Driver");
	  con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
	 System.out.println("Connected in websservice vehde ");
//	 int k=0, flag=1;
//	  while(k<list.size()){
//	 String sqlselect4="select vehicle_creation()";
	 if(searchbydealername==null)
	 {
		 searchbydealername=""; 
	 }
	 String sqlselect4="select * from dblocator.selectprocedure('selectDealer', '"+loginid+"', '"+searchbydealername+"', '', '', '', '', '', '', "+
			  "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "+
			  "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
	 System.out.println(sqlselect4);
	 SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 int indexno=1;
	Statement st4=con.createStatement();
	 ResultSet rs4=st4.executeQuery(sqlselect4);
//	 if(list.get(k).getLoginid().equals(loginid)){
//			flag=0;
//		}
	 while(rs4.next()){
		
		 try{
			 
			 
//			 mco.dealerid, mco.dealername, mco.dealertype, mco.mobilenumber,mco.alternatecontnumber,mco.loginid,mco.datetimestamp,
//			 mco.remarks,mco.flag,mco.address,mco.city,mco.pincode,mco.bank_name,mco.branch,mco.accountno,mco.bankaddress,mco.ifscno,
//			 mco.creditdays, mco.creditamount, mco.contactperson, mco.iscredit, mco.paymentmode, mco.emailid
			 
			dealer_details obj = new dealer_details();
			obj.setDealerid(rs4.getString(0+1));
			obj.setDealername(rs4.getString(1+1));
			obj.setDealertype(rs4.getString(2+1));
			obj.setMobilenumber(rs4.getString(3+1));
			obj.setAlternatecontnumber(rs4.getString(4+1));
			obj.setLoginid(rs4.getString(5+1));
			obj.setDatetimestamp(rs4.getString(6+1));
			obj.setRemarks(rs4.getString(7+1));
			obj.setFlag(rs4.getString(8+1));
			obj.setAddress(rs4.getString(10+1));
			obj.setCity(rs4.getString(9+1));
			obj.setPincode(rs4.getString(11+1));
			obj.setBank_name(rs4.getString(12+1));
			obj.setBranch(rs4.getString(13+1));
			obj.setAccountno(rs4.getString(14+1));
			obj.setBankaddress(rs4.getString(15+1));
			obj.setIfscno(rs4.getString(16+1));
			obj.setCreditdays(rs4.getString(17+1));
			obj.setCreditamount(rs4.getString(18+1));
			obj.setContactperson(rs4.getString(19+1));
			obj.setIscredit(rs4.getString(20+1));
			obj.setPaymentmode(rs4.getString(21+1));
			obj.setEmailid(rs4.getString(22+1));
			obj.setParentdealer(rs4.getString(23+1));
			obj.setState(rs4.getString(24+1));
			
			obj.setRowno(indexno);
			indexno++;
//			  if(flag==1){
//				 obj.setFlag("false");
//			 } else{
				 obj.setFlag("true");
//			 }
//			 if(rs4.getString(23+1).equals("0")){
//				 obj.setFlag("false");
//			 }
			 data.add(obj);
		 }catch(Exception e){
			 System.out.println("e "+e);
		 }
	 }
//	 k++;
//	 }
	
	 String json = new Gson().toJson(data);   return json;
	 }
	 catch (Exception e)
	 {
	 System.out.println(e);
	 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	}

	
	
	 @RequestMapping("searchdealerbyname")
	 
	 public @ResponseBody String searchdealerbyname(@RequestParam("companyid") String companyid,@RequestParam("loginid") String loginid,@RequestParam("dealername")String dealername) {
	 List<dealer_details>data=new ArrayList<dealer_details>();
//	 List<parentcomp_details> list = getLoginId(companyid);

	 Connection con = null;
	 try{
	 Class.forName("org.postgresql.Driver");
	  con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
	 System.out.println("Connected in websservice vehde ");
//	 int k=0, flag=1;
//	  while(k<list.size()){
//	 String sqlselect4="select vehicle_creation()";
	 String sqlselect4="select * from dblocator.selectprocedure('selectDealerByName', '"+loginid+"', '"+dealername+"', '', '', '', '', '', '', "+
			  "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "+
			  "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
	 System.out.println(sqlselect4);
	 SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 int indexno=1;
	Statement st4=con.createStatement();
	 ResultSet rs4=st4.executeQuery(sqlselect4);
//	 if(list.get(k).getLoginid().equals(loginid)){
//			flag=0;
//		}
	 while(rs4.next()){
		
		 try{
			 
			 
//			 mco.dealerid, mco.dealername, mco.dealertype, mco.mobilenumber,mco.alternatecontnumber,mco.loginid,mco.datetimestamp,
//			 mco.remarks,mco.flag,mco.address,mco.city,mco.pincode,mco.bank_name,mco.branch,mco.accountno,mco.bankaddress,mco.ifscno,
//			 mco.creditdays, mco.creditamount, mco.contactperson, mco.iscredit, mco.paymentmode, mco.emailid
			 
			dealer_details obj = new dealer_details();
			obj.setDealerid(rs4.getString(0+1));
			obj.setDealername(rs4.getString(1+1));
			obj.setDealertype(rs4.getString(2+1));
			obj.setMobilenumber(rs4.getString(3+1));
			obj.setAlternatecontnumber(rs4.getString(4+1));
			obj.setLoginid(rs4.getString(5+1));
			obj.setDatetimestamp(rs4.getString(6+1));
			obj.setRemarks(rs4.getString(7+1));
			obj.setFlag(rs4.getString(8+1));
			obj.setAddress(rs4.getString(10+1));
			obj.setCity(rs4.getString(9+1));
			obj.setPincode(rs4.getString(11+1));
			obj.setBank_name(rs4.getString(12+1));
			obj.setBranch(rs4.getString(13+1));
			obj.setAccountno(rs4.getString(14+1));
			obj.setBankaddress(rs4.getString(15+1));
			obj.setIfscno(rs4.getString(16+1));
			obj.setCreditdays(rs4.getString(17+1));
			obj.setCreditamount(rs4.getString(18+1));
			obj.setContactperson(rs4.getString(19+1));
			obj.setIscredit(rs4.getString(20+1));
			obj.setPaymentmode(rs4.getString(21+1));
			obj.setEmailid(rs4.getString(22+1));
			obj.setParentdealer(rs4.getString(23+1));
			obj.setState(rs4.getString(24+1));
			
			obj.setRowno(indexno);
			indexno++;
//			  if(flag==1){
//				 obj.setFlag("false");
//			 } else{
				 obj.setFlag("true");
//			 }
//			 if(rs4.getString(23+1).equals("0")){
//				 obj.setFlag("false");
//			 }
			 data.add(obj);
		 }catch(Exception e){
			 System.out.println("e "+e);
		 }
	 }
//	 k++;
//	 }
	
	 String json = new Gson().toJson(data);   return json;
	 }
	 catch (Exception e)
	 {
	 System.out.println(e);
	 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	}

	 
	 
	 
	 public String vehicletype(String vehicletype){
		 
		    String vehicon;
		      if(vehicletype.contains("Bus")){
		    	  vehicon="resources/images/SchoolBus.png";
		      }
		      else if(vehicletype.contains("Car"))
		      {
		    	 vehicon="resources/images/Car.png";
		      }
		      else if(vehicletype.contains("Truck"))
		      {
		    	  vehicon="resources/images/truck.gif";  
		      }
		     else 
		     {
		    	  vehicon="resources/images/notass1.png";
		     }
		      return(vehicon);
		  } 
	 
	 
	 public String vehiclestatus(String stateofvehicle){
		 
		    String status;
		      if(stateofvehicle.equals("Halt")){
		    	  status="resources/images/hand.png";
		      }
		      else if(stateofvehicle.equals("Stop"))
		      {
		    	  status="resources/imagenew/stop.png";
		      }
		     else if(stateofvehicle.equals("Running"))
		     {
		    	 status="resources/images/run.png";
		     }
		     else
		     {
		    	 status="not found";
		     }
		      return(status);
		  } 
	 

	public String reticon(int head){
	    //alert("head"+head);
	      String icon;
	      if(head>=345 && head<15){
	          icon="resources/assets/images/directionimage/0.png";
	      }
	      else if(head>=15 && head<45){
	          icon="resources/assets/images/directionimage/30.png";
	      }
	      else if(head>=45 && head<75){
	          icon="resources/assets/images/directionimage/60.png";
	      }
	      else if(head>=75 && head<150){
	          icon="resources/assets/images/directionimage/90.png";
	      }
	      else if(head>=105 && head<135){
	          icon="resources/assets/images/directionimage/120.png";
	      }
	      else if(head>=135 && head<165){
	          icon="resources/assets/images/directionimage/150.png";
	      }
	      else if(head>=165 && head<195){
	          icon="resources/assets/images/directionimage/180.png";
	      }
	      else if(head>=195 && head<225){
	          icon="resources/assets/images/directionimage/210.png";
	      }
	      else if(head>=225 && head<255){
	          icon="resources/assets/images/directionimage/240.png";
	      }
	      else if(head>=255 && head<285){
	          icon="resources/assets/images/directionimage/270.png";
	      }
	      else if(head>=285 && head<315){
	          icon="resources/assets/images/directionimage/300.png";
	      }
	      else if(head>=315 && head<345){
	          icon="resources/assets/images/directionimage/330.png";
	      }
	      else {
	          icon="resources/assets/images/directionimage/0.png";
	      }
	      return(icon);
	  }

	public String iginition(int ignumber){
		String igiIcon=null;
		 if(ignumber==1){
			 igiIcon="resources/images/IGINIOn.png";
	      }
		 else{
			 igiIcon="resources/images/IGINOff.png";
	      }
		return(igiIcon);
	}
	
	public String GPS(String gpsvalue){
		String gpsstatus=null;
		 if(gpsvalue.equals("0")){
			 gpsstatus="resources/images/GPSOFF.png";
	      }
		 else{
			 gpsstatus="resources/images/GPSON.png";
	      }
		return(gpsstatus);
	}

	 
	 


	 
	 @RequestMapping("dealerinsert")
	 
	 public @ResponseBody String dealerInsert(@RequestParam("dealername") String dealername,@RequestParam("dealertype") String dealertype,
			 @RequestParam("address")String address,@RequestParam("city")String city,
			 @RequestParam("pincode")String pincode,@RequestParam("mobilenumber")String mobilenumber,
			 @RequestParam("alternatecontnumber")String alternatecontnumber,
			 @RequestParam("bankname")String bankname,@RequestParam("branch") String branch,@RequestParam("accountno")String accountno,
			 @RequestParam("bankaddress")String bankaddress , @RequestParam("ifsc")String ifsc, @RequestParam("loginid")String loginid,
			 @RequestParam("remarks")String remarks, @RequestParam("creditdays")String creditdays,@RequestParam("creditamount")String creditamount,
			 @RequestParam("iscredit")String iscredit,@RequestParam("paymentmode")String paymentmode,
			 @RequestParam("contactperson")String contactperson,@RequestParam("emailid")String emailid,@RequestParam("state")String state) {
		 Connection con = null;
	
	 try{
		 
	 Class.forName("org.postgresql.Driver");
	  con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
	 System.out.println("Connected in websservice insertDealer");
	 java.util.Date dd=new Date();
    Timestamp tt=new Timestamp(dd.getTime());
    
	 //dealerid, dealername, dealertype,mobilenumber,alternatecontnumber,loginid,datetimestamp,
		//remarks,flag,address,city,pincode,bank_name,branch,accountno,bankaddress,ifscno
	 
//    ,contactperson,iscredit, paymentmode, emailid
    
   
    String sqlselect4 =null;
    	sqlselect4 = "select * from dblocator.insertprocedure('insertDealer', '0'"
				+ ", '"+dealername+"', '"+dealertype+"', '"+mobilenumber+"', '"+alternatecontnumber+"',"
				+ " '"+loginid+"', '"+tt.toLocaleString()+"', '"+remarks+"', "
				+ "'0', '"+address+"', '"+city+"', "
				+ "'"+pincode+"', '"+bankname+"', '"+branch+"', '"+accountno+"',"
				+ " '"+bankaddress+"', '"+ifsc+"', '"+creditdays+"', '"+creditamount+"', "
				+ "'"+contactperson+"', '"+iscredit+"', '"+paymentmode+"', '"+emailid+"', '"+state+"', '', '', '', '', "
				+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
//    }
    
    PreparedStatement	ps = con.prepareStatement(sqlselect4);
	 boolean rs = ps.execute();
	 if(rs){
//		 return "ok";
	 }else{
//		 return "Not ok";
	 }
	 
	return "ok";
	 }
	 
	 catch (Exception e)
	 {
		 System.out.println(e);
		 livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
		// return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 }
	 
	 
	 
	 @RequestMapping("dealerupdate")
	 
	 public @ResponseBody String dealerUpdate(@RequestParam("dealerid") String dealerid,
			 @RequestParam("dealername") String dealername,@RequestParam("dealertype") String dealertype,
			 @RequestParam("address")String address,@RequestParam("city")String city,
			 @RequestParam("pincode")String pincode,@RequestParam("mobilenumber")String mobilenumber,
			 @RequestParam("alternatecontnumber")String alternatecontnumber,
			 @RequestParam("bankname")String bankname,@RequestParam("branch") String branch,@RequestParam("accountno")String accountno,
			 @RequestParam("bankaddress")String bankaddress , @RequestParam("ifsc")String ifsc, @RequestParam("loginid")String loginid,
			 @RequestParam("remarks")String remarks,@RequestParam("creditdays")String creditdays,@RequestParam("creditamount")String creditamount,
			 @RequestParam("iscredit")String iscredit,@RequestParam("paymentmode")String paymentmode,
			 @RequestParam("contactperson")String contactperson,@RequestParam("emailid")String emailid,@RequestParam("state")String state) {
		 Connection con = null;
	
	 try{
		 
	 Class.forName("org.postgresql.Driver");
	  con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
	 System.out.println("Connected in websservice upate dealer");
	 java.util.Date dd=new Date();
    Timestamp tt=new Timestamp(dd.getTime());

    String sqlselect4 =null;
    //dealerid, dealername, dealertype,mobilenumber,alternatecontnumber,loginid,datetimestamp,
	//remarks,flag,address,city,pincode,bank_name,branch,accountno,bankaddress,ifscno
    
    
    
	sqlselect4 = "select * from dblocator.insertprocedure('insertDealer', '"+dealerid+"'"
			+ ", '"+dealername+"', '"+dealertype+"', '"+mobilenumber+"', '"+alternatecontnumber+"',"
			+ " '"+loginid+"', '"+tt.toLocaleString()+"', '"+remarks+"', "
			+ "'0', '"+address+"', '"+city+"', "
			+ "'"+pincode+"', '"+bankname+"', '"+branch+"', '"+accountno+"',"
			+ " '"+bankaddress+"', '"+ifsc+"', '"+creditdays+"', '"+creditamount+"', "
			+ "'"+contactperson+"', '"+iscredit+"', '"+paymentmode+"', '"+emailid+"', '"+state+"', '', '', '', '', "
			+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
//	System.out.println(sqlselect4);
//    }
    PreparedStatement	ps = con.prepareStatement(sqlselect4);
	 boolean rs = ps.execute();
	 if(rs){
		 return "ok";
	 }else{
		 return "Not ok";
	 }
	 
	 }
	 
	 catch (Exception e)
	 {
		 System.out.println(e);
		 livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
		// return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 }
	 
	 
	 
	 
	 
	 @RequestMapping("dealerdelete")
	 
	 public @ResponseBody String dealerdelete(@RequestParam("id") String id) {
		 Connection con = null;
	
	 try{
		 
	 Class.forName("org.postgresql.Driver");
	  con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
	 System.out.println("Connected in websservice dealerdelete");
	 java.util.Date dd=new Date();
    Timestamp tt=new Timestamp(dd.getTime());
    
//	 networkid, networkname, networkapn, loginid, datetimestamp, remarks,companyid
    
//   System.out.println("payment mode = "+payment_mode);
    String sqlselect4 = "select * from dblocator.insertprocedure('deleteDealer',"
 	  		+ " '"+id+"', '', "+
   			" '',  '', "+
   			"'', '', '',  "+
   			"'', '', '', '', '', '',"+
   			"'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
	 PreparedStatement	ps = con.prepareStatement(sqlselect4);
	 boolean rs = ps.execute();
	 if(rs){
		 return "ok";
	 }else{
		 return "Not ok";
	 }
	 
	
	 }
	 
	 catch (Exception e)
	 {
		 System.out.println(e);
		 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 }
	 
	 
	 
		@RequestMapping("checkuser")
		
		public @ResponseBody String checkuser(@RequestParam("param") String param,@RequestParam("username") String username) {
			List<forget_passDetails> data = new ArrayList<forget_passDetails>();
			generateOTP otpgen=new generateOTP();
			String otp=null;
			Connection con = null;
			try {
			//	System.out.println("in chkser");
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		System.out.println("Connected in websservice check user");

				// String sqlselect4="select vehicle_creation()";
//				String sqlselect4 = "select * from db_nrda_dborissa.dblocator.selectprocedure('selectForgotpassword', "
//						+ "'"+param+"', '', '', '', '', '', '', '', "
//						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
//						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

				String sqlselect4 = "select * from dblocator.selectprocedure('selectForgotpassword', '"
						+ param + "', '"+username+"', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				
				System.out.println("query"+sqlselect4);
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				int indexno=1;
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
			//	System.out.println("query"+sqlselect4);
				forget_passDetails obj = null;
				String ownerid = null;
				String mailid=null;
				String mobileno = null;
				while (rs4.next()) {
					
//					mco.customerid, mco.customername, mco.customertype, mco.contactperson, mco.emailid, 
//					mco.mobilenumber, mco.alternatecontnumber, mco.address, mco.city, mco.pincode, mco.iscredit, 
//					mco.creditdays, mco.creditamount, mco.paymentmode, mco.bank_name, mco.branch, mco.accountno, 
//					mco.bankaddress, mco.ifscno, mco.loginid, mco.datetimestamp, mco.remarks, mco.flag
					try {
						obj = new forget_passDetails();
						System.out.println("mobile"+rs4.getString(6));
						obj.setOwnersid(rs4.getString(1));
						obj.setOwnersname(rs4.getString(2));
						obj.setOwnerstype(rs4.getString(3));
						obj.setContactperson(rs4.getString(4));
						obj.setEmailid(rs4.getString(5));
						obj.setMobilenumber(rs4.getString(6));
						obj.setAlternatecontnumber(rs4.getString(7));
						obj.setAddress(rs4.getString(8));
						obj.setCity(rs4.getString(9));
						obj.setPincode(rs4.getString(10));
						obj.setIscredit(rs4.getString(11));
						obj.setCreditdays(rs4.getString(12));
						obj.setCreditamount(rs4.getString(13));
						obj.setPaymentmode(rs4.getString(14));
						obj.setBank_name(rs4.getString(15));
						obj.setBranch(rs4.getString(16));
						obj.setAccountno(rs4.getString(17));
						obj.setBankaddress(rs4.getString(18));
						obj.setIfscno(rs4.getString(19));
						obj.setLoginid(rs4.getString(20));
						obj.setDatetimestamp(rs4.getString(21));
						obj.setRemarks(rs4.getString(22));
						obj.setFlag(rs4.getString(23));
						obj.setRowno(indexno);
						indexno++;
						data.add(obj);
					} catch (Exception e) {
					System.out.println("e " + e);
					}
				}
				
		
	if(!(data.isEmpty()))
	{
		String mobile=obj.getMobilenumber();	
		String emailid=obj.getEmailid();
			
//		System.out.println("mobile"+mobile);
//		System.out.println("emailid"+emailid);
//	System.out.println("in if");
	try
	{
if(param.equals(mobile))
{
	//System.out.println("in mobileno");
	otp=otpgen.generateotp();
	SearchBloxREST.sendSMS(param, otp);
//System.out.println("otp"+otp);
	ownerid=obj.getOwnersid();
	//System.out.println("owernerid"+ownerid);
	OTPInsert(ownerid,otp,"ok");
}
else if(param.equals(emailid))
{
	try{
	//System.out.println("in email");
		EmailSend email=new EmailSend();
		email.sendHtmlEmail(param,ownerid);
	}catch(Exception ex){System.out.println("iternet Exception"+ex);}
	
}
	}
	catch(Exception er){System.out.println("in er"+er);}
		
	String json = new Gson().toJson(data);   return json;
	}
	else
	{
		//System.out.println("in elseif");
		return "";
	}
			} catch (Exception e) {
				System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		@RequestMapping("checkotp")
		
		public @ResponseBody String checkotp(@RequestParam("otp") String otp,@RequestParam("ownersid") String ownersid) {
			Connection con = null;
			int k=0;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice checkotp ");

				// String sqlselect4="select vehicle_creation()";
				String sqlselect4 = "select * from dblocator.selectprocedure('selectotp', "
						+ "'"+ownersid+"', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

			//	System.out.println("query"+sqlselect4);
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				int indexno=1;
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);

				while (rs4.next()) {
					

					try {
						//System.out.println(rs4.getString(2));
						if(otp.equals(rs4.getString(2))){
							k++;
						}
					} catch (Exception e) {
					//	System.out.println("e " + e);
					}
				}
				
				if(k!=0){
					return "true";
				}else{
					return "false";
				}

				
			} catch (Exception e) {
			  System.out.println(e);
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		

		
		 @RequestMapping("passwordinsert")
		 
		 public @ResponseBody String PasswordInsert(@RequestParam("ownersid") String ownersid,
				 @RequestParam("password") String password) {
			 Connection con = null;
		
		 try{
			 
		 Class.forName("org.postgresql.Driver");
		  con =
		 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
						"takshak");
		 System.out.println("Connected in websservice password insert");
		 java.util.Date dd=new Date();
	   Timestamp tt=new Timestamp(dd.getTime());
	   
	//   ownersid, otp, datetimestamp, remarks
	 
	//   String sqlselect4 = "select * from dblocator.insertprocedure('insertPassword',"
//		  		+ " '"+password+"', '"+ownersid+"', "+
//	  			" '', '', "+
//	  			"'', '', '',"+
//	  			"'', '', '', '', '', '',"+
//	  			 "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
		 
	   String sqlselect4 = "select * from dblocator.insertprocedure('insertPassword', '"+password+"', '" + ownersid + "', " + "'"
				+  "', '', '', '', "
				+ "'', '', '',  " + "'', '', '', '',"
				+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
	   
	   
	   PreparedStatement	ps = con.prepareStatement(sqlselect4);
		 boolean rs = ps.execute();
		 if(rs){
			 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		 }else{
			 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		 }
		 
		
		 }
		 
		 catch (Exception e)
		 {
			 System.out.println(e);
			 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		 }
		 finally{
			 try {
				con.close(); System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		 }
//		
//		
			
		//@POST
		 @RequestMapping("exceptioninsert")
		// @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_JSON})
		 public @ResponseBody String ExceptionInsert(@RequestParam("formname") String formname,
				livedet inputJsonObj) {
			 Connection con = null;
		
		 try{
			 
		 Class.forName("org.postgresql.Driver");
		  con =
		 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
						"takshak");
		 System.out.println("Connected in websservice inseretexception insert");
		 java.util.Date dd=new Date();
	 Timestamp tt=new Timestamp(dd.getTime());
	 
	// ownersid, otp, datetimestamp, remarks

	 String sqlselect4="select * from dblocator.insertprocedure('inseretexception', '"+formname+"', '"+tt.toLocaleString()+"', '"+inputJsonObj.getExc()+"', '', '', '', '', '', '',  '', '', '', '','', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '')";
		 
	 System.out.println("qq"+sqlselect4);
	 PreparedStatement	ps = con.prepareStatement(sqlselect4);
		 boolean rs = ps.execute();
		 if(rs){
			 return "ok";
		 }else{
			 return "Not ok";
		 }
		 
	 
		 }
		 
		 catch (Exception e)
		 {
			 System.out.println(e);
			 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		 }
		 finally{
			 try {
				con.close(); System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		 }
		 
		
		
		
		
		
		
		
	 
	 
	 @RequestMapping("otpinsert")
	 
	 public @ResponseBody String OTPInsert(@RequestParam("ownersid") String ownersid,
			 @RequestParam("otp") String otp, @RequestParam("remarks")String remarks) {
		 Connection con = null;
	
	 try{
		 
	 Class.forName("org.postgresql.Driver");
	  con =
	 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
					"takshak");
	 System.out.println("Connected in websservice dealerassign insert");
	 java.util.Date dd=new Date();
 Timestamp tt=new Timestamp(dd.getTime());
 
// ownersid, otp, datetimestamp, remarks

 String sqlselect4 = "select * from dblocator.insertprocedure('insertOtp',"
	  		+ " '"+ownersid+"', '"+otp+"', "+
			" '"+tt.toLocaleString()+"', '"+remarks+"', "+
			"'', '', '',"+
			"'', '', '', '', '', '',"+
			 "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
	 PreparedStatement	ps = con.prepareStatement(sqlselect4);
	 boolean rs = ps.execute();
	 if(rs){
		 return "ok";
	 }else{
		 return "Not ok";
	 }
	 
	
	 }
	 
	 catch (Exception e)
	 {
		 System.out.println(e);
		 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 }
	 
	 
	 
	 
	 @RequestMapping("dealerassigninsert")
	 
	 public @ResponseBody String dealerAssignInsert(@RequestParam("dealerid") String dealerid,
			 @RequestParam("salecost")String salecost,@RequestParam("credit_money")String credit_money,
			 @RequestParam("payment_mode")String payment_mode,
			 @RequestParam("deviceid")String deviceid,
			 @RequestParam("loginid")String loginid) {
		 Connection con = null;
	
	 try{
		 
	 Class.forName("org.postgresql.Driver");
	  con =
	 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
					"takshak");
	 System.out.println("Connected in websservice dealerassign insert");
	 java.util.Date dd=new Date();
    Timestamp tt=new Timestamp(dd.getTime());
    
//devicemapid,
	//dealerid, salecost, credit_money, payment_mode, datetimestamp, deviceid, loginid, flag
   
    String sqlselect4 = "select * from dblocator.insertprocedure('insertdealerAssign',"
 	  		+ " '0', '"+dealerid+"', "+
   			" '"+salecost+"', '"+credit_money+"', "+
   			"'"+payment_mode+"', '"+tt.toLocaleString()+"', '"+deviceid+"',  "+
   			"'"+loginid+"', '0', '', '', '', '',"+
   			 "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
	 PreparedStatement	ps = con.prepareStatement(sqlselect4);
	 boolean rs = ps.execute();
	 if(rs){
//		 return "ok";
	 }else{
//		 return "Not ok";
	 }
	 
	
   	return "ok";
	 }
	 
	 catch (Exception e)
	 {
		 System.out.println(e);
		 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 }
	 
	 
	 @RequestMapping("dealerassignupdate")
	 
	 public @ResponseBody String dealerAssignUpdate(@RequestParam("devicemapid") String devicemapid,
			 @RequestParam("dealerid") String dealerid,
			 @RequestParam("salecost")String salecost,@RequestParam("credit_money")String credit_money,
			 @RequestParam("payment_mode")String payment_mode,
			@RequestParam("deviceid")String deviceid,
			 @RequestParam("loginid")String loginid) {
		 Connection con = null;
	
	 try{
		 
	 Class.forName("org.postgresql.Driver");
	  con =
	 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
					"takshak");
	 System.out.println("Connected in websservice dealerassignupdate");
	 java.util.Date dd=new Date();
    Timestamp tt=new Timestamp(dd.getTime());
    
///devicemapid,
 	//dealerid, salecost, credit_money, payment_mode, datetimestamp, deviceid, loginid, flag
    
    
   System.out.println("payment mode = "+payment_mode);
    String sqlselect4 = "select * from dblocator.insertprocedure('insertdealerAssign',"
 	  		+ " '"+devicemapid+"', '"+dealerid+"', "+
   			" '"+salecost+"', '"+credit_money+"', "+
   			"'"+payment_mode+"', '"+tt.toLocaleString()+"', '"+deviceid+"',  "+
   			"'"+loginid+"', '0', '', '', '', '',"+
   			 "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
	 PreparedStatement	ps = con.prepareStatement(sqlselect4);
	 boolean rs = ps.execute();
	 if(rs){
		 return "ok";
	 }else{
		 return "Not ok";
	 }
	 
	
	 }
	 
	 catch (Exception e)
	 {
		 System.out.println(e);
		 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 }
	 
	 
	 //@POST
	 @RequestMapping("getimei")
	 
	 public @ResponseBody String dealerAssignUpdate(imeilist inputJsonObj, @RequestParam("dealerid") String dealerid,
			 @RequestParam("ponum") String ponum,@RequestParam("loginid") String loginid) {
		 Connection con = null;
	
	 try{
		 
	 Class.forName("org.postgresql.Driver");
	  con =
	 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
					"takshak");
	 System.out.println("Connected in websservice dealerassignupdate");
	 java.util.Date dd=new Date();
    Timestamp tt=new Timestamp(dd.getTime());
    
///devicemapid,
 	//dealerid, salecost, credit_money, payment_mode, datetimestamp, deviceid, loginid, flag
    
    
//   System.out.println("payment mode = "+payment_mode);
    String arr = "{";
    String[] val = inputJsonObj.getImeino();
    for(int i = 0 ;i<=inputJsonObj.getImeino().length-1; i++){
    	if(i == (inputJsonObj.getImeino().length)-1){
    		arr = arr + ""+val[i]+"";
    	}else{
    		arr = arr + ""+val[i]+",";
    	}
    }
    arr = arr + "}";
    System.out.println("length"+arr+"\n"+inputJsonObj.getImeino().length);
    String sqlselect4 = "select * from dblocator.saveimei('"+arr+"', '"+dealerid+"', '"+ponum+"', '"+tt.toLocaleString()+"', '"+loginid+"')";
//	System.out.println("sqlselect = "+sqlselect4);
    PreparedStatement	ps = con.prepareStatement(sqlselect4);
  
	 boolean rs = ps.execute();
	 if(rs){
		 return "ok";
	 }else{
		 return "Not ok";
	 }
	 
	
	 }
	 
	 catch (Exception e)
	 {
		 System.out.println(e);
		 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 }
	 
	 
	 
	
	 
//	 @POST
//	 @RequestMapping("getimei")
//	 
////	 @Consumes(MediaType.APPLICATION_JSON)
//	 public @ResponseBody String getIMEINO(imeilist inputJsonObj) {
//		 Connection con = null;
//	
//	 try{
//		 
////	 Class.forName("org.postgresql.Driver");
////	  con =
////	 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
////					"takshak");
//	 
//	 java.util.Date dd=new Date();
//    Timestamp tt=new Timestamp(dd.getTime());
//    
/////devicemapid,
// 	//dealerid, salecost, credit_money, payment_mode, datetimestamp, deviceid, loginid, flag
//    
////    String input = (String) inputJsonObj.get("input");
////    String output = "The input you sent is :" + input;
////    JSONObject outputJsonObj = new JSONObject();
////    outputJsonObj.put("output", output);
//    System.out.println("Connected in websservice dealerassignupdate"+inputJsonObj.getImeino().length);
////   System.out.println("payment mode = "+payment_mode);
////    String sqlselect4 = "select * from dblocator.insertprocedure('insertdealerAssign',"
//// 	  		+ " '"+devicemapid+"', '"+dealerid+"', "+
////   			" '"+salecost+"', '"+credit_money+"', "+
////   			"'"+payment_mode+"', '"+tt.toLocaleString()+"', '"+deviceid+"',  "+
////   			"'"+loginid+"', '0', '', '', '', '',"+
////   			 "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
////	 PreparedStatement	ps = con.prepareStatement(sqlselect4);
////	 boolean rs = ps.execute();
////	 if(rs){
////		 return "ok";
////	 }else{
////		 return "Not ok";
////	 }
//	 
//    return "ok";
//	 }
//	 
//	 catch (Exception e)
//	 {
//		 System.out.println(e);
//		 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
//	 }
//	 finally{
//		 try {
//			con.close(); System.out.println("connection closed");
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	 }
//	 }
	 
	// @POST
	 @RequestMapping("getimeicustomer")
	 
	 public @ResponseBody String customerAssignUpdate(imeilist inputJsonObj, @RequestParam("customerid") String customerid,
			 @RequestParam("ponum") String ponum,@RequestParam("loginid") String loginid) {
		 Connection con = null;
	
	 try{
		 
	 Class.forName("org.postgresql.Driver");
	  con =
	 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
					"takshak");
	 System.out.println("Connected in websservice customerassignupdate");
	 java.util.Date dd=new Date();
    Timestamp tt=new Timestamp(dd.getTime());
    
///devicemapid,
 	//customerid, salecost, credit_money, payment_mode, datetimestamp, deviceid, loginid, flag
    
    
//   System.out.println("payment mode = "+payment_mode);
    String arr = "{";
    String[] val = inputJsonObj.getImeino();
    for(int i = 0 ;i<=inputJsonObj.getImeino().length-1; i++){
    	if(i == (inputJsonObj.getImeino().length)-1){
    		arr = arr + ""+val[i]+"";
    	}else{
    		arr = arr + ""+val[i]+",";
    	}
    }
    arr = arr + "}";
    System.out.println("length"+arr+"\n"+inputJsonObj.getImeino().length);
    String sqlselect4 = "select * from salecustomer('"+arr+"', '"+customerid+"', '"+ponum+"', '"+tt.toLocaleString()+"', '"+loginid+"')";
//	System.out.println("sqlselect = "+sqlselect4);
    PreparedStatement	ps = con.prepareStatement(sqlselect4);
  
	 boolean rs = ps.execute();
	 if(rs){
		 return "ok";
	 }else{
		 return "Not ok";
	 }
	 
	
	 }
	 
	 catch (Exception e)
	 {
		 System.out.println(e);
		 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 }
	 
	 
	 
	 
	 
	 @RequestMapping("dealerassigndetails")
	 
	 public @ResponseBody String dealerAssignDetails(@RequestParam("companyid") String companyid,@RequestParam("loginid") String loginid) {
	 List<dealerdevice_assigndetails>data=new ArrayList<dealerdevice_assigndetails>();
//	 List<parentcomp_details> list = getLoginId(companyid);
	 Connection con = null;
	 try{
	 Class.forName("org.postgresql.Driver");
	  con =
	 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
					"takshak");
	 System.out.println("Connected in websservice dealerassign ");
//	 int k=0, flag=1; 
	 int indexno=1;
//	  while(k<list.size()){
//	 String sqlselect4="select vehicle_creation()";
	 String sqlselect4="select * from dblocator.selectprocedure('selectdealerdeviceassign', '"+loginid+"', '', '', '', '', '', '', '', "+
			  "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "+
			  "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";

	 SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	 Statement st4=con.createStatement();
	 ResultSet rs4=st4.executeQuery(sqlselect4);
//	 if(list.get(k).getLoginid().equals(loginid)){
//			flag=0;
//		}
	 while(rs4.next()){
		
//		 mca.dealerid,mca.salecost, mca.credit_money, 
//		   mca.payment_mode,mca.devicemapid,mca.datetimestamp,md.deviceid,md.uniqueid,mco.dealername,mca.loginid,mca.flag
		 try{
			 dealerdevice_assigndetails obj = new dealerdevice_assigndetails();
			 obj.setDealerid(rs4.getString(0+1));
			 obj.setSalecost(rs4.getString(1+1));
			 obj.setCredit_money(rs4.getString(2+1));
			 obj.setPayment_mode(rs4.getString(3+1));
			 obj.setDevicemapid(rs4.getString(4+1));
			 obj.setDatetimestamp(rs4.getString(5+1));
			 obj.setDeviceid(rs4.getString(6+1));
			 obj.setDeviceno(rs4.getString(7+1));
			 obj.setDealername(rs4.getString(8+1));
			 obj.setLoginid(rs4.getString(9+1));
			 obj.setFlag(rs4.getString(10+1));
			 obj.setRowno(indexno);
				indexno++;
//			 if(flag==1){
//				 obj.setFlag("false");
//			 } else{
				 obj.setFlag("true");
//			 }
			 data.add(obj);
		 }catch(Exception e){
			 System.out.println("e "+e);
		 }
	 }
//	 k++;
//	 }
	
	 String json = new Gson().toJson(data);   return json;
	 }
	 catch (Exception e)
	 {
	 System.out.println(e);
	 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	}
	 

	 
	 
	 @RequestMapping("dealerassigndelete")
	 
	 public @ResponseBody String dealerassigndelete(@RequestParam("id") String id) {
		 Connection con = null;
	
	 try{
		 
	 Class.forName("org.postgresql.Driver");
	  con =
	 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
					"takshak");
	 System.out.println("Connected in websservice dealerassigndelete");
	 java.util.Date dd=new Date();
    Timestamp tt=new Timestamp(dd.getTime());
    
//	 networkid, networkname, networkapn, loginid, datetimestamp, remarks,companyid
    
//   System.out.println("payment mode = "+payment_mode);
    String sqlselect4 = "select * from dblocator.insertprocedure('deleteDealerAssign',"
 	  		+ " '"+id+"', '', "+
   			" '',  '', "+
   			"'', '', '',  "+
   			"'', '', '', '', '', '',"+
   			"'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
	 PreparedStatement	ps = con.prepareStatement(sqlselect4);
	 boolean rs = ps.execute();
	 if(rs){
		 return "ok";
	 }else{
		 return "Not ok";
	 }
	 
	
	 }
	 
	 catch (Exception e)
	 {
		 System.out.println(e);
		 return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); //System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 } 



	 
		@RequestMapping("customerassigninsert")
		
		public @ResponseBody String customerAssignInsert(@RequestParam("customerid") String customerid,
				@RequestParam("deviceid") String deviceid, @RequestParam("salecost") String salecost,
				@RequestParam("credit_money") String credit_money, @RequestParam("payment_mode") String payment_mode,
				@RequestParam("datetimestamp") String datetimestamp, @RequestParam("companyid") String companyid,
				@RequestParam("dealerid") String dealerid) {
			Connection con = null;

			try {

				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			//	System.out.println("Connected in websservice simins");
				java.util.Date dd = new Date();
				Timestamp tt = new Timestamp(dd.getTime());

				// devicemapid,dealerid, dealername,
				// deviceid,devicename,salecost, credit_money, payement_mode

			//	System.out.println("payment mode = " + payment_mode);
				String sqlselect4 = "select * from dblocator.insertprocedure('insertcustomerAssign'," + " '0', '" + customerid
						+ "', " + " '" + deviceid + "',  '" + salecost + "', " + "'" + credit_money + "', '" + payment_mode
						+ "', '" + datetimestamp + "',  " + "'" + companyid + "', '" + dealerid + "', '', '', '', '',"
						+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
				PreparedStatement ps = con.prepareStatement(sqlselect4);
				boolean rs = ps.execute();
				if (rs) {
					return "ok";
				} else {
					return "Not ok";
				}

			}
			catch (Exception e) {
			  System.out.println(e);
			  livedet det = new livedet();
				det.setExc(String.valueOf(e));
			  //System.out.println(e);
				String json = new Gson().toJson(det);
				return json;
//				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//						;
			} finally {
				try {
					con.close(); // System.out.println("connection closed");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	
	@RequestMapping("customerassignupdate")
	
	public @ResponseBody String customerAssignUpdate(@RequestParam("devicemapid") String devicemapid,
			@RequestParam("customerid") String customerid, @RequestParam("deviceid") String deviceid,
			@RequestParam("salecost") String salecost, @RequestParam("credit_money") String credit_money,
			@RequestParam("payment_mode") String payment_mode, @RequestParam("datetimestamp") String datetimestamp,
			@RequestParam("companyid") String companyid, @RequestParam("dealerid") String dealerid) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// devicemapid,dealerid, dealername,
			// deviceid,devicename,salecost, credit_money, payement_mode

		//	System.out.println("payment mode = " + payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('insertcustomerAssign'," + " '" + devicemapid
					+ "', '" + customerid + "', " + "'" + deviceid + "', '" + salecost + "', " + "'" + credit_money
					+ "', '" + payment_mode + "', '" + datetimestamp + "',  " + "'" + companyid + "', '" + dealerid
					+ "', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
		  //System.out.println(e);
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("networkinsert")
	
	public @ResponseBody String networkInsert(@RequestParam("networkname") String networkname,
			@RequestParam("networkapn") String networkapn, @RequestParam("loginid") String loginid,
			@RequestParam("remarks") String remarks) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice insert network");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			
			String sqlselect4 = "select * from dblocator.insertprocedure('insertnetwork'," + " '0', '" + networkname
					+ "', " + " '" + networkapn + "',  '" + loginid + "', " + "'" + tt.toLocaleString() + "', '"
					+ remarks + "', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
//				return "ok";
			} else {
//				return "Not ok";
			}
			
			   	return "ok";
		}

		catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("networkupdate")
	
	public @ResponseBody String networkUpdate(@RequestParam("networkid") String networkid,
			@RequestParam("networkname") String networkname, @RequestParam("networkapn") String networkapn,
			@RequestParam("loginid") String loginid, @RequestParam("remarks") String remarks) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice updte");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('insertnetwork'," + " '" + networkid + "', '"
					+ networkname + "', " + " '" + networkapn + "',  '" + loginid + "', " + "'" + tt.toLocaleString()
					+ "', '" + remarks + "', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
		
			System.out.println("in update query"+sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("networkdelete")
	
	public @ResponseBody String networkdelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice deleteNetwork");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteNetwork'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("companydelete")
	
	public @ResponseBody String companydelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteCompany'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("simassigndelete")
	
	public @ResponseBody String newsimassignUpdate(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simass delete");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			
			String sqlselect4 = "select * from dblocator.insertprocedure('deletesimassign'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	@RequestMapping("simassignactivate")
	
	public @ResponseBody String simassignactivate(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simass delete");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid
		String sqlselect4 = "select * from dblocator.insertprocedure('activatesimassign'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	@RequestMapping("vehicleassigndelete")
	
	public @ResponseBody String vehicleassignUpdate(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteVehicleToDevice'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("vehicleassignupdate")
	
	public @ResponseBody String vehicleAssignUpdate(@RequestParam("id") String id, @RequestParam("vehicleid") String vehicleid,
			@RequestParam("deviceid") String deviceid, @RequestParam("status") String status,
			@RequestParam("assigndate") String assigndate, @RequestParam("loginid") String loginid,
			@RequestParam("remarks") String remarks) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// id,vehicleid,deviceid,status,assigndate,companyid,loginid,remarks,datetimestamp
			String sqlselect4 = "select * from dblocator.insertprocedure('insertVehicleToDevice'," + " '" + id + "', '"
					+ vehicleid + "',  '" + deviceid + "',  '" + status + "', '" + assigndate + "', " + "'" + loginid
					+ "', '" + remarks + "',  " + "'" + tt.toLocaleString() + "', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
		  //System.out.println(e);
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	
	
	// @POST
	 @RequestMapping("getmultipledeviceassign")
	// @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_JSON})
	// @Consumes(MediaType.APPLICATION_JSON)
	 public @ResponseBody String getmultipledeviceassign(@RequestParam("status") String status,
				@RequestParam("assigndate") String assigndate, @RequestParam("loginid") String loginid,
				@RequestParam("remarks") String remarks,
				@RequestParam("customerid") String customerid,List<Multipledeviceassng_jsonlist> inputJsonObj) {
		 Connection con = null;
	 try{
		 System.out.println("Connected in websservice multipledevi1   "+inputJsonObj);
	 Class.forName("org.postgresql.Driver");
	  con =
	 DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres",
					"takshak");
	// System.out.println("Connected in websservice multipledevi");
	 java.util.Date dd=new Date();
    Timestamp tt=new Timestamp(dd.getTime());
//    String arr = "{";
////    String[] val = inputJsonObj.getVehicleid();
////    for(int i = 0 ;i<=inputJsonObj.size(); i++){
////    	
////    	Multipledeviceassng_jsonlist deviceid=inputJsonObj.get(i);
////    	System.out.println("deviceid");
//    	
////    	if(i ==(inputJsonObj.getImeino().length)-1){
////    		arr = arr + ""+val[i]+"";
////    	}else{
////    		arr = arr + ""+val[i]+",";
////    	}
////    }
//    arr = arr + "}";
    //System.out.println("length"+arr+"\n"+inputJsonObj.getImeino().length);
    //String sqlselect4 = "select * from salecustomer('"+arr+"', '"+customerid+"', '"+ponum+"', '"+tt.toLocaleString()+"', '"+loginid+"')";
  
    System.out.println("size of lust"+inputJsonObj.size());
    for(int i=0;i<inputJsonObj.size();i++)
   {
    System.out.println("in for");

    String sqlselect4="select * from dblocator.insertprocedure('insertVehicleToDevice'," + " '0', '" + inputJsonObj.get(i).getVehicleid()
					+ "',  '"+inputJsonObj.get(i).getDeviceid() +"',  '" + status + "', '" + assigndate + "', " + "'" + loginid + "', '"
					+ remarks + "',  " + "'" + tt.toLocaleString() + "', '"+customerid+"', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
  
    System.out.println("sqlselect4"+ sqlselect4);
    PreparedStatement	ps = con.prepareStatement(sqlselect4);
   
	boolean rs = ps.execute();
	if (rs) {
	//return "ok";
	} else {
		//return "Not ok";
	}   
   }
	// boolean rs = ps.execute();
	// if(rs){
		 return "ok";
	// }else{
		// return "Not ok";
	// }
	 
	
	 }
	 
	 catch (Exception e)
	 { System.out.println(e);
		 livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
		 	return json;
		 //return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
	 }
	 finally{
		 try {
			con.close(); System.out.println("connection closed");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 }
	 
	
	
	
	
	
	
	@RequestMapping("vehicleassigninsert")
	
	public @ResponseBody String vehicleAssignInsert(@RequestParam("vehicleid") String vehicleid,
			@RequestParam("deviceid") String deviceid, @RequestParam("status") String status,
			@RequestParam("assigndate") String assigndate, @RequestParam("loginid") String loginid,
			@RequestParam("remarks") String remarks,@RequestParam("customerid") String customerid) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// id,vehicleid,deviceid,status,assigndate,loginid,remarks,datetimestamp,flag
			
			
			String sqlselect4 = "select * from dblocator.insertprocedure('insertVehicleToDevice'," + " '0', '" + vehicleid
					+ "',  '" + deviceid + "',  '" + status + "', '" + assigndate + "', " + "'" + loginid + "', '"
					+ remarks + "',  " + "'" + tt.toLocaleString() + "', '"+customerid+"', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			System.out.println("sql"+sqlselect4);
			
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
//				return "ok";
			} else {
//				return "Not ok";
			}
			
			
			   	return "ok";

		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("modelinsert")
	
	public @ResponseBody String modelInsert(@RequestParam("modelname") String modelname, @RequestParam("makeid") String makeid,
			@RequestParam("loginid") String loginid, @RequestParam("remarks") String remarks) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice modelinsert");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// modelid, modelname, makeid, loginid, datetimestamp, remarks,flag
			
			

			String sqlselect4 = "select * from dblocator.insertprocedure('insertModel'," + " '0', '" + modelname + "',  '"
					+ makeid + "',  '" + loginid + "', '" + tt.toLocaleString() + "', '" + remarks + "', '0',  "
					+ "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
//				return "ok";
			} else {
//				return "Not ok";
			}
			
			
			   	return "ok";

		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("modelUpdate")
	
	public @ResponseBody String modelUpdate(@RequestParam("modelid") String modelid, @RequestParam("modelname") String modelname,
			@RequestParam("makeid") String makeid, @RequestParam("loginid") String loginid,
			@RequestParam("remarks") String remarks) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice modelupdatet");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// modelname=$3, makeid=$4::numeric, loginid=$5::numeric,
			// datetimestamp=$6::timestamp, remarks=$7,
			// flag=$8::integer,companyid=$9::numeric
			// WHERE modelid

			String sqlselect4 = "select * from dblocator.insertprocedure('insertModel'," + "'" + modelid + "','"
					+ modelname + "', '" + makeid + "',  '" + loginid + "',  '" + tt.toLocaleString() + "', '" + remarks
					+ "', '0', '',  " + " '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			System.out.println("moedlupadte  "+sqlselect4);
			
			PreparedStatement ps = con.prepareStatement(sqlselect4);

			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}
		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("vendorinsert")
	
	public @ResponseBody String vendorInsert(@RequestParam("vendorfirmname") String vendorfirmname,
			@RequestParam("vendoraddress") String vendoraddress, @RequestParam("city") String city,
			@RequestParam("statename") String statename, @RequestParam("landlinenumber") String landlinenumber,
			@RequestParam("contactperson") String contactperson, @RequestParam("designation") String designation,
			@RequestParam("mobilenumber") String mobilenumber, @RequestParam("emailid") String emailid,
			@RequestParam("assettypeid") String assettypeid, @RequestParam("servicestationaddr") String servicestationaddr,
			@RequestParam("servstationcontactno") String servstationcontactno, @RequestParam("makeid") String makeid,
			@RequestParam("creditdays") String creditdays, @RequestParam("loginid") String loginid,
			@RequestParam("paymentdate") String paymentdate, @RequestParam("remarks") String remarks) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vendor insert");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

//			vendorid, vendorfirmname, vendoraddress, city,statename,landlinenumber,contactperson,designation,
//		      mobilenumber,emailid,assettypeid,servicestationaddr,servstationcontactno,creditdays,
//		      loginid,datetimestamp,paymentdate,remarks,flag, makeid
			
			
			String sqlselect4 = "select * from dblocator.insertprocedure('insertVendor'," + " '0', '" + vendorfirmname
					+ "',  '" + vendoraddress + "', '" + city + "', '" + statename + "'," + " '" + landlinenumber
					+ "', '" + contactperson + "',  " + "'" + designation + "', '" + mobilenumber + "', '" + emailid
					+ "', '" + assettypeid + "', '" + servicestationaddr + "', '" + servstationcontactno + "'," + "'"
					+ creditdays + "', '" + loginid + "', '" + tt.toLocaleString() + "', '" + paymentdate + "', " + "'"
					+ remarks
					+ "','0', '"+makeid+"', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";

//			
//			String sqlselect4 = " select * from dblocator.insertprocedure('insertVendor'," + " '0', '" + vendorfirmname + "', "
//					+ "'" + vendoraddress + "', '" + city + "', '" + statename + "', '" + landlinenumber + "', " + "'"
//					+ contactperson + "', '" + designation + "', '" + mobilenumber + "',  " + "'" + emailid + "', '"
//					+ assettypeid + "', '" + servicestationaddr + "', '" + servstationcontactno + "'," + "'" + creditdays + "', '"
//					+ loginid + "', '" + creditdays+ "', '" +  tt.toLocaleString() + "', " + "'"+paymentdate+"',"
//					+ "'"+remarks+"', '0', '"+makeid+"', '','', '',"
//					+ " '', '','', '', "
//					+ "'', '','', '', "
//					+ "'', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
//			
			
			System.out.println("vendor"+sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
//				return "ok";
			} else {
//				return "Not ok";
			}
			
			
			   	return "ok";

		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	
	@RequestMapping("modeldelete")
	
	public @ResponseBody String modeldelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice deleteModel");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteModel'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("vendorupdate")
	
	public @ResponseBody String vendorUpdate(@RequestParam("vendorid") String vendorid,
			@RequestParam("vendorfirmname") String vendorfirmname, @RequestParam("vendoraddress") String vendoraddress,
			@RequestParam("city") String city, @RequestParam("statename") String statename,
			@RequestParam("landlinenumber") String landlinenumber, @RequestParam("contactperson") String contactperson,
			@RequestParam("designation") String designation, @RequestParam("mobilenumber") String mobilenumber,
			@RequestParam("emailid") String emailid, @RequestParam("assettypeid") String assettypeid,
			@RequestParam("servicestationaddr") String servicestationaddr,
			@RequestParam("servstationcontactno") String servstationcontactno,@RequestParam("makeid") String makeid,
			@RequestParam("creditdays") String creditdays, @RequestParam("loginid") String loginid,
			@RequestParam("paymentdate") String paymentdate, @RequestParam("remarks") String remarks) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vendor updatet");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// vendorid, vendorfirmname, vendoraddress, city, statename,
			// landlinenumber,
			// contactperson, designation, mobilenumber, emailid, assettypeid,
			// servicestationaddr, servstationcontactno, creditdays, loginid,
			// datetimestamp, paymentdate, remarks, flag

			String sqlselect4 = "select * from dblocator.insertprocedure('insertVendor'," + " '" + vendorid + "', '"
					+ vendorfirmname + "',  '" + vendoraddress + "', '" + city + "', '" + statename + "'," + " '"
					+ landlinenumber + "', '" + contactperson + "',  " + "'" + designation + "', '" + mobilenumber
					+ "', '" + emailid + "', '" + assettypeid + "', '" + servicestationaddr + "', '"
					+ servstationcontactno + "'," + "'" + creditdays + "', '" + loginid + "', '" + tt.toLocaleString()
					+ "', '" + paymentdate + "', " + "'" + remarks
					+ "','0', '"+makeid+"', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);

			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("vendordelete")
	
	public @ResponseBody String vendordelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice vendordelete");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteVendor'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
//	@RequestMapping("vehiclesummary")
//	
//	public @ResponseBody String vehicleSummary(@RequestParam("imeino") String imeino, @RequestParam("fromdate") String fromdate,
//			@RequestParam("todate") String todate, @RequestParam("fromtime") String fromtime,
//			@RequestParam("totime") String totime) {
//		List<vehiclesummary_report> data = new ArrayList<vehiclesummary_report>();
//		Connection con = null;
//		try {
//			Class.forName("org.postgresql.Driver");
//			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//		//	System.out.println("Connected in websservice vendor updatet");
//			java.util.Date dd = new Date();
//			Timestamp tt = new Timestamp(dd.getTime());
//
//			// modelname=$3, makeid=$4::numeric, loginid=$5::numeric,
//			// datetimestamp=$6::timestamp, remarks=$7,
//			// flag=$8::integer,companyid=$9::numeric
//			// WHERE modelid
//
//			String sqlselect4 = "select vehiclesummary('" + imeino + "','" + fromdate + "','" + fromtime
//					+ "','" + totime + "','" + todate + "');";
//			PreparedStatement ps = con.prepareStatement(sqlselect4);
//
//			boolean rs = ps.execute();
//			if (rs) {
//				sqlselect4 = "select * from dblocator.selectprocedure('selectVehicleSummary', '" + imeino
//						+ "', '', '', '', '', '', '', '', "
//						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
//						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
//				// SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd
//				// HH:mm:ss");
//
//				Statement st4 = con.createStatement();
//				ResultSet rs4 = st4.executeQuery(sqlselect4);
//
//				while (rs4.next()) {
//				
//
//					// unitid, MinDateReceived, MaxDateReceived,
//					// MinTimeReceived, MaxTimeReceived, TripID, Latitude,
//					// Longitude,
//					// DATE_PART('day', MaxDateReceived::timestamp -
//					// MinDateReceived::timestamp) * 24 * 60 + DATE_PART('hour',
//					// '08:56:10'::time - '08:54:55'::time) * 60 +
//					// DATE_PART('minute', MaxTimeReceived::time -
//					// MinTimeReceived::time) AS Stop,
//					// ntoWN, NCITY
//					try {
//						vehiclesummary_report obj = new vehiclesummary_report();
//						obj.setUnitid(rs4.getString(0+1));
//						obj.setMindatereceived(rs4.getString(1+1));
//						obj.setMaxdatereceived(rs4.getString(2+1));
//						obj.setMintimereceived(rs4.getString(3+1));
//						obj.setMaxtimereceived(rs4.getString(4+1));
//						obj.setTripid(rs4.getString(5+1));
//						obj.setLatitude(rs4.getString(6+1));
//						obj.setLongitude(rs4.getString(7+1));
//						obj.setStop(rs4.getString(8+1));
//						// obj.setNtown(rs4.getString(9+1));
//						// obj.setNcity(rs4.getString(10+1));
//						data.add(obj);
//					} catch (Exception e) {
//					//	System.out.println("e " + e);
//
//					}
//				}
//
//				String json = new Gson().toJson(data);   return json;
//			} else {
//				return "Not ok";
//			}
//
//		} catch (Exception e) {
//		  System.out.println(e);
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
//		} finally {
//			try {
//				con.close(); // System.out.println("connection closed");
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//	}

	
	@RequestMapping("roleinsert")
	
	public @ResponseBody String insertRole(@RequestParam("rolename") String rolename, @RequestParam("companyid") String companyid,
			@RequestParam("loginid") String loginid, @RequestParam("remarks") String remarks) {
		Connection con = null;

		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
	System.out.println("Connected in websservice roleinsert");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// roleid, rolename, companyid, loginid, datetimestamp, remarks,
			// flag
			
			 
			String sqlselect4 = "select * from dblocator.insertprocedure('insertRole', '0', '" + rolename + "', " + "'"
					+ companyid + "', '" + loginid + "', '" + tt.toLocaleString() + "', '" + remarks + "', "
					+ "'0', '', '',  " + "'', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
		
			System.out.println("role edit "+sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			ResultSet rs = ps.executeQuery();
			
			

			return "{\"success\": false,\"error\": \"ok\",\"success_code\": 202}";

		} catch (Exception e) {
			livedet det = new livedet();
			det.setExc(String.valueOf(e));
			System.out.println(e);
			String json = new Gson().toJson(det);
			return json;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	
	@RequestMapping("roleedit")
	
	public @ResponseBody String editRole(@RequestParam("roleid") String roleid, @RequestParam("rolename") String rolename,
			@RequestParam("companyid") String companyid, @RequestParam("loginid") String loginid,
			@RequestParam("remarks") String remarks) {
		Connection con = null;

		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice role edit");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// roleid, rolename, companyid, loginid, datetimestamp, remarks,
			// flag

			String sqlselect4 = "select * from dblocator.insertprocedure('insertRole', '" + roleid + "', '" + rolename
					+ "', " + "'" + companyid + "', '" + loginid + "', '" + tt.toLocaleString() + "', '" + remarks
					+ "', " + "'0', '', '',  " + "'', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			System.out.println("role"+sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			ResultSet rs = ps.executeQuery();

			
			return "ok";

		} catch (Exception e) {
			System.out.println("error "+e);
			livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	
	@RequestMapping("roledelete")
	
	public @ResponseBody String roledelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice deleteRole");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteRole'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			
			System.out.println("query"+sqlselect4);
			
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				System.out.println("ok");
				return "ok";
			} else {
				System.out.println(" not ok");
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("menuassigninsert")
	
	public @ResponseBody String menuassignInsert(@RequestParam("menuid") String menuid, @RequestParam("roleid") String roleid,
			@RequestParam("loginid") String loginid) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// id, menuid, roleid, loginid, flag
			String sqlselect4 = "select * from dblocator.insertprocedure('insertmenuassign'," + " '0', '" + menuid + "', "
					+ "'" + roleid + "', '" + loginid + "', '0', '', " + "'', '', '',  " + "'', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		}

		finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("menuassignupdate")
	
	public @ResponseBody String menuassignUpdate(@RequestParam("id") String id, @RequestParam("menuid") String menuid,
			@RequestParam("roleid") String roleid, @RequestParam("loginid") String loginid) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// id, menuid, roleid, loginid, flag
			String sqlselect4 = "select * from dblocator.insertprocedure('insertmenuassign'," + " '" + id + "', '" + menuid
					+ "', " + "'" + roleid + "', '" + loginid + "', '0', '', " + "'', '', '',  " + "'', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		}

		finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	
	@RequestMapping("menuassigndelete")
	
	public @ResponseBody String menuassigndelete(@RequestParam("id") String id) {
		Connection con = null;

		try {

			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice deleteMenuAssign");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());

			// networkid, networkname, networkapn, loginid, datetimestamp,
			// remarks,companyid

			// System.out.println("payment mode = "+payment_mode);
			String sqlselect4 = "select * from dblocator.insertprocedure('deleteMenuAssign'," + " '" + id + "', '', "
					+ " '',  '', " + "'', '', '',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		}

		catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("assetinsert")
	
	public @ResponseBody String assetInsert(@RequestParam("companyid") String companyid, @RequestParam("remarks") String remarks,
			@RequestParam("assetname") String assetname, @RequestParam("loginid") String loginid) {

		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// assettypeid, companyid,assetname,loginid,datetimestamp,remarks
			String sqlselect4 = "select * from dblocator.insertprocedure('insertAsset'," + " '0', '" + companyid + "', "
					+ "'" + assetname + "', '" + loginid + "', '" + tt.toLocaleString() + "', '" + remarks + "', "
					+ "'', '', '',  " + "'', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		}

		finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("assetupdate")
	
	public @ResponseBody String assetUpdate(@RequestParam("companyid") String companyid, @RequestParam("remarks") String remarks,
			@RequestParam("assetname") String assetname, @RequestParam("loginid") String loginid,
			@RequestParam("assettypeid") String assettypeid) {
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// assettypeid, companyid,assetname,loginid,datetimestamp,remarks
			String sqlselect4 = "select * from dblocator.insertprocedure('insertAsset'," + " '" + assettypeid + "', '"
					+ companyid + "', " + "'" + assetname + "', '" + loginid + "', '" + tt.toLocaleString() + "', '"
					+ remarks + "', " + "'', '', '',  " + "'', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		}

		finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("menuinsert")
	
	public @ResponseBody String menuInsert(@RequestParam("menutext") String menutext, @RequestParam("description") String description,
			@RequestParam("navigateurl") String navigateurl, @RequestParam("parentid") String parentid,
			@RequestParam("orderno") String orderno) {
		navigateurl = "#/" + navigateurl;
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
			System.out.println("Connected in websservice menuinsert");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
		//	System.out.println("parentid = " + parentid);
			// menuid,menutext, description, navigateurl, parentid, orderno, mid
			String sqlselect4 = "select * from dblocator.insertprocedure('insertmenu'," + " '0', '" + menutext + "',  '"
					+ description + "',  '" + navigateurl + "', '" + parentid + "', " + "'" + orderno + "', '"
					+ parentid + "',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";
		System.out.println("insert "+sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	@RequestMapping("menuupdate")
	
	public @ResponseBody String menuUpdate(@RequestParam("menutext") String menutext, @RequestParam("menuid") String menuid,
			@RequestParam("description") String description, @RequestParam("navigateurl") String navigateurl,
			@RequestParam("parentid") String parentid, @RequestParam("orderno") String orderno) {
		navigateurl = "#/" + navigateurl;
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			// menuid,menutext, description, navigateurl, parentid, orderno, mid
			String sqlselect4 = "select * from dblocator.insertprocedure('insertmenu'," + " '" + menuid + "', '" + menutext
					+ "',  '" + description + "',  '" + navigateurl + "', '" + parentid + "', " + "'" + orderno + "', '"
					+ parentid + "',  " + "'', '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";

		//	System.out.println("script=" + sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "ok";
			} else {
				return "Not ok";
			}

		} catch (Exception e) {
		  System.out.println(e);
		  
		  livedet det = new livedet();
			det.setExc(String.valueOf(e));
			String json = new Gson().toJson(det);
			return json;
//			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
//					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	@RequestMapping("historylogdetails")
	
	public @ResponseBody String historylogdetails(@RequestParam("vehicleno") String vehicleno,@RequestParam("fromdate")String fromdate,@RequestParam("todate")String todate) {
		List<historylog_details> data = new ArrayList<historylog_details>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//			 System.out.println("Connected in websservice deviceIDdetails count ");
			
				String sqlselect4 = "select * from dblocator.selectprocedure('historyLogreport', '"
						+ fromdate + "', '"+todate+"', '"+vehicleno+"', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				
				System.out.println("in history log"+sqlselect4);
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
			
				boolean avail=false;;
//			
//				mstvehicle.vehicleid, mstvehicle.vehicletypeid, mstvehicle.vehicleregno,
//		        mstass.deviceid,
//		      deviceparse.imeino,deviceparse.latitude,deviceparse.longitude,deviceparse.datatimestamp,deviceparse.gpsstatus,deviceparse.packettime,
//		      deviceparse.vehiclespeed,deviceparse.ignumber
				
				
			while (rs4.next()) {
					try {
						historylog_details obj=new historylog_details();
						obj.setVehicleid(rs4.getString(1));
						obj.setVehicletypeid(rs4.getString(2));
						obj.setVehicleregno(rs4.getString(3));
						obj.setDeviceid(rs4.getString(4));
						obj.setImeino(rs4.getString(5));
						obj.setLatitude(rs4.getString(6));
						obj.setLongitude(rs4.getString(7));
						
						SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						SimpleDateFormat sdfnew = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss a");
						java.util.Date parseTimestamp = sdf1.parse(rs4.getString(8));
//						System.out.println(rs4.getString(8));
//						dd.setDatereceived(sdfnew.format(parseTimestamp));
//						dd.setTrackdate(parseTimestamp.toLocaleString());
					
						obj.setDatatimestamp(sdfnew.format(parseTimestamp));
						
						if(rs4.getString(9).equals("0"))
						{
						obj.setGpsstatus("Invalid");
						}
						else
						{
							obj.setGpsstatus("Valid");
						}
						obj.setPackettime(rs4.getString(10));
						obj.setVehiclespeed(rs4.getString(11));
						if(rs4.getInt(12)==0)
						{
							obj.setIgnumber("ON");
						}
						else
						{
							obj.setIgnumber("OFF");
						}
						
						
						data.add(obj);
					
					} catch (Exception e) {
						System.out.println("e = " + e);
					}
		}
			String json = new Gson().toJson(data);   return json;
//			return "{\"success\": true,\"error_code\": 200}";
			
		
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	
	@RequestMapping("bangimeidetails")
	
	public @ResponseBody String bangimeidetails(@RequestParam("imei") String imei) {
		List<bang_imei> data = new ArrayList<bang_imei>();
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
//			 System.out.println("Connected in websservice deviceIDdetails count ");
			
				String sqlselect4 = "select * from dblocator.selectprocedure('selectbangimei', '"
						+ imei + "', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', "
						+ "'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '','')";
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				
		System.out.println(sqlselect4);
				Statement st4 = con.createStatement();
				ResultSet rs4 = st4.executeQuery(sqlselect4);
			
				boolean avail=false;
			
			
//			   md.deviceid,cdm.imeino, cdm.packetdate, cdm.packettime, cdm.updatedtimestamp, 
//		       cdm.vehicleid, cdm.latitude, cdm.latitudedirection, cdm.longitude, cdm.longitudedirection, 
//		       cdm.vehiclespeed, cdm.vehicledirection, cdm.gpsstatus, cdm.ignumber
			while (rs4.next()) {
					try {
						bang_imei obj=new bang_imei();
						obj.setDeviceid(rs4.getString(1));
						obj.setImeino(rs4.getString(2));
						obj.setPacketdate(rs4.getString(3));
						obj.setPackettime(rs4.getString(4));
						obj.setUpdatedtimestamp(rs4.getString(5));
						obj.setVehicleid(rs4.getString(6));
						obj.setLatitude(rs4.getString(7));
						obj.setLatitudedirection(rs4.getString(8));
						obj.setLongitude(rs4.getString(9));
						obj.setLongitudedirection(rs4.getString(10));
						obj.setVehiclespeed(rs4.getString(11));
						obj.setVehicledirection(rs4.getString(12));
						if(rs4.getString(13).equals("0"))
						{
						obj.setGpsstatus("Invalid");
						}
						else
						{
							obj.setGpsstatus("Valid");
						}
						if(rs4.getInt(14)==0)
						{
						obj.setIgnumber("OFF");
						}
						else
						{
							obj.setIgnumber("ON");
						}
						obj.setMobileno(rs4.getString(16));
						try{
							obj.setLocation(getLocationClass.getLoc(Double.parseDouble(obj.getLatitude()),
							Double.parseDouble(obj.getLongitude())));
						}catch(Exception e){
						}
						if(obj.getLocation().equals("") || obj.getLocation().startsWith("Object")){
							obj.setLocation("Location Not Found");
						}
						
						data.add(obj);
						
					} catch (Exception e) {
						System.out.println("e = " + e);
					}
		}
			String json = new Gson().toJson(data);   return json;
//			return "{\"success\": true,\"error_code\": 200}";
			
		
		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}";
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
	
	@RequestMapping("geofenceinsert")
	
	public @ResponseBody String geofenceInsert(@RequestParam("geofencename") String geofencename, 
			@RequestParam("coord") String coord,
			@RequestParam("loginid") String loginid) {
		Connection con = null;
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5472/dborissa", "postgres", "takshak");
		//	System.out.println("Connected in websservice simins");
			java.util.Date dd = new Date();
			Timestamp tt = new Timestamp(dd.getTime());
			
//			String json = new Gson().toJson(coord);
			
			JSONObject json = new JSONObject(coord);
			
			JSONArray jsonArray = json.getJSONArray("features");
			
			json = jsonArray.getJSONObject(0);
			json = json.getJSONObject("geometry");
		//	System.out.println("jsonArray = "+json);
			
			//id, geofencename, coord, datatimestamp, loginid, flag
			String sqlselect4 = "select dblocator.insertprocedure('insertgeofence','0'," + " '" + geofencename + "', '" + json
					+ "',  '" + tt.toLocaleString() + "',  '" + loginid + "', '0', " + "'', '"
					+ "',  " + " '', '', '', '', '',"
					+ "'', '', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '','', '', '', '', '', '', '', '','', '', '', '','', '', '', '');";

		//	System.out.println("script=" + sqlselect4);
			PreparedStatement ps = con.prepareStatement(sqlselect4);
			boolean rs = ps.execute();
			if (rs) {
				return "{\"success\": true,\"error\": \"Invalid input\",\"error_code\": 200}"
				;
			} else {
				return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
						;
			}

		} catch (Exception e) {
		  System.out.println(e);
			return "{\"success\": false,\"error\": \"Invalid input\",\"error_code\": 404}"
					;
		} finally {
			try {
				con.close(); // System.out.println("connection closed");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	

}
