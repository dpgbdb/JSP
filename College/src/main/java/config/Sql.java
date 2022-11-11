package config;

public class Sql {

	public static final String SELECT_LECTURE ="SELECT*FROM `lecture`";
	public static final String SELECT_STUDENT="SELECT*FROM `student`";
	public static final String SELECT_REGISTER="SELECT a.regStdNo,c.stdName,b.lecName,a.regLecNo,a.regMidScore,a.regFinalScore "
											+ "FROM `register` AS a JOIN `lecture` AS b ON a.regLecNo=b.lecNo "
											+ "JOIN `student` AS c ON a.regStdNo=c.stdNo";
	
	public static final String INSERT_LECTURE="insert into `lecture` (`lecNo`,`lecName`,`lecCredit`,`lecTime`,`lecClass`)VALUES(?,?,?,?,?)";
	public static final String INSERT_STUDENT="insert into `student` (`stdNo`,`stdName`,`stdHp`,`stdYear`,`stdAddress`)VALUES(?,?,?,?,?)";
}
