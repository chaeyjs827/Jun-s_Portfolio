package hello;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextArea;

public class TestFrame extends JFrame{
	
	
	TestFrame(){
		setLayout(null);
		setSize(2000,2000);
		setVisible(true);
		JPanel jp = new JPanel();
		jp.setVisible(true);
		jp.setBounds(0, 0, 2000, 2000);
		JTextArea a = new JTextArea("아아아");
		jp.add(a);
		add(jp);
		
		
		
	}
	
	public static void main(String[] args) {
		TestFrame t = new  TestFrame();
	}
}
