 function studentjs(){
 
 $(function(){
					$('section').empty();
					$('nav').empty().append("<h4>학생등록</h4>");
					
					
					let table = "<table border = '1'>";
						table += "<tr>";
						table += "<td>학번</td>";
						table += "<td><input type='text' name='StdNo'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>이름</td>";
						table += "<td><input type='text' name='StdName'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>휴대폰</td>";
						table += "<td><input type='text' name='StdHp'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>학년</td>";
						table += "<td><input type='range' name='StdYear' min='1' max='3' step='1'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>주소</td>";
						table += "<td><input type='text' name='StdAddress'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td colspan='2' align='right'><input type='submit' id = 'btnStd' value='추가'/></td>";
						table += "</tr>";
						table += "</table>";
						
					$('section').append(table);
				});
				
};