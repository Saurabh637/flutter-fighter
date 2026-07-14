import 'package:flutter/material.dart';
import 'package:flutter_fighter/managers/input_manager.dart';

/// A professional, responsive mobile control overlay for Nexus Clash.
///
/// This widget provides a fighting-game style layout with movement controls
/// on the left and action buttons on the right. It communicates exclusively
/// with the provided [InputManager].
class MobileControlsUI extends StatelessWidget {
  /// The [InputManager] that this UI will update.
  final InputManager inputManager;

  const MobileControlsUI({
    super.key,
    required this.inputManager,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            // --- Movement Controls (Bottom Left) ---
            Positioned(
              left: 0,
              bottom: 0,
              child: Row(
                children: [
                  _ControlButton(
                    icon: Icons.arrow_back,
                    onPressed: () => inputManager.moveLeft = true,
                    onReleased: () => inputManager.moveLeft = false,
                  ),
                  const SizedBox(width: 20),
                  _ControlButton(
                    icon: Icons.arrow_forward,
                    onPressed: () => inputManager.moveRight = true,
                    onReleased: () => inputManager.moveRight = false,
                  ),
                ],
              ),
            ),

            // --- Action Controls (Bottom Right) ---
            Positioned(
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Top row of action buttons (Placeholders)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _ControlButton(
                        label: 'L', // Light Attack
                        color: Colors.yellow.withOpacity(0.4),
                        onPressed: () => inputManager.lightAttack = true,
                        onReleased: () => inputManager.lightAttack = false,
                      ),
                      const SizedBox(width: 15),
                      _ControlButton(
                        label: 'H', // Heavy Attack
                        color: Colors.red.withOpacity(0.4),
                        onPressed: () => inputManager.heavyAttack = true,
                        onReleased: () => inputManager.heavyAttack = false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Bottom row: Special, Block, and Jump
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _ControlButton(
                        label: 'S', // Special
                        color: Colors.purple.withOpacity(0.4),
                        onPressed: () => inputManager.specialAttack = true,
                        onReleased: () => inputManager.specialAttack = false,
                      ),
                      const SizedBox(width: 15),
                      _ControlButton(
                        icon: Icons.shield, // Block
                        color: Colors.blueGrey.withOpacity(0.4),
                        // Assuming block will be added to InputManager in the future
                      ),
                      const SizedBox(width: 15),
                      _ControlButton(
                        icon: Icons.arrow_upward, // Jump
                        color: Colors.blue.withOpacity(0.6),
                        size: 70, // Slightly larger jump button
                        onPressed: () => inputManager.jump = true,
                        onReleased: () => inputManager.jump = false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A internal helper widget for individual control buttons.
class _ControlButton extends StatefulWidget {
  final IconData? icon;
  final String? label;
  final VoidCallback? onPressed;
  final VoidCallback? onReleased;
  final Color? color;
  final double size;

  const _ControlButton({
    this.icon,
    this.label,
    this.onPressed,
    this.onReleased,
    this.color,
    this.size = 60,
  });

  @override
  State<_ControlButton> createState() => _ControlButtonState();
}

class _ControlButtonState extends State<_ControlButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        widget.onPressed?.call();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onReleased?.call();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        widget.onReleased?.call();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isPressed 
              ? (widget.color?.withOpacity(0.8) ?? Colors.white.withOpacity(0.8))
              : (widget.color ?? Colors.white.withOpacity(0.2)),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 2,
          ),
        ),
        child: Center(
          child: widget.icon != null
              ? Icon(widget.icon, color: Colors.white, size: widget.size * 0.5)
              : Text(
                  widget.label ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: widget.size * 0.4,
                  ),
                ),
        ),
      ),
    );
  }
}
