import 'package:flutter/material.dart';

class fackSerch extends StatelessWidget {
  const fackSerch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
        prefixIcon: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.grey.shade400,
          ),
          onPressed: () {},
        ),
        hintText: "Search",
      ),
    );
  }
}
