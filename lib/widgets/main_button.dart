import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final IconData? prefix;
  final VoidCallback onTap;
  final bool loading;
  const RoundButton({super.key,
    required this.title,
    this.color = Colors.orange,
    this.textColor = Colors.black,
    this.prefix,
    required this.onTap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefix!=null ? Icon(prefix,color: Colors.white,) : const SizedBox(),
            const SizedBox(width: 20,),
            loading? const CircularProgressIndicator(color: Colors.white,) : Text(title,style: TextStyle(color: textColor),),
          ],
        ),
      ),
    );
  }
}
