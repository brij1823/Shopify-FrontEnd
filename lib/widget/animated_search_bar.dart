import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  String searchText;
  Function modSearch;
  AnimatedSearchBar(this.searchText, this.modSearch);
  @override
  _AnimatedSearchBarState createState() =>
      _AnimatedSearchBarState(this.searchText, this.modSearch);
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;
  String searchText;
  Function modSearch;
  _AnimatedSearchBarState(this.searchText, this.modSearch);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: _folded ? 56 : 300,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        boxShadow: kElevationToShadow[2],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: !_folded
                  ? TextField(
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                      onChanged: (String value) async {
                        this.setState(() {
                          searchText = value;
                          modSearch(value);
                        });
                      },
                    )
                  : null,
            ),
          ),
          Container(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 12 : 0),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(_folded ? 12 : 0),
                  bottomRight: Radius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    _folded ? Icons.search : Icons.close,
                    color: Colors.amber[900],
                  ),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
