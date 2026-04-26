import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import '../../../domain/entities/chat_message_entity.dart';

class ChatInputBar extends StatefulWidget {
  final void Function(String text) onSendText;
  final void Function(String fileName, MessageType type) onSendFile;

  const ChatInputBar({
    super.key,
    required this.onSendText,
    required this.onSendFile,
  });

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() => _hasText = _controller.text.trim().isNotEmpty);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    if (!_hasText) return;
    widget.onSendText(_controller.text.trim());
    _controller.clear();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      widget.onSendFile(file.name, MessageType.image);
    }
  }

  Future<void> _pickPdf() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.isNotEmpty) {
      widget.onSendFile(result.files.first.name, MessageType.file);
    }
  }

  void _showAttachMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _AttachOption(
                icon: Icons.image_rounded,
                label: AppLocalizations.of(context)!.chatbot_attach_image,
                color: Colors.blue,
                onTap: () {
                  Navigator.pop(context);
                  _pickImage();
                },
              ),
              SizedBox(height: 16.h),
              _AttachOption(
                icon: Icons.picture_as_pdf_rounded,
                label: AppLocalizations.of(context)!.chatbot_attach_pdf,
                color: Colors.red,
                onTap: () {
                  Navigator.pop(context);
                  _pickPdf();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h)
          .copyWith(bottom: 10.h + MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Attach button
          InkWell(
            onTap: () => _showAttachMenu(context),
            borderRadius: BorderRadius.circular(100),
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Icon(
                Icons.attach_file_rounded,
                color: colorScheme.primary,
                size: 22.r,
              ),
            ),
          ),
          SizedBox(width: 6.w),

          // Text field
          Expanded(
            child: TextField(
              controller: _controller,
              minLines: 1,
              maxLines: 4,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.chatbot_hint,
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceVariant,
              ),
            ),
          ),

          SizedBox(width: 8.w),

          // Send button
          AnimatedScale(
            scale: _hasText ? 1.0 : 0.85,
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: _send,
              child: Container(
                width: 44.r,
                height: 44.r,
                decoration: BoxDecoration(
                  color: _hasText
                      ? colorScheme.primary
                      : Colors.grey.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 20.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AttachOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _AttachOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: color, size: 24.r),
            ),
            SizedBox(width: 16.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}