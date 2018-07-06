package CaptainStudy;
public class DebugTest {
	static int[] staticMember = new int[10];
	static int staticMemberLens = 10;
	
	static boolean staticMethod(int index, int value) {
		if(index >= staticMemberLens) 
			return false;
		
		staticMember[index] = value;
		return true;
	}

	public static void main(String[] args) {
		AClass a = new AClass();
		BClass b = new BClass(3, "abcds");
		
		b.BMethod(2);
		a.AMethod(3, 5);
		b.BMethod(10);
		
		staticMethod(1, 5);
		staticMethod(2, 3);
	}
}
