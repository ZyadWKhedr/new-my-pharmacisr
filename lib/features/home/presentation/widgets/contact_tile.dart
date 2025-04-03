import 'package:flutter/material.dart';
import 'package:new_my_pharmacist/features/home/domain/entities/emergency_contact_entity.dart';

class ContactTile extends StatelessWidget {
  final EmergencyContactEntity contact;

  const ContactTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getIcon(contact.icon),
              size: 32,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 8),
            Text(
              contact.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(contact.phone, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'ambulance':
        return Icons.medical_services;
      case 'police':
        return Icons.local_police;
      case 'fire':
        return Icons.fire_truck;
      case 'electric':
        return Icons.electrical_services;
      default:
        return Icons.help_outline;
    }
  }
}
