import 'package:flutter/material.dart';
import 'package:oilnow/theme.dart';

import '../../../common/utils/logger.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    logger.d('MyWallet Page() 메모리 호출 확인');
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              // Row 1 영역 (내 지갑, 이용내역)
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        '내 지갑',
                        style: textTheme().labelLarge?.copyWith(
                              fontSize: 20,
                            ),
                      ),
                      SizedBox(width: 3.5),
                      Icon(
                        Icons.info_outline,
                        size: 15,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text('이용 내역'),
                      SizedBox(width: 3.5),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),

              // Row 2 영역 (충전된 외화)
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(
                      '아직 충전된 외화가 없습니다.',
                      style: textTheme().bodyMedium?.copyWith(
                            color: Color(0xFFBDBDBD),
                          ),
                    ),
                  ],
                ),
              ),

              // Row 3 영역 (충전하기 버튼)
              Row(
                children: [
                  _buildChargeButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 충전하기 버튼
  _buildChargeButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.83,
          height: 45,
          decoration: BoxDecoration(
            color: Color(0xFF0EAFFE),
            // border: Border.all(color: Color(0xFFBDBDBD)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              '충전하기',
              style: textTheme().bodyMedium?.copyWith(
                    color: Color(0xFFFFFFFF),
                  ),
            ),
          ),
        ),
      ),
    );
  } // end of _buildChargeButton
} // end of MyWallet
