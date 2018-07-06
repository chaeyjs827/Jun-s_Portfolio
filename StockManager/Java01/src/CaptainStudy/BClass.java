package CaptainStudy;

public class BClass{
	int bMember;
	String bMember2;
	
	BClass(int bMember, String bMember2){
		this.bMember = bMember;
		this.bMember2 = bMember2;
	}
	
	int BMethod(int inputN) {
		bMember += inputN;
		return bMember;
	}
}