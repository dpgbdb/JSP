package DB;

public class Sql {
	public static final String SELECT_CUSTOMER="SELECT * FROM `customer`";
	public static final String SELECT_PRODUCT="SELECT * FROM `product`";
	public static final String INSERT_ORDER="insert into `order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`)VALUES(?,?,?,NOW())";
	public static final String SELECT_ORDER= "SELECT o.orderNo , c.name , p.prodName, o.orderCount, o.orderDate   "
												+ "FROM `customer`AS c INNER JOIN `order` AS o ON c.custId = o.orderId"
												+"INNER JOIN `product` as p  on o.orderProduct = p.prodNo order by `orderNo` ASC";
}
