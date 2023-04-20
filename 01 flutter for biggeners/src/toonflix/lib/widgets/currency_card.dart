import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String title, amount, unit;
  final IconData icon;
  final Color bgColor, itemColor;
  final bool isInverted;
  final double order;

  const CurrencyCard({
    super.key,
    required this.title,
    required this.amount,
    required this.unit,
    required this.icon,
    required this.isInverted,
    required this.order,
  })  : bgColor = isInverted ? Colors.white : const Color(0xFF1F2123),
        itemColor = isInverted ? const Color(0xFF1F2123) : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -20 * (order - 1)),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: itemColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: itemColor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        unit,
                        style: TextStyle(
                          color: itemColor.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 3.3,
                child: Transform.translate(
                  offset: const Offset(-2, 8),
                  child: Icon(
                    icon,
                    color: itemColor,
                    size: 50,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
