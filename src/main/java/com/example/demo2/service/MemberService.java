package com.example.demo2.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.demo2.model.JpaMember;
import com.example.demo2.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor // 모든 것에 대한 생성자를 만들어준다. autowired 랑 같다
public class MemberService {
	
	private final MemberRepository memberRepository; 
	
	// 추가
	public void save(JpaMember member) {
		memberRepository.save(member);
	}
	// 전체보기
	public List<JpaMember> list() {
		return memberRepository.findAll();
	}
	
	//페이징 전체보기
	public Page<JpaMember> list(Pageable pageable) {
		return memberRepository.findAll(pageable);
	}
	// 상세보기 ( Optional -> )
	public JpaMember findById(Long id) {
		// return memberRepository.findById(id).get(); // 널을 체크하고 객체가 있으면 반환하라
		return memberRepository.findById(id)
					.orElseThrow(()->{ // 예외가 발생한다면 메세지 리턴해라
						return new IllegalArgumentException("상세보기 실패");
					});
	}
	// 삭제
	public void delete(Long id) {
		memberRepository.deleteById(id);
	}
	//업데이트
	@Transactional
	public void update(JpaMember member) {
		JpaMember m = memberRepository.findById(member.getId()).get();
		m.setEmail(member.getEmail());
		m.setAddr(member.getAddr());
		m.setMemo(member.getMemo());
		
	}
	
}
