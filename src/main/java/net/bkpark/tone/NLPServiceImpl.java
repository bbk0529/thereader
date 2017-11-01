package net.bkpark.tone;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NLPServiceImpl implements NLPService{

	@Autowired
	private NLPDAO nlpDAO;
	
	@Override
	public void insertEmail(EmailVO vo) {
		nlpDAO.insertEmail(vo);
	}

	@Override
	public EmailVO detail(int no) {
		return nlpDAO.getDetail(no);
	}

	@Override
	@Test
	public int wordCount(String text) {
		String splittedText[]=text.split(" ");
		int len=splittedText.length;
		System.out.println(len);
		return len;
	}

	@Override
	public String[] getSender() {
		return nlpDAO.getSender();
	}

	@Override
	public String[] getSenderW() {
		return nlpDAO.getSenderW();
	}
	
	@Override
	public Date[] getemaildate() {
		return nlpDAO.getEmailDate();
	}

	@Override
	public List<EmailVO> searchData(String keyword) {
		System.out.println("inputted keyword is :" + keyword);
		return nlpDAO.searchData(keyword);
	}

	@Override
	public void insertPI(PIVO vo) {
		nlpDAO.insertPI(vo);
		
	}

	@Override
	public PIVO readPI(String sender) {
		System.out.println("inputted keyword for readPI in NLPServiceImpl :" + sender);
		PIVO vo = nlpDAO.readPI(sender); 
		return vo;
	}

	

}
