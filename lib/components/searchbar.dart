import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => Navigator.pushNamed(context, '/search'),
        child: Ink(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: const [
              Icon(Icons.search),
              SizedBox(width: 8),
              Text('Search course...'),
            ],
          ),
        ),
      ),
    );
  }
}
