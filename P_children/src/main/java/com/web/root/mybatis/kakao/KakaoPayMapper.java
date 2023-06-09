package com.web.root.mybatis.kakao;

import com.web.root.kakaoPay.dto.KakaoPaymentApproveResultDTO;

public interface KakaoPayMapper {

	void registKakaoPaymentApproveResult(KakaoPaymentApproveResultDTO kakaoPaymentApproveResultDTO);

	void test(String body);



}
