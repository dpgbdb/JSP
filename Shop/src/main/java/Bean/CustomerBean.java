package Bean;

public class CustomerBean {
 private String CustId;
 private String name;
 private String Hp;
 private String Addr;
 private String Rdate;
 public String getRdate() {
	return Rdate;
}
public void setRdate(String rdate) {
	Rdate = rdate;
}
public String getCustId() {
	return CustId;
}
public void setCustId(String custId) {
	CustId = custId;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getHp() {
	return Hp;
}
public void setHp(String hp) {
	Hp = hp;
}
public String getAddr() {
	return Addr;
}
public void setAddr(String addr) {
	Addr = addr;
}

}
