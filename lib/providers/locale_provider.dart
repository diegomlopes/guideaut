import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';

final StateProvider<Locale> localeProvider = StateProvider<Locale>(
  (StateProviderRef<Locale> ref) => const Locale("pt", "BR"),
);
