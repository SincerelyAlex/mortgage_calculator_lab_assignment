import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MortgageCalculator {
  double amount = 0.0;
  int years = 0;
  double rate = 0.0;

  void setAmount (double newAmountInput) {
    if (newAmountInput >= 0) {
      amount = newAmountInput;
    }
  }

  void setYears(int newYearInput) {
    if (newYearInput >= 0) {
      years = newYearInput;
    }
  }

  void setRate(double newRateInput) {
    if (newRateInput >= 0) {
      rate = newRateInput;
    }
  }

  double getAmount() {
    return amount;
  }

  int getYears() {
    return years;
  }

  double getRate() {
    return rate;
  }

  double calculateMonthlyPayment() {
    double principal = double.parse(amount.toStringAsFixed(2));
    double monthlyRate = rate / 12;
    int totalPayments = years * 12;
    double monthlyPayment = (principal * monthlyRate * pow((1 + monthlyRate), totalPayments))
    / (pow(1 + monthlyRate, totalPayments) - 1);
    return monthlyPayment;
  }
  
  double calculateTotalPayment() {
    return calculateMonthlyPayment() * 12 * years;
  }

}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mortgage Calculator V0',
      
    );
  }
}
