import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: isUser ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
      child: Column(
        crossAxisAlignment:
        isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (!isUser) _BotAvatar(),
          SizedBox(height: 4.h),
          Container(
            constraints: BoxConstraints(maxWidth: 0.75.sw),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isUser
                  ? colorScheme.primary
                  : colorScheme.primary.withValues(alpha: .14),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isUser ? 16.r : 4.r),
                topRight: Radius.circular(isUser ? 4.r : 16.r),
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Text(
              message.content,
              style: TextStyle(
                color: isUser
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: 14.sp,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            DateFormat('h:mm a').format(message.createdAt),
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _BotAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14.r,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(Icons.health_and_safety, size: 16.r, color: Colors.white),
        ),
        SizedBox(width: 6.w),
        Text(
          AppLocalizations.of(context)!.chatbot_title,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.mainColor,
          ),
        ),
      ],
    );
  }
}