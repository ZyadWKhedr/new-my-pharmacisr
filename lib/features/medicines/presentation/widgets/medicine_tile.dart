import 'package:flutter/material.dart';
import '../../domain/entities/medicine.dart';

class MedicineTile extends StatelessWidget {
  final Medicine medicine;
  final VoidCallback onTap;

  const MedicineTile({super.key, required this.medicine, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      shadowColor: Colors.black.withOpacity(0.1),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            medicine.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder:
                (_, __, ___) => const Icon(Icons.medication, size: 40),
          ),
        ),
        title: Text(
          medicine.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          medicine.uses,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey[700], fontSize: 14),
        ),
        onTap: onTap,
      ),
    );
  }
}
