 function lecturejs(){
 
 $(function(){
					$('section').empty();
					$('nav').empty().append("<h4>수강신청</h4>");
					
					
					let table = "<table border = '1'>";
						table += "<tr>";
						table += "<td>번호</td>";
						table += "<td><input type='text' name='LecNo'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>강좌명</td>";
						table += "<td><input type='text' name='LecName'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>학점</td>";
						table += "<td><input type='text' name='LecCredit'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>시간</td>";
						table += "<td><input type='text' name='LecTime'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>강의장</td>";
						table += "<td><input type='text' name='LecClass'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td colspan='2' align='right'><input type='submit' id = 'btnLec' value='추가'/></td>";
						table += "</tr>";
						table += "</table>";
						
					$('section').append(table);
				});
				
};