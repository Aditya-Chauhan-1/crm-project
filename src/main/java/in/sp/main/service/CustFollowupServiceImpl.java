package in.sp.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.entity.CustFollowUp;
import in.sp.main.repository.CustFollowupRepository;

@Service
public class CustFollowupServiceImpl implements CustFollowupService {
	
	@Autowired
	CustFollowupRepository custFollowupRepository;

	@Override
	public boolean addCustFollowupDateService(CustFollowUp custFollowUp) {
		boolean status = false;
		
		try {
			CustFollowUp custFollowUp_db = custFollowupRepository.findByPhoneno(custFollowUp.getPhoneno());
			if (custFollowUp_db != null) {
				custFollowUp_db.setFollowupdate(custFollowUp.getFollowupdate());
				custFollowupRepository.save(custFollowUp_db);
			}
			else {
				custFollowupRepository.save(custFollowUp);
			}
			status = true;
		}
		catch (Exception e) {
			status = false;
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public List<CustFollowUp> getCustFollowUpForProvidedDate(String date) {
		return custFollowupRepository.findByFollowupdate(date);
	}

	
}
