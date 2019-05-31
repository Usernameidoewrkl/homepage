package member;
 
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
 
public class MemberTest {
public static void main(String[] args) {
MemberDAO dao = new MemberDAO();
 
//read(dao);
//create(dao);
// list(dao);
// total(dao);
}
 
public static void read(MemberDAO dao) {
	MemberDTO dto = dao.read("user1");
	p(dto);
}
private static void total(MemberDAO dao) {
Map map = new HashMap();
map.put("col", "mname");
map.put("word", "");
p("전체레코드 갯수: "+dao.total(map));
}
 
private static void list(MemberDAO dao) {
Map map = new HashMap();
map.put("col", "mname");
map.put("word", "개");
map.put("sno", 1);
map.put("eno", 5);
 
List<MemberDTO> list = dao.list(map);
Iterator<MemberDTO> iter = list.iterator();
 
while(iter.hasNext()) {
MemberDTO dto = iter.next();
p(dto);
p("===========================");
}
}
 
private static void p(MemberDTO dto) {
p("아이디: "+dto.getId());
p("이름: "+dto.getMname());
p("이메일: "+dto.getEmail());
p("전화번호: "+dto.getTel());
p("직업: "+dto.getJob());
p("우편번호: "+dto.getZipcode());
p("주소: "+dto.getAddress1());
p("상세주소: "+dto.getAddress2());
p("사진: "+dto.getFname());
}
 
private static void create(MemberDAO dao) {
MemberDTO dto = new MemberDTO();
 
dto.setId("user6");
dto.setPasswd("6666");
dto.setMname("유저6");
dto.setTel("666-666-6666");
dto.setEmail("email6@mail.com");
dto.setZipcode("66666");
dto.setAddress1("서울시 강남구 압구정동");
dto.setAddress2("66-6");
dto.setJob("A06");
dto.setFname("member6.jpg");
 
if(dao.create(dto))
p("생성 성공");
else
p("생성 실패");
}
 
private static void p(String string) {
System.out.println(string);
}
}