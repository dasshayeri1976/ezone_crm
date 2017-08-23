package com.action.aimt;

import java.io.File;
import java.text.ParseException;
import java.util.List;
//import java.util.Map;  

import java.util.Map;


 

//import org.apache.struts2.dispatcher.SessionMap;  
//import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.dispatcher.SessionMap;    
import org.apache.struts2.interceptor.SessionAware;  





import org.apache.commons.io.FileUtils;

import com.bean.aimt.FormBean;
import com.helper.aimt.FormHelper;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

//public class Login extends ActionSupport implements SessionAware {
	public class Login extends ActionSupport implements SessionAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FormBean formbean,formbean2;
	private String accid,username,brandname,mcode,pcode,cdate;
	
	/**
	 * 
	 */
	private String stax,remarks,check;
	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	private File userImage;
	private String userImageContentType,count;
	private String userImageFileName;
	private Integer id;
	private String voucherno;
	private String ar[];
	// added by Nilesh, 30th March
	private String slnum;
	
	
	private String[] checked;
	private String[] checked1;
	private String[] checked2;
	private String leadid;
	private List<FormBean> usList,usList1,usList2,usList3,usList4,usList5,usList6,usList7,usList8,usList9;
	//private SessionMap<String,Object> sessionMap; 
	private SessionMap<String,Object> sessionMap;  
	Map<String, Object> session = ActionContext.getContext().getSession();
	String d=(String)session.get("user");
	

	public String getSlnum() {
		return slnum;
	}

	public void setSlnum(String slnum) {
		this.slnum = slnum;
	}
	
	
	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String login() throws ParseException {
		//System.out.println("Avijit");
		String result="";
		
		
		//usList = FormHelper.list1();
		//usList1 = FormHelper.list2();
		//usList2 = FormHelper.list3();
		//usList3 = FormHelper.list4(d);
		//usList4 = FormHelper.list5(d);
		//usList5 = FormHelper.list6(d);
		result = SUCCESS;
		
		
			
		return result;
	}
	
	public String dashboard() throws ParseException {
		//System.out.println("dashboard action Avijit");
		String result=SUCCESS;
		//String role=FormHelper.roll(d);
		Map<String, Object> session = ActionContext.getContext().getSession();
		//session.put("role", role);
		//System.out.println("Role: "+session.get("role"));
		usList = FormHelper.list1(d);
		usList1 = FormHelper.brandnameuser(d);
		//usList2 = FormHelper.list3();
		//usList3 = FormHelper.list4(d);
		//usList4 = FormHelper.list5(d);
		//usList5 = FormHelper.list6(d);
			
		return result;
	}
	
	public String dashboarddetails() {
		//System.out.println("Avijit");
		String result=SUCCESS;
		usList=FormHelper.dashboarddetails(formbean,d);
		usList1 = FormHelper.brandnameuser(d);
		return result;
	}
	
	
	public String callerdashboardlist0() 
	{
		
		String result = SUCCESS;
		usList=FormHelper.callerdashboardlist0(brandname,mcode,pcode,d);
		
		
		return result;
		
	}

	public String callerdashboardlist() 
	{
		
		String result = SUCCESS;
		usList=FormHelper.callerdashboardlist(brandname,mcode,pcode,d);
		
		
		return result;
		
	}
	
	public String callerdashboardlist1() 
	{
		
		String result = SUCCESS;
		usList=FormHelper.callerdashboardlist1(brandname,mcode,pcode,d);
		
		
		return result;
		
	}
	
	public String callerdashboardlist2() 
	{
		
		String result = SUCCESS;
		usList=FormHelper.callerdashboardlist2(brandname,mcode,pcode,d);
		
		
		return result;
		
	}
	
	public String logout(){  
	    sessionMap.invalidate();  
	    return "success";  
	}
	
	public String calculator() {
		String result = SUCCESS;
		return result;
	}

	

	public String usercreation() 
	{
		String result = ERROR;
		if (formbean != null)
			{
			//System.out.println("Avi1234");
			if (FormHelper.usercreation(formbean))
				{
					addActionMessage("User create/Updated successfully!!!!!");
					result = SUCCESS;
				}
			else
				result = ERROR;
			}
		formbean = null;
		userlist();
		return result;
	}

	public String branchcreation() {
		String result = ERROR;
		if (formbean != null) {
	    //System.out.println("Avi1234");
		if (FormHelper.branchcreation(formbean))
		{
		addActionMessage("Branch create/Updated successfully!!!!!");
		result = SUCCESS;
		}
		else
		result = ERROR;
		}
		formbean = null;
		branchlist();
		return result;
		}

	public String statecreation() {
		String result = ERROR;
		if (formbean != null) {
	    //System.out.println("Avi1234");
		if (FormHelper.statecreation(formbean))
		{
		addActionMessage("State create/Updated successfully!!!!!");
		result = SUCCESS;
		}
		else
		result = ERROR;
		}
		formbean = null;
		statelist();
		return result;
		}
	 public String districtcreation() {
		String result = ERROR;
		if (formbean != null) {
	    //System.out.println("Avi1234");
		if (FormHelper.districtcreation(formbean))
		{
		addActionMessage("District create/Updated successfully!!!!!");
		result = SUCCESS;
		}
		else
		result = ERROR;
		}
		formbean = null;
		districtlist();
		return result;
		} 
	 public String citycreation() {
		String result = ERROR;
		if (formbean != null) {		
	   // System.out.println("BKV1234");		
		if (FormHelper.citycreation(formbean))
		{
		addActionMessage("City create/Updated successfully!!!!!");
		result = SUCCESS;
		}
		else
		result = ERROR;
		}
		formbean = null;
		citylist();
		return result;
		}

	 public String companycreation() {
		String result = ERROR;
		if (formbean != null) {			
		// 	System.out.println("BKV1234");			
		int i=FormHelper.companycreation(formbean);
		
		if(i==0)
		{
		addActionMessage("Company created successfully!!!!!");
		result=SUCCESS;
		}
		if(i==1)
		{
		addActionMessage("Company is showing duplicated");
		result=SUCCESS;
		}
		if(i==2)
		{
		addActionMessage("Company Updated Successfully");
		result=SUCCESS;
		}
	
		
		}
		formbean = null;
		companylist();
		return result;
	 	}
	 

	 public String engineercreation() {
			String result = ERROR;
			if (formbean != null) {
					
		   // System.out.println("BKV1234");
					
			if (FormHelper.engineercreation(formbean))
				{
					addActionMessage("Engineer Master created/Updated successfully!!!!!");
					result = SUCCESS;
				}
			else
				result = ERROR;
			}
			formbean = null;
			engineerlist();
			return result;
			}
	 
	 // added by Nilesh,17th March
	 public String customercreation() {
			String result = ERROR;
			if (formbean != null) {
					
		   // System.out.println("BKV1234");
					
			if (FormHelper.customercreation(formbean))
				{
					addActionMessage("Customer Master created/Updated successfully!!!!!");
					result = SUCCESS;
				}
			else
				result = ERROR;
			}
			formbean = null;
			customerlist();
			return result;
			}
	 
	 public String customerlist() 
		{	
			String result = SUCCESS;
			String prefix="EN";
			formbean=FormHelper.uniqueid1(prefix);
			usList=FormHelper.customerlist();
			usList1=FormHelper.placename();
			return result;
			
		}
	 
	 public String customerlist1() 
		{	
		
		 
			String result = SUCCESS;
			String prefix="EN";
			formbean=FormHelper.uniqueid1(prefix);
			usList=FormHelper.customerlist();
			usList1=FormHelper.placename();
			return result;
			
		}
	 
	 public String customerupdate() 
	 {
	 	String result = SUCCESS;
	 	formbean=FormHelper.customeredit(id);
	 	
	 	//System.out.println(enquerybean.getName());
	 	usList=FormHelper.customerlist();
		usList1=FormHelper.placename();
	 	return result;
	 }
	 
	 public String customerdelete() 
		{
		String result = SUCCESS;
		FormHelper.customerdelete(id);
		
	
		customerlist();
		return result;
		}
	 
	
	 public String quotationcreation() {
			String result = ERROR;
			if (formbean != null) {
					
		   // System.out.println("BKV1234");
					
			if (FormHelper.quotationcreation(formbean))
				{
					addActionMessage("Quotation Master created/Updated successfully!!!!!");
					result = SUCCESS;
				}
			else
				result = ERROR;
			}
			formbean = null;
			quotationlist();
			return result;
			}
	 
	 public String quotationlist() 
		{	
			String result = SUCCESS;
			String prefix="EN";
			formbean=FormHelper.uniqueid1(prefix);
			
			usList=FormHelper.quotationlist();
			
			usList9=FormHelper.customer();
			
			//usList1=FormHelper.jobworklist(d);
			//usList9=FormHelper.customerlist();
			//usList1=FormHelper.placename();
			return result;
			
		}
	 
	 public String quotationupdate() 
	 {
	 	String result = SUCCESS;
	 	//System.out.println("Hello");
	 	formbean=FormHelper.quotationedit(id);
	 	//System.out.println(enquerybean.getName());
	 	
	 	usList9=FormHelper.customer();
	 	
	 	usList=FormHelper.quotationlist();
		/*usList1=FormHelper.placename();*/
	 	return result;
	 }
	 
	 public String quotationdelete() 
		{
		String result = SUCCESS;
		FormHelper.quotationdelete(id);
		
		//System.out.println(enquerybean.getName());
		quotationlist();
		return result;
		}
	 

	 public String brandcreation() {
		String result = ERROR;
		if (formbean != null) {
			//System.out.println("Avi1234");
			if (FormHelper.brandcreation(formbean))
				{
					addActionMessage("Brand create/Updated successfully!!!!!");
					result = SUCCESS;
				}
			else
				result = ERROR;
				}
		formbean = null;
		brandlist();
		return result;
		}

	 public String productcreation() {
		String result = ERROR;
		if (formbean != null) {
	    //System.out.println("Avi1234");
		if (FormHelper.productcreation(formbean))
		{
		addActionMessage("District create/Updated successfully!!!!!");
		result = SUCCESS;
		}
		else
		result = ERROR;
		}
		formbean = null;
		productlist();
		return result;
		}
	 
	 public String modelcreation() {
			String result = ERROR;
			if (formbean != null) {
		    //System.out.println("Avi1234");
			// if (FormHelper.modelcreation(formbean))
			
			if (FormHelper.modelcreation(formbean))
				
			{
			addActionMessage("Model create/Updated successfully!!!!!");
			result = SUCCESS;
			}
			else
			result = ERROR;
			}
			formbean = null;
			modellist();
			return result;
			}
	 
	 public String complaincreation() {
			String result = ERROR;
			if (formbean != null) {
		    //System.out.println("Avi1234");
			if (FormHelper.complaincreation(formbean))
				
			{
			addActionMessage("Complain create/Updated successfully!!!!!");
			result = SUCCESS;
			}
			else
			result = ERROR;
			}
			formbean = null;
			complainlist();
			return result;
			}

	 public String resolvecreation() {
			String result = ERROR;
			if (formbean != null) {
		    //System.out.println("Avi1234");
			if (FormHelper.resolvecreation(formbean))
				
			{
			addActionMessage("Resolve create/Updated successfully!!!!!");
			result = SUCCESS;
			}
			else
			result = ERROR;
			}
			formbean = null;
			resolvelist();
			return result;
			}

	 public String placecreation() {
			String result = ERROR;
			if (formbean != null) {
		    //System.out.println("Avi1234");
			if (FormHelper.placecreation(formbean))
				
			{
			addActionMessage("Place create/Updated successfully!!!!!");
			result = SUCCESS;
			}
			else
			result = ERROR;
			}
			formbean = null;
			placelist();
			return result;
			}
	 public String transportcreation() {
			String result = ERROR;
			if (formbean != null) {
		    //System.out.println("Avi1234");
			if (FormHelper.transportcreation(formbean))
				
			{
			addActionMessage("Transport Create/Updated successfully!!!!!");
			result = SUCCESS;
			}
			else
			result = ERROR;
			}
			formbean = null;
			transportlist();
			return result;
			}

	 public String sparecreation() {
			String result = ERROR;
			if (formbean != null) {
		    //System.out.println("Avi1234");
			if (FormHelper.sparecreation(formbean))
				
			{
			addActionMessage("Spare Create/Updated successfully!!!!!");
			result = SUCCESS;
			}
			else
			result = ERROR;
			}
			formbean = null;
			sparelist();
			return result;
			}
	 
	 public String jobworkcreation() {
			String result = ERROR;
			if (formbean != null) {
		    //System.out.println("Avi1234");
			String k1=FormHelper.jobworkcreation(formbean,d);
			int k=Integer.parseInt(k1.substring(0,1));
			if(k==0)
			{
			addActionMessage("jobwork Created successfully with Cutomer Call Id "+k1.substring(1,k1.length()));
			result = SUCCESS;
			}
			if(k==1)
			{
			addActionMessage("Company Call Id is Duplicated "+ k1.substring(1,k1.length())+" , Please check once with company Id!!!!!");
			result = SUCCESS; 
			}
			if(k==2)
			{
			addActionMessage("jobwork Updated successfully!!!!!");
			result = SUCCESS;
			}
			}
			formbean = null;
			jobworklist();
			return result;
			}
	 
	 public String jobworkcreation1() {
			String result = ERROR;
			if (formbean != null) {
		    //System.out.println("Avi1234");
			String k1=FormHelper.jobworkcreation(formbean,d);
			int k=Integer.parseInt(k1.substring(0,1));
			if(k==0)
			{
			addActionMessage("jobwork Created successfully with Cutomer Call Id "+k1.substring(1,k1.length()));
			result = SUCCESS;
			}
			if(k==1)
			{
			addActionMessage("Company Call Id is Duplicated, Please check once with company Id!!!!!");
			result = SUCCESS;
			}
			if(k==2)
			{
			addActionMessage("jobwork Updated successfully!!!!!");
			result = SUCCESS;
			}
			}
			formbean = null;
			englist();
			return result;
			}
	 
	 public String jobworkcreation2() {
			String result = ERROR;
			if (formbean != null) {
		    //System.out.println("Avi1234");
				String k1=FormHelper.jobworkcreation(formbean,d);
				int k=Integer.parseInt(k1.substring(0,1));
			if(k==0)
			{
			addActionMessage("jobwork Created successfully with Cutomer Call Id "+k1.substring(1,k1.length()));
			result = SUCCESS;
			}
			if(k==1)
			{
			addActionMessage("Company Call Id is Duplicated, Please check once with company Id!!!!!");
			result = SUCCESS;
			}
			if(k==2)
			{
			addActionMessage("jobwork Updated successfully!!!!!");
			result = SUCCESS;
			}
			}
			formbean = null;
			englistc();
			return result;
			}
	 
	 public String engcreationcin() 
		{
			String result = ERROR;
			
				if (FormHelper.engcreationcin(formbean,id))
					{
						addActionMessage("User create successfully!!!!!");
						result = SUCCESS;
					}
				else
					result = ERROR;
				
			formbean = null;
			englist();
			return result;
		}
	 
	 public String engcreationcin1() 
		{
			String result = ERROR;
			
				if (FormHelper.engcreationcin1(formbean,accid))
					{
						addActionMessage("User create successfully!!!!!");
						result = SUCCESS;
					}
				else
					result = ERROR;
				
			formbean = null;
			englist();
			return result;
		}
	 
	 public String engcreation() 
		{
			String result = ERROR;
			
				if (FormHelper.engcreation(formbean,id))
					{
						addActionMessage("User create successfully!!!!!");
						result = SUCCESS;
					}
				else
					result = ERROR;
				
			formbean = null;
			englistc();
			return result;
		}
	 
	 public String engcreation1() 
		{
			String result = ERROR;
			
				if (FormHelper.engcreation1(formbean,accid))
					{
						addActionMessage("User Updated successfully!!!!!");
						result = SUCCESS;
					}
				else
					result = ERROR;
				
			formbean = null;
			englistc();
			return result;
		}
	 
	 public String userlist() 
	{
		
		String result = SUCCESS;
		usList=FormHelper.userlist();
		return result;
		
	}

	public String branchlist() 
	{
		String result = SUCCESS;
		String prefix="BA";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.branchlist();
		return result;
		
	}

	public String statelist() 
	{
		
		String result = SUCCESS;
		String prefix="ST";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.statelist();
			
		return result;
		
	}

	public String districtlist() 
	{
		String result = SUCCESS;
		String prefix="DS";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.districtlist();
		usList1=FormHelper.statename();
		return result;
		
	}
	public String citylist() 
	{	
		String result = SUCCESS;
		String prefix="CT";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.citylist();
		usList1=FormHelper.districtname();
		return result;
		
	}
	public String companylist() 
	{	
		String result = SUCCESS;
		String prefix="CO";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.companylist();
		return result;
		
	}

	public String brandlist() 
	{	
		String result = SUCCESS;
		String prefix="BR";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.brandlist();
		usList1=FormHelper.companyname();
		return result;	
	}

	public String engineerlist() 
	{	
		String result = SUCCESS;
		String prefix="EN";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.engineerlist();
		usList1=FormHelper.placename();
		return result;
		
	}

	public String productlist() 
	{
		String result = SUCCESS;
		String prefix="PD";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.productlist();
		return result;
	}

	public String modellist() 
	{
		String result = SUCCESS;
		String prefix="MC";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.modellist();
		usList1=FormHelper.productname();
		usList2=FormHelper.brandname();
		return result;
	}
	public String complainlist() 
	{
		String result = SUCCESS;
		String prefix="CC";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.complainlist();
		return result;
	}
	public String resolvelist() 
	{
		String result = SUCCESS;
		String prefix="RC";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.resolvelist();
		return result;
	}
	public String placelist() 
	{
		String result = SUCCESS;
		String prefix="PC";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.placelist();
		usList1=FormHelper.cityname();
		return result;
	}
	
	// added by Nilesh
		public String routelist() 
		{
			String result = SUCCESS;
			
			
			usList1=FormHelper.frmplace();
			usList2=FormHelper.toplace();
			usList=FormHelper.routelist();
			
			/*usList1=FormHelper.cityname();*/
			return result;
		}
		
		// added by Nilesh 10th March
				public String routelistdialog() 
				{
					String result = SUCCESS;
					
					
					usList1=FormHelper.frmplace();
					usList2=FormHelper.toplace();
					usList=FormHelper.routelist();
					
					/*usList1=FormHelper.cityname();*/
					return result;
				}
		
		// Nilesh
		  public String routeupdate() 
		  {
		  	String result = SUCCESS;
		  	// first one showing contents inside fields
		  	formbean=FormHelper.routeedit(id);
		  	
		  	//System.out.println(enquerybean.getName());
		  	// second one showing list of data inside table
		  	routelist();
		  	return result;
		  
		  }
		  
		// added by Nilesh
			public String routedelete() 
			{
			String result = SUCCESS;
			FormHelper.routedelete(id);
			
			//System.out.println(enquerybean.getName());
			routelist();
			return result;
			}
		
		// Nilesh
		  public String routecreation() {
				String result = ERROR;
				if (formbean != null) {
			    //System.out.println("Avi1234");
				if (FormHelper.routecreation(formbean))
					
				{
				addActionMessage("Route create/Updated successfully!!!!!");
				result = SUCCESS;
				}
				else
				result = ERROR;
				}
				formbean = null;
				routelist();
				return result;
				}
	
	public String transportlist() 
	{
		String result = SUCCESS;
		String prefix="TC";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.transportlist();
		return result;
	}
	public String sparelist() 
	{
		String result = SUCCESS;
		String prefix="SP";
		formbean=FormHelper.uniqueid1(prefix);
		usList=FormHelper.sparelist();
		return result;
	}
	
	public String jobworklist() 
	{
		String result = SUCCESS;
		formbean=FormHelper.uniqueid();
		usList1=FormHelper.placename();
		usList2=FormHelper.cityname();
		usList3=FormHelper.complainname();
		usList4=FormHelper.modelname();
		usList5=FormHelper.productname();
		usList6=FormHelper.brandnameuser(d);
		usList7=FormHelper.companynameuser(d);
		usList8=FormHelper.calltypeuser(d);
		usList9=FormHelper.customer();
		usList=FormHelper.jobworklist(d);
		return result;
	}
	
	public String englist() 
	{
		String result = SUCCESS;
		usList=FormHelper.englist(d);
		usList1=FormHelper.engname();
		
		return result;
	}
	
	public String englistc() 
	{
		String result = SUCCESS;
		usList=FormHelper.englistc(d);
		usList1=FormHelper.engname();
		return result;
	}
	
	public String englistcp() 
	{
		String result = SUCCESS;
		usList=FormHelper.englistcp(d);
		return result;
	}
	
	public String englistcp1() 
	{
		String result = SUCCESS;
		usList=FormHelper.englistcp1();
		return result;
	}
	
	public String englistcin() 
	{
		String result = SUCCESS;
		usList=FormHelper.englistcin(d);
		//usList=FormHelper.englist(d);
		return result;
	}
	
	public String englistcem() 
	{
		String result = SUCCESS;
		usList=FormHelper.englistcem(d);
		
		// added 15th March, Nilesh
		usList1=FormHelper.frmplace();
	    usList2=FormHelper.toplace();
		
		return result;
	}

	public String userupdate() 
	{
		String result = SUCCESS;
		formbean=FormHelper.useredit(id);
		
		//System.out.println(enquerybean.getName());
		userlist();
		return result;
	}

	public String branchupdate() 
	{
		String result = SUCCESS;
		formbean=FormHelper.branchedit(id);
		
		//System.out.println(enquerybean.getName());
		usList=FormHelper.branchlist();
		return result;
	}

	public String stateupdate() 
	{
		String result = SUCCESS;
		formbean=FormHelper.stateedit(id);
		
		//System.out.println(enquerybean.getName());
		usList=FormHelper.statelist();
		return result;
	}
	public String districtupdate() 
	{
		String result = SUCCESS;
		formbean=FormHelper.districtedit(id);
		
		//System.out.println(enquerybean.getName());
		usList=FormHelper.districtlist();
		usList1=FormHelper.statename();
		return result;
	}
	 public String cityupdate() 
	{
		String result = SUCCESS;
		formbean=FormHelper.cityedit(id);
		
		//System.out.println(enquerybean.getName());
		usList=FormHelper.citylist();
		usList1=FormHelper.districtname();
		return result;
	}
	 public String companyupdate() 
	 {
	 	String result = SUCCESS;
	 	formbean=FormHelper.companyedit(id);
	 	
	 	//System.out.println(enquerybean.getName());
	 	usList=FormHelper.companylist();
	 	return result;
	 }
	 public String engineerupdate() 
	 {
	 	String result = SUCCESS;
	 	formbean=FormHelper.engineeredit(id);
	 	
	 	//System.out.println(enquerybean.getName());
	 	usList=FormHelper.engineerlist();
		usList1=FormHelper.placename();
	 	return result;
	 }
	 
	  public String brandupdate() 
	 {
	 	String result = SUCCESS;
	 	formbean=FormHelper.brandedit(id);
	 	
	 	//System.out.println(enquerybean.getName());
	 	usList=FormHelper.brandlist();
		usList1=FormHelper.companyname();
	 	return result;
	 }
	 
	  public String productupdate() 
	  {
	  	String result = SUCCESS;
	  	formbean=FormHelper.productedit(id);
	  	
	  	//System.out.println(enquerybean.getName());
	  	usList=FormHelper.productlist();
	  	return result;
	  }

	  public String modelupdate() 
	  {
	  	String result = SUCCESS;
	  	formbean=FormHelper.modeledit(id);
	  	
	  	//System.out.println(enquerybean.getName());
	  	usList=FormHelper.modellist();
		usList1=FormHelper.productname();
		usList2=FormHelper.brandname();
	  	return result;
	  }
	  public String complainupdate() 
	  {
	  	String result = SUCCESS;
	  	formbean=FormHelper.complainedit(id);
	  	
	  	//System.out.println(enquerybean.getName());
	  	usList=FormHelper.complainlist();
	  	return result;
	  }
	   
	  public String resolveupdate() 
	  {
	  	String result = SUCCESS;
	  	formbean=FormHelper.resolveedit(id);
	  	
	  	//System.out.println(enquerybean.getName());
	  	usList=FormHelper.resolvelist();
	  	return result;
	  }
	  public String placeupdate() 
	  {
	  	String result = SUCCESS;
	  	formbean=FormHelper.placeedit(id);
	  	
	  	//System.out.println(enquerybean.getName());
	  	usList=FormHelper.placelist();
		usList1=FormHelper.cityname();
	  	return result;
	  }
	  public String transportupdate() 
	  {
	  	String result = SUCCESS;
	  	formbean=FormHelper.transportedit(id);
	  	
	  	//System.out.println(enquerybean.getName());
	  	usList=FormHelper.transportlist();
	  	return result;
	  }
	  
		

		public String spareupdate() 
		  {
		  	String result = SUCCESS;
		  	formbean=FormHelper.spareedit(id);
		  	
		  	//System.out.println(enquerybean.getName());
		  	usList=FormHelper.sparelist();
		  	return result;
		  	
		  }
		
		public String jobworkupdate() 
		  {
		  	String result = SUCCESS;
		  	
		  	System.out.println("ID: "+id);
		  	formbean=FormHelper.jobworkedit(id);
		  	usList1=FormHelper.placename();
			usList2=FormHelper.cityname();
			usList3=FormHelper.complainname();
			usList4=FormHelper.modelname();
			usList5=FormHelper.productname();
			usList6=FormHelper.brandnameuser(d);
			usList7=FormHelper.companynameuser(d);
			usList8=FormHelper.calltypeuser(d);
			usList9=FormHelper.customer();
			//usList=FormHelper.englist();
			usList=FormHelper.jobworklist(d);
		  	
			
		  	//System.out.println(enquerybean.getName());
		  	
		  	return result;
		  }
		
		// added by Nilesh, 28th March
		public String quotationdetails()
		{
			String result = SUCCESS;
			
			//System.out.println("ID: "+id);
			
			formbean = FormHelper.quotations(id,check);
			usList=FormHelper.quotationlist1(id);
			//formbean=FormHelper.quotationedit(id);
			//formbean = FormHelper.vouchernum();
			
			return result;
		}
		
		
		public String jobworkupdate1() 
		  {
		  	String result = SUCCESS;
		  	
		  	formbean=FormHelper.jobworkedit(id);
		  	
		  	usList1=FormHelper.placename();
			usList2=FormHelper.cityname();
			usList3=FormHelper.complainname();
			usList4=FormHelper.modelname();
			usList5=FormHelper.productname();
			usList6=FormHelper.brandnameuser(d);
			usList7=FormHelper.companynameuser(d);
			usList8=FormHelper.calltypeuser(d);
			usList9=FormHelper.customer();
			usList=FormHelper.englist(d);
			
		  	
		  	//System.out.println(enquerybean.getName());
		  	
		  	return result;
		  }
		
		public String jobworkupdate2() 
		  {
		  	String result = SUCCESS;
		  	
		  	formbean=FormHelper.jobworkedit(id);
		  	usList1=FormHelper.placename();
			usList2=FormHelper.cityname();
			usList3=FormHelper.complainname();
			usList4=FormHelper.modelname();
			usList5=FormHelper.productname();
			usList6=FormHelper.brandnameuser(d);
			usList7=FormHelper.companynameuser(d);
			usList8=FormHelper.calltypeuser(d);
			usList9=FormHelper.customer();
			usList=FormHelper.englistc(d);
			
			
		  	
		  	//System.out.println(enquerybean.getName());
		  	
		  	return result;
		  }
		
		public String report() 
		  {
		  	String result = SUCCESS;
		  
		  
			
			usList=FormHelper.brandname();
			usList1=FormHelper.engnameuser(d);
		  	
		  	//System.out.println(enquerybean.getName());
		  	
		  	return result;
		  }
		
		public String reportdetails() {
			//System.out.println("Avijit");
			String result=SUCCESS;
			usList2=FormHelper.reportdetails(formbean);
			usList=FormHelper.brandnameuser(d);
			usList1=FormHelper.engnameuser(d);
			return result;
		}
		
		public String sparereturnreport() 
		  {
		  	String result = SUCCESS;
		  
		  	usList1=FormHelper.engname();
		  	
		  	//System.out.println(enquerybean.getName());
		  	
		  	return result;
		  }
		  
		public String sparereturndetails() {
			//System.out.println("Avijit");
			String result=SUCCESS;
			usList2=FormHelper.sparereturndetails(formbean);
			usList1=FormHelper.engname();
			return result;
		}
			
			public String expensereport() 
			  {
			  	String result = SUCCESS;
			  
			  	usList1=FormHelper.engname();
			 // 	usList2=FormHelper.engexpensedetails(formbean);
			  	//System.out.println(enquerybean.getName());
			  	
			  	return result;
			  }
			
			public String expensereport1() 
			  {
			  	String result = SUCCESS;
			  
			  	usList1=FormHelper.engname();
			  	
			  	//System.out.println(enquerybean.getName());
			  	
			  	return result;
			  }
			  
			public String engexpensedetails() {
				//System.out.println("Avijit");
				String result=SUCCESS;
				usList2=FormHelper.engexpensedetails(formbean);
				usList1=FormHelper.engname();
				return result;
			}
					
			
			public String search() 
			  {
			  	String result = SUCCESS;
			  
			  	//System.out.println(enquerybean.getName());
			  	
			  	return result;
			  }
			  
			public String searchr() {
				//System.out.println("Avijit");
				String result=SUCCESS;
				usList=FormHelper.searchr(formbean);
				return result;
			}
			
			
			
			
			
			
			
		public String userdelete() 
			{
			String result = SUCCESS;
			FormHelper.userdelete(id);
			
			//System.out.println(enquerybean.getName());
			userlist();
			return result;
			}
			
			
		public String branchdelete() 
		{
		String result = SUCCESS;
		FormHelper.branchdelete(id);
		
		//System.out.println(enquerybean.getName());
		branchlist();
		return result;
		}
		public String statedelete() 
		{
		String result = SUCCESS;
		FormHelper.statedelete(id);
		
		//System.out.println(enquerybean.getName());
		statelist();
		return result;
		}
		public String districtdelete() 
		{
		String result = SUCCESS;
		FormHelper.districtdelete(id);
		
		//System.out.println(enquerybean.getName());
		districtlist();
		return result;
		}
		public String citydelete() 
		{
		String result = SUCCESS;
		FormHelper.citydelete(id);
		
		//System.out.println(enquerybean.getName());
		citylist();
		return result;
		}
		public String companydelete() 
		{
		String result = SUCCESS;
		FormHelper.companydelete(id);
		
		//System.out.println(enquerybean.getName());
		companylist();
		return result;
		}
		
		public String engineerdelete() 
		{
		String result = SUCCESS;
		FormHelper.engineerdelete(id);
		
		//System.out.println(enquerybean.getName());
		engineerlist();
		return result;
		}
		
		public String branddelete() 
		{
		String result = SUCCESS;
		FormHelper.branddelete(id);
		
		//System.out.println(enquerybean.getName());
		brandlist();
		return result;
		}

		public String productdelete() 
		{
		String result = SUCCESS;
		FormHelper.productdelete(id);
		
		//System.out.println(enquerybean.getName());
		productlist();
		return result;
		}
		
		public String modeldelete() 
		{
		String result = SUCCESS;
		FormHelper.modeldelete(id);
		
		//System.out.println(enquerybean.getName());
		modellist();
		return result;
		}
		
		public String complaindelete() 
		{
		String result = SUCCESS;
		FormHelper.complaindelete(id);
		
		//System.out.println(enquerybean.getName());
		complainlist();
		return result;
		}
		public String resolvedelete() 
		{
		String result = SUCCESS;
		FormHelper.resolvedelete(id);
		
		//System.out.println(enquerybean.getName());
		resolvelist();
		return result;
		}
		
		
//shayerisalescrm
		
		 
		 public String salescrmserviceslist() 
			{
				
				String result = SUCCESS;
				
				String prefix="SS";
				formbean=FormHelper.uniqueid1(prefix);
				usList1=FormHelper.salescrmserviceslist(formbean);
				usList4=FormHelper.customername(formbean);
				usList5=FormHelper.model(formbean);
				return result;
				
			}		
		
		 public String salescrmservicescreation() 
			{
			 	
				String result = ERROR;
				FormHelper.salescrmservicescreation(formbean);
				//System.out.println("hello"+formbean);
				if (formbean != null) 
				{		
				  		
					if (FormHelper.salescrmservicescreation(formbean))
					{
					addActionMessage("Sales(CRM) services created/updated successfully!!!!!");
					result = SUCCESS;
					}
					
				}
				usList4=FormHelper.customername(formbean);
				usList5=FormHelper.model(formbean);
				formbean = null;
				return result;
				
			}
		 public String salescrmservicesupdate() 
		 {
					String result = SUCCESS;
					
					formbean=FormHelper.salescrmservicesupdate(id,voucherno);
					//System.out.println(id+" "+v);
					usList4=FormHelper.customername(formbean);
					usList5=FormHelper.model(formbean);
							return result;
			}
		 public String salescrmservicesdelete() 
			{
			String result = SUCCESS;
			FormHelper.salescrmservicesdelete(id,voucherno);
			usList4=FormHelper.customername(formbean);
			usList5=FormHelper.model(formbean);
			return result;
			} 
		
		
		
		
		
		public String placedelete() 
		{
		String result = SUCCESS;
		FormHelper.placedelete(id);
		
		//System.out.println(enquerybean.getName());
		placelist();
		return result;
		}
		
		public String transportdelete() 
		{
		String result = SUCCESS;
		FormHelper.transportdelete(id);
		
		//System.out.println(enquerybean.getName());
		transportlist();
		return result;
		}
		
		public String sparedelete() 
		{
		String result = SUCCESS;
		FormHelper.sparedelete(id);
		
		//System.out.println(enquerybean.getName());
		sparelist();
		return result;
		}
		
		public String jobworkdelete() 
		{
		String result = SUCCESS;
		FormHelper.jobworkdelete(id);
		
		//System.out.println(enquerybean.getName());
		jobworklist();
		return result;
		}

		public String printview() throws ParseException 
		{
				
				
				String result = SUCCESS;
				usList=FormHelper.printview(checked);
				//addActionMessage("Message sent successfully");
				return result;
			
		}
		
		public String printview1() throws ParseException 
		{
				
				
				String result = SUCCESS;
				usList=FormHelper.printview(checked);
				//addActionMessage("Message sent successfully");
				return result;
			
		}
		
		public String sparereturn() throws ParseException 
		{
				
				
				String result = SUCCESS;
				FormHelper.sparereturn(formbean,checked,checked1,checked2,id);
				englistcem();
				//addActionMessage("Message sent successfully");
				return result;
			
		}
		
		public String sparereturn1() throws ParseException 
		{
							
				String result = SUCCESS;
				FormHelper.sparereturn(formbean,checked,checked1,checked2,id);
				englistcin();
				//addActionMessage("Message sent successfully");
				return result;
			
		}
		
		public String expencereturn() throws ParseException 
		{
						
				String result = SUCCESS;
				FormHelper.expencereturn(formbean,accid);
				englistcem();
				//addActionMessage("Message sent successfully");
				return result;
			
		}
		
		public String pstatus() throws ParseException 
		{
				
				String result = SUCCESS;
				FormHelper.pstatus(formbean,username);
				englistcem();
				formbean = null;
				//addActionMessage("Message sent successfully");
				return result;
			
		}
		
		public String pstatus1() throws ParseException 
		{
				
				//System.out.println("hello in pstatus1 action");
				String result = SUCCESS;
				FormHelper.pstatus1(formbean,username);
				//System.out.println("check value "+username);
				englistcin();
				//englist();
				//addActionMessage("Message sent successfully");
				return result;
				
			
		}
		
		public String pertsreq() throws ParseException 
		{
				
				
				String result = SUCCESS;
				usList=FormHelper.pertsreq(d);
				//addActionMessage("Message sent successfully");
				return result;
				
			
		}
		
		public String pertsrec() throws ParseException 
		{
				
				
				String result = SUCCESS;
				usList=FormHelper.pertsrec(d);
				//addActionMessage("Message sent successfully");
				return result;
			
		}


	public FormBean getFormbean() {
		return formbean;
	}

	public void setFormbean(FormBean formbean) {
		this.formbean = formbean;
	}
	
	public List<FormBean> getUsList() {
		return usList;
	}

	public void setUsList(List<FormBean> usList) {
		this.usList = usList;
	}
	
	public List<FormBean> getUsList1() {
		return usList1;
	}

	public void setUsList1(List<FormBean> usList1) {
		this.usList1 = usList1;
	}
	
	public List<FormBean> getUsList2() {
		return usList2;
	}

	public void setUsList2(List<FormBean> usList2) {
		this.usList2 = usList2;
	}
	
	public List<FormBean> getUsList3() {
		return usList3;
	}

	public void setUsList3(List<FormBean> usList3) {
		this.usList3 = usList3;
	}
	
	public List<FormBean> getUsList4() {
		return usList4;
	}

	public void setUsList4(List<FormBean> usList4) {
		this.usList4 = usList4;
	}
	
	public List<FormBean> getUsList5() {
		return usList5;
	}

	public void setUsList5(List<FormBean> usList5) {
		this.usList5 = usList5;
	}
	
	public List<FormBean> getUsList6() {
		return usList6;
	}

	public void setUsList6(List<FormBean> usList6) {
		this.usList6 = usList6;
	}
	
	public List<FormBean> getUsList7() {
		return usList7;
	}

	public void setUsList7(List<FormBean> usList7) {
		this.usList7 = usList7;
	}
	
	public List<FormBean> getUsList8() {
		return usList8;
	}

	public void setUsList8(List<FormBean> usList8) {
		this.usList8 = usList8;
	}
	
	public List<FormBean> getUsList9() {
		return usList9;
	}

	public void setUsList9(List<FormBean> usList9) {
		this.usList9 = usList9;
	}


	public String[] getChecked() {
		 
	    return checked;
	}
	 
	public void setChecked(String[] checked) {
	 
	    this.checked=checked;
	 
	}
	
	public String[] getChecked1() {
		 
	    return checked1;
	}
	 
	public void setChecked1(String[] checked1) {
	 
	    this.checked1=checked1;
	 
	}
	
	public String[] getChecked2() {
		 
	    return checked2;
	}
	 
	public void setChecked2(String[] checked2) {
	 
	    this.checked2=checked2;
	 
	}
	
	public Integer getId() {
		return id;
		}
		 
	public void setId(Integer id) {
	this.id = id;
	}
	
	public File getUserImage() {
        return userImage;
    }
 
    public void setUserImage(File userImage) {
        this.userImage = userImage;
    }
 
    public String getUserImageContentType() {
        return userImageContentType;
    }
 
    public void setUserImageContentType(String userImageContentType) {
        this.userImageContentType = userImageContentType;
    }
 
    public String getUserImageFileName() {
        return userImageFileName;
    }
 
    public void setUserImageFileName(String userImageFileName) 
    {
        this.userImageFileName = userImageFileName;
    }
    
    public String getAccid() {
		return accid;
	}

	public void setAccid(String accid) {
		this.accid = accid;
	}
	
	public String getStax() {
		return stax;
	}

	public void setStax(String stax) {
		this.stax = stax;
	}
	
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public String getLeadid() {
		return leadid;
	}

	public void setLeadid(String leadid) {
		this.leadid = leadid;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	  
	public void setSession(Map<String, Object> map) {  
	    sessionMap=(SessionMap)map;  
	}  
	
	public String getBrandname() {
		return brandname;
	}

	public void setBrandname(String brandname) { 
		this.brandname = brandname;
	}
	
	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	
	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}


}
