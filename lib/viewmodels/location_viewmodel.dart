// lib/viewmodels/location_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/location_model.dart';

class LocationViewModel extends ChangeNotifier {
  LocationModel? selectedLocation;

  void setLocation(LocationModel location) {
    selectedLocation = location;
    notifyListeners();
  }
}