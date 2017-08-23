package com.bean.aimt;
import java.io.File;

public class FormBean 
{
	private String accid,desc,check,catagory,sname,name,fname,address,address2,add,contact,email,mobile,gender,community,dob,pf,doa,deg,post,department,workshop,gradepay,comcertificate,educertificate,matcertificate,place,cdate,edate,scrno;
	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}


	private Integer id;
	private String[] academic;
	private String[] board;
	private String[] passingyear;
	private String userid,username,userpass,password,roll,userstatus,pon,cperson,city,district,pcode,state,scode,cus_remarks,remarks,doj,rmobile,eduqli,tecqli,pmobile;
	private File userImage;
	private String userImageContentType,date1;
	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}


	private String userImageFileName;
	private String ctype,ccode,mcode,slno,pserial,ptype,comcode,cptype,premarks,cremarks,sremarks,pdate,bname;
	private String modelcode,modelname,brandname,productname,companyname,brandcode,allocation,engname,spare,user,distance,amount;
	private String engstatus,sparedetails,expencedetails,total,ready;
	private String[] quantity;
	private String[] amount1;
	private String[] particulars,report,status,attendedby;
	
	public String[] getStatus() {
		return status;
	}

	public String[] getAttendedby() {
		return attendedby;
	}

	public String getSlno() {
		return slno;
	}

	public void setSlno(String slno) {
		this.slno = slno;
	}

	public String[] getParticulars() {
		return particulars;
	}

	public void setParticulars(String[] particulars) {
		this.particulars = particulars;
	}

	public String[] getReport() {
		return report;
	}

	public void setReport(String[] report) {
		this.report = report;
	}

	public void setStatus(String[] status) {
		this.status = status;
	}

	public void setAttendedby(String[] attendedby) {
		this.attendedby = attendedby;
	}

	
	private String frmdate,todate,icharge,complaincode,complainname,voucherno;


	public String getVoucherno() {
		return voucherno;
	}

	public void setVoucherno(String voucherno) {
		this.voucherno = voucherno;
	}

	private Double cramount;
    private int billno;
	private String ccode1, engremarks,custid,customername,date,mobileno,pincode,productid,product,model,payouttype,problems,customercode;

	public String getCustomercode() {
		return customercode;
	}

	public void setCustomercode(String customercode) {
		this.customercode = customercode;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getPayouttype() {
		return payouttype;
	}

	public void setPayouttype(String payouttype) {
		this.payouttype = payouttype;
	}

	public String getProblems() {
		return problems;
	}

	public void setProblems(String problems) {
		this.problems = problems;
	}

	public String getEngremarks() {
		return engremarks;
	}

	public void setEngremarks(String engremarks) {
		this.engremarks = engremarks;
	}

	public String getCus_remarks() {
		return cus_remarks;
	}

	public void setCus_remarks(String cus_remarks) {
		this.cus_remarks = cus_remarks;
	}

	public int getBillno() {
		return billno;
	}

	public void setBillno(int billno) {
		this.billno = billno;
	}

	public String getReady() {
		return ready;
	}

	public void setReady(String ready) {
		this.ready = ready;
	}

	public String getCcode1() {
		return ccode1;
	}

	public void setCcode1(String ccode1) {
		this.ccode1 = ccode1;
	}

	// added by Nilesh 31th March
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

		//added by Nilesh
		private String adopter;
		private String battery;
		private String hdd;
		private String opd;
		private String ram;
		private String screen;
		private String keyboard;
		private String otheraccessories;
		private String physicaldamaged;
		private String wifi_yes_no;
		private String bag_yes_no;
		private String inspected_by;
		private String engineer_name;
		
		// added by Nilesh for hidden field to formbean value transfer
		private String adapter1;
		private String battery1;
		private String harddisk1;
		private String odd1;
		private String ram1;
		private String screen1;
		private String keyboard1;
		private String other1;
		private String physical1;
		private String wifi1;
		private String bag1;
		private String engineername1;
		private String acode;
		private String bcode;
		
		private String fromplace1;
		private String toplace1;
		private String distancekm1;
		private String ownvehicle1;
		private String companyvehicle1;
		private String publictransport1;
		
		// added by Nilesh
		private String fromplace;
		private String toplace;
		private double distancekm;
		private double approvedrate;
		
		// added by Nilesh 9th March,2017
		private String ownvehicle;
		private String companyvehicle;
		private String publictransport;
		
		// added by Nilesh, 16th March
		private String contact_person;
		private String category;
		
		//added by Nilesh, 17th March
		private String slnum;
		private String qty;
		private String rate;
		private String terms_conditions;
		private String total1;
		
		// added by Nilesh 23rd March
		private String particular_nos[];
		private String qty_nos[];
		private String rate_nos[];
		private String amount_nos[];
		private String approved_nos[];
		
		public String[] getApproved_nos() {
			return approved_nos;
		}

		public void setApproved_nos(String[] approved_nos) {
			this.approved_nos = approved_nos;
		}

		// added by Nilesh 28th March
		private String approved;
		private String approved_amt;
		
		// added by Nilesh 30th March
		private String cust_ref_id;
		
		// added by Nilesh 31st March
		private String password1;
		
		// added by Nilesh, 12th April
		private String particular_nos1[];
		private String qty_nos1[];
		private String rate_nos1[];
		private String amount_nos1[];
		private String approved1[];
		
		public String[] getApproved1() {
			return approved1;
		}

		public void setApproved1(String[] approved1) {
			this.approved1 = approved1;
		}

		public String[] getParticular_nos1() {
			return particular_nos1;
		}

		public void setParticular_nos1(String[] particular_nos1) {
			this.particular_nos1 = particular_nos1;
		}

		public String[] getQty_nos1() {
			return qty_nos1;
		}

		public void setQty_nos1(String[] qty_nos1) {
			this.qty_nos1 = qty_nos1;
		}

		public String[] getRate_nos1() {
			return rate_nos1;
		}

		public void setRate_nos1(String[] rate_nos1) {
			this.rate_nos1 = rate_nos1;
		}

		public String[] getAmount_nos1() {
			return amount_nos1;
		}

		public void setAmount_nos1(String[] amount_nos1) {
			this.amount_nos1 = amount_nos1;
		}

	public String getPassword1() {
			return password1;
		}

		public void setPassword1(String password1) {
			this.password1 = password1;
		}

	public String getCust_ref_id() {
			return cust_ref_id;
		}

		public void setCust_ref_id(String cust_ref_id) {
			this.cust_ref_id = cust_ref_id;
		}

	public String getApproved_amt() {
			return approved_amt;
		}

		public void setApproved_amt(String approved_amt) {
			this.approved_amt = approved_amt;
		}

	public String getApproved() {
			return approved;
		}

		public void setApproved(String approved) {
			this.approved = approved;
		}


	public String[] getParticular_nos() {
			return particular_nos;
		}

		public void setParticular_nos(String[] particular_nos) {
			this.particular_nos = particular_nos;
		}

		public String[] getQty_nos() {
			return qty_nos;
		}

		public void setQty_nos(String[] qty_nos) {
			this.qty_nos = qty_nos;
		}

		public String[] getRate_nos() {
			return rate_nos;
		}

		public void setRate_nos(String[] rate_nos) {
			this.rate_nos = rate_nos;
		}

		public String[] getAmount_nos() {
			return amount_nos;
		}

		public void setAmount_nos(String[] amount_nos) {
			this.amount_nos = amount_nos;
		}

	public String getTotal1() {
			return total1;
		}

		public void setTotal1(String total1) {
			this.total1 = total1;
		}

	public String getTerms_conditions() {
			return terms_conditions;
		}

		public void setTerms_conditions(String terms_conditions) {
			this.terms_conditions = terms_conditions;
		}
/*
	public String getParticulars() {
			return particulars;
		}

		public void setParticulars(String particulars) {
			this.particulars = particulars;
		}*/

		public String getQty() {
			return qty;
		}

		public void setQty(String qty) {
			this.qty = qty;
		}

		public String getRate() {
			return rate;
		}

		public void setRate(String rate) {
			this.rate = rate;
		}

	

	public String getSlnum() {
			return slnum;
		}

		public void setSlnum(String slnum) {
			this.slnum = slnum;
		}

	public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

	public String getContact_person() {
			return contact_person;
		}

		public void setContact_person(String contact_person) {
			this.contact_person = contact_person;
		}

	public String getFromplace1() {
			return fromplace1;
		}

		public void setFromplace1(String fromplace1) {
			this.fromplace1 = fromplace1;
		}

		public String getToplace1() {
			return toplace1;
		}

		public void setToplace1(String toplace1) {
			this.toplace1 = toplace1;
		}

		public String getDistancekm1() {
			return distancekm1;
		}

		public void setDistancekm1(String distancekm1) {
			this.distancekm1 = distancekm1;
		}

		public String getOwnvehicle1() {
			return ownvehicle1;
		}

		public void setOwnvehicle1(String ownvehicle1) {
			this.ownvehicle1 = ownvehicle1;
		}

		public String getCompanyvehicle1() {
			return companyvehicle1;
		}

		public void setCompanyvehicle1(String companyvehicle1) {
			this.companyvehicle1 = companyvehicle1;
		}

		public String getPublictransport1() {
			return publictransport1;
		}

		public void setPublictransport1(String publictransport1) {
			this.publictransport1 = publictransport1;
		}

	public String getAdopter() {
			return adopter;
		}

		public void setAdopter(String adopter) {
			this.adopter = adopter;
		}

		public String getBattery() {
			return battery;
		}

		public void setBattery(String battery) {
			this.battery = battery;
		}

		public String getHdd() {
			return hdd;
		}

		public void setHdd(String hdd) {
			this.hdd = hdd;
		}

		public String getOpd() {
			return opd;
		}

		public void setOpd(String opd) {
			this.opd = opd;
		}

		public String getRam() {
			return ram;
		}

		public void setRam(String ram) {
			this.ram = ram;
		}

		public String getScreen() {
			return screen;
		}

		public void setScreen(String screen) {
			this.screen = screen;
		}

		public String getKeyboard() {
			return keyboard;
		}

		public void setKeyboard(String keyboard) {
			this.keyboard = keyboard;
		}

		public String getOtheraccessories() {
			return otheraccessories;
		}

		public void setOtheraccessories(String otheraccessories) {
			this.otheraccessories = otheraccessories;
		}

		public String getPhysicaldamaged() {
			return physicaldamaged;
		}

		public void setPhysicaldamaged(String physicaldamaged) {
			this.physicaldamaged = physicaldamaged;
		}

		public String getWifi_yes_no() {
			return wifi_yes_no;
		}

		public void setWifi_yes_no(String wifi_yes_no) {
			this.wifi_yes_no = wifi_yes_no;
		}

		public String getBag_yes_no() {
			return bag_yes_no;
		}

		public void setBag_yes_no(String bag_yes_no) {
			this.bag_yes_no = bag_yes_no;
		}

		public String getInspected_by() {
			return inspected_by;
		}

		public void setInspected_by(String inspected_by) {
			this.inspected_by = inspected_by;
		}

		public String getEngineer_name() {
			return engineer_name;
		}

		public void setEngineer_name(String engineer_name) {
			this.engineer_name = engineer_name;
		}

		public String getAdapter1() {
			return adapter1;
		}

		public void setAdapter1(String adapter1) {
			this.adapter1 = adapter1;
		}

		public String getBattery1() {
			return battery1;
		}

		public void setBattery1(String battery1) {
			this.battery1 = battery1;
		}

		public String getHarddisk1() {
			return harddisk1;
		}

		public void setHarddisk1(String harddisk1) {
			this.harddisk1 = harddisk1;
		}

		public String getOdd1() {
			return odd1;
		}

		public void setOdd1(String odd1) {
			this.odd1 = odd1;
		}

		public String getRam1() {
			return ram1;
		}

		public void setRam1(String ram1) {
			this.ram1 = ram1;
		}

		public String getScreen1() {
			return screen1;
		}

		public void setScreen1(String screen1) {
			this.screen1 = screen1;
		}

		public String getKeyboard1() {
			return keyboard1;
		}

		public void setKeyboard1(String keyboard1) {
			this.keyboard1 = keyboard1;
		}

		public String getOther1() {
			return other1;
		}

		public void setOther1(String other1) {
			this.other1 = other1;
		}

		public String getPhysical1() {
			return physical1;
		}

		public void setPhysical1(String physical1) {
			this.physical1 = physical1;
		}

		public String getWifi1() {
			return wifi1;
		}

		public void setWifi1(String wifi1) {
			this.wifi1 = wifi1;
		}

		public String getBag1() {
			return bag1;
		}

		public void setBag1(String bag1) {
			this.bag1 = bag1;
		}

		public String getEngineername1() {
			return engineername1;
		}

		public void setEngineername1(String engineername1) {
			this.engineername1 = engineername1;
		}

		public String getAcode() {
			return acode;
		}

		public void setAcode(String acode) {
			this.acode = acode;
		}

		public String getBcode() {
			return bcode;
		}

		public void setBcode(String bcode) {
			this.bcode = bcode;
		}

		public String getFromplace() {
			return fromplace;
		}

		public void setFromplace(String fromplace) {
			this.fromplace = fromplace;
		}

		public String getToplace() {
			return toplace;
		}

		public void setToplace(String toplace) {
			this.toplace = toplace;
		}

		public double getDistancekm() {
			return distancekm;
		}

		public void setDistancekm(double distancekm) {
			this.distancekm = distancekm;
		}

		public String getCheck() {
			return check;
		}

		public void setCheck(String check) {
			this.check = check;
		}

		public double getApprovedrate() {
			return approvedrate;
		}

		public void setApprovedrate(double approvedrate) {
			this.approvedrate = approvedrate;
		}

		public String getOwnvehicle() {
			return ownvehicle;
		}

		public void setOwnvehicle(String ownvehicle) {
			this.ownvehicle = ownvehicle;
		}

		public String getCompanyvehicle() {
			return companyvehicle;
		}

		public void setCompanyvehicle(String companyvehicle) {
			this.companyvehicle = companyvehicle;
		}

		public String getPublictransport() {
			return publictransport;
		}

		public void setPublictransport(String publictransport) {
			this.publictransport = publictransport;
		}

	public String getComplaincode() {
		return complaincode;
	}
	
	public void setComplaincode(String complaincode) {
		this.complaincode = complaincode;
	}
	
	public String getComplainname() {
		return complainname;
	}
	
	public void setComplainname(String complainname) {
		this.complainname = complainname;
	}
	
	
	public String getIcharge() {
		return icharge;
	}
	
	public void setIcharge(String icharge) {
		this.icharge = icharge;
	}
	
	public String getFrmdate() {
		return frmdate;
	}
	
	public void setFrmdate(String frmdate) {
		this.frmdate = frmdate;
	}
	
	public String getTodate() {
		return todate;
	}
	
	public void setTodate(String todate) {
		this.todate = todate;
	}
	
	public String[] getQuantity() {
		 
	    return quantity;
	}
	 
	public void setQuantity(String[] quantity) {
	 
	    this.quantity=quantity;
	 
	}
	
	public String[] getAmount1() {
		 
	    return amount1;
	}
	 
	public void setAmount1(String[] amount1) {
	 
	    this.amount1=amount1;
	 
	}

	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}
	
	public String getUserstatus() {
		return userstatus;
	}

	public void setUserstatus(String userstatus) {
		this.userstatus = userstatus;
	}
	
	public String getExpencedetails() {
		return expencedetails;
	}

	public void setExpencedetails(String expencedetails) {
		this.expencedetails = expencedetails;
	}
	
	public String getSparedetails() {
		return sparedetails;
	}

	public void setSparedetails(String sparedetails) {
		this.sparedetails = sparedetails;
	}
	
	public String getEngstatus() {
		return engstatus;
	}

	public void setEngstatus(String engstatus) {
		this.engstatus = engstatus;
	}
	
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	public Double getCramount() {
		return cramount;
	}

	public void setCramount(Double cramount) {
		this.cramount = cramount;
	}
	
	
	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}
	
	public String getPon() {
		return pon;
	}

	public void setPon(String pon) {
		this.pon = pon;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	
	public String getRmobile() {
		return rmobile;
	}

	public void setRmobile(String rmobile) {
		this.rmobile = rmobile;
	}
	public String getPmobile() {
		return pmobile;
	}

	public void setPmobile(String pmobile) {
		this.pmobile = pmobile;
	}
	
	public String getEduqli() {
		return eduqli;
	}

	public void setEduqli(String eduqli) {
		this.eduqli = eduqli;
	}
	public String getTecqli() {
		return tecqli;
	}

	public void setTecqli(String tecqli) {
		this.tecqli = tecqli;
	}
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	public String getCperson() {
		return cperson;
	}

	public void setCperson(String cperson) {
		this.cperson = cperson;
	}
	
	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
	public String getScode() {
		return scode;
	}

	public void setScode(String scode) {
		this.scode = scode;
	}
	
	public String getDistrict() {
		return district;
	}
	
	public void setDistrict(String district) {
		this.district = district;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
	public String getRoll() {
		return roll;
	}

	public void setRoll(String roll) {
		this.roll = roll;
	}


	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPass() {
		return password;
	}

	public void setPass(String password) {
		this.password = password;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getAccid() {
		return accid;
	}

	public void setAccid(String accid) {
		this.accid = accid;
	}
	
	public String getCatagory() {
		return catagory;
	}

	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
		
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
	
	public String getAdd() {
		return add;
	}

	public void setAdd(String add) {
		this.add = add;
	}
	
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getCommunity() {
		return community;
	}

	public void setCommunity(String community) {
		this.community = community;
	}
	
	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}
	
	public String getPf() {
		return pf;
	}

	public void setPf(String pf) {
		this.pf = pf;
	}
	
	public String getDoa() {
		return doa;
	}

	public void setDoa(String doa) {
		this.doa = doa;
	}
	
	public String getDeg() {
		return deg;
	}

	public void setDeg(String deg) {
		this.deg = deg;
	}
	
	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}
	
	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	public String getWorkshop() {
		return workshop;
	}

	public void setWorkshop(String workshop) {
		this.workshop = workshop;
	}
	
	public String getGradepay() {
		return gradepay;
	}

	public void setGradepay(String gradepay) {
		this.gradepay = gradepay;
	}
	
	public String getComcertificate() {
		return comcertificate;
	}

	public void setComcertificate(String comcertificate) {
		this.comcertificate = comcertificate;
	}
	
	public String getEducertificate() {
		return educertificate;
	}

	public void setEducertificate(String educertificate) {
		this.educertificate= educertificate;
	}
	
	public String getMatcertificate() {
		return matcertificate;
	}

	public void setMatcertificate(String matcertificate) {
		this.matcertificate= matcertificate;
	}
	
	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place= place;
	}
	
	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate= cdate;
	}
	
	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate= pdate;
	}
	
	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate= edate;
	}
	
	public String[] getAcademic() {
		 
	    return academic;
	}
	 
	public void setAcademic(String[] academic) {
	 
	    this.academic=academic;
	 
	}
	
	public String[] getBoard() {
		 
	    return board;
	}
	 
	public void setBoard(String[] board) {
	 
	    this.board=board;
	 
	}
	
	public String[] getPassingyear() {
		 
	    return passingyear;
	}
	 
	public void setPassingyear(String[] passingyear) {
	 
	    this.passingyear=passingyear;
	 
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
    
    public String getCcode() {
		return ccode;
	}

	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	
	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	
	public String getPserial() {
		return pserial;
	}

	public void setPserial(String pserial) {
		this.pserial = pserial;
	}
	
	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	
	public String getCptype() {
		return cptype;
	}

	public void setCptype(String cptype) {
		this.cptype = cptype;
	}
	
	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getComcode() {
		return comcode;
	}

	public void setComcode(String comcode) {
		this.comcode = comcode;
	}

	public String getPremarks() {
		return premarks;
	}

	public void setPremarks(String premarks) {
		this.premarks = premarks;
	}
	
	public String getCremarks() {
		return cremarks;
	}

	public void setCremarks(String cremarks) {
		this.cremarks = cremarks;
	}
	public String getSremarks() {
		return sremarks;
	}

	public void setSremarks(String sremarks) {
		this.sremarks = sremarks;
	}
	
	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}
	
	public String getModelcode() {
		return modelcode;
	}

	public void setModelcode(String modelcode) {
		this.modelcode = modelcode;
	}
	
	public String getBrandcode() {
		return brandcode;
	}

	public void setBrandcode(String brandcode) {
		this.brandcode = brandcode;
	}
	
	public String getModelname() {
		return modelname;
	}

	public void setModelname(String modelname) {
		this.modelname = modelname;
	}
	
	public String getBrandname() {
		return brandname;
	}

	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}
	
	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}
	
	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	
	public String getAllocation() {
		return allocation;
	}

	public void setAllocation(String allocation) {
		this.allocation = allocation;
	}
	
	public String getEngname() {
		return engname;
	}

	public void setEngname(String engname) {
		this.engname = engname;
	}
	
	public String getSpare() {
		return spare;
	}

	public void setSpare(String spare) {
		this.spare = spare;
	}
	
	public String getScrno() {
		return scrno;
	}

	public void setScrno(String scrno) {
		this.scrno = scrno;
	}
	
	
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	
}
