import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget(
      {super.key,
      required this.textController,
      required this.onTextChanged,
      required this.textFocusNode});

  final TextEditingController textController;
  final ValueChanged<String> onTextChanged;
  final FocusNode textFocusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: TextField(
        controller: textController,
        onChanged: onTextChanged,
        focusNode: textFocusNode,
        onTapOutside: (event) => textFocusNode.unfocus(),
        decoration: InputDecoration(
          hintText: 'Cari Model...',
          hintStyle: TextStyle(color: Colors.white54),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          suffixIcon: textController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    textController.clear();
                    onTextChanged('');
                    textFocusNode.unfocus();
                  },
                )
              : null,
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
