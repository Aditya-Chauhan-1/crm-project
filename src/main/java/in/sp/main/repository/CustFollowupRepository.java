package in.sp.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import in.sp.main.entity.CustFollowUp;


public interface CustFollowupRepository extends JpaRepository<CustFollowUp, Integer> {

	CustFollowUp findByPhoneno(String phoneno);
	
	List<CustFollowUp> findByFollowupdate(String followupdate);
}