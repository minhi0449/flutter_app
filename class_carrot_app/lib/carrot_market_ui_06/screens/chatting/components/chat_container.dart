import 'package:class_carrot_app/carrot_market_ui_01/theme.dart';
import 'package:class_carrot_app/carrot_market_ui_05/models/chat_message.dart';
import 'package:class_carrot_app/carrot_market_ui_05/screens/components/image_container.dart';
import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {
  final ChatMessage chatMessage;

  const ChatContainer({super.key, required this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 100,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          ImageContainer(
            borderRadius: 25,
            imageUrl: chatMessage.profileImage,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                // 이름이 생성자
                // 복잡한 텍스트를 구성을 위해 사용한다.
                Text.rich(
                  // 재귀적 텍스트 표현
                  // 하나의 텍스트 조각 안에 또 다른 텍스트 조각이
                  // 포함될 수 있도록 설계되어 있다.
                  TextSpan(
                    children: [
                      TextSpan(
                        text: chatMessage.sender,
                        style: textTheme().bodyLarge,
                      ),
                      TextSpan(
                        text: chatMessage.location,
                        style: textTheme().bodySmall,
                      ),
                      TextSpan(
                        text: ' · ${chatMessage.sendDate}',
                        style: textTheme().bodySmall,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  chatMessage.message,
                  style: textTheme().bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
              ],
            ),
          ),
          Visibility(
            visible: chatMessage.imageUri != null,
            child: ImageContainer(
                borderRadius: 10.0,
                imageUrl: chatMessage.imageUri ?? '', // null 이면 빈 문자열로 들어가
                width: 50,
                height: 50),
          ),
        ],
      ),
    );
  }
}
