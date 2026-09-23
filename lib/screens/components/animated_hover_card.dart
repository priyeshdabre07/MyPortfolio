import 'package:flutter/material.dart';
import 'package:my_portfolio/theme/app_theme.dart';

class AnimatedHoverCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? hoverBorderColor;
  final double borderRadius;
  final VoidCallback? onTap;

  const AnimatedHoverCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.hoverBorderColor,
    this.borderRadius = 16,
    this.onTap,
  });

  @override
  State<AnimatedHoverCard> createState() => _AnimatedHoverCardState();
}

class _AnimatedHoverCardState extends State<AnimatedHoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveHoverBorder =
        widget.hoverBorderColor ?? AppTheme.accentMint.withValues(alpha: 0.6);

    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          margin: widget.margin,
          padding: widget.padding ?? const EdgeInsets.all(24),
          transform: _isHovered
              ? Matrix4.translationValues(0, -5, 0)
              : Matrix4.translationValues(0, 0, 0),
          decoration: BoxDecoration(
            color: _isHovered
                ? (widget.backgroundColor ?? AppTheme.bgCardHover)
                : (widget.backgroundColor ?? AppTheme.bgCard),
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: _isHovered ? effectiveHoverBorder : AppTheme.borderSubtle,
              width: _isHovered ? 1.4 : 1.0,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: AppTheme.accentMint.withValues(alpha: 0.12),
                  blurRadius: 28,
                  offset: const Offset(0, 14),
                  spreadRadius: -4,
                )
              else
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                  spreadRadius: -4,
                ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
