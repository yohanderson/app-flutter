import 'package:flutter/material.dart';
import 'layout_header/layout_header_one.dart';

class LayoutSelect extends StatefulWidget {
  const LayoutSelect({super.key});

  @override
  _LayoutSelect createState() => _LayoutSelect();
}

class _LayoutSelect extends State<LayoutSelect> {
  String _selectedLayout = 'Layout 0';

  String _Layout = 'L0';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          if (_selectedLayout == 'Layout 0')
            Stack(
              children: [
                if (_Layout == 'L0')
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _Layout = 'L1';
                                  });
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (_Layout == 'L1')
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedLayout = 'Layout 1';
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                              width: 370,
                              height: 400,
                              child: Container()),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedLayout = 'Layout 2';
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                              width: 370,
                              height: 400,
                              child: Container()),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _selectedLayout = 'Layout 3';
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                              width: 370,
                              height: 400,
                              child: Container()),
                        ),
                      ],
                    ),
                  )
              ],
            )
          else if (_selectedLayout == 'Layout 1')
            const LayoutHeaderOne()
          else if (_selectedLayout == 'Layout 2')
            Container(
              height: 200,
              color: Colors.green,
            )
          else if (_selectedLayout == 'Layout 3')
            Container(
              height: 200,
              color: Colors.red,
            )
        ],
      ),
    );
  }
}
