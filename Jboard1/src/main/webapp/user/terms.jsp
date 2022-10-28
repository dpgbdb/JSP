<%@page import="kr.co.jboard.config.Sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.jboard.config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="./_header.jsp" %>

<script>
	$(function() {
		$('.btnNext').click(function(){
			let isCheck1 = $('input[class=terms]').is(':checked');
			let isCheck2 = $('input[class=privacy]').is(':checked');
			if(isCheck1&&isCheck2){
				return true;
			}else{
				alert('약관 동의 체크를 하셔야 합니다.')
				return false;	
			}
			
			
		})
	});
</script>
<%
	String terms= null;
	String privacy=null;
try{
		Connection conn = DBCP.getConnection();  // db 연결
		Statement stmt = conn.createStatement(); //  sql 문 전송
		ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS); // 결과받기
		if(rs.next()){		
			terms = rs.getString(1);
			privacy=rs.getString(2);
		}
		
		
		rs.close();
		stmt.close();
		conn.close();		
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>
        <main id="user">
            <section class="terms">
                <table border="1">
                    <caption>사이트 이용약관</caption>
                    <tr>
                        <td>
                            <textarea name="terms"><%= terms %></textarea>
                            <label><input type="checkbox" class="terms">&nbsp;동의합니다.</label>
                        </td>
                    </tr>
                </table>

                <table border="1">
                    <caption>개인정보 취급방침</caption>
                    <tr>
                        <td>
                            <textarea name="privacy"><%= privacy %></textarea>
                            <label><input type="checkbox" class="privacy">&nbsp;동의합니다.</label>
                        </td>
                    </tr>
                </table>
                
                <div>
                    <a href="/Jboard1/user/login.jsp" class="btn btnCancel">취소</a>
                    <a href="/Jboard1/user/register.jsp" class="btn btnNext">다음</a>
                </div>

            </section>
        </main>
<%@ include file ="./_footer.jsp" %>