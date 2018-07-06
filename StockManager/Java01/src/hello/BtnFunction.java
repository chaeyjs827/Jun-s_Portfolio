package hello;

import java.awt.BorderLayout;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.AbstractButton;
import javax.swing.ButtonGroup;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

public class BtnFunction extends JFrame {

	JTextField displayJTF;

	public BtnFunction() {
		// 프레임 설정
		JFrame mainJF = new JFrame("조건 선택");
		SelectItemListener sil = new SelectItemListener();
		// 프레임 레이아웃 설정
		mainJF.setLayout(new BorderLayout());
		mainJF.setDefaultCloseOperation(mainJF.EXIT_ON_CLOSE);

		
		// 라디오 버튼
		JRadioButton btnKakao = new JRadioButton("카카오");
		JRadioButton btnSamsung = new JRadioButton("삼성전자");
		JRadioButton btnLG = new JRadioButton("LG전자");
		JRadioButton btnHyundai = new JRadioButton("현대차");
		JRadioButton btnSK = new JRadioButton("SK하이닉스");
		JRadioButton btnNaver = new JRadioButton("네이버");

		// 버튼 그룹 설정
		ButtonGroup buttonGrp = new ButtonGroup();
		buttonGrp.add(btnKakao);
		buttonGrp.add(btnSamsung);
		buttonGrp.add(btnLG);
		buttonGrp.add(btnHyundai);
		buttonGrp.add(btnSK);
		buttonGrp.add(btnNaver);

		// 리스너 설정
		btnKakao.addItemListener(sil);
		btnSamsung.addItemListener(sil);
		btnLG.addItemListener(sil);
		btnHyundai.addItemListener(sil);
		btnSK.addItemListener(sil);
		btnNaver.addItemListener(sil);

		// 라디오 버튼 패널 설정 및 프레임 등록
		JPanel btnPanel = new JPanel();
		btnPanel.add(btnKakao);
		btnPanel.add(btnSamsung);
		btnPanel.add(btnLG);
		btnPanel.add(btnHyundai);
		btnPanel.add(btnSK);
		btnPanel.add(btnNaver);
		mainJF.add(btnPanel, BorderLayout.NORTH);

		// 텍스트필드 설정
		displayJTF = new JTextField("", 20);

		// 텍스트필드 패널 설정 및 프레임 등록
		JPanel textJP = new JPanel();
		textJP.add(displayJTF);
		mainJF.getContentPane().add(textJP, BorderLayout.CENTER);

		// 프레임 세부 설정
		mainJF.setSize(500, 110);
		mainJF.setLocation(50, 50);
		mainJF.setVisible(true);

	}

	public static void main(String[] args) {
		BtnFunction btn = new BtnFunction();

	}

	class SelectItemListener implements ItemListener {
		
		ConnectionDB dbConnect = new ConnectionDB();
		
		public void itemStateChanged(ItemEvent e) {
			AbstractButton sel = (AbstractButton) e.getItemSelectable();

			if (e.getStateChange() == ItemEvent.SELECTED) {
				if (sel.getText().equals("카카오")) {
					displayJTF.setText("카카오 데이터를 불러옵니다.");
				} else if (sel.getText().equals("삼성전자")) {
					displayJTF.setText("삼성전자 데이터를 불러옵니다.");
				} else if (sel.getText().equals("LG전자")) {
					displayJTF.setText("LG전자 데이터를 불러옵니다.");
				} else if (sel.getText().equals("현대차")) {
					displayJTF.setText("현대차 데이터를 불러옵니다.");
				} else if (sel.getText().equals("SK하이닉스")) {
					displayJTF.setText("SK하이닉스 데이터를 불러옵니다.");
				} else if (sel.getText().equals("네이버")) {
					displayJTF.setText("네이버 데이터를 불러옵니다.");
				}

			}
		}
	}
}
