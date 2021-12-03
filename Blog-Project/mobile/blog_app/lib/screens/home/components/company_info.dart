import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Listacc Blog',
        style: TextStyle(
          color: Colors.white,
          fontSize: 35.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Pacifico',
        ),
      ),
    );
  }
}
