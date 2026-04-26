import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/di/injection.dart';
import 'package:hayat_care/features/chatbot/domain/entities/chat_message_entity.dart';
import 'package:hayat_care/features/chatbot/presentation/cubit/chat_cubit.dart';
import 'package:hayat_care/features/chatbot/presentation/cubit/chat_state.dart';
import 'package:hayat_care/features/chatbot/presentation/view/widgets/chat_bubble.dart';
import 'package:hayat_care/features/chatbot/presentation/view/widgets/chat_input_bar.dart';
import 'package:hayat_care/features/chatbot/presentation/view/widgets/file_message_bubble.dart';
import 'package:hayat_care/features/chatbot/presentation/view/widgets/typing_indicator.dart';
import 'package:hayat_care/localization/app_localizations.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  static const String routeName = 'chatbotScreen';

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ChatCubit>(),
      child: Scaffold(
        appBar: _ChatAppBar(),
        body: Builder(
          builder: (context) {
            return Column(
              children: [
                _DisclaimerBanner(),
                Expanded(
                  child: BlocConsumer<ChatCubit, ChatState>(
                    listener: (context, state) {
                      _scrollToBottom();
                      if (state.status == ChatStatus.error &&
                          state.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage!),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ListView.separated(
                        controller: _scrollController,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        itemCount:
                        state.messages.length + (state.isBotTyping ? 1 : 0),
                        separatorBuilder: (_, __) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          // Typing indicator as last item
                          if (state.isBotTyping &&
                              index == state.messages.length) {
                            return _TypingBubble();
                          }

                          final msg = state.messages[index];

                          // File/Image bubble (user side)
                          if (msg.isUser &&
                              (msg.type == MessageType.image ||
                                  msg.type == MessageType.file)) {
                            return FileMessageBubble(message: msg);
                          }

                          // Regular text bubble
                          return ChatBubble(message: msg);
                        },
                      );
                    },
                  ),
                ),
                BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    return ChatInputBar(
                      onSendText: (text) =>
                          context.read<ChatCubit>().sendText(text),
                      onSendFile: (fileName, type) =>
                          context.read<ChatCubit>().sendFile(
                            fileName: fileName,
                            type: type,
                          ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ── Sub-widgets ───────────────────────────────────────────

class _ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          CircleAvatar(
            radius: 18.r,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child:
            Icon(Icons.health_and_safety, color: Colors.white, size: 20.r),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.chatbot_title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.chatbot_subtitle,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DisclaimerBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      color: Colors.amber.withValues(alpha: 0.15),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 16.r, color: Colors.amber[800]),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
AppLocalizations.of(context)!.chatbot_disclaimer,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.amber[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TypingBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.4),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.r),
            topRight: Radius.circular(16.r),
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
        ),
        child: const TypingIndicator(),
      ),
    );
  }
}