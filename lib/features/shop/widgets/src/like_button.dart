import 'package:dsplatform/configurations/theme/src/hex_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key, required this.isLiked, required this.likeAmount}) : super(key: key);

  final bool isLiked;
  final double likeAmount;

  @override
  State<LikeButton> createState() => LikeButtonState();
}

class LikeButtonState extends State<LikeButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);

  bool _isFavorite = false;
  double _likeAmount = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isFavorite = widget.isLiked;
      _likeAmount = widget.likeAmount;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void like() {
    setState(() {
      if(_isFavorite) {
        _likeAmount = _likeAmount - 1;
      } else {
        _likeAmount = _likeAmount + 1;
      }
      _isFavorite = !_isFavorite;
    });
    _controller
        .reverse()
        .then((value) => _controller.forward());
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        like();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: HexColor.fromHex("#EDEDED", opacity: 0.85),
        ),
        child: Row(
          children: [
            ScaleTransition(
              scale: Tween(begin: 0.7, end: 1.0).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
              child: _isFavorite
                  ? Icon(
                Icons.favorite_rounded,
                size: 16,
                color: HexColor.fromHex("#FF2D55"),
              )
                  : Icon(
                Icons.favorite_border_rounded,
                color: Colors.black.withOpacity(0.5),
                size: 16,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              NumberFormat.compact().format(_likeAmount),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Colors.black.withOpacity(0.5)
              ),
            )
          ],
        ),
      ),
    );
  }
}