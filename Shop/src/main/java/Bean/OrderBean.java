package Bean;

public class OrderBean {

 private int OrderNo;
 private String OrderId;
 private int OrderProduct;
 private int OrderCount;
 private String OrderDate;
 private String ProductName;
 
 
public String getProductName() {
	return ProductName;
}
public void setProductName(String productName) {
	ProductName = productName;
}
public int getOrderNo() {
	return OrderNo;
}
public void setOrderNo(int orderNo) {
	OrderNo = orderNo;
}
public String getOrderId() {
	return OrderId;
}
public void setOrderId(String orderId) {
	OrderId = orderId;
}
public int getOrderProduct() {
	return OrderProduct;
}
public void setOrderProduct(int orderProduct) {
	OrderProduct = orderProduct;
}
public int getOrderCount() {
	return OrderCount;
}
public void setOrderCount(int orderCount) {
	OrderCount = orderCount;
}
public String getOrderDate() {
	return OrderDate;
}
public void setOrderDate(String orderDate) {
	OrderDate = orderDate;
}
}
