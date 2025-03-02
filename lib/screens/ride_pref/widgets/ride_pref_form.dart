import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  Location? arrival;
  late DateTime departureDate;
  int requestedSeats = 1;

  @override
  void initState() {
    super.initState();
    departure = widget.initRidePref?.departure;
    arrival = widget.initRidePref?.arrival;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
  }

  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: departureDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      setState(() {
        departureDate = pickedDate;
      });
    }
  }

  void _swapLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildLocationField('Departure', departure, Icons.location_on),
          _buildLocationField('Arrival', arrival, Icons.location_on),
          _buildDateField(),
          _buildSeatsSelector(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationField(String label, Location? location, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: label == 'Departure'
            ? IconButton(
                icon: const Icon(Icons.swap_vert),
                onPressed: _swapLocations,
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDateField() {
    return InkWell(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Departure Date',
          prefixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(),
        ),
        child: Text(
          '${departureDate.toLocal()}'.split(' ')[0],
        ),
      ),
    );
  }

  Widget _buildSeatsSelector() {
    return Row(
      children: [
        const Icon(Icons.person),
        const SizedBox(width: 8),
        DropdownButton<int>(
          value: requestedSeats,
          items: List.generate(5, (index) => index + 1)
              .map((e) => DropdownMenuItem<int>(
                    value: e,
                    child: Text('$e'),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              requestedSeats = value!;
            });
          },
        ),
      ],
    );
  }
}
