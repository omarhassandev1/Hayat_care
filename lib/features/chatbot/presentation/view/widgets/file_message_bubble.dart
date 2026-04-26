import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/chat_message_entity.dart';

class FileMessageBubble extends StatelessWidget {
  final ChatMessageEntity message;

  const FileMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isImage = message.type == MessageType.image;
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 0.65.sw),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(4.r),
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isImage ? Icons.image_rounded : Icons.picture_as_pdf_rounded,
                  color: Colors.white,
                  size: 22.r,
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: Text(
                    message.content, // file name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            DateFormat('h:mm a').format(message.createdAt),
            style: TextStyle(fontSize: 10.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}